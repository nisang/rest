<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style type="text/css">
	ul.rightTools {float:right; display:block;}
	ul.rightTools li{float:left; display:block; margin-left:5px}
</style>

<div class="pageContent" style="padding:5px">
	<div class="panel" defH="40">
		<h1>病人基本信息</h1>
	</div>
	<div class="divider"></div>
	<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>订单统计</span></a></li>
				</ul>
			</div>
		</div>
		<div class="tabsContent">
			<div>
	
				<div layoutH="146" style="float:left; display:block; overflow:auto; width:240px; border:solid 1px #CCC; line-height:21px; background:#fff">
				    <ul class="tree treeFolder">
						<li><a href="javascript">订单统计</a>
							<ul>
							<li><a href="order/baodan/realtime" target="ajax" rel="jbsxBox">保单统计</a></li>
								<li><a href="order/baodan/stat" target="ajax" rel="jbsxBox">保单统计</a></li>
								<li><a href="demo/pagination/list1.html" target="ajax" rel="jbsxBox">下单与取消</a></li>
								<li><a href="demo/pagination/list1.html" target="ajax" rel="jbsxBox">完成与接受</a></li>
							</ul>
						</li>
						
				     </ul>
				</div>
				
				<div id="jbsxBox" class="unitBox" style="margin-left:246px;">
					<!--#include virtual="list1.html" -->
				</div>
	
			</div>
			
			<div>病人处方</div>
			
			<div>病人服药情况</div>
			
			<div>基线调查</div>
			
			<div>随访</div>
		</div>
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
	</div>
	
</div>