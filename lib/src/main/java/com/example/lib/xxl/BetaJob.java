package com.example.lib.xxl;

import com.xxl.job.core.handler.IJobHandler;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;


@Slf4j
@Component
public class BetaJob extends IJobHandler {
    @Override
    public void execute() throws Exception {
        log.info("Hello world");
    }
}
