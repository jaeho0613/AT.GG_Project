package com.jaeho.atgg.utility;

import java.io.IOException;
import java.util.Map;

import lombok.extern.log4j.Log4j;
import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.ConnectionPool;
import okhttp3.HttpUrl;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

// 기본 RestAPI 통신 클래스입니다.
@Log4j
public class RestAPIUtility {

	// 커넥션 Pool
	private static ConnectionPool connectionPool = new ConnectionPool();

	// sync client 객체
	private static OkHttpClient syncClient;

	// async client 객체
	private static OkHttpClient asyncClient;

	// 동기 클라이언트 객체 싱글톤
	private static OkHttpClient getSyncOkHttpClient() {
		if (syncClient == null) {
			syncClient = new OkHttpClient.Builder().connectionPool(connectionPool).build();
		}

		return syncClient;
	}

	// 비동기 클라이언트 객체 싱글톤
	private static OkHttpClient getAsyncOkHttpClient() {
		if (asyncClient == null) {
			asyncClient = new OkHttpClient.Builder().connectionPool(connectionPool).build();
		}

		return asyncClient;
	}

	// API 사용하기 (Headers가 없을 때)
	public static String syncRestAPI(String url) throws IOException {
		Request request = getRequest(url);
		return getResponse(getSyncOkHttpClient(), request);
	}

	// API 사용하기 (Headers가 있을 때)
	public static String syncRestAPI(String url, Map<String, String> headers) throws IOException {
		Request request = getRequest(url, headers);
		return getResponse(getSyncOkHttpClient(), request);
	}

	// API 사용하기 (Headers,Parameter가 있을 때)
	public static String syncRestAPI(String url, Map<String, String> headers, Map<String, String> parameters)
			throws IOException {
		Request request = getRequest(url, headers, parameters);
		return getResponse(getSyncOkHttpClient(), request);
	}

	// 비동기식 요청
	public static String asyncRestAPI(String url, Map<String, String> headers) throws IOException {
		Request request = getRequest(url, headers);
		OkHttpClient client = getAsyncOkHttpClient();
		client.newCall(request).enqueue(new Callback() {

			@Override
			public void onResponse(Call call, Response response) throws IOException {
//				log.info("===============Response=================");
//				log.info(response.body().string());
//				log.info("========================================");
			}

			@Override
			public void onFailure(Call call, IOException e) {
				log.info("==============Error=============");
				log.info(e.getMessage());
				log.info("================================");
			}
		});
		return getResponse(client, request);
	}

	// 비동기식 요청
	public static String asyncRestAPI(String url, Map<String, String> headers, Map<String, String> parameters)
			throws IOException {
		Request request = getRequest(url, headers, parameters);
		OkHttpClient client = getAsyncOkHttpClient();
		client.newCall(request).enqueue(new Callback() {

			@Override
			public void onResponse(Call call, Response response) throws IOException {
//				log.info("===============Response=================");
//				log.info(response.body().string());
//				log.info("========================================");
			}

			@Override
			public void onFailure(Call call, IOException e) {
				log.info("==============Error=============");
				log.info(e.getMessage());
				log.info("================================");
			}
		});
		return getResponse(client, request);
	}

	// 동기식 요청
	private static Request getRequest(String url) {
		return new Request.Builder().url(url).build();
	}

	// 동기식 요청
	private static Request getRequest(String url, Map<String, String> headers) {

		Request.Builder builder = new Request.Builder().get();
		builder.url(url);

		headers.forEach((key, value) -> {
			builder.addHeader(key, value);
		});

		return builder.build();
	}

	// 동기식 요청
	private static Request getRequest(String url, Map<String, String> headers, Map<String, String> parameters) {

		HttpUrl.Builder urlBuilder = HttpUrl.parse(url).newBuilder();

		parameters.forEach((key, value) -> {
			urlBuilder.addQueryParameter(key, value);
		});

		Request.Builder builder = new Request.Builder().get();
		builder.url(urlBuilder.build().toString());

		headers.forEach((key, value) -> {
			builder.addHeader(key, value);
		});

		return builder.build();
	}

	// 동기식 응답
	private static String getResponse(OkHttpClient client, Request request) throws IOException {

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
