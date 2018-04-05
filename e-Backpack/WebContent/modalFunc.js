//var modal = document.getElementById('SimpleModal');
//var modalBtn = document.getElementById('modalBtn');
//var closeBtn = document.getElementsByClassName('closeBtn')[0];
//
//
////listen for click
//modalBtn.addEventListener('click', openModal);
//
//closeBtn.addEventListener('click', closeModal);
//
////function to open the modal
//function openModal(){
//	modal.style.display = 'block';
//
//}
//
////function to close the modal
//function closeModal(){
//	modal.style.display = 'none';
//1qa6}
$(document).ready(function(){
    $("#addEventBtn").click(function(){
        $("#addEventModal").modal();
    });
});