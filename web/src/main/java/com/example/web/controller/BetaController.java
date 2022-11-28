package com.example.web.controller;

import com.example.core.db.entity.User;
import com.example.core.db.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping(value = "/")
public class BetaController {

    @Autowired
    private UserRepository userRepo;

    @ExceptionHandler(RuntimeException.class)
    public ModelAndView handleUnknownException(Exception ignored) {
        return new ModelAndView("ERROR", HttpStatus.EXPECTATION_FAILED);
    }

    @GetMapping("/beta")
    public String greet() {
        return "multi modules";
    }

    @GetMapping("/getUser")
    public User getUser(@RequestParam(value = "name") String name) {
        return userRepo.findUserByName(name);
    }

}
