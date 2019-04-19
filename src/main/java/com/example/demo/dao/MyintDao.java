package com.example.demo.dao;

import com.example.demo.pojo.Myint;
import com.example.demo.pojo.News;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
@Repository
public interface MyintDao {
    ArrayList<Myint> query(String tag);

    List<String> queryTags(String newsid);

    News queryNews(String newsid);
    List<News> queryAll();

    void insertNews(News news);



    void insertTags(Myint myint);
}
