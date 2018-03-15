<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="${pageContext.request.contextPath}/" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>简单实用国产jQuery UI框架 - DWZ富客户端框架(J-UI.com)</title>

<link href="resources/jui/themes/default/style.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="resources/jui/themes/css/core.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="resources/jui/themes/css/print.css" rel="stylesheet" type="text/css"
	media="print" />
<link href="resources/jui/uploadify/css/uploadify.css" rel="stylesheet"
	type="text/css" media="screen" />
<!--[if IE]>
<link href="resources/jui/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lt IE 9]><script src="resources/jui/js/speedup.js" type="text/javascript"></script><script src="resources/jui/js/jquery-1.11.3.min.js" type="text/javascript"></script><![endif]-->
<!--[if gte IE 9]><!-->
<script src="resources/jui/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<!--<![endif]-->

<script src="resources/jui/js/jquery.cookie.js" type="text/javascript"></script>
<script src="resources/jui/js/jquery.validate.js" type="text/javascript"></script>
<script src="resources/jui/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="resources/jui/xheditor/xheditor-1.2.2.min.js" type="text/javascript"></script>
<script src="resources/jui/xheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>
<script src="resources/jui/uploadify/scripts/jquery.uploadify.js"
	type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script type="text/javascript" src="resources/jui/chart/raphael.js"></script>
<script type="text/javascript" src="resources/jui/chart/g.raphael.js"></script>
<script type="text/javascript" src="resources/jui/chart/g.bar.js"></script>
<script type="text/javascript" src="resources/jui/chart/g.line.js"></script>
<script type="text/javascript" src="resources/jui/chart/g.pie.js"></script>
<script type="text/javascript" src="resources/jui/chart/g.dot.js"></script>

<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=6PYkS1eDz5pMnyfO0jvBNE0F"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>

<script src="resources/jui/js/dwz.core.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.util.date.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.validate.method.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.barDrag.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.drag.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.tree.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.accordion.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.ui.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.theme.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.contextmenu.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.navTab.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.tab.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.resize.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.dialog.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.cssTable.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.stable.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.taskBar.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.ajax.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.pagination.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.database.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.datepicker.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.effects.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.panel.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.checkbox.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.history.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.combox.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.file.js" type="text/javascript"></script>
<script src="resources/jui/js/dwz.print.js" type="text/javascript"></script>

<!-- 可以用dwz.min.js替换前面全部dwz.*.js (注意：替换时下面dwz.regional.zh.js还需要引入)
<script src="bin/dwz.min.js" type="text/javascript"></script>
-->
<script src="resources/jui/js/dwz.regional.zh.js" type="text/javascript"></script>

<script type="text/javascript">
	$(function() {
		DWZ.init("dwz.frag.xml", {
			loginUrl : "login_dialog.html",
			loginTitle : "登录", // 弹出登录对话框
			//		loginUrl:"login.html",	// 跳到登录页面
			statusCode : {
				ok : 200,
				error : 300,
				timeout : 301
			}, //【可选】
			pageInfo : {
				pageNum : "pageNum",
				numPerPage : "numPerPage",
				orderField : "orderField",
				orderDirection : "orderDirection"
			}, //【可选】
			keys : {
				statusCode : "statusCode",
				message : "message"
			}, //【可选】
			ui : {
				hideMode : 'offsets'
			}, //【可选】hideMode:navTab组件切换的隐藏方式，支持的值有’display’，’offsets’负数偏移位置的值，默认值为’display’
			debug : false, // 调试模式 【true|false】
			callback : function() {
				initEnv();
				$("#themeList").theme({
					themeBase : "themes"
				}); // themeBase 相对于index页面的主题base路径
			}
		});
	});
</script>

</head>

<body>
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="http://j-ui.com">标志</a>
				<ul class="nav">
					<li id="switchEnvBox"><a href="javascript:">（<span>北京</span>）切换城市
					</a>
						<ul>
							<li><a href="sidebar_1.html">北京</a></li>
							<li><a href="sidebar_2.html">上海</a></li>
							<li><a href="sidebar_2.html">南京</a></li>
							<li><a href="sidebar_2.html">深圳</a></li>
							<li><a href="sidebar_2.html">广州</a></li>
							<li><a href="sidebar_2.html">天津</a></li>
							<li><a href="sidebar_2.html">杭州</a></li>
						</ul></li>
					<li><a href="changepwd.html" target="dialog" width="600">设置</a></li>
					<li><a href="http://www.cnblogs.com/dwzjs" target="_blank">官方网站</a></li>
					<li><a href="http://weibo.com/dwzui" target="_blank">消息</a></li>
					<li><a href="login.html">退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<!--<li theme="red"><div>红色</div></li>-->
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>

			<!-- navMenu -->

		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse">
						<div></div>
					</div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse">
					<h2>主菜单</h2>
					<div>收缩</div>
				</div>

				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2>
							<span>Folder</span>订单管理系统
						</h2>
					</div>
					<div class="accordionContent">
							<ul class="tree treeFolder treeCheck">
							<li><a href="order/manage" target="navTab"
								rel="demo_page1">订单库管理</a></li>
							<li><a href="demo_page1.html" target="navTab"
								rel="demo_page2">保单库管理</a></li>
							<li><a href="demo_page4.html" target="navTab"
								rel="demo_page4">虚拟订单库</a></li>
							<li><a href="demo_page5.html" target="navTab"
								rel="demo_page5">改派订单库</a></li>
							<li><a href="demo_page5.html" target="navTab"
								rel="demo_page5">未接订单库</a></li>
							<li><a href="demo_page5.html" target="navTab"
								rel="demo_page5">订单时间轴</a></li>
						</ul>
					
					</div>
					<div class="accordionHeader">
						<h2>
							<span>Folder</span>司机管理系统
						</h2>
					</div>
					<div class="accordionContent">
							<ul class="tree treeFolder treeCheck">
							<li><a href="demo_page1.html" target="navTab"
								rel="demo_page1">司机管理</a></li>
							<li><a href="demo_page1.html" target="navTab"
								rel="demo_page2">司机录入</a></li>
							<li><a href="demo_page4.html" target="navTab"
								rel="demo_page4">司机在线状态</a></li>
							<li><a href="javascript:;">投诉管理</a>
								<ul>
									<li><a href="javascript:;">租赁公司</a></li>
									<li><a href="javascript:;">平台</a></li>
								</ul></li>
							<li><a href="javascript:;">评分管理</a>
								<ul>
									<li><a href="javascript:;">租赁公司</a></li>
									<li><a href="javascript:;">平台</a></li>
								</ul></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2>
							<span>Folder</span>统计管理
						</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder treeCheck">
						<li><a href="javascript:;">订单统计</a>
						<li><a href="order/baodan" target="navTab"
								rel="order_baodan">保单统计</a></li>
								<ul>
									<li><a href="javascript:;">每日订单统计</a></li>
									<li><a href="javascript:;">所有订单统计</a></li>
								</ul></li>
							<li><a href="javascript:;">司机统计</a>
								<ul>
									<li><a href="javascript:;">每日司机考核统计</a></li>
									<li><a href="javascript:;">所有司机考核统计</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent">
						<!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span
										class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div>
					<!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div>
					<!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<div class="alertInfo">
								<p>
									<a href="https://code.csdn.net/dwzteam/dwz_jui/tree/master/doc"
										target="_blank" style="line-height: 19px"><span>操作手册</span></a>
								</p>
								<p>
									<a href="http://pan.baidu.com/s/18Bb8Z" target="_blank"
										style="line-height: 19px">操作手册下载</a>
								</p>
							</div>
							<div class="right">
								<p style="color: red">
									官方网站&nbsp;&nbsp;<a href="http://weibo.com/dwzui" target="_blank">http://kc.com</a>
								</p>
							</div>
							<p>
								<span>车城快车</span>
							</p>
							<p>
								官方地址:<a href="http://weibo.com/dwzui" target="_blank">http://admin.kc.com</a>
							</p>
						</div>
						<div class="pageFormContent" layoutH="80"
							style="margin-right: 230px">
							<div class="divider"></div>
							<h2>订单流程:</h2>
							<pre style="margin: 5px; line-height: 1.4em">
订单时间轴

1.价格查询
   保存计算公式
2.下单
   下单原始数据
3.推送订单
  推送时间，推送人员

4.接单
  接单时间
4.1指派

5.司机改派
  改派时间

6.中台客服改派

6.开始服务

7.出发去接乘客

8.到达接车地点

9.接到乘客

10.到达地点，乘客付费

11.完成订单
</pre>


						</div>

						<div style="width: 230px; position: absolute; top: 60px; right: 15px"
							layoutH="80">
							<iframe width="100%" height="430" class="share_self"
								frameborder="0" scrolling="no"
								src="messageshow.jsp"></iframe>
						</div>
						<!-- 
						<div style="width: 230px; position: absolute; top: 60px; right: 0"
							layoutH="80">
							<iframe width="100%" height="430" class="share_self"
								frameborder="0" scrolling="no"
								src="http://widget.weibo.com/weiboshow/index.php?width=0&height=430&fansRow=2&ptype=1&skin=1&isTitle=0&noborder=1&isWeibo=1&isFans=0&uid=1739071261&verifier=c683dfe7"></iframe>
						</div>  
						-->
						
					</div>

				</div>
			</div>
		</div>

	</div>

	<div id="footer">
		Copyright &copy; 2017 <a href="demo_page2.html" target="dialog">车城租赁有限公司</a>
		<a class="hover-link" href="http://www.miitbeian.gov.cn" rel="noopener" target="_blank">
            沪ICP备17009455号
</a>
	</div>

</body>
</html>