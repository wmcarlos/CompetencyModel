
	jQuery(document).ready(function($) {
		var valores_angular = Array();
		

		/*----------------PATRON DE VALIDACIONES-------------------*/
		function solonumeros(data){
			patron = /^(?:\+|-)?\d+$/
			return patron.test(data);
		}
		function solovacio(palabra){
			patron =  /^[^]+$/
			return patron.test(palabra);
		}
		function sololetras(palabra){
			patron = /^[a-zA-Z]+(\s*[a-zA-Z]*)*[a-zA-Z]+$/
			return patron.test(palabra);
		}
		/*------------------------------------*/


		
		/*funcion para validar los campos*/
		function fr_validate(valor_validate,tagbutton_validate){
			cont_validate_errors = 0;
							

				$(tagbutton_validate).find('tbody tr td .fr_validate').each(function(){
				if(valor_validate!='button-click'){
					fr_data_field = valor_validate;
				}else{
					fr_data_field  = $(this);
				}
				/*comenzamos las validaciones*/
				//##solonumeros
				if(fr_data_field.hasClass('solonumeros')){
					if(!solonumeros(fr_data_field.val())){
						cont_validate_errors++;
						$("span.doc_"+fr_data_field.attr('id')).remove();
					 	fr_data_field.before("<span class='hint--top span_clasic doc_"+fr_data_field.attr('id')+"'  data-hint='Solo se permiten numeros'></span>");
				 		fr_data_field.css({'border':'1px solid #DD4B39'});
				 	}else{
						$("span.doc_"+fr_data_field.attr('id')).fadeOut(500).delay(100).remove();
				 		fr_data_field.css({'border':'1px solid #D2D6DE'});
				 	}
				}//##solonumeros closed

				/*#sololetras*/
				if(fr_data_field.hasClass('sololetras')){
					if(!sololetras(fr_data_field.val())){
						cont_validate_errors++;
						$("span.doc_"+fr_data_field.attr('id')).remove();
					 	fr_data_field.before("<span class='hint--top span_clasic doc_"+fr_data_field.attr('id')+"'  data-hint='Solo se permiten letras'></span>");
				 		fr_data_field.css({'border':'1px solid #DD4B39'});
				 	}else{
						$("span.doc_"+fr_data_field.attr('id')).fadeOut(500).delay(100).remove();
				 		fr_data_field.css({'border':'1px solid #D2D6DE'});
				 	}
				}//##sololetras closed

				/*#solovacio*/
				if(fr_data_field.hasClass('solovacio')){
					if(!solovacio(fr_data_field.val())){
						cont_validate_errors++;
						$("span.doc_"+fr_data_field.attr('id')).remove();
					 	fr_data_field.before("<span class='hint--top span_clasic doc_"+fr_data_field.attr('id')+"'  data-hint='El campo no puede quedar vacio'></span>");
				 		fr_data_field.css({'border':'1px solid #DD4B39'});
				 	}else{
						$("span.doc_"+fr_data_field.attr('id')).fadeOut(500).delay(100).remove();
				 		fr_data_field.css({'border':'1px solid #D2D6DE'});
				 	}
				}//##solovacio closed

				/*si el campo esta vacio pero no es obligatorio no entra en la validacion*/
				if(parseInt(fr_data_field.val().length)<=0 && fr_data_field.hasClass("nobligatorio")){
					cont_validate_errors--;
					$("span.doc_"+fr_data_field.attr('id')).remove();
				 	fr_data_field.css({'border':'1px solid #D2D6DE'});
				}

			
				});
			
			return cont_validate_errors;
		}/*------CIERRE DE LA FUNCION DE VALIDACIONES---*/


		/*funcion para convertir los valores estilo angular en datos y obtener su funcionamiento*/
		function converter_value_angular(tagbutton){
			
			//alert("converter angular "+tagbutton);
			detail_html = $('#'+tagbutton).html();
			console.log(detail_html);
		 	piezes_submit = detail_html.split('{{');
			for(i=0;i<piezes_submit.length;i++){
				if(piezes_submit[i].indexOf('}}')>-1){
					taghtml =  piezes_submit[i].split('}}');
					valores_angular.push(taghtml[0]);
				}
			}
			//console.log(valores_angular);
			piezes_submit.length = 0;
			extract_value_angular(tagbutton);
		}
		String.prototype.replaceAll = function(search, replacement) {
		    var target = this;
		    return target.split(search).join(replacement);
		};
		/*con esto extraeremos los valores entre llaves para colocarlo en sus correspondientes sitios*/
		function extract_value_angular(tagbutton){
			/*realizamos el for y vamos a cambiar todo*/
			for(i=0; i<valores_angular.length;i++){
				idnewtext = $("#"+valores_angular[i]).attr('id');

				//alert("text "+$("#"+idnewtext).text());


					if($("#"+idnewtext).text()){
						new_text =  $("#"+idnewtext).text();
						if($("#"+idnewtext).hasClass('fr_select')){
							new_text = $("#"+idnewtext+" option:selected").text();
						}
					}else{
						new_text = $("#"+idnewtext).val();
					}

				

				/*preguntaremos si el select es un hijo*/
				
					if(valores_angular[i].indexOf('-value')>-1){
						array_fr_select = valores_angular[i].split("-");
						new_text_value = $("#"+array_fr_select[0]).val();
					}else{
						new_text_value = '';
					}
				

				/*reemplazamos el texto*/
				//console.log($("#"+tagbutton).html());
				//alert(idnewtext);
				//guardamos el html del tr padre temporalmente
				tr_padre_temp = $("#"+tagbutton+" tr.tr_padre").html();

				//reemplazamos todos los hijos como tal
				$("#"+tagbutton).html($("#"+tagbutton).html().replaceAll('{{'+idnewtext+'}}',new_text));
				if(new_text_value!=''){
					$("#"+tagbutton).html($("#"+tagbutton).html().replaceAll('{{'+array_fr_select[0]+'-value}}',new_text_value));
				}
				//retornamos nuevamente los valores angular al tr padre
				$("#"+tagbutton+" tr.tr_padre").html(tr_padre_temp);
			}
			/*vaciamos los arreglos*/
			valores_angular.length=0;
		}

		function clearfields(){
			for(i=0; i<valores_angular.length;i++){
				$("#"+valores_angular[i]).val("");
			}
			valores_angular.length = 0;
			
		}


		/*EVENTOS*/
		$(document).on('click','.fr_button_add',function(){
			/*si la validacion no devolvio nimgun error entra*/
			tagbutton = $(this).parent().parent().parent().parent().find('.fr_details').attr("id");

			tagbutton_validate = $(this).parent().parent().parent().parent(); 

			if(fr_validate('button-click',tagbutton_validate)==0){
				//clonamos el tr padre al hijo
				$("#"+tagbutton).find('.tr_padre').clone().removeClass('tr_padre').addClass('tr_hijo').appendTo('#'+tagbutton);
				converter_value_angular(tagbutton);
				clearfields();
			}
			
		});

		$(document).on('click','.fr_button_remove',function(){
			$(this).parent().parent().remove();
		});	

		$(".fr_validate").keyup(function(){
			tagbutton_validate = $(this).parent().parent().parent().parent(); 
			fr_validate($(this),tagbutton_validate);
		});

		$(".fr_validate").change(function(){
			tagbutton_validate = $(this).parent().parent().parent().parent(); 
			fr_validate($(this),tagbutton_validate);
		});


	});
