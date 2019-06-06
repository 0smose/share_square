var cards = document.querySelectorAll("div.card");
var categories = document.querySelectorAll("li.adcategory");
var allCategories = document.querySelectorAll("p.all_categories")[0];



categories.forEach(clickedCategory => {
	clickedCategory.addEventListener('click', function(){
		cards.forEach(card =>{ 
			if (!card.classList.contains(clickedCategory.innerText)) {
				if (card.style.display === "none") {
					card.style.display = "block";
				} else {
					card.style.display = "none" ;
				}
			

			} 

		})
	})	
});

allCategories.addEventListener('click', function() {
	cards.forEach(card =>{
		card.style.display = "block";
	})
})