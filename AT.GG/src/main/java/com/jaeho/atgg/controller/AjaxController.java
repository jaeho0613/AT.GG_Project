package com.jaeho.atgg.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/ajax/*")
public class AjaxController {

	@GetMapping(value = "/match", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<String> moreMatchList() {

		String result = "bpbpbpbp";

		return new ResponseEntity<String>(result, HttpStatus.OK);
	}

}
