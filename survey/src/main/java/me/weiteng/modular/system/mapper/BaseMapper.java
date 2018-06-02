package me.weiteng.modular.system.mapper;

/**
 * 演示 mapper 父类，注意这个类不要让 mp 扫描到！！
 */
public interface BaseMapper<T> {

    // 这里可以放一些公共的方法
    int insert(T t);
}
