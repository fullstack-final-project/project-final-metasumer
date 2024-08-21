package com.spring_boot_final.metasumer.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Service;

@Service
public class SearchTrendService {
	public static void searchTrend(String[] args) {
        String clientId = "sio4q1ij5f";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "mVTSK6B3Ng5X7yhhD9eM4BquW6sPjpfO4qjUdFCu";//애플리케이션 클라이언트 시크릿값";

        try {
            String apiURL = "https://naveropenapi.apigw.ntruss.com/datalab/v1/search";
            String body = "{\"startDate\":\"2017-01-01\","
            		+ "\"endDate\":\"2017-04-30\","
            		+ "\"timeUnit\":\"month\","
            		+ "\"keywordGroups\":[{\"groupName\":\"한글\",\"keywords\":[\"한글\",\"korean\"]},{\"groupName\":\"영어\",\"keywords\":[\"영어\",\"english\"]}],"
            		+ "\"device\":\"pc\","
            		+ "\"ages\":[\"1\",\"2\"],"
            		+ "\"gender\":\"f\"}";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            con.setRequestProperty("Content-Type", "application/json");

            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.write(body.getBytes());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 오류 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
