<%--
  Created by IntelliJ IDEA.
  User: liao
  Date: 2019/4/13
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html >
<head>
    <title>login</title>
</head>
<body>
<script src="/js/vue.min.js"></script>
<script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>
<div id="App">
    <form action="/getLogin" method="post">
    <p>账号：<input v-model="name" name="name" type="text"></p>
    <p>密码：<input v-model="password" name="password" type="password"></p>
    <input type="submit" value="登录">
    </form>
</div>
<script>
    new Vue({
        el:"#App",
        data:{
            name:"",
            password:""
        },
        methods:{
            login: function () {
                console.log(this.password+"nnnnn");
               this.$http.post("/getLogin",{name:this.name,password: this.password},{emulateJSON:true}).then(function (res) {
                     console.log(res.body)
                   }
                   ,function () {

               })
            }
        }
    })
</script>
</body>
</html>
