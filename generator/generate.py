import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["product", "category", "price", "quantity"]

PRODUCTS = [
    "protein",
    "creatine",
    "glutamine",
    "l-carnitine",
    "pre-workout",
    "vitamins",
    "omega-3",
    "melatonin",
    "shaker"
]

CATEGORIES = [
    "nutrition",
    "vitamins",
    "accessories"
]

def generate_row():
    product = random.choice(PRODUCTS)
    category = random.choice(CATEGORIES)
    price = random.randint(3000, 25000)
    quantity = random.randint(1, 40)


    return {
        "product": product,
        "category": category,
        "price": price,
        "quantity": quantity
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)

print(f"Done, file created: {OUTPUT_FILE}")
