var modal = document.getElementById('SimpleModal');
var modalBtn = document.getElementById('modalBtn');
var closeBtn = document.getElementById('closeBtn');

//listen for click
modalBtn.addEventListener('click', openModal);

//function to open the modal
function openModal(){
	console.log(123);
	modal.style.display = 'block';
}