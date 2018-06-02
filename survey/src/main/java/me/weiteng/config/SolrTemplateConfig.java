package me.weiteng.config;


import org.apache.solr.client.solrj.SolrClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.solr.core.SolrTemplate;

/**
 * Created by weiTeng on 2018/6/2.
 */
@Configuration
public class SolrTemplateConfig {

    @Autowired
    private SolrClient solrClient;

    @Bean
    public SolrTemplate solrTemplate() {
        return new SolrTemplate(solrClient);
    }

}
