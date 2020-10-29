window.onload  = function(){
	$('#kakao-login').click(function(){
		$(location).attr('href', 'https://kauth.kakao.com/oauth/authorize?client_id=58442d2db186718a10e67063f8c92638&redirect_uri=http://localhost:8080/test/kakaologin&response_type=code');
	});
	
	$('#naver-login').click(function(){
		$(location).attr('href', 'https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=bXWkcT4KNffb0pw2PpOA&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Ftest%2Fnaverlogin&state=4sfiddlh2llgmki950rp792p2s');
	});
	
	$('#goggle-login').click(function(){
		$(location).attr('href', 'https://accounts.google.com/o/oauth2/v2/auth?scope=email profile&response_type=code&state=security_token%3D138r5719ru3e1%26url%3Dhttps://oauth2.example.com/token&client_id=646310476786-5ml7n2ofqb422dqkekkbpgvt809opomp.apps.googleusercontent.com&redirect_uri=http://localhost:8080/test/googlelogin&access_type=offline');
	});
}