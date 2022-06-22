const changeBackgroundColor = () => {
    const color = document.getElementById('colors').value
    const divColor = document.querySelector('.container')
    divColor.style.backgroundColor = color;
}


// let i=0, text;
// text = " Web Developer"

// const typing = () => {
//     if(i<text.length){
//         document.getElementById("text").innerHTML += text.charAt(i)
//         i++
//         setTimeout(typing,150)
//     }
// }

const contexts = ["Phyllis Kan ", "Student at Mizzou ", "Web Developer "];

let currentWord = 0;
let currentWordIndex = 0;
let intervalVal;
const text = document.getElementById("typewriter");
const cursor = document.getElementById("cursor");

//typing effect
const Type = () => { 
	let loopChar =  contexts[currentWord].substring(0, currentWordIndex + 1);
	text.innerHTML = loopChar;
	currentWordIndex++;
	if(loopChar === contexts[currentWord]) {
		cursor.style.display = 'inline-block';
		clearInterval(intervalVal);
		setTimeout(() => {
			intervalVal = setInterval(Delete, 50);
		}, 1500);
	}
}

//deleting effect
function Delete() {
	let loopChar =  contexts[currentWord].substring(0, currentWordIndex - 1);
	text.innerHTML = loopChar;
	currentWordIndex--;

	if(loopChar === '') {
		clearInterval(intervalVal);
		if(currentWord == (contexts.length - 1))
			currentWord = 0;
		else
			currentWord++;
		currentWordIndex = 0;
		setTimeout(() => {
			cursor.style.display = 'inline-block';
			intervalVal = setInterval(Type, 150);
		}, 200);
	}
}

// Start the typing effect on load
intervalVal = setInterval(Type, 150);

// toggle list
const tech = document.getElementById('new-tech')
const newTech = () => {
	if (tech.style.display !== "none"){
		tech.style.display = "none"
	}
	else {
		tech.style.display = "block"
	}
}