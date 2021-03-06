<%--
  Created by IntelliJ IDEA.
  User: Saya
  Date: 2018/4/24
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户注册</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="../../../assets/user/amazeui/css/amazeui.min.css"/>
    <link rel="stylesheet" href="../../../assets/user/default/style.css"/>
    <script src="../../../assets/user/amazeui/js/jquery.min.js"></script>
    <script src="../../../assets/user/amazeui/js/amazeui.min.js"></script>
    <script type="text/javascript" src="../../../assets/tools/layui-v2.2.6/layui.js"></script>
</head>
<body>
<div class="container">
    <header data-am-widget="header" class="am-header am-header-default my-header">
        <div class="am-header-left am-header-nav">

        </div>
        <h1 class="am-header-title">
            <a href="#title-link" class="">用户注册</a>
        </h1>
        <div class="am-header-right am-header-nav">
            <a href="#right-link" class="">
                <i class="am-header-icon  am-icon-home"></i>
            </a>
        </div>
    </header>
    <div class="cart-panel">
        <form class="am-form" id="form_register">
            <div class="am-form-group am-form-icon">
                <i class="am-icon-user" style="color:#329cd9"></i>
                <input type="text" id="username" class="am-form-field  my-radius" placeholder="请输入您的用户名">
            </div>
            <div class="am-form-group am-form-icon">
                <i class="am-icon-lock" style="color:#329cd9"></i>
                <input type="password" id="password1" class="am-form-field  my-radius" placeholder="请输入您的密码">
            </div>
            <div class="am-form-group am-form-icon">
                <i class="am-icon-lock" style="color:#e9c740"></i>
                <input type="password" id="password2" class="am-form-field  my-radius" placeholder="请重复输入一次密码">
            </div>
            <div class="am-form-group am-form-icon">
                <i class="am-icon-envelope" style="color:#78c3ca"></i>
                <input type="text" id="email" class="am-form-field  my-radius" placeholder="请输入邮箱号码">
            </div>
            <div class="am-form-group am-form-icon">
                <i class="am-icon-phone" style="color:#f09513"></i>
                <input type="text" id="phone" class="am-form-field  my-radius" placeholder="请输入联系电话">
            </div>
            <p class="am-text-center"><button type="button" id="goSave" class="am-btn am-btn-danger am-radius am-btn-block">立即注册</button></p>
        </form>
    </div>

    <footer data-am-widget="footer" class="am-footer am-footer-default" data-am-footer="{  }">
        <hr data-am-widget="divider" style="" class="am-divider am-divider-default"/>
        <div class="am-footer-miscs ">
            <p>CopyRight©2018 saya.ac.cn.</p>
            <p>蜀ICP备xxxxx</p>
        </div>
    </footer>
    <!--底部-->
    <div data-am-widget="navbar" class="am-navbar am-cf my-nav-footer " id="">
        <ul class="am-navbar-nav am-cf am-avg-sm-4 my-footer-ul">
            <li>
                <a href="/wap/" class="">
                    <span class="am-icon-home"></span>
                    <span class="am-navbar-label">首页</span>
                </a>
            </li>
            <li>
                <a href="###" class="">
                    <span class="am-icon-th-list"></span>
                    <span class="am-navbar-label">资讯</span>
                </a>
            </li>
            </li>
            <li style="position:relative">
                <a href="javascript:;" onClick="showFooterNav();" class="">
                    <span class="am-icon-user"></span>
                    <span class="am-navbar-label">我的</span>
                </a>
                <div class="footer-nav" id="footNav">
                    <span class="am-icon-user"><a href="#">个人资料</a></span>
                    <span class="am-icon-th-list"><a href="#">已选商品</a></span>
                    <span class="am-icon-suitcase"><a href="#">我的订单</a></span>
                    <span class=" am-icon-bank"><a href="#">收货地址</a></span>
                    <span class="am-icon-cog"><a href="#">修改密码</a></span>
                    <span class="am-icon-power-off"><a href="#">退出平台</a></span>
                </div>
            </li>
        </ul>
        <script>
            function showFooterNav(){
                $("#footNav").toggle();
            }

        </script>
    </div>
</div>
<script type="text/javascript">
    var layer;//定义layui模块

    var checkUser = false;//核验是否通过标志位，默认不通过

    layui.use(['layer'], function(){
        layer = layui.layer;
    });

    $(function (){


        $("#goSave").click(function () {
            var username = $("#username").val().trim();
            var password1 = $("#password1").val().trim();
            var password2 = $("#password2").val().trim();
            var email = $("#email").val().trim();
            var phone = $("#phone").val().trim();
            if(username == '')
            {
                layer.msg("账号不可为空");
            }
            else if(checkUser == false)
            {
                layer.msg("该账号已经存在了，换个吧。");
            }
            else if(email == '')
            {
                layer.msg("邮箱不可为空");
            }
            else if(phone == '')
            {
                layer.msg("联系电话不可为空");
            }
            else if(password1 == '' || password2 == '' || password1.length < 6 || password2.length < 6)
            {
                layer.msg("密码不可为空且长度在6位以上");
            }
            else if(password1 != password2)
            {
                layer.msg("两次输入的密码必须一致");
            }
            else
            {
                var sendData = {
                    username :username,
                    email :email,
                    phone :phone,
                    password:password2
                };
                go(sendData);
            }
        });

        $("#username").blur(function () {
            var username = $(this).val().trim();
            if(username != '')
            {
                //执行异步查询
                $.ajax({
                    type: "GET",
                    url: "/api/public/userExist.yht",
                    data:{username:username},
                    dataType:"json",
                    success: function(data){
                        if(data.code == 2){
                            //没有注册过
                            checkUser = true;
                            return false;
                        }
                        else
                        {
                            //注册过
                            checkUser = false;
                            $("#username").val("");
                            layer.msg("该账号已经存在了，换个吧。");
                        }
                    },
                    error:function(data){
                        checkUser = false;
                        layer.msg('查询失败');
                        return false;
                    }
                });
            }
        })

    });

    //注册
    function go(data) {
        $.ajax({
            type: "POST",
            url: "/api/public/userRegister.yht",
            data:data,
            dataType:"json",
            success: function(data){
                if(data.code == 0){
                    document.getElementById("form_register").reset();
                    layer.msg("注册成功，赶紧登录吧");
                    return false;
                }
                else
                {
                    layer.msg(data.msg);
                }
            },
            error:function(data){
                layer.msg('注册失败');
                return false;
            }
        });
    }
</script>
</body>
</html>
