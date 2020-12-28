function tax () {
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
  　const tax = (itemPrice.value * 0.1);
    const addTaxPrice  = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML  = tax
  });

}

window.addEventListener('load', tax);