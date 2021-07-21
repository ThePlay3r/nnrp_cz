$(function() {
	window.addEventListener('message', function(event) {
		if (event.data.type == "enableui") {
			document.body.style.display = event.data.enable ? "block" : "none";
		}
		if (event.data.type == "lore") {
			document.getElementById("title").textContent = event.data.user.firstname + ' ' + event.data.user.lastname

			$("#height").val(event.data.user.height)
			$("#height").addClass("focus")
			$("#height").prop( "disabled", true )

			$("#dateofbirth").val(event.data.user.dateofbirth)
			$("#dateofbirth").addClass("focus")
			$("#dateofbirth").prop( "disabled", true )

			document.getElementById("row--zero").style.display = "none"
			document.getElementById("loreTitle").setAttribute("data-placeholder", "Lore")
			$("#lore").focus()
			document.getElementById("row--first").style.display = "none"

			document.getElementById("submit").style.display = "none"
			document.getElementById("submit2").style.display = "block"
		}
	});

	document.onkeyup = function (data) {
		if (data.which == 27) { // Escape key
			$.post('http://esx_identity/escape', JSON.stringify({}));
		}
	};

});

$(".txtb input").on("focus",function(){
	$(this).addClass("focus");
});

$(".txtb textarea").on("focus",function(){
	$(this).addClass("focus2");
	setTimeout(() => {
		$(this).addClass("focus2fin");
	}, 250)
});

$(".txtb input").on("blur",function(){
	if($(this).val() == "")
		$(this).removeClass("focus");
});

$(".txtb textarea").on("blur",function(){
	if($(this).val() == "")
		$(this).removeClass("focus2");
		$(this).removeClass("focus2fin");
});

function saveRegister() {
	document.getElementById("pomoc").style.display = "block"
	// Verify date
	var date = $("#dateofbirth").val();
	var dateCheck = new Date($("#dateofbirth").val());

	if (dateCheck == "Invalid Date") {
		date == "invalid";
	}
	var loreVal = $("#lore").val()
	
	if ($("#lore").val().length < 3) {
		loreVal = 'Nemas zadnou historii'
	}

	$.post('http://esx_identity/register', JSON.stringify({
		firstname: $("#firstname").val(),
		lastname: $("#lastname").val(),
		dateofbirth: date,
		lore: loreVal,
		sex: $("input[type='radio'][name='sex']:checked").val(),
		height: $("#height").val()
	}));
}
function saveLore() {
	$.post('http://esx_identity/registerLore', JSON.stringify({
		lore: $("#lore").val(),
	}));
}