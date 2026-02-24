from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, Session
from pydantic import BaseModel
from typing import List

# --- DATABASE SETUP ---
DATABASE_URL = "sqlite:///./persistent_storage.db"
engine = create_engine(DATABASE_URL, connect_args={"check_same_thread": False})
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

# SQLAlchemy Model (Database Table)
class DBItem(Base):
    __tablename__ = "items"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String)

# Create tables
Base.metadata.create_all(bind=engine)

# --- PYDANTIC MODELS (Data Validation) ---
class ItemCreate(BaseModel):
    name: str

class ItemResponse(BaseModel):
    id: int
    name: str

    class Config:
        from_attributes = True

# --- API HELPERS ---
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# --- FASTAPI APP ---
app = FastAPI(title="Persistent Backend API")

@app.get("/", tags=["Root"])
def read_root():
    return {"message": "Welcome to the Persistent API! Your data is now saved to SQLite."}

@app.post("/items/", response_model=ItemResponse, tags=["Items"])
def create_item(item: ItemCreate, db: Session = Depends(get_db)):
    db_item = DBItem(name=item.name)
    db.add(db_item)
    db.commit()
    db.refresh(db_item)
    return db_item

@app.get("/items/", response_model=List[ItemResponse], tags=["Items"])
def read_items(db: Session = Depends(get_db)):
    return db.query(DBItem).all()

@app.get("/items/{item_id}", response_model=ItemResponse, tags=["Items"])
def read_item(item_id: int, db: Session = Depends(get_db)):
    db_item = db.query(DBItem).filter(DBItem.id == item_id).first()
    if db_item is None:
        raise HTTPException(status_code=404, detail="Item not found")
    return db_item
