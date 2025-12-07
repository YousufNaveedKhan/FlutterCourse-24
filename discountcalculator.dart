void main() {
  bool isVisitsImtiazbyBike = false;
  double purchasedProducts = 20;
  double billAmount = 75000;

  if (isVisitsImtiazbyBike == true &&
      purchasedProducts == 10 &&
      billAmount == 5000) {
    double givenDiscount = 25;
    double discFormula = billAmount * givenDiscount / 100;
    double discount = billAmount - discFormula;
    print(
        "You just visits Imtiaz by bike and purchased ${purchasedProducts} products and your bill amount is ${billAmount}. You have got ${givenDiscount}% discount so after discount, your new bill amount is ${discount}");
  } else if (isVisitsImtiazbyBike == true &&
      purchasedProducts == 10 &&
      billAmount == 10000) {
    double givenDiscount = 50;
    double discFormula = billAmount * givenDiscount / 100;
    double discount = billAmount - discFormula;
    print(
        "You just visits Imtiaz by bike and purchased ${purchasedProducts} products and your bill amount is ${billAmount}. You have got ${givenDiscount}% discount so after discount, your new bill amount is ${discount}");
  } else if (isVisitsImtiazbyBike == true &&
      purchasedProducts == 10 &&
      billAmount == 25000) {
    double givenDiscount = 75;
    double discFormula = billAmount * givenDiscount / 100;
    double discount = billAmount - discFormula;
    print(
        "You just visits Imtiaz by bike and purchased ${purchasedProducts} products and your bill amount is ${billAmount}. You have got ${givenDiscount}% discount so after discount, your new bill amount is ${discount}");
  } else if (isVisitsImtiazbyBike == false &&
      purchasedProducts == 20 &&
      billAmount == 20000) {
    double givenDiscount = 10;
    double discFormula = billAmount * givenDiscount / 100;
    double discount = billAmount - discFormula;
    print(
        "You just visits Imtiaz by bike and purchased ${purchasedProducts} products and your bill amount is ${billAmount}. You have got ${givenDiscount}% discount so after discount, your new bill amount is ${discount}");
  } else if (isVisitsImtiazbyBike == false &&
      purchasedProducts == 20 &&
      billAmount == 30000) {
    double givenDiscount = 50;
    double discFormula = billAmount * givenDiscount / 100;
    double discount = billAmount - discFormula;
    print(
        "You just visits Imtiaz by bike and purchased ${purchasedProducts} products and your bill amount is ${billAmount}. You have got ${givenDiscount}% discount so after discount, your new bill amount is ${discount}");
  } else if (isVisitsImtiazbyBike == false &&
      purchasedProducts == 20 &&
      billAmount == 75000) {
    double givenDiscount = 75;
    double discFormula = billAmount * givenDiscount / 100;
    double discount = billAmount - discFormula;
    print(
        "You just visits Imtiaz by bike and purchased ${purchasedProducts} products and your bill amount is ${billAmount}. You have got ${givenDiscount}% discount so after discount, your new bill amount is ${discount}");
  }else {
    print("Something went wrong!");
  }
}
