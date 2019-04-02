<%--
  Created by IntelliJ IDEA.
  User: liao
  Date: 2019/3/14
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>upload</title>
    <link type="text/css" rel="stylesheet" href="/css/write.css">
</head>
<body>
<script src="/js/vue.min.js"></script>
<script type="text/javascript" src="/js/wangEditor.js"></script>
<script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>
<div id="App">
    <div id="header"></div>
    <div id="test">
        <div id="div1" style="width:800px">
            <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
        </div>
    </div>
    <div id="box">
        <input type="button" @click="get()" value="点我异步获取数据(Get)"><div v-html="msg" ></div><div><img src="https://www.cupidwall.cn/image/b6cebc06728448768cae06c860f89840.jpeg"></div>
    </div>
</div>
<script type = "text/javascript">
    window.onload=function () {
        vm = new Vue({
            el: '#App',
            editor1: null,
            data: {
                msg: 'Hello World!',
                sites: [
                    {name: '../jsp/123'},
                    {name: 'jsp'},
                    {name: 'jsp'}
                ]
            },
            methods: {
                get: function () {
                    //发送get请求
                    var da = this.editor1.txt.html();
                    this.$http.post('https://www.cupidwall.cn/ssm02/test', {
                        data: da,
                    },{emulateJSON:true}).then(function (res) {
                        alert(res.body);
                        this.msg=res.body;
                        console.log(res.body);
                    }, function () {
                        console.log('请求失败处理');
                    });
                },
                getEditor: function () {
                    var E = window.wangEditor
                    this.editor1 = new E('#div1') // 两个参数也可以传入 elem 对象，class 选择器
                    this.editor1.customConfig.uploadImgServer = 'https://www.cupidwall.cn/ssm02/upload'

                    this.editor1.customConfig.uploadFileName = 'file'
                    this.editor1.customConfig.uploadImgMaxSize = 3 * 1024 * 1024
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
