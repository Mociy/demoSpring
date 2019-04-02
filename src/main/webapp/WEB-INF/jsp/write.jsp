<%--
  Created by IntelliJ IDEA.
  User: liao
  Date: 2019/3/19
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>write</title>
    <link type="text/css" rel="stylesheet" href="/css/write.css">
</head>
<body>
<script src="/js/vue.min.js"></script>
<script src="/js/wangEditor.js"></script>
<script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>
<div id="App">
<div style="height:100px"></div>
    <div id="header">
      <div id="one">
          <button v-on:click="get"> 发布文章</button>
          <input type="text" v-model="title" placeholder="输入文章标题">

      </div>
        <p>请添加标签，多个标签的话，用“，”隔开</p>
        <input type="text"  v-model="tags" placeholder="添加标签">

    </div>
    <div id="test">
        <div id="div1">
        </div>
    </div>
</div>

<script type="text/javascript">
    window.onload=function () {
        vm = new Vue({
            el: '#App',
            editor1: null,
            data: {
                title: '',
                tags: '',
                content: '',
            },
            methods: {
                get: function () {
                    this.content = this.editor1.txt.html();
                    this.$http.post('/postContent', {
                        title: this.title, tag: this.tags, content: this.content
                    }, {emulateJSON: false}).then(function (res) {
                       if(res.body.ok!=""){
                           window.location="/";
                       }
                    }, function () {
                        console.log('请求失败处理');
                    });
                },
                getEditor: function () {
                    var E = window.wangEditor
                    this.editor1 = new E('#div1') // 两个参数也可以传入 elem 对象，class 选择器

                    this.editor1.customConfig.uploadFileName = 'file'
                    this.editor1.customConfig.uploadImgMaxSize = 5 * 1024 * 1024
                    this.editor1.showLinkImg = false
                    // 限制一次最多上传 5 张图片
                    this.editor1.customConfig.uploadImgMaxLength = 1
                    this.editor1.customConfig.uploadImgHooks = {
                        before: function (xhr, editor, files) {

                        },
                        success: function (xhr, editor, result) {
                            console.log("after");
                            // vm.get();
                        },
                        fail: function (xhr, editor, result) {
                            // 图片上传并返回结果，但图片插入错误时触发   xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
                            alert("插入错误");

                        },
                        error: function (xhr, editor) {// 图片上传出错时触发  xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
                        },
                        timeout: function (xhr, editor) {
                            // 图片上传超时时触发            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
                        },
                    }
                    this.editor1.create()

                }
            },
            mounted() {
                this.getEditor();
            }
        });
    }
</script>

</body>
</html>
