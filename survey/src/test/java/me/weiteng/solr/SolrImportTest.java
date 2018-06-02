package me.weiteng.solr;

import me.weiteng.modular.topic.service.impl.TopicServiceImpl;
import me.weiteng.pojo.entity.Topic;
import me.weiteng.service.impl.SearchServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * Created by weiTeng on 2018/6/2.
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class SolrImportTest {

    @Autowired
    private SearchServiceImpl searchService;

    @Autowired
    private TopicServiceImpl topicService;

    @Test
    public void testImport() throws Exception {
        List<Topic> topics = topicService.selectAll();
        searchService.importSolrIndex(topics);
    }
}
