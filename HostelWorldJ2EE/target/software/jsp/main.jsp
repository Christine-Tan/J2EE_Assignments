<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2017/3/4
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Hostel World</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body style="background-image: url(img/bg2.jpg) ;background-size: cover">
<div>
    <nav class="navbar navbar-default navbar-fixed-top" style="color: #d0e9c6">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand">Hostel World</a>
            </div>
            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">首页</a></li>
                    <li><a href="#">预订客栈</a></li>
                    <li><a href="#">联系我们</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li data-toggle="modal" data-target="#login"><a href="#">登录/注册</a></li>
                    <li><a href="#">我要开店</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>
</div>

<!--提示框-->
<div class="modal fade" tabindex="-1" role="dialog" id="vip-register" style="margin-top: 10%">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" style="align-items: center;padding-left: 3%">注册新会员</h4>
            </div>
            <div class="modal-body">
                <form action="upload.html" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="请输入会员名">
                    </div>
                    <div class="form-group">
                        <input type="name" class="form-control" placeholder="请输入电子邮箱">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="请输入密码">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="请再次输入密码">
                    </div>
                    <div class="row">
                        <div class="col-xs-8">
                            <a data-toggle="modal" data-target="#login" data-dismiss="modal" class="text-center">已经是会员了</a>
                        </div>
                        <!-- /.col -->
                        <div class="col-xs-4">
                            <button type="submit" class="btn btn-primary btn-block btn-flat">注册</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!--提示框-->
<div class="modal fade" tabindex="-1" role="dialog" id="login" style="margin-top: 10%">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" style="align-items: center;padding-left: 3%">欢迎登录</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <input type="name" id="name" class="form-control" placeholder="请输入会员名">
                    </div>
                    <div class="form-group">
                        <input type="password" id="password" class="form-control" placeholder="请输入密码">
                    </div>
                    <div class="row">
                        <div class="col-xs-8">
                            <a data-toggle="modal" data-target="#vip-register" data-dismiss="modal" class="text-center">注册成为新会员</a>
                        </div>
                        <!-- /.col -->
                        <div class="col-xs-4">
                            <button type="submit" class="btn btn-primary btn-block btn-flat" onclick="login()">登录</button>
                        </div>
                        <!-- /.col -->
                        <p id="result">hhhhh</p>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="col-md-3 explorediv" style="margin: 10%;padding:5% 5% 5% 5%;background-image: url(img/bg3.jpeg);">
    <form class="exploreform">
        <div class="form-group">
            <label>选择城市</label>
            <select id="city" class="form-control">
                <option value="1">上海</option>
                <option value="2">南京</option>
            </select>
        </div>
        <div class="form-group">
            <label>入住日期</label>
            <input type="date" id="checkinDate" class="form-control" placeholder="入住日期">
        </div>
        <div class="form-group">
            <label>离店日期</label>
            <input type="date" id="checkoutDate" class="form-control" placeholder="离店日期">
        </div>
        <button class="btn btn-default" style="float: right" onclick="reserve()">查找</button>
    </form>
</div>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<script>
    function reserve() {
        var city=document.getElementById("city").value;
        var checkinDate=document.getElementById("checkinDate").value;
        var checkoutDate=document.getElementById("checkoutDate").value;
        $.ajax({
            type: "post",
            url : "",
            async:true,
            dataType:'json',
            data: {"city":city,"checkinDate":checkinDate,"checkoutDate":checkoutDate},
            success: function(data){
                $("#numberInput").html(data.id);
            },
            error:function (XMLHttpRequest, textStatus, errorThrown) {
                alert("error");
//                       alert(XMLHttpRequest);
//                      alert(textStatus);
//                       alert(errorThrown);
            }
        });
    }

        console.log(1)


    function login() {

        console.log(1111)

        var name=document.getElementById("name").value;
        var password=document.getElementById("password").value;

        console.log(name,password);
        $.ajax({
            type: "post",
            url : "/hotelworld/login.action",
            dataType:"json",
            data: {"name":name,"password":password},
            success: function(data){
//                alert(data);
                console.log(data)
                window.location="jsp/hotelSearch.jsp";
//                alert(data);
//                if(data.jsonString=="notFindVip"){
//                    $("#result").html(" 没有找到该会员 ");
//                }else if(data.jsonString=="wrongPassword"){
//                    $("#result").html(" 密码错误 ");
//                }else if(data.jsonString=="success"){
//                    window.location="vipInfo.html";
//                }
            }
        });
    }
</script>


</body>
</html>
