window.onload = function(){
	$('.bd_title').click(function(){
		var bno = $(this).parent('.bd_tr').children('.bd_bno').text();
		$(location).attr('href', 'http://localhost:8080/sprpa/board/viewArticle?bno='+bno);
	});
		
}

