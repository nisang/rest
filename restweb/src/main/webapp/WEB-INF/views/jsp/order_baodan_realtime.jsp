<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
var options = {
	axis: "0 0 1 1", // Where to put the labels (trbl)
	axisxstep: 16, // How many x interval labels to render (axisystep does the same for the y axis)
	shade:true, // true, false
	smooth:false, //曲线
	symbol:"circle",
	colors:["#F44"]
};

$(function () {
	
	// Make the raphael object
	var r = Raphael("chartHolder"); 
	
	var lines = r.linechart(
		20, // X start in pixels
		10, // Y start in pixels
		600, // Width of chart in pixels
		200, // Height of chart in pixels
		[.5,1.5,2,2.5,3,3.5,4,4.5,5], // Array of x coordinates equal in length to ycoords
		[7,11,9,16,3,19,12,12,15], // Array of y coordinates equal in length to xcoords
		options // opts object
	);
	
	// Modify the x axis labels
	var xText = lines.axis[0].text.items;		
	for(var i in xText){ // Iterate through the array of dom elems, the current dom elem will be i
		var _oldLabel = (xText[i].attr('text') + "").split('.'), // Get the current dom elem in the loop, and split it on the decimal
			_newLabel = _oldLabel[0] + ":" + (_oldLabel[1] == undefined ? '00' : '30'); // Format the result into time strings
		xText[i].attr({'text': _newLabel}); // Set the text of the current elem with the result
	};
});
</script>



<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form id="pagerForm" onsubmit="return divSearch(this, 'jbsxBox');" action="demo/pagination/list1.html" method="post">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${model.numPerPage}" />
	<input type="hidden" name="orderField" value="${param.orderField}" />
	<input type="hidden" name="orderDirection" value="${param.orderDirection}" />
	
	
	<div class="searchBar">

		<table class="searchContent">
			<tr>
			<!-- 
				<td>
					我的客户：<input type="text" name="keyword" />
				</td>  -->
				<td>
					<select class="combox" name="province">
						<option value="">所有保单公司</option>
						<option value="上海车城">上海车城</option>
						<option value="上海红达">上海红达</option>
						<option value="上海鲜创">上海鲜创</option>
						<option value="上海慕运">上海慕运</option>
						<option value="上海剑聪">上海剑聪</option>
					</select>
				</td>
				<td>
					日期：<input type="text" class="date" readonly="true" />
				</td>
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<li><div class="button"><div class="buttonContent"><button type="reset">重置</button></div></div></li>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
				<li><a class="button" href="demo_page6.html" target="dialog" mask="true" title="查询框"><span>高级检索</span></a></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div id="chartHolder" style="width: 650px;height: 250px"></div>
<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid">
<div class="panelBar">
2017-07-21
		<!--   <ul class="toolBar">
			<li><a class="add" href="demo/pagination/dialog2.html" target="dialog" mask="true"><span>添加尿检检测</span></a></li>
			<li><a class="delete" href="demo/pagination/ajaxDone3.html?uid={sid_obj}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<li><a class="edit" href="demo/pagination/dialog2.html?uid={sid_obj}" target="dialog" mask="true"><span>修改</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="demo/common/dwz-team.xls" target="dwzExport" title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li>
		</ul> -->
	</div>
	<table class="table" width="99%" layoutH="260" rel="jbsxBox">
		<thead>
			<tr>
				<th width="80">租赁公司</th>
				<th width="100">未完成量（实时）</th>
				<th width="100">保单未安排量（实时）</th>
				<th width="120">保单安排量（实时）</th>
				
				<th width="100">保单总量</th>
				<th width="120">取消保单总数</th>
				<th width="100">保单完成数</th>
				<th width="120">保单完成总金额</th>
				<th width="120">保单总金额</th>
			</tr>
		</thead>
		<tbody>
			<tr target="sid_obj" rel="1">
				<td>1</td>
				<td>bj0001</td>
				<td>xxx诊所</td>
				<td>xxx</td>
				<td>1</td>
				<td><a class="button" href="demo_page1.html" target="dialog" rel="dlg_page4" title="打开窗口4 [自定义标题]"><span>查看实时数据</span></a></td>
			</tr>
			<tr target="sid_obj" rel="2">
				<td>1</td>
				<td>bj0001</td>
				<td>xxx诊所</td>
				<td>xxx</td>
				<td>1</td>
				<td><a class="button" href="demo_page1.html" target="dialog" rel="dlg_page4" title="打开窗口4 [自定义标题]"><span>查看实时数据</span></a></td>
			</tr>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value}, 'jbsxBox')">
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共50条</span>
		</div>
		
		<div class="pagination" rel="jbsxBox" totalCount="200" numPerPage="20" pageNumShown="5" currentPage="1"></div>

	</div>
	
	<div>

	
	</div>
</div>