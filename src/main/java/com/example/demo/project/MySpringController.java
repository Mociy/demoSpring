package com.example.demo.project;

import com.example.demo.pojo.Myint;
import com.example.demo.pojo.News;
import com.example.demo.service.imp.MyintService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
   // @ResponseBody
    public class MySpringController {
    @Autowired
    private MyintService myintService;
    @Autowired
    private News news;
    @Autowired
    private Myint myint;


        @RequestMapping("/one/{name}")
        public String name(Model model,@PathVariable("name") String name){
            model.addAttribute("name", name);
            return "index";
        }

        @RequestMapping("/myupload")
    public String uploadpage(){
            return "Testupload";
        }

        @RequestMapping("/upload")
        @ResponseBody
    public String uploadfile(Part file, HttpServletRequest request){
            System.out.println(request.getParameter("token"));
             String filename=file.getSubmittedFileName();
             filename=filename.replaceAll("[A-Z]:","");
             System.out.println(filename);
             try{
                 file.write(filename);
             }catch (Exception e){
                 e.printStackTrace();
                 return "false";
             }
            return "ok";
        }
        @RequestMapping("/test1")
        @ResponseBody
        public ArrayList<News> test1(String tag){

            ArrayList<Myint> myints=myintService.query(tag);
            System.out.println(tag);
            ArrayList<News>  news=new ArrayList<>();
            int i=0;
            for(Myint myint:myints){
                news.add(myintService.queryNews(myint.getNewsid()));
                news.get(i).setTags(myintService.queryTags(myint.getNewsid()));//加上tags数据
                i++;
            }
            return news;

        }
        @PostMapping("/getAll")
        @ResponseBody
        public List<News> getAll(){
            return myintService.queryAll();
        }
        @RequestMapping("/page/{newsid}")
        public String getpage(Model model,@PathVariable("newsid") String newsid){
            model.addAttribute("newsid",newsid);
            return "page";
        }
        @RequestMapping("/get")
        @ResponseBody
        public News getNews(String newsid,HttpServletRequest request){
            System.out.println(request.getRemoteAddr()+"          "+request.getRemoteHost());
            news=myintService.queryNews(newsid);
                 news.setTags(myintService.queryTags(newsid));
            return news;
        }
        @RequestMapping("/write")
        public String writePage(@ModelAttribute("name")String name,Model model){
                  System.out.println(name+"111");
                  if(name==null||name.equals(""))
                      return "login";
            return "write";
        }
        @RequestMapping("/postContent")
        @ResponseBody
        public Map postContent(@RequestBody News news){

            int i=0;
            news.setNewsid(String.valueOf(System.currentTimeMillis()));
            String regEx_html="<[^>]+>";
            news.setStart(news.getContent().replaceAll("<code>.*<\\/code>","").replaceAll(regEx_html,"").replaceAll("[\\n|\\s|&nbsp;]","").replaceAll("gt",">").substring(0,60));
            myintService.insertNews(news);
            System.out.println(news.getContent());
             String[] tags= news.getTag().split("[, ，]");
             System.out.println(tags.length);
             while (i<tags.length){
                 myint.setNewsid(news.getNewsid());
                 myint.setTags(tags[i]);
                 myintService.insertTags(myint);
                 i++;
             }
            System.out.println(news.getNewsid()+"  "+myint.getNewsid()+"   "+myint.getTags());
             Map map=new HashMap();
             map.put("ok","content");
            return map;
        }
        @RequestMapping("/login")
        public String toLogin(){
            return "login";
        }
        @RequestMapping("/getLogin")
        public String getLogin(HttpServletRequest request, HttpServletResponse response, RedirectAttributes attr) throws Exception{
            String name=request.getParameter("name");
            String password=request.getParameter("password");
            System.out.println(password);

            if(password.equals("123")){
                attr.addFlashAttribute("name",name);
                return "redirect:/write";
            }
          return "redirect:/";
        }

    }
