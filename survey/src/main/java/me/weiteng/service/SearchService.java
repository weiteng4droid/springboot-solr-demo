package me.weiteng.service;

import me.weiteng.pojo.entity.Topic;

import java.util.List;
import java.util.Map;

/**
 * Created by weiTeng on 2018/6/2.
 */
public interface SearchService {

    String COLLECTION = "survey";

    int createSolrIndex(Topic topic);

    int importSolrIndex(List<Topic> topics);

    List<Topic> searchTopic(Map<String, String> map);
}
