class Product:
    def __init__(self, name, price, quantity):
        self.name = name
        self.price = price
        self.quantity = quantity

    def display_details(self):
        print(f"Product: {self.name}")
        print(f"Price: ${self.price}")
        print(f"Quantity: {self.quantity}")


products = []

def add_product():
    name = input("Enter the product name: ")
    price = float(input("Enter the product price: "))
    quantity = int(input("Enter the product quantity: "))
    product = Product(name, price, quantity)
    products.append(product)
    print("Product added successfully.")

def view_products():
    if not products:
        print("No products available.")
    else:
        print("Products:")
        for product in products:
            product.display_details()
            print("-------------------------")

def menu():
    while True:
        print("\nE-commerce System")
        print("1. Add Product")
        print("2. View Products")
        print("3. Exit")

        choice = input("Enter your choice: ")

        if choice == "1":
            add_product()
        elif choice == "2":
            view_products()
        elif choice == "3":
            print("Thank you for using the E-commerce System. Goodbye!")
            break
        else:
            print("Invalid choice. Please try again.")


menu()
