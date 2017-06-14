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


        if($selecteds == NULL){
            foreach ($items as $item) {
                $cad.="<div class='checkbox'>";
                    $cad.='<label><input type="checkbox" name="txt'.$name.'" value="'.$item->value.'">'.$item->text.'</label>';
                $cad.="</div>";
            }
        }else{
            foreach($items as $item){
                foreach ($selecteds as $selected) {
                    if($selected->value == $item->value){
                        $cad.="<div class='checkbox'>";
                            $cad.='<label><input type="checkbox" name="txt'.$name.'" checked="checked" value="'.$item->value.'">'.$item->text.'</label>';
                        $cad.="</div>";
                    }else{
                        $cad.="<div class='checkbox'>";
                            $cad.='<label><input type="checkbox" name="txt'.$name.'" value="'.$item->value.'">'.$item->text.'</label>';
                        $cad.="</div>";
                    }
                }
            }
        }

        return $cad;
    }   
}