
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
		function fr_validate(){
			cont_validate_errors = 0;
			$(".fr_validate").each(function(){
				/*comenzamos las validaciones*/
				//##solonumeros
				if($(this).hasClass('solonumeros')){
					if(!solonumeros($(this).val())){
						cont_validate_errors++;
						$("span.doc_"+$(this).attr('id')).remove();
					 	$(this).before("<span class='hint--top span_clasic doc_"+$(this).attr('id')+"'  data-hint='Solo se permiten numeros'></span>");
				 		$(this).css({'border':'1px solid #DD4B39'});
				 	}else{
						$("span.doc_"+$(this).attr('id')).fadeOut(500).delay(100).remove();
				 		$(this).css({'border':'1px solid #D2D6DE'});
				 	}
				}//##solonumeros closed

				/*#sololetras*/
				if($(this).hasClass('sololetras')){
					if(!sololetras($(this).val())){
						cont_validate_errors++;
						$("span.doc_"+$(this).attr('id')).remove();
					 	$(this).before("<span class='hint--top span_clasic doc_"+$(this).attr('id')+"'  data-hint='Solo se permiten letras'></span>");
				 		$(this).css({'border':'1px solid #DD4B39'});
				 	}else{
						$("span.doc_"+$(this).attr('id')).fadeOut(500).delay(100).remove();
				 		$(this).css({'border':'1px solid #D2D6DE'});
				 	}
				}//##sololetras closed

				/*#solovacio*/
				if($(this).hasClass('solovacio')){
					if(!solovacio($(this).val())){
						cont_validate_errors++;
						$("span.doc_"+$(this).attr('id')).remove();
					 	$(this).before("<span class='hint--top span_clasic doc_"+$(this).attr('id')+"'  data-hint='El campo no puede quedar vacio'></span>");
				 		$(this).css({'border':'1px solid #DD4B39'});
				 	}else{
						$("span.doc_"+$(this).attr('id')).fadeOut(500).delay(100).remove();
				 		$(this).css({'border':'1px solid #D2D6DE'});
				 	}
				}//##solovacio closed

				/*si el campo esta vacio pero no es obligatorio no entra en la validacion*/
				if(parseInt($(this).val().length)<=0 && $(this).hasClass("nobligatorio")){
					cont_validate_errors--;
					$("span.doc_"+$(this).attr('id')).remove();
				 	$(this).css({'border':'1px solid #D2D6DE'});
				}

			});
			return cont_validate_errors;
		}/*------CIERRE DE LA FUNCION DE VALIDACIONES---*/


		/*funcion para convertir los valores estilo angular en datos y obtener su funcionamiento*/
		function converter_value_angular(){
			detail_html = $('.fr_details').html();
		 	piezes_submit = detail_html.split('{{');
			for(i=0;i<piezes_submit.length;i++){
				if(piezes_submit[i].indexOf('}}')>-1){
					taghtml =  piezes_submit[i].split('}}');
					valores_angular.push(taghtml[0]);
				}
			}
			//console.log(valores_angular);
			extract_value_angular();
		}
		String.prototype.replaceAll = function(search, replacement) {
		    var target = this;
		    return target.split(search).join(replacement);
		};
		/*con esto extraeremos los valores entre llaves para colocarlo en sus correspondientes sitios*/
		function extract_value_angular(){
			/*realizamos el for y vamos a cambiar todo*/
			for(i=0; i<valores_angular.length;i++){

				idnewtext = $("#"+valores_angular[i]).attr('id');
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
				console.log($(".fr_details").html());
				//alert(idnewtext);
				//guardamos el html del tr padre temporalmente
				tr_padre_temp = $(".fr_details tr.tr_padre").html();
				//reemplazamos todos los hijos como tal
				$(".fr_details").html($(".fr_details").html().replaceAll('{{'+idnewtext+'}}',new_text));
				if(new_text_value!=''){
					$(".fr_details").html($(".fr_details").html().replaceAll('{{'+array_fr_select[0]+'-value}}',new_text_value));
				}
				//retornamos nuevamente los valores angular al tr padre
				$(".fr_details tr.tr_padre").html(tr_padre_temp);
			}
		
		}

		function clearfields(){
			for(i=0; i<valores_angular.length;i++){
				$("#"+valores_angular[i]).val("");
			}
			
		}


		/*EVENTOS*/
		$(document).on('click','.fr_button_add',function(){
			/*si la validacion no devolvio nimgun error entra*/
			if(fr_validate()==0){
				//clonamos el tr padre al hijo
				$(".fr_details").find('.tr_padre').clone().removeClass('tr_padre').addClass('tr_hijo').appendTo('.fr_details');
				converter_value_angular();
				clearfields();
			}
			
		});

		$(document).on('click','.fr_button_remove',function(){
			$(this).parent().parent().remove();
		});	



	});
