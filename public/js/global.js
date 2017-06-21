$(document).ready(function () {

    $('.sidebar-menu').tree();
    $(".datatable").DataTable({
    	'language':{
		    "sProcessing":     "Procesando...",
		    "sLengthMenu":     "Mostrar _MENU_ registros",
		    "sZeroRecords":    "No se encontraron resultados",
		    "sEmptyTable":     "Ningún dato disponible en esta tabla",
		    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
		    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
		    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
		    "sInfoPostFix":    "",
		    "sSearch":         "Buscar:",
		    "sUrl":            "",
		    "sInfoThousands":  ",",
		    "sLoadingRecords": "Cargando...",
		    "oPaginate": {
		        "sFirst":    "Primero",
		        "sLast":     "Último",
		        "sNext":     "Siguiente",
		        "sPrevious": "Anterior"
		    },
		    "oAria": {
		        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
		        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
		    }
		}
    });

    /*$(function () {
	    $('input').iCheck({
	      checkboxClass: 'icheckbox_square-blue',
	      radioClass: 'iradio_square-blue',
	      increaseArea: '20%' // optional
	    });
	});*/
    
});

function isalert(msj){
	bootbox.alert({
		title : 'Alerta',
		message : msj
	});
}

function isconfirm(message,url){

	bootbox.confirm({
		title : "Confirmaci&oacute;n",
	    message: message,
	    buttons: {
	        cancel: {
	            label: '<i class="fa fa-times"></i> No',
	            className: 'btn-danger'
	        },
	        confirm: {
	            label: '<i class="fa fa-check"></i> Si',
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

function set_calculate(e,dolv,delv){
	var forid = e.getAttribute("data-calculate");
	var multiple = dolv * delv;
	var getVal = (document.getElementById(forid).innerHTML) ? document.getElementById(forid).innerHTML : 0;
	var total = parseInt(getVal) + parseInt(multiple);

	document.getElementById(forid).innerHTML = total;
}