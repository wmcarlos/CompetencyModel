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