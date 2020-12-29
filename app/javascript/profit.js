function profit () {
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const tax = (itemPrice.value * 0.1);
    const nonTaxPrice = (itemPrice.value - tax);
    const profit  = document.getElementById("profit");
    profit.innerHTML  = nonTaxPrice
  });
}  
window.addEventListener('load', profit);
