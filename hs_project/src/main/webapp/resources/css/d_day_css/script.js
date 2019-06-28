
document.addEventListener("DOMContentLoaded", function(){
	const d_date = document.querySelector("#d_date");
	d_date.addEventListener('click', function() {
	  picker.open();
	}, false);

	const picker= new MaterialDatetimePicker({
		el: d_date,
		format: 'YYYY-MM-DD',
		openedBy: 'focus'
	});
});