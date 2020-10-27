function hover(){
	if($('#secret').is(':checked')){
		$('span').css('background-color','DodgerBlue');
		$('span').css('color','white');
	} else{
		$('span').css('background','none');
		$('span').css('color','black');
	}
}
