package com.example.demo.service.imp;

import com.example.demo.dao.MyintDao;
import com.example.demo.pojo.Myint;
import com.example.demo.pojo.News;
import com.example.demo.service.Myintservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class MyintService  implements Myintservice {

    @Autowired
    private MyintDao MyintDao;
    @Override
    public ArrayList<Myint> query(String tag){
        return MyintDao.query(tag);
    }
    @Override
    public List<String> queryTags(String newsid){
        return MyintDao.queryTags(newsid);
    }

    @Override
    @Cacheable(value = "redisCache",key="'redis_News'+#newsid")
    public News queryNews(String newsid){
        return MyintDao.queryNews(newsid);
    }

    @Override
    public List<News> queryAll(){
        return MyintDao.queryAll();
    }
    @Override
    public void insertNews(News news){
         MyintDao.insertNews(news);
    }

    @Override
    public void insertTags(Myint myint) {
        MyintDao.insertTags(myint);
    }
}
