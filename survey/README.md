## 配置solr

- 配置域

    域相当于数据库的表字段，用户存放数据，因此用户根据业务需要去定义相关的 Field （域），一般来说，每一种对应着一种数据，用户对同一种数据进行相同的操作。

- 域的常用属性：

    - name：指定域的名称
    - type：指定域的类型
    - indexed: 是否索引
    - stored: 是否存储
    - required：是否必须
    - multiValued：是否多值

    编辑`solr-home/survey/conf/managed-schema`配置数据域，放置到最后配置
    ```
    <field name="topic_content" type="text_ik" indexed="true" stored="true"/>
    <field name="topic_score" type="int" indexed="true" stored="true"/>
    <field name="topic_create_time" type="date" indexed="false" stored="true" />

    <field name="item_keywords" type="text_ik" indexed="true" stored="false" multiValued="true"/>
    <copyField source="topic_content" dest="item_keywords"/>
    ```

- 复制域`copyField`

    复制域的作用在于将某一个 Field 中的数据复制到另一个域中

## 与SpringBoot集成

1. 添加相关依赖

    ```
     <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-solr</artifactId>
        <version>2.0.1.RELEASE</version>
    </dependency>
    ```

2. 在`application.yml`配置文件中配置host

    ```
    spring:
      data:
        solr:
          host: http://127.0.0.1:8080/solr
    ```

3. 配置solr模板

    ```
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
    ```

4. 准备实体类

    ```
    /**
     * Created by weiTeng on 2018/5/5.
     */
    @Data
    public class Topic {

        @Field("id")
        private Integer topicId;

        @Field("topic_content")
        private String content;

        @Field("topic_score")
        private Integer score;

        @Field("topic_create_time")
        private Date createTime;
    }
    ```

    `@Field`注解标识这个字段对应于域中的字段，如果实体类的字段不对应的话，需要在注解中添加映射名称

    **注意**：`id`是solr中的一个必须字段，刚才在域中并没有配置id字段，但是必须要将实体类中的id字段跟他映射到一起，不然存储的时候会报错，说id是唯一约束。

    不设置id的时候提交保存数据报错如下：
    ```
    ERROR - 2016-06-02 14:29:09.752; org.apache.solr.common.SolrException; org.apache.solr.common.SolrException: Document is missing mandatory uniqueKey field: id
        at org.apache.solr.update.AddUpdateCommand.getIndexedId(AddUpdateCommand.java:92)
        at org.apache.solr.update.processor.DistributedUpdateProcessor.versionAdd(DistributedUpdateProcessor.java:717)
        at org.apache.solr.update.processor.DistributedUpdateProcessor.processAdd(DistributedUpdateProcessor.java:557)
        at org.apache.solr.update.processor.LogUpdateProcessor.processAdd(LogUpdateProcessorFactory.java:100)
        at org.apache.solr.handler.loader.XMLLoader.processUpdate(XMLLoader.java:247)
    ```

5. 编写搜索service

    `SearchService.java`

    ```
    /**
     * Created by weiTeng on 2018/6/2.
     */
    public interface SearchService {

        String COLLECTION = "survey";

        int createSolrIndex(Topic topic);

        int importSolrIndex(List<Topic> topics);

        List<Topic> searchTopic(Map<String, String> map);
    }
    ```

    ```
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
    ```

6. 导入数据

    ```
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
    ```

7. 根据关键字搜索

    ```
    @GetMapping("/search")
    @ResponseBody
    public Object searchTopic(@RequestParam("keywords") String keywords) {
        Map<String, String> map = new HashMap<>();
        map.put("keywords", keywords);
        return searchService.searchTopic(map);
    }
    ```

    传入：`http://localhost:8089/survey/search?keywords=中国`

    ```
    [
        {
        topicId: 6,
        content: "你知道中国有多少个民族？",
        score: 2,
        createTime: "2018-05-05 14:46:49"
        },
        {
        topicId: 16,
        content: "摧毁统治中国22年之久的国民党政权的历史事件是",
        score: 2,
        createTime: "2018-06-02 07:40:28"
        }
    ]
    ```