from fastapi import FastAPI,HTTPException
from pydantic import BaseModel

app = FastAPI()
class ItemCreate(BaseModel):
    name: str
    price: float
    quantity: int
class Item(ItemCreate):
    id:int

items=[]
current_id=1
@app.get("/")
def Home():
    return {"Hello" : "Rest API"}

@app.post("/items", response_model=Item)
def create_item(ItemToCreate: ItemCreate):
    global current_id
    new_item={
        "id":current_id,
        **ItemToCreate.dict()
    }
    current_id+=1
    items.append(new_item)
    return new_item
@app.get("/items")
def get_items():
    return items
@app.get("/items/{item_id}")
def get_item(item_id:int):
    for i in items:
        if i["id"]==item_id:
            return i
    raise HTTPException(status_code=404,detail="item not found")
@app.put("/items/{item_id}")
def update_item(item_id:int,item_to_update:ItemCreate):
    for index , item in enumerate(items):
        if item["id"]== item_id:
            update_item={
            "id":item_id,
            **item_to_update.dict()
            }
            items[index]=update_item
            return update_item
    raise HTTPException(status_code=404,detail="item not found")