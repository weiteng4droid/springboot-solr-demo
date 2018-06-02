package me.weiteng.service.impl;

import lombok.extern.slf4j.Slf4j;
import me.weiteng.pojo.entity.Topic;
import me.weiteng.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.solr.core.SolrTemplate;
import org.springframework.data.solr.core.query.Criteria;
import org.springframework.data.solr.core.query.Query;
import org.springframework.data.solr.core.query.SimpleQuery;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by weiTeng on 2018/6/2.
 */
@Slf4j
@Service
public class SearchServiceImpl implements SearchService {

    @Autowired
    private SolrTemplate solrTemplate;

    @Override
    public int createSolrIndex(Topic topic) {
        solrTemplate.saveBean(COLLECTION, topic);
        solrTemplate.commit(COLLECTION);
        return 1;
    }

    @Override
    public int importSolrIndex(List<Topic> topics) {
        topics.forEach(topic -> log.info("【题目】{}", topic));
        solrTemplate.saveBeans(COLLECTION, topics);
        solrTemplate.commit(COLLECTION);
        return topics.size();
    }

    @Override
    public List<Topic> searchTopic(Map<String, String> map) {
        Query query = new SimpleQuery();

        String keywords = map.get("keywords");
        log.info("【关键字】{}", keywords);
        Criteria criteria = new Criteria("item_keywords");
        criteria.is(keywords);
        query.addCriteria(criteria);

        return solrTemplate.queryForPage(COLLECTION, query, Topic.class).getContent();
    }
}
