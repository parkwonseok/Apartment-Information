package com.pws.test;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "loginForm";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup() {
		return "signup";
	}

	@RequestMapping(value = "/kakaologin", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String kakaologin(@RequestParam("code") String code) {
		JsonNode accessToken;
		// JsonNode트리형태로 토큰받아온다
		JsonNode jsonToken = Kakao.getKakaoAccessToken(code);
		// 여러 json객체 중 access_token을 가져온다
		accessToken = jsonToken.get("access_token");

		// access_token을 통해 사용자 정보 요청
		JsonNode userInfo = Kakao.getKakaoUserInfo(accessToken);
		// Get id
		String id = userInfo.path("id").asText();
		String name = null;
		String email = null;
		// 유저정보 카카오에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		name = properties.path("nickname").asText();
		email = kakao_account.path("email").asText();
		System.out.println("id : " + id);
		System.out.println("name : " + name);
		System.out.println("email : " + email);
		return "home";
	}

	@Autowired
	NaverLoginBO naverLoginBO;

	// 네이버 Callback호출 메소드
	@RequestMapping(value = "/naverlogin")
	public String naverCallback(ModelMap model, @RequestParam String code, @RequestParam String state,
			HttpSession session) throws IOException, ParseException {
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
		session.setAttribute("state", state);
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		String apiResult = naverLoginBO.getUserProfile(oauthToken);

		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		Object obj2 = parser.parse(jsonObj.get("response").toString());
		JSONObject jsonObj2 = (JSONObject) obj2;
		System.out.println(jsonObj2.get("name"));
		System.out.println(jsonObj2.get("email"));
		return "home";
	}

	// 구글 로그인 콜백
	@RequestMapping(value = "/googlelogin")
	public String googleLogin(@RequestParam("code") String code, HttpSession session, Model model) throws Exception {
		// 코드 확인
		System.out.println("code : " + code);

		// Access Token 발급
		JsonNode jsonToken = Google.getAccessToken(code);
		String accessToken = jsonToken.get("access_token").toString();
		String refreshToken = "";
		if (jsonToken.has("refresh_token")) {
			refreshToken = jsonToken.get("refresh_token").toString();
		}
		String expiresTime = jsonToken.get("expires_in").toString();
		System.out.println("Access Token : " + accessToken);
		System.out.println("Refresh Token : " + refreshToken);
		System.out.println("Expires Time : " + expiresTime);

		// Access Token으로 사용자 정보 반환
		JsonNode userInfo = Google.getGoogleUserInfo(accessToken);
		System.out.println(userInfo.toString());

		

		return "home";
	}

}
