from typing import Dict, List, Optional
from src.app.models import ProductCreate, ProductUpdate, Product

_store: Dict[int, Product] = {
    1: Product(id=1, name="Classic Tee", description="A classic cotton tee", price=24.99, in_stock=120),
    2: Product(id=2, name="Sneakers", description="Comfortable running shoes", price=79.99, in_stock=35),
    3: Product(id=3, name="Classic Tee", description="A classic cotton tee", price=24.99, in_stock=120),
    4: Product(id=4, name="Sneakers", description="Comfortable running shoes", price=79.99, in_stock=35),
    5: Product(id=5, name="Classic Tee", description="A classic cotton tee", price=24.99, in_stock=120),
    6: Product(id=6, name="Sneakers", description="Comfortable running shoes", price=79.99, in_stock=35),
    7: Product(id=7, name="Classic Tee", description="A classic cotton tee", price=24.99, in_stock=120),
    8: Product(id=8, name="Sneakers", description="Comfortable running shoes", price=79.99, in_stock=35),
    9: Product(id=9, name="Classic Tee", description="A classic cotton tee", price=24.99, in_stock=120),
}
_next_id = max(_store.keys()) + 1

class ProductService:
    """In-memory product storage and business logic for CRUD operations."""

    def __init__(self):
        self._store: Dict[int, Product] = _store
        self._next_id: int = _next_id

    def list_products(self) -> List[Product]:
        """Return all products currently stored in memory."""
        return list(self._store.values())

    def get_product(self, product_id: int) -> Optional[Product]:
        """Return the product for the given ID or None if not found."""
        return self._store.get(product_id)

    def create_product(self, payload: ProductCreate) -> Product:
        """Create a new product in storage and return it."""
        global _next_id
        product = Product(id=_next_id, **payload.model_dump())
        _store[_next_id] = product
        _next_id += 1
        return product

    def update_product(self, product_id: int, payload: ProductUpdate) -> Optional[Product]:
        """Update an existing product with the provided fields and return it."""
        current = self._store.get(product_id)
        if not current:
            return None
        updated_data = payload.model_dump(exclude_unset=True)
        updated_product = current.model_copy(update=updated_data)
        self._store[product_id] = updated_product
        return updated_product

    def delete_product(self, product_id: int) -> bool:
        """Remove a product from storage and return whether deletion succeeded."""
        return _store.pop(product_id, None) is not None
