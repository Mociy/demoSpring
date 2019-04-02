package com.example.demo.service;

import com.example.demo.pojo.Myint;
import com.example.demo.pojo.News;

import java.util.ArrayList;
import java.util.List;

public interface Myintservice {
     ArrayList<Myint> query(String tag);
     List<String> queryTags(String newsid);
     News queryNews(String newsid);
     List<News> queryAll();
     void insertNews(News news);
     void insertTags(Myint myint);

}
