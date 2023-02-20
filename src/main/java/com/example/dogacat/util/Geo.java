package com.example.dogacat.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

public class Geo {
	public static Map<String, Object> testmap(String address1) {
		String GEOCODE_URL = "http://dapi.kakao.com/v2/local/search/address.json?analyze_type=similar&query=";
		String GEOCODE_USER_INFO = "KakaoAK b24c429f6ac24590ffe7714dd2e3a1dd";
		URL obj;

		try {
			String address = URLEncoder.encode(address1, "UTF-8");

			obj = new URL(GEOCODE_URL + address);

			HttpURLConnection con = (HttpURLConnection) obj.openConnection();

			// get으로 받아오면 된다. 자세한 사항은 카카오개발자센터에 나와있다.
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", GEOCODE_USER_INFO);
			con.setRequestProperty("content-type", "application/json");
			con.setDoOutput(true);
			con.setUseCaches(false);
			con.setDefaultUseCaches(false);

			Charset charset = Charset.forName("UTF-8");
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), charset));

			String inputLine;
			StringBuilder response = new StringBuilder();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}

			inputLine = response.toString();

			// JSONParser jsonParser = new JSONParser();
			// JSONObject json = (JSONObject) jsonParser.parse(inputLine);
			JSONObject json = new JSONObject(inputLine);
			// System.out.println(json);
			JSONArray array = json.getJSONArray("documents");

			// String a = json.toString();

			// JSONObject documents = json.getJSONObject("documents");

			// JSONArray jsonArray = (JSONArray) jsonParser.parse(inputLine);

			JSONObject jsonObject = new JSONObject();
			for (int i = 0; i < array.length(); i++) {
				jsonObject = array.getJSONObject(i);
			}

			return jsonObject.toMap();
			// System.out.println(array.toList());

//			System.out.println(map.get("x"));
//			System.out.println(jsonObject.get("x"));
//			System.out.println(jsonObject.get("y"));

			// response 객체를 출력해보자
			// System.out.println(response);
			// System.out.println(array);
			// System.out.println(jsonObject.get("documents"));

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
