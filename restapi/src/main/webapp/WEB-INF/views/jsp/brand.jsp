<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false" %>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">
<title>匹配</title>
<style>
.brand-button {
	margin: 2px 0px;
}

.brand-series {
	
}

thead tr {
	display: block;
}

tbody {
	display: block;
	height: 450px;
	overflow: auto;
}

.tdbrand {
	display: inline-block;
	height: 450px;
	overflow: auto;
	border: 1px solid red;
	width: 600px;
}
.divmodel {
	display: inline-block;
	height: 450px;
	overflow: auto;
	border: 1px solid red;
	width: 600px;
}
.tdseries {
	display: inline-block;
	height: 450px;
	overflow: auto;
	border: 1px solid red;
	margin-left: 5px;
	width: 600px;
}

.lino {
	list-style: none;
}
</style>
<style type="text/css">
.cf:after {
	visibility: hidden;
	display: block;
	font-size: 0;
	content: " ";
	clear: both;
	height: 0;
}

* html .cf {
	zoom: 1;
}

*:first-child+html .cf {
	zoom: 1;
}

html {
	margin: 0;
	padding: 0;
}

body {
	font-size: 100%;
	margin: 0;
	padding: 1.75em;
	font-family: 'Helvetica Neue', Arial, sans-serif;
}

h1 {
	font-size: 1.75em;
	margin: 0 0 0.6em 0;
}

a {
	color: #2996cc;
}

a:hover {
	text-decoration: none;
}

p {
	line-height: 1.5em;
}

.small {
	color: #666;
	font-size: 0.875em;
}

.large {
	font-size: 1.25em;
}

/**

 * Nestable

 */
.dd {
	position: relative;
	display: block;
	margin: 0;
	padding: 0;
	
	list-style: none;
	font-size: 13px;
	line-height: 20px;
}

.dd-list {
	display: block;
	position: relative;
	margin: 0;
	padding: 0;
	list-style: none;
}

.dd-list .dd-list {
	padding-left: 30px;
}

.dd-collapsed .dd-list {
	display: none;
}

.dd-item, .dd-empty, .dd-placeholder {
	display: block;
	position: relative;
	margin: 0;
	padding: 0;
	min-height: 20px;
	font-size: 13px;
	line-height: 20px;
}

.dd-handle {
	display: block;
	height: 37px;
	margin: 2px 0;
	padding: 2px 10px;
	color: #333;
	text-decoration: none;
	font-weight: bold;
	border: 1px solid #ccc;
	background: #fafafa;
	background: -webkit-linear-gradient(top, #fafafa 0%, #eee 100%);
	background: -moz-linear-gradient(top, #fafafa 0%, #eee 100%);
	background: linear-gradient(top, #fafafa 0%, #eee 100%);
	-webkit-border-radius: 3px;
	border-radius: 3px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.dd-handle:hover {
	color: #2ea8e5;
	background: #fff;
}

.dd-item>button {
	display: block;
	position: relative;
	cursor: pointer;
	float: left;
	width: 25px;
	height: 20px;
	margin: 5px 0;
	padding: 0;
	text-indent: 100%;
	white-space: nowrap;
	overflow: hidden;
	border: 0;
	background: transparent;
	font-size: 12px;
	line-height: 1;
	text-align: center;
	font-weight: bold;
}

.dd-item>button:before {
	content: '+';
	display: block;
	position: absolute;
	width: 100%;
	text-align: center;
	text-indent: 0;
}

.dd-item>button[data-action="collapse"]:before {
	content: '-';
}

.dd-placeholder, .dd-empty {
	margin: 5px 0;
	padding: 0;
	min-height: 30px;
	background: #f2fbff;
	border: 1px dashed #b6bcbf;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.dd-empty {
	border: 1px dashed #bbb;
	min-height: 100px;
	background-color: #e5e5e5;
	background-image: -webkit-linear-gradient(45deg, #fff 25%, transparent 25%, transparent
		75%, #fff 75%, #fff),
		-webkit-linear-gradient(45deg, #fff 25%, transparent 25%, transparent
		75%, #fff 75%, #fff);
	background-image: -moz-linear-gradient(45deg, #fff 25%, transparent 25%, transparent 75%,
		#fff 75%, #fff),
		-moz-linear-gradient(45deg, #fff 25%, transparent 25%, transparent 75%,
		#fff 75%, #fff);
	background-image: linear-gradient(45deg, #fff 25%, transparent 25%, transparent 75%, #fff
		75%, #fff),
		linear-gradient(45deg, #fff 25%, transparent 25%, transparent 75%, #fff
		75%, #fff);
	background-size: 60px 60px;
	background-position: 0 0, 30px 30px;
}

.dd-dragel {
	position: absolute;
	pointer-events: none;
	z-index: 9999;
}

.dd-dragel>.dd-item .dd-handle {
	margin-top: 0;
}

.dd-dragel .dd-handle {
	-webkit-box-shadow: 2px 4px 6px 0 rgba(0, 0, 0, .1);
	box-shadow: 2px 4px 6px 0 rgba(0, 0, 0, .1);
}

/**

 * Nestable Extras

 */
.nestable-lists {
	display: block;
	clear: both;
	padding: 30px 0;
	width: 100%;
	border: 0;
	border-top: 2px solid #ddd;
	border-bottom: 2px solid #ddd;
}

#nestable-menu {
	padding: 0;
	margin: 20px 0;
}

#nestable-output, #nestable2-output {
	width: 100%;
	height: 7em;
	font-size: 0.75em;
	line-height: 1.333333em;
	font-family: Consolas, monospace;
	padding: 5px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
}

#nestable2 .dd-handle {
	color: #fff;
	border: 1px solid #999;
	background: #bbb;
	background: -webkit-linear-gradient(top, #bbb 0%, #999 100%);
	background: -moz-linear-gradient(top, #bbb 0%, #999 100%);
	background: linear-gradient(top, #bbb 0%, #999 100%);
}

#nestable2 .dd-handle:hover {
	background: #bbb;
}

#nestable2 .dd-item>button:before {
	color: #fff;
}

@media only screen and (min-width: 700px) {
	.dd {
		float: left;
		width: 48%;
	}
	.dd+.dd {
		margin-left: 2%;
	}
}

.dd-hover>.dd-handle {
	background: #2ea8e5 !important;
}

/**

 * Nestable Draggable Handles

 */
.dd3-content {
	display: block;
	height: 30px;
	margin: 5px 0;
	padding: 5px 10px 5px 40px;
	color: #333;
	text-decoration: none;
	font-weight: bold;
	border: 1px solid #ccc;
	background: #fafafa;
	background: -webkit-linear-gradient(top, #fafafa 0%, #eee 100%);
	background: -moz-linear-gradient(top, #fafafa 0%, #eee 100%);
	background: linear-gradient(top, #fafafa 0%, #eee 100%);
	-webkit-border-radius: 3px;
	border-radius: 3px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.dd3-content:hover {
	color: #2ea8e5;
	background: #fff;
}

.dd-dragel>.dd3-item>.dd3-content {
	margin: 0;
}

.dd3-item>button {
	margin-left: 30px;
}

.dd3-handle {
	position: absolute;
	margin: 0;
	left: 0;
	top: 0;
	cursor: pointer;
	width: 30px;
	text-indent: 100%;
	white-space: nowrap;
	overflow: hidden;
	border: 1px solid #aaa;
	background: #ddd;
	background: -webkit-linear-gradient(top, #ddd 0%, #bbb 100%);
	background: -moz-linear-gradient(top, #ddd 0%, #bbb 100%);
	background: linear-gradient(top, #ddd 0%, #bbb 100%);
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

.dd3-handle:before {
	content: '≡';
	display: block;
	position: absolute;
	left: 0;
	top: 3px;
	width: 100%;
	text-align: center;
	text-indent: 0;
	color: #fff;
	font-size: 20px;
	font-weight: normal;
}

.dd3-handle:hover {
	background: #ddd;
}
</style>

<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="http://192.168.7.138/jquery.nestable.js"></script>
</head>

<h1>1.品牌库匹配</h1>
<div
	style="position: relative; height: 500px; border: solid 1px; margin: 20px; padding: 20px;">
	<table style="width: 100%">
		<thead>
			<tr>
				<th style="width: 50%">品牌</th>
				<th style="width: 4%">车系</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<button type="button" class="am-btn am-btn-primary am-round">获取品牌</button>
				</td>

			</tr>


			<tr>
				<td class="tdbrand">
					<ul class="am-list">
						<c:forEach var="brand" items="${brands}" varStatus="s">
							<li class="lino" brand_id="${brand.brand_id}"><button
									class="brand-button am-btn am-btn-primary am-btn-xs">${s.index+1} . ${brand.brand_name}</button></li>
						</c:forEach>
					</ul>
				</td>
				<td class="tdseries">
					<ul class="am-list">
						<!-- 
		<li class="lino" brand_id="" series_id="">
			<span>series_name<span class="am-icon-sm"> <button class="brand-button am-btn am-btn-secondary am-btn-xs"></button>
			<span>series_group_name<span class="am-icon-sm">11111111</span>
		</li> -->
					</ul>
				</td>
			</tr>

		</tbody>
	</table>
</div>
<h1>2.车系库匹配</h1>

<!-- 车系对其 -->
<div style="width: 100%; position: relative; height: 500px; border: 1px solid; margin: 20px; padding: 20px; display: inline-flex; flex-direction: row; justify-content: flex-start;">
	<div style="width: 50%; border: 1px solid red" class="divmodel dd am-checkbox" id="nestable11">
		<span>che300车系库</span>
			<ul class="am-list dd-list">
			<!--  
							<li class="lino dd-item" data-id="1"><div class="dd-handle"><button class="model-button am-btn am-btn-primary am-btn-xs">1</button></div></li>
			--></ul>
	</div>
	<div style="margin-left: 10px; width: 50%; border: 1px solid red" class="divmodel dd" id="nestable12">
		<span>公司车系库</span>
			<ul class="am-list dd-list">
			<!--  
							<li class="lino dd-item" data-id="1">
							<div class="dd-handle">
							<button class="model-button am-btn am-btn-primary am-btn-xs">1</button>
							</div>
									</li>-->
					</ul>
	</div>
	<button class="series-run-button am-btn am-btn-primary am-btn-xs">执行</button>
</div>
<h1 >3.车型库对齐</h1>
<!-- 车型对其 -->

<div style="display:none;width: 100%; position: relative; height: 500px; border: 1px solid; margin: 20px; padding: 20px; display: inline-flex; flex-direction: row; justify-content: flex-start;">
	<div style="width: 50%; border: 1px solid red" class="divmodel dd" id="nestable">
		<span>che300车型库</span>
			<ul class="am-list dd-list">
			<!--  
							<li class="lino dd-item" data-id="1"><div class="dd-handle"><button class="model-button am-btn am-btn-primary am-btn-xs">1</button></div></li>
			--></ul>
	</div>
	<div style="margin-left: 10px; width: 50%; border: 1px solid red" class="divmodel dd" id="nestable1">
		<span>公司车型库</span>
			<ul class="am-list dd-list">
			<!-- -->
							<li class="lino dd-item" data-id="1">
							<div class="dd-handle">
							<button class="model-button am-btn am-btn-primary am-btn-xs">1</button>
							</div>
									</li>
									
									</li> 
					</ul>
	</div>
	<button class="modal-run-button am-btn am-btn-primary am-btn-xs">执行</button>
</div>

<!--
<div class="dd" id="nestable">
	<ul class="dd-list">
		<li class="dd-item" data-id="1">
			<div class="dd-handle">Item 1</div>
		</li>
		<li class="dd-item" data-id="11">
			<div class="dd-handle">Item 11</div>
		</li>
		<li class="dd-item" data-id="12">
			<div class="dd-handle">Item 12</div>
		</li>
	</ul>
</div>  -->


</body>
<script>
;(function(){
	$(document).ready(function(){
		$('button.brand-button').click(function(){
			var $this = $(this);
			var brandId = $this.parent().attr('brand_id');
			console.log(brandId);
			btn_click(brandId);
		});

		function btn_click(brandId){
			var url = './series?brandId='+brandId;
			$('.tdseries').children('.am-list').empty();
			$('#nestable11').find('ul').empty();
			$('#nestable12').find('ul').empty();
			$.get(url,brandId,function(data,status){
				var carSeries = data.carSeries;
				var chechengSeries = data.chechengSeries;
				carSeries.forEach(function(car,i){
					addseries(car,i);
					addche300series(car,i);
				});
				chechengSeries.forEach(function(car,i){
					console.log(car);
					addchechechengseries(car,i);
				});
			});
		}
		
		function addseries(car,i){
			var $li = $("<li class='lino' brand_id="+car.brand_id+" series_id="+car.series_id+"> <span>"+car.series_name+"</span>  <span>"+car.series_group_name+"</span></li>");
			var $button = $("<button class='series-button am-btn am-btn-secondary am-btn-xs'>"+car.series_name+"</button>");
			$button.click(function(){
				var seriesId = $(this).parent().attr('series_id');
				model_click(seriesId);
			});
			$li.append($button);
			var $seriesul = $('.tdseries').children('.am-list');
			$seriesul.append($li);
		}
		function addche300series(car,i){
			//<button class='model-button am-btn am-btn-primary am-btn-xs'>"+name+"</button>
			var $ul = $('#nestable11').find('ul');
			var name = " [ 名称="+car.series_name+" ]    [ 分组="+car.series_group_name+" ]";
			i++;
			var $li = $("<li class='lino dd-item' data-id="+car.series_id+"><div class='dd-handle' style='margin-left:20px'><label style='margin-right:10px'><input type='checkbox'>"+i+" </label><a href='#' class='am-text-truncate'>"+name+"</a></div></li>");
			$ul.append($li);
		}
		//<button class='model-button am-btn am-btn-primary am-btn-xs'>"+name+"</button>
		function addchechechengseries(car,i){
			var $ul = $('#nestable12').find('ul');
			i++;
			var name = " [ 名称="+car.series_name+ " ]   [ 分组="+car.series_group_name+" ]";	
			var $li = $("<li class='lino dd-item' data-id="+car.series_id+"><label style='margin-right:10px'><input type='checkbox'> "+i+"</label><div class='dd-handle' style='margin-left:20px'><a href='#' class='am-text-truncate'>"+name+"</a></div></li>");
			$ul.append($li);
		}
		
		function model_click(seriesId){
			$('#nestable').find('ul').empty();
			var url = './model?seriesId='+seriesId;
			$('#nestable').find('ul').empty();
			$.get(url,"",function(data,status){
				console.log(data);
				var carmodel300 = data.carModelChe300;
				var carmodelchecheng = data.carModelChecheng;
				console.log(carmodel300);
				console.log(carmodelchecheng);
				carmodel300.length!=0?carmodel300.forEach(function(model,i){
					addChe300model(model,i+1);
				}):0;
				carmodelchecheng.forEach(function(model){
					console.log(model);
					addChe300model(model);
				});
			});
		}
		function addChe300model(model,i){
			var $ul = $('#nestable').find('ul');
			//var name = "seriesId:"+model.series_id+" modelId="+model.model_id+" modelName="+model.model_name+" price="+model.model_price+" modelYear"+model.model_year+" liter="+model.liter+" gear_type"+model.gear_type;
			var name = i+". 车系:"+model.series_id+" 车型="+model.model_id+" 名称="+model.model_name+" 价格="+model.model_price+" 年份"+model.model_year+" 排量="+model.liter+" 驾驶类型"+model.gear_type;
			var $li = $("<li class='lino dd-item' data-id='1'><div class='dd-handle'><button class='model-button am-btn am-btn-primary am-btn-xs'>"+name+"</button></div></li>");
			$ul.append($li);
		}
		
		$('button.modal-run-button').click(function(){
			//che300
			var checkbox = $("#nestable11").find(':checkbox:checked');
			var $checheng = $("#nestable12").find(':checkbox:checked');
			
			var data = [];
			checkbox.each(function(i,d){
				var sers = {};
				var ckey = $(d).parent().parent().parent().attr("data-id");
				sers.pageNum = ckey;
				console.log($checheng);
				var cval = $checheng.eq(i).parent().parent().attr("data-id");
				sers.pageSize = cval;
				data[i] = sers;
			});
			var data1 = {
					"series" : data
			};
			data1 = JSON.stringify(data1);
			console.log(data1);
			var curl = "./postModels";
			$.ajax({ 
				  url:curl,
				  type:"POST",
				  data:data1,
				  contentType:"application/json",
				  dataType:"jsonp",
				  success: function(data,status){
					  console.log(data);
					  if(data.replyCode==0){
						  alert("！！！,恭喜匹配成功 ！！！");
					  }
				  }
			});
		});
		$('button.series-run-button').click(function(){
			//che300
			var checkbox = $("#nestable11").find(':checkbox:checked');
			var $checheng = $("#nestable12").find(':checkbox:checked');
			
			var data = [];
			checkbox.each(function(i,d){
				var sers = {};
				var ckey = $(d).parent().parent().parent().attr("data-id");
				sers.pageNum = ckey;
				console.log($checheng);
				var cval = $checheng.eq(i).parent().parent().attr("data-id");
				sers.pageSize = cval;
				data[i] = sers;
			});
			var data1 = {
					"series" : data
			};
			data1 = JSON.stringify(data1);
			console.log(data1);
			var curl = "./postSeries";
			$.ajax({ 
				  url:curl,
				  type:"POST",
				  data:data1,
				  contentType:"application/json",
				  dataType:"json",
				  success: function(data,status){
					  console.log(data);
					  if(data.replyCode==0){
						  alert("！！！,恭喜匹配成功 ！！！");
					  }
				  }
				})
			
		});
		
	});

})(window.jQuery);
</script>

<script>



$(document).ready(function(){
    var updateOutput = function(e)
    {

        var list   = e.length ? e : $(e.target),
        output = list.data('output');
        if (window.JSON) {
            output.val(window.JSON.stringify(list.nestable('serialize')));//, null, 2));
        } else {
            output.val('JSON browser support required for this demo.');
        }
    };

    $('#nestable').nestable({
		group: 1
    }).on('change', updateOutput);
    updateOutput($('#nestable').data('output', $('#nestable-output')));
    $('#nestable-menu').on('click', function(e){
        var target = $(e.target),
            action = target.data('action');
        if (action === 'expand-all') {

            $('.dd').nestable('expandAll');
        }
        if (action === 'collapse-all') {

            $('.dd').nestable('collapseAll');
        }
    });
});

</script>

<script>



$(document).ready(function(){
    var updateOutput1 = function(e)
    {

        var list   = e.length ? e : $(e.target),
        output = list.data('output');
        if (window.JSON) {
            output.val(window.JSON.stringify(list.nestable('serialize')));//, null, 2));
        } else {
            output.val('JSON browser support required for this demo.');
        }
    };

    $('#nestable1').nestable({
		group: 1
    }).on('change', updateOutput1);
    updateOutput1($('#nestable1').data('output', $('#nestable-output')));
    $('#nestable-menu').on('click', function(e){
        var target = $(e.target),
            action = target.data('action');
        if (action === 'expand-all') {

            $('.dd').nestable('expandAll');
        }
        if (action === 'collapse-all') {

            $('.dd').nestable('collapseAll');
        }
    });
});
</script>
<script>
$(document).ready(function(){
    var updateOutput1 = function(e)
    {

        var list   = e.length ? e : $(e.target),
        output = list.data('output');
        if (window.JSON) {
            output.val(window.JSON.stringify(list.nestable('serialize')));//, null, 2));
        } else {
            output.val('JSON browser support required for this demo.');
        }
    };

    $('#nestable12').nestable({
		group: 1
    }).on('change', updateOutput12);
    updateOutput12($('#nestable12').data('output', $('#nestable-output')));
    
    $('#nestable-menu').on('click', function(e){
        var target = $(e.target),
            action = target.data('action');
        if (action === 'expand-all') {
            $('.dd').nestable('expandAll');
        }
        if (action === 'collapse-all') {
            $('.dd').nestable('collapseAll');
        }
    });
});

</script>

<script>
$(document).ready(function(){
    var updateOutput1 = function(e)
    {

        var list   = e.length ? e : $(e.target),
        output = list.data('output');
        if (window.JSON) {
            output.val(window.JSON.stringify(list.nestable('serialize')));//, null, 2));
        } else {
            output.val('JSON browser support required for this demo.');
        }
    };

    $('#nestable11').nestable({
		group: 1
    }).on('change', updateOutput11);
    updateOutput11($('#nestable11').data('output', $('#nestable-output')));
    $('#nestable-menu').on('click', function(e){
        var target = $(e.target),
            action = target.data('action');
        if (action === 'expand-all') {

            $('.dd').nestable('expandAll');
        }
        if (action === 'collapse-all') {

            $('.dd').nestable('collapseAll');
        }
    });
});

</script>
<script src=" http://libs.baidu.com/json/json2/json2.js"></script>
</html>