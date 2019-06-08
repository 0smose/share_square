//We get the conversation body div by its id and we stock it in a variable
var element = document.getElementById("conversation-body");
// The scrollTop property returns the number of pixels the content of the <div> is scrolled vertically
// ThecrollHeight property returns the entire height of the div in pixels
// We set the scrollTOp property to the height of the div so that the scroll bar stays at the bottom
element.scrollTop = element.scrollHeight;

// We set a function to update the scrollbar and we call each time we add an element to the conversation
function updateScroll(){
    var element = document.getElementById("conversation-body");
    element.scrollTop = element.scrollHeight;
}