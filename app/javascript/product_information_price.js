window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML =Math.floor(inputValue*0.1);
  const profitTaxDom = document.getElementById("profit");
  profitTaxDom.innerHTML = Math.floor(inputValue*0.9);
  
  

  
})
});