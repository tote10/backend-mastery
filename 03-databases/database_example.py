from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# 1. Setup the Database Engine
# "sqlite:///./test.db" tells SQLAlchemy to use a file named test.db in the current folder
DATABASE_URL = "sqlite:///./test_example.db"
engine = create_engine(DATABASE_URL, connect_args={"check_same_thread": False})

# 2. Create a Session factory
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# 3. Define the Base for our models
Base = declarative_base()

# 4. Define a Database Model (Table)
class Item(Base):
    __tablename__ = "items"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, index=True)
    description = Column(String)

# 5. Create the tables in the database
Base.metadata.create_all(bind=engine)

def run_example():
    # Create a new session
    db = SessionLocal()
    
    try:
        # CREATE: Add a new item
        print("--- Creating an item ---")
        new_item = Item(name="Notebook", description="A premium paper notebook")
        db.add(new_item)
        db.commit()
        db.refresh(new_item)
        print(f"Added item: {new_item.name} with ID: {new_item.id}")

        # READ: Get items
        print("\n--- Reading items ---")
        items = db.query(Item).all()
        for item in items:
            print(f"Found: {item.name} (ID: {item.id})")

        # UPDATE: Change item description
        print("\n--- Updating item ---")
        item_to_update = db.query(Item).filter(Item.id == new_item.id).first()
        item_to_update.description = "Updated description"
        db.commit()
        print(f"Updated description for {item_to_update.name}")

        # DELETE: Remove the item
        print("\n--- Deleting item ---")
        db.delete(item_to_update)
        db.commit()
        print("Item deleted successfully")

    finally:
        db.close()

if __name__ == "__main__":
    run_example()
