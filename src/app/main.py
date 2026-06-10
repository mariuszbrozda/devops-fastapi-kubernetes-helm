from fastapi import FastAPI, HTTPException
from fastapi.responses import HTMLResponse
from src.app.models import ProductCreate, ProductUpdate
from .service import ProductService
from .landing_page import _render_landing_page

app = FastAPI(
    title="Online Store",
    description="FastAPI online store application deployed with Kubernetes.",
    version="1.0.0",
)

@app.get("/", response_class=HTMLResponse, summary="Store landing page")
def landing_page():
    """Render the HTML landing page showing all available products."""
    products = ProductService().list_products()
    return HTMLResponse(content=_render_landing_page(products))

@app.get("/health", summary="Health check")
def health_check():
    """Return the health status of the application."""
    return {"status": "Successfully connected to API."}

@app.get("/products", summary="List all products")
def get_all_products():
    """Return an HTML page listing all products in the store."""
    products = ProductService().list_products()
    return HTMLResponse(content=_render_landing_page(products))

@app.get("/products/{product_id}", summary="Get product by ID")
def get_product(product_id: int):
    """Return product details for the given product ID or raise 404 if missing."""
    product = ProductService().get_product(product_id)
    if not product:
        raise HTTPException(status_code=404, detail="Product not found")
    return product

@app.post("/products", response_model=None, summary="Create a new product")
def create_product(payload: ProductCreate):
    """Create a new product using the validated request payload."""
    return ProductService().create_product(payload)

@app.put("/products/{product_id}", summary="Update a product")
def update_product(product_id: int, payload: ProductUpdate):
    """Update an existing product and return the updated record."""
    product = ProductService().update_product(product_id, payload)
    if not product:
        raise HTTPException(status_code=404, detail="Product not found")
    return product

@app.delete("/products/{product_id}", summary="Delete a product")
def delete_product(product_id: int):
    """Delete a product by ID and return deletion confirmation."""
    deleted = ProductService().delete_product(product_id)
    if not deleted:
        raise HTTPException(status_code=404, detail="Product not found")
    return {"deleted": product_id}
