package com.example.demo.pojo;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

import java.util.List;
@Component("news")
@Alias(value="news")
public class News {
    private String newsid;
    private String content;
    private String start;
    private String title;
    private List<String> tags;
    private String tag;
    private String date;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getTag() {
        return tag;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

    public List<String> getTags() {
        return tags;
    }

    public String getContent() {
        return content;
    }

    public String getNewsid() {
        return newsid;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setNewsid(String newsid) {
        this.newsid = newsid;
    }

    public String getStart() {
        return start;
    }

    public String getTitle() {
        return title;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
