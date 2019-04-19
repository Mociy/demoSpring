<%--
  Created by IntelliJ IDEA.
  User: liao
  Date: 2019/3/18
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>page</title>
    <link type="text/css" rel="styleSheet" href="/css/page.css">
</head>
<body>
<script src="/js/vue.min.js"></script>
<script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>

<div id="App1">
    <div id="header"></div>
    <div id="center">

    <input  value="${newsid}" ref="one" type="hidden">
    <div id="center1">
    <div id="title">
        <h2 class="titleone">{{news.title}}</h2>
    </div>
        <div id="left">
        <div v-for="tag in news.tags">
            <div class="tag">{{tag}}</div>
        </div>
        </div>
    <div id="content">
        <div v-html="news.content"></div>
        <p id="date">{{news.date}}</p>

    </div>

    <div style="height: 150px"></div>
</div>


<script type="text/javascript">
window.onload=function() {
    vm = new Vue({
        el: '#App1',
        data: {
            news: [],
            id: '',
        },
        methods: {
            getdata: function () {
                this.$http.post('/get', {newsid: this.$refs.one.value}, {emulateJSON: true}).then(function (res) {
                    this.news = res.body;
                    console.log(res.body)
                }, function (res) {
                    console.log(res.status);
                });
            },
            getid: function () {

            }
        },
        mounted() {
            this.getdata();
        }
    })
}

</script>
</body>
</html>
