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

function set_calculate(){

	var radios = document.getElementsByTagName("input");
	var etotal = 0;

	for(var i = 0; i < radios.length; i++){

		if(radios[i].getAttribute("data-calculate")){
			var spl = radios[i].getAttribute("data-calculate").split("_");

			document.getElementById(radios[i].getAttribute("data-calculate")).innerHTML = parseInt(0);

			document.getElementById(spl[0]+"_"+spl[1]).innerHTML = parseInt(0);

			document.getElementById("competency_"+spl[0]).innerHTML = parseInt(0);

		}

	}

    for(var e = 0; e < radios.length; e++){

		if(radios[e].getAttribute("data-calculate")){
			if(radios[e].checked){

				var getVal = document.getElementById(radios[e].getAttribute("data-calculate")).innerHTML;

				var spl = radios[e].getAttribute("data-calculate").split("_");
				var mulp = radios[e].getAttribute("data-mult").split("_");
				var multiplo = mulp[0] * mulp[1];
				var total = parseInt(getVal) + parseInt(multiplo);

				document.getElementById(radios[e].getAttribute("data-calculate")).innerHTML = total;

				document.getElementById(spl[0]+"_"+spl[1]).innerHTML = parseInt(document.getElementById(spl[0]+"_"+spl[1]).innerHTML) + parseInt(multiplo);

				document.getElementById("competency_"+spl[0]).innerHTML = parseInt(document.getElementById("competency_"+spl[0]).innerHTML) + parseInt(multiplo);
			}
		}
	}

	

}