var modal = document.getElementById('SimpleModal');
var modalBtn = document.getElementById('modalBtn');
var closeBtn = document.getElementsByClassName('closeBtn')[0];


//listen for click
modalBtn.addEventListener('click', openModal);

closeBtn.addEventListener('click', closeModal);

//function to open the modal
function openModal(){
	modal.style.display = 'block';
	console.log(456);

}

//function to close the modal
function closeModal(){
	modal.style.display = 'none';
	console.log(123);
}