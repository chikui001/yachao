package com.yachao.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author jiao
 * @date 2020年10月24日
 */
@Controller
@RequestMapping("/testTop")
public class GitController {

    @ResponseBody
    @RequestMapping(value = "/testGet", method = RequestMethod.GET)
    public ResponseEntity<String> testGetEnv() {

        return new ResponseEntity<>("testGet ok", HttpStatus.OK);
    }

    @ResponseBody
    @RequestMapping(value = "/testQueryParams", method = RequestMethod.GET)
    public ResponseEntity<String> testGetEnv(@RequestParam String queryParams) {

        return new ResponseEntity<>("queryParams :" + queryParams, HttpStatus.OK);
    }
}
