<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('load_select'))
{
    function load_select($items, $selected = NULL)
    {
    	$cad = NULL;

        foreach($items as $item){

        	if($item->value == $selected){
        		$cad.="<option value='".$item->value."' selected='selected'>".$item->text."</option>";
        	}else{
        		$cad.="<option value='".$item->value."'>".$item->text."</option>";
        	}

        }
        
        return $cad;
    }   
}

if ( ! function_exists('load_checkbox'))
{
    function load_checkbox($items,$name, $selecteds = NULL)
    {
        $cad = NULL;
        $cont = 0;

        if($selecteds == NULL){
            foreach ($items as $item) {
                $cad.="<div class='checkbox'>";
                    $cad.='<label><input type="checkbox" name="txt'.$name.'" value="'.$item->value.'">'.$item->text.'</label>';
                $cad.="</div>";
            }
        }else{
            foreach($items as $item){
                foreach ($selecteds as $selected) {
                       if($item->value == $selected->value){
                            $cont++;
                       }
                }

                if($cont > 0){
                    $chk = 'checked="checked"';
                }else{
                   $chk = ''; 
                }


                $cad.="<div class='checkbox'>";
                     $cad.='<label><input type="checkbox" name="txt'.$name.'" '.$chk.' value="'.$item->value.'">'.$item->text.'</label>';
                $cad.="</div>"; 

                $cont = 0;
            }
        }

        return $cad;
    }   
}