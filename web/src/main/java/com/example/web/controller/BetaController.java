package com.example.web.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping(value = "/")
public class BetaController {

    @ExceptionHandler(RuntimeException.class)
    public ModelAndView handleUnknownException(Exception ignored) {
        return new ModelAndView("ERROR", HttpStatus.EXPECTATION_FAILED);
    }

    @GetMapping("/beta")
    public String greet() {
        throw new RuntimeException("BETA");
//        return "multi modules";
    }
}
