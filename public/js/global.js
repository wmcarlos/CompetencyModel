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

function isconfirm(message,url){

	bootbox.confirm({
		title : "Confirmation",
	    message: message,
	    buttons: {
	        cancel: {
	            label: '<i class="fa fa-times"></i> No',
	            className: 'btn-danger'
	        },
	        confirm: {
	            label: '<i class="fa fa-check"></i> Yes',
	            className: 'btn-success'
	        }
	    },
	    callback: function (result) {
	        if(result){
	        	document.location.href=url;
	        }
	    }
	});

}