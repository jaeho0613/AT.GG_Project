package com.jaeho.atgg.utility;

import java.io.IOException;
import java.util.Map;

import lombok.extern.log4j.Log4j;
import okhttp3.ConnectionPool;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@Log4j
public class RestAPIUtility {

	// 커넥션 Pool
	private static ConnectionPool connectionPool = new ConnectionPool();

	// client 객체
	private static OkHttpClient client;

	private static OkHttpClient getOkHttpClient() {
		if (client == null) {
			client = new OkHttpClient.Builder().connectionPool(connectionPool).build();
		}

		return client;
	}

	// API 사용하기 (Headers가 없을 때)
	public static String restAPI(String url) throws IOException {
		Request request = syncGetRequest(url);
		return syncGetResponse(getOkHttpClient(), request);
	}

	// API 사용하기 (Headers가 있을 때)
	public static String restAPI(String url, Map<String, String> headers) throws IOException {
		Request request = syncGetRequest(url, headers);
		return syncGetResponse(getOkHttpClient(), request);
	}

	// 동기식 요청 (기본 요청)
	private static Request syncGetRequest(String url) {
		return new Request.Builder().url(url).build();
	}

	// 동기식 요청 (헤드 요청)
	private static Request syncGetRequest(String url, Map<String, String> headers) {

		Request.Builder builder = new Request.Builder().get();
		builder.url(url);

		headers.forEach((key, value) -> {
			builder.addHeader(key, value);
		});

		return builder.build();
	}

	// 동기식 응답
	private static String syncGetResponse(OkHttpClient client, Request request) throws IOException {

		try (Response response = client.newCall(request).execute()) {
			if (response.isSuccessful()) {
				return response.body().string();
			} else {
				log.info("===========syncGetResponse Error=====================");
				log.info(response.body().string());
				log.info("=====================================================");
			}
		} catch (Exception e) {
			log.info("동기식 응답 요청 에러 : " + e.getMessage());
		}
		return "404";
	}

}
