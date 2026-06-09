
from src.app.models import Product

def _render_landing_page(products: list[Product]) -> str:
    """Render the product list as a styled HTML landing page."""
    product_cards = "\n".join(
        f"""
        <article class=\"product-card\">
          <h2>{product.name}</h2>
          <p>{product.description}</p>
          <div class=\"product-meta\">
            <span>Price: ${product.price:.2f}</span>
            <span>In stock: {product.in_stock}</span>
          </div>
        </article>
        """
        for product in products
    )

    return f"""
    <!DOCTYPE html>
    <html lang=\"en\">
      <head>
        <meta charset=\"UTF-8\" />
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />
        <title>Online Store</title>
        <style>
          body {{ margin: 0; font-family: Arial, sans-serif; background: #f4f4f9; color: #1f2937; }}
          .page {{ max-width: 960px; margin: 0 auto; padding: 2rem; }}
          .hero {{ text-align: center; margin-bottom: 2rem; }}
          .hero h1 {{ font-size: 2.75rem; margin: 0 0 0.5rem; }}
          .hero p {{ color: #4b5563; font-size: 1.1rem; margin: 0; }}
          .product-grid {{ display: grid; gap: 1rem; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); }}
          .product-card {{ background: #fff; padding: 1.5rem; border-radius: 12px; box-shadow: 0 10px 20px rgba(0,0,0,0.08); }}
          .product-card h2 {{ margin: 0 0 0.5rem; font-size: 1.25rem; }}
          .product-card p {{ margin: 0 0 1rem; color: #4b5563; min-height: 3rem; }}
          .product-meta {{ display: flex; justify-content: space-between; gap: 1rem; font-weight: 600; color: #111827; }}
          .footer {{ text-align: center; margin-top: 2rem; color: #6b7280; font-size: 0.95rem; }}
        </style>
      </head>
      <body>
        <div class=\"page\">
          <section class=\"hero\">
            <p>Welcome to our online storefront.</p>
            <h1>Shop the latest quality goods.</h1>
            <p>Browse featured products and start your order today.</p>
          </section>
          <section class=\"product-grid\">
            {product_cards}
          </section>
          <footer class=\"footer\">
            <p>FastAPI store demo — browse the API at <code>/docs</code>.</p>
          </footer>
        </div>
      </body>
    </html>
    """