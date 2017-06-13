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

function isconfirm(url){

	bootbox.confirm({
	    message: "Estas Seguro de Realizar la Operacion?",
	    buttons: {
	        confirm: {
	            label: 'Yes',
	            className: 'btn-success'
	        },
	        cancel: {
	            label: 'No',
	            className: 'btn-danger'
	        }
	    },
	    callback: function (result) {
	        if(result){
	        	document.location.href=url;
	        }
	    }
	});

}