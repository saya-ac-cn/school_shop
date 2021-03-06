<%--
  Created by IntelliJ IDEA.
  User: Saya
  Date: 2018/4/26
  Time: 23:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="../../../assets/user/amazeui/css/amazeui.min.css"/>
    <link rel="stylesheet" href="../../../assets/user/default/style.css"/>
    <link type="text/css" rel="stylesheet" href="../../../assets/cart/css/base.css" />
    <link type="text/css" rel="stylesheet" href="../../../assets/cart/css/module.css"  />
    <script src="../../../assets/user/amazeui/js/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <header data-am-widget="header" class="am-header am-header-default my-header">
        <div class="am-header-left am-header-nav">
            <a href="#left-link" class="">
                <i class="am-header-icon am-icon-chevron-left"></i>
            </a>
        </div>
        <h1 class="am-header-title">
            <a href="#title-link" class="">会员中心</a>
        </h1>
        <div class="am-header-right am-header-nav">
            <a href="#right-link" class="">
                <i class="am-header-icon  am-icon-home"></i>
            </a>
        </div>
    </header>
    <div class="uchome-info">
        <div class="uchome-info-uimg">
            <img src="<%= (String) session.getAttribute("userImg") %>" />
        </div>
        <div class="uchome-info-uinfo">

        </div>
    </div>
    <div class="my-nav-bar">
        <ol class="am-breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">分类</a></li>
            <li class="am-active">内容</li>
        </ol>
    </div>
    <div class="am-cf cart-panel">
        <div class="shopping">
            <div class="shop-group-item" >
                <div class="shop-name">
                    <input type="checkbox" class="check goods-check shopCheck">
                    <h4><a href="#">购物车</a></h4>
                    <div class="coupons"><span onclick="deleteCart()">删除所选</span><!--<span class="shop-total-amount ShopTotal">0</span>--></div>
                </div>
                <ul id="cartList">

                </ul>
                <div class="shopPrice">合计：￥<span class="shop-total-amount ShopTotal">0.00</span></div>
            </div>
        </div>

        <div class="payment-bar" style="position: absolute">
            <div class="all-checkbox"><input type="checkbox" class="check goods-check" id="AllCheck">全选</div>
            <div class="shop-total">
                <strong>总价：<i class="total" id="AllTotal">0.00</i></strong>
            </div>
            <a href="javascript:goBuy()" class="settlement">结算</a>
        </div>
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
</body>
<script type="text/javascript" src ="../../../assets/tools/vue/vue.min.js"></script>
<script type="text/javascript" src ="../../../assets/tools/vue/vue-resource.min.js"></script>
<script src="../../../assets/user/amazeui/js/amazeui.min.js"></script>
<script type="text/javascript" src="../../../assets/tools/layui-v2.2.6/layui.js"></script>
<script type="text/javascript" src="../../../assets/cart/js/shopping.js"></script>
</html>
