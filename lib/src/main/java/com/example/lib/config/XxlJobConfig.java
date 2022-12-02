package com.example.lib.config;

import com.xxl.job.core.executor.impl.XxlJobSpringExecutor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@Slf4j
public class XxlJobConfig {

    @Bean
    public XxlJobSpringExecutor xxlJobExecutor(@Value("${xxl.job.executor.ip:}") String ip,
                                               @Value("${xxl.job.admin.address:}") String adminAddresses,
                                               @Value("${xxl.job.executor.port:}") int port,
                                               @Value("${xxl.job.accessToken:}") String accessToken,
                                               @Value("${xxl.job.executor.logpath:}") String logPath,
                                               @Value("${xxl.job.executor.logretentiondays:}") int logRetentionDays,
                                               @Value("${xxl.job.executor.appname:}") String appname) {
        XxlJobSpringExecutor executor = new XxlJobSpringExecutor();
        executor.setAdminAddresses(adminAddresses);
        executor.setAppname(appname);
        executor.setIp(ip);
        executor.setPort(port);
        executor.setAccessToken(accessToken);
        executor.setLogPath(logPath);
        executor.setLogRetentionDays(logRetentionDays);
        log.info("access token is:{}", accessToken);
        return executor;
    }
}
