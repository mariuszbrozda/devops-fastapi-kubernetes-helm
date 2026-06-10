from fastapi.testclient import TestClient
from src.app.main import app

client = TestClient(app)

def test_list_products_returns_products_html():
    response = client.get("/products")

    assert response.status_code == 200
    assert "text/html" in response.headers["content-type"]
    assert "Classic Tee" in response.text
    assert "Sneakers" in response.text

def test_get_product_by_id_returns_product_json():
    response = client.get("/products/1")

    assert response.status_code == 200
    body = response.json()
    assert body["id"] == 1
    assert body["name"] == "Classic Tee"
    assert body["price"] == 24.99

def test_get_product_missing_returns_404():
    response = client.get("/products/9999")

    assert response.status_code == 404
    assert response.json()["detail"] == "Product not found"