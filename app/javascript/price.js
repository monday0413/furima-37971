window.addEventListener('load', function(){

  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price") //販売手数料 
  const profit = document.getElementById("profit")   //販売利益


  itemPrice.addEventListener('input', () => {
    addTaxPrice.innerHTML = Math.round(itemPrice.value * 0.1 );
    profit.innerHTML = Math.round(itemPrice.value - Math.round(itemPrice.value * 0.1 ))

  })

});