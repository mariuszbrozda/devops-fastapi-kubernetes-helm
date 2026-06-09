from fastapi import FastAPI, HTTPException
from fastapi.responses import HTMLResponse
from src.app.models import ProductCreate, ProductUpdate

app = FastAPI(
    title="Online Store",
    description="FastAPI online store application deployed with Kubernetes.",
    version="1.0.0",
)

@app.get("/", response_class=HTMLResponse, summary="Store landing page")
def landing_page():
    products = ProductService().list_products()
    return products


@app.get("/products", summary="List all products")
def get_all_products():
    products = ProductService().list_products()
    return products


@app.get("/products/{product_id}", summary="Get product by ID")
def get_product(product_id: int):
    product = ProductService().get_product(product_id)
    if not product:
        raise HTTPException(status_code=404, detail="Product not found")
    return product


@app.post("/products", response_model=None, summary="Create a new product")
def create_product(payload: ProductCreate):
    return ProductService().create_product(payload)


@app.put("/products/{product_id}", summary="Update a product")
def update_product(product_id: int, payload: ProductUpdate):
    product = ProductService().update_product(product_id, payload)
    if not product:
        raise HTTPException(status_code=404, detail="Product not found")
    return product


@app.delete("/products/{product_id}", summary="Delete a product")
def delete_product(product_id: int):
    deleted = ProductService().delete_product(product_id)
    if not deleted:
        raise HTTPException(status_code=404, detail="Product not found")
    return {"deleted": product_id}
