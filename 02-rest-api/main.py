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

@app.post("/items")
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
    for i in items:
        if i["id"]==item_id:
            i["name"]=item_to_update.name
            i["price"]=item_to_update.price
            i["quantity"]=item_to_update.quantity
            return i
    raise HTTPException(status_code=404,detail="item not found")