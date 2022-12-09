package com.example.lib.common;

import com.ctrip.framework.apollo.model.ConfigChange;
import com.ctrip.framework.apollo.model.ConfigChangeEvent;
import com.ctrip.framework.apollo.spring.annotation.ApolloConfigChangeListener;
import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@Slf4j
@EnableApolloConfig
public class ApolloService {

    @ApolloConfigChangeListener
    public void apolloConfigListener(ConfigChangeEvent event) {
        for (String key : event.changedKeys()) {
            try {
                ConfigChange change = event.getChange(key);
                log.info("key:{} oldValue:{} newValue:{}", key, change.getOldValue(), change.getNewValue());
            } catch (Throwable tr) {
                log.warn("apollo config listener:", tr);
            }
        }
    }
}
