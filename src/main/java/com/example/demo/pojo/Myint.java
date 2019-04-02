package com.example.demo.pojo;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

import java.util.List;
@Component("myint")
@Alias(value="Myint")
public class Myint {
    private String newsid;
    private String tags;

    public String getNewsid() {
        return newsid;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public void setNewsid(String newsid) {
        this.newsid = newsid;
    }
}
