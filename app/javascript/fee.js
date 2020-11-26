function fee(){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('input', () => {
    const priceValue = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = Math.floor(priceValue * 0.1);
    profit.innerHTML = Math.floor(priceValue - (priceValue * 0.1));
  })
}

window.addEventListener('load', fee);