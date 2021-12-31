window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addProfit = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = Number(priceInput.value);
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    addProfit.innerHTML = Math.ceil(inputValue * 0.9);
  })

})