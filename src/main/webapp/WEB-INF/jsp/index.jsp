<%@ page pageEncoding="utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>index</title>
    <link type="text/css" rel="styleSheet"  href="/css/main.css" />
    <style>
        #background {
            position: fixed;
            top: 0;
            left: 0;

            z-index: -100;
        }
    </style>
</head>
    <body>
    <script src="/js/vue.min.js"></script>
    <script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>
<div id="app">

    <div id="header">
        <input type="search" ref="tag"  placeholder="java">
        <button id="btn1"  v-on:click="getTwo">搜索标签</button>

    </div>

    <input  value="${name}" ref="one" type="hidden">

    <div class="content" v-for="data in datas" v-on:click="go(data.newsid)">
        <div class="h2class">
        <h2 class="titleone">{{data.title}}</h2>
            <p style="{font-size: 15px;margin-left: 8px;color:dimgray;}">{{data.date}} </p>
        </div>
        <div class="pclass">
        <p class="pone">{{data.start}}...</p>
        </div>
    </div>
</div>
    <canvas id="background"></canvas>

<script>
  window.onload=function () {
      new Vue({
        el:'#app',
        data:{
            datas:[],
            url0:['<h1>菜鸟教程</h1>','<h1>菜鸟教程2</h1>','<h1>菜鸟教程3</h1>'],
            data:[1111,222,333,444,555,666,777,888,999,1010],
        },
        methods:{
            gettValue:function () {
                console.log(this.$refs.one.value);
                console.log(Math.random().toString(16).slice(5,11))
            },
            go:function (name) {
                window.open("/page/"+name);

            },
            getTwo:function(){
                if(this.$refs.tag.value!="") {
                    this.$http.post('/test1', {tag: this.$refs.tag.value}, {emulateJSON: true}).then(function (res) {
                        this.datas = res.body;
                        console.log("success");
                    }, function () {
                        console.log('请求失败处理');
                    });
                }
                else this.getdata();
            },
            getdata:function(){
                this.$http.post('/getAll').then(function (res) {
                       this.datas=res.body;
                       console.log(res.body);
                     }, function () {
                         console.log('请求失败处理');
                     });
            }
        },
        mounted() {
            this.getdata();
            this.gettValue();
        }
    })
  }
  document.onreadystatechange = function () {
      if (document.readyState == "complete") {
          document.body.style.display = "block";
      } else {
          document.body.style.display = "none";
      };
  };
</script>
    <script async type="text/javascript" src="/js/background.js"></script>
</body>
</html>
