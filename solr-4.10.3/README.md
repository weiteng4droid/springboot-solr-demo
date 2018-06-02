## Solr介绍
>Solr是一个高性能，采用Java5开发，基于Lucene的全文搜索服务器。同时对其进行了扩展，提供了比Lucene更为丰富的查询语言，同时实现了可配置、可扩展并对查询性能进行了优化，并且提供了一个完善的功能管理界面，是一款非常优秀的全文搜索引擎。

## 部署(tomcat容器单机部署)

1. 下载solr软件包,`solr4.10.3`目前官网已经不提供了。
    
2. 将里边的web-app的内容拷贝到某一个新建的solr文件夹中，然后将该文件夹放置到tomcat的wepapps目录下
3. 将解压根目录下/example/lib/ext/下的jar包拷贝到2中webapps/solr/WEB-INF/lib/下即可。
4. 将解压根目录下/example/solr拷贝到一个指定的地方，作为solr存储数据的仓库，然后再在tomcat的webapps/solr/WEB-INF/web.xml中配置

    ```
    <env-entry>
       <env-entry-name>solr/home</env-entry-name>
       <env-entry-value>/Users/weiTeng/javaEE/solrhome</env-entry-value>
       <env-entry-type>java.lang.String</env-entry-type>
    </env-entry>
    ```
    `env-entry-value`的内容指向你本地要存储的仓库的路径即可。不配置solr是运行不起来的。
    
    以上配置信息默认是注释的，打开并替换`env-entry-value`的标签体内容即可。
    
5. 运行tomcat服务器访问solr，比如：http://localhost:8081/solr

    效果图
    
    ![image](http://weiteng.me/upload/2018/06/545ngtsd0cii1r4t1kss8jmhlk.png)

## 配置中文分词器

1. 下载`IK Analyzer`.jar分词器放入到`solr/WEB-INF/lib`下
2. 然后再在`solr/WEB-INF/`下创建`classes`目录，并放入分词器的配置

    * `ext_stopword.dic`   停用词词典
    * `IKAnalyzer.cfg.xml` 分词器配置文件
    * `mydict.dic`        
    
3. 配置分词器

    在`solrhome/collection1/conf/schema.xml`中配置分词器
    
    ```
    <fieldType name="text_ik" class="solr.TextField">
        <analyzer class="org.wltea.analyzer.lucene.IKAnalyzer"/>
    </fieldType>
    ```