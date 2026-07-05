# DAX Measures

This Document contains all the DAX function used in this project.

---

## Total Revenue

**Purpose:** Calculates all the revenue generated from the products sold. 

```DAX
Total Revenue = SUM('main orderitems'[price])
```

## Total Orders

**Purpose:** Calculates total number of orders.

```DAX
Total Orders = COUNTROWS('main orders')
```

## Total Customers

**Purpose:** Calculates total number of customers.

```DAX
Total Customers = COUNTROWS('main customers')
```

## Average Shipping Charges

**Purpose:** Calculates the average shipping charges.

```DAX
Average Shipping Charges = AVERAGE('main orderitems'[shipping_charges])
```

## Average Product Price

**Purpose:** Calculates the average selling price of products.

```DAX
Average product price = AVERAGE('main orderitems'[price])
```

## Average Order Value

**Purpose:** Calculates the Average revenue earned per order.

```DAX
Average order Value = DIVIDE([Total Revenue], [Total Orders])
```
