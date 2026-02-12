from fastapi import FastAPI,HTTPException

app = FastAPI()
items=[]
@app.get("/")
def Home():
    return {"Hello" : "Rest API"}

@app.post("/items")
def create_item(item: str):
    items.append(item)
    return {"message": "Item added successfully"}
@app.get("/items/{item_id}")
def get_items(item_id:int):
    if item_id < len(items):
        item=items[item_id]
        return item
    else:
        raise HTTPException(status_code=404, detail="Item not found")