$(document).ready(function () {

    $('.sidebar-menu').tree();
    $(".datatable").DataTable();
    
});

function isalert(msj){
	bootbox.alert({
		title : 'Alert',
		message : msj
	});
}