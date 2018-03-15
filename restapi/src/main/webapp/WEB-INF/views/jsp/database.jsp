<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0030)http://localhost:8080/test/sql -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据库分析</title>

<style type="text/css">
/* GitHub stylesheet for MarkdownPad (http://markdownpad.com) */
/* Author: Nicolas Hery - http://nicolashery.com */
/* Version: b13fe65ca28d2e568c6ed5d7f06581183df8f2ff */
/* Source: https://github.com/nicolahery/markdownpad-github */

/* RESET
=============================================================================*/

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
}

/* BODY
=============================================================================*/

body {
  font-family: Helvetica, arial, freesans, clean, sans-serif;
  font-size: 14px;
  line-height: 1.6;
  color: #333;
  background-color: #fff;
  padding: 20px;
  max-width: 960px;
  margin: 0 auto;
}

body>*:first-child {
  margin-top: 0 !important;
}

body>*:last-child {
  margin-bottom: 0 !important;
}

/* BLOCKS
=============================================================================*/

p, blockquote, ul, ol, dl, table, pre {
  margin: 15px 0;
}

/* HEADERS
=============================================================================*/

h1, h2, h3, h4, h5, h6 {
  margin: 20px 0 10px;
  padding: 0;
  font-weight: bold;
  -webkit-font-smoothing: antialiased;
}

h1 tt, h1 code, h2 tt, h2 code, h3 tt, h3 code, h4 tt, h4 code, h5 tt, h5 code, h6 tt, h6 code {
  font-size: inherit;
}

h1 {
  font-size: 28px;
  color: #000;
}

h2 {
  font-size: 24px;
  border-bottom: 1px solid #ccc;
  color: #000;
}

h3 {
  font-size: 18px;
}

h4 {
  font-size: 16px;
}

h5 {
  font-size: 14px;
}

h6 {
  color: #777;
  font-size: 14px;
}

body>h2:first-child, body>h1:first-child, body>h1:first-child+h2, body>h3:first-child, body>h4:first-child, body>h5:first-child, body>h6:first-child {
  margin-top: 0;
  padding-top: 0;
}

a:first-child h1, a:first-child h2, a:first-child h3, a:first-child h4, a:first-child h5, a:first-child h6 {
  margin-top: 0;
  padding-top: 0;
}

h1+p, h2+p, h3+p, h4+p, h5+p, h6+p {
  margin-top: 10px;
}

/* LINKS
=============================================================================*/

a {
  color: #4183C4;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

/* LISTS
=============================================================================*/

ul, ol {
  padding-left: 30px;
}

ul li > :first-child, 
ol li > :first-child, 
ul li ul:first-of-type, 
ol li ol:first-of-type, 
ul li ol:first-of-type, 
ol li ul:first-of-type {
  margin-top: 0px;
}

ul ul, ul ol, ol ol, ol ul {
  margin-bottom: 0;
}

dl {
  padding: 0;
}

dl dt {
  font-size: 14px;
  font-weight: bold;
  font-style: italic;
  padding: 0;
  margin: 15px 0 5px;
}

dl dt:first-child {
  padding: 0;
}

dl dt>:first-child {
  margin-top: 0px;
}

dl dt>:last-child {
  margin-bottom: 0px;
}

dl dd {
  margin: 0 0 15px;
  padding: 0 15px;
}

dl dd>:first-child {
  margin-top: 0px;
}

dl dd>:last-child {
  margin-bottom: 0px;
}

/* CODE
=============================================================================*/

pre, code, tt {
  font-size: 12px;
  font-family: Consolas, "Liberation Mono", Courier, monospace;
}

code, tt {
  margin: 0 0px;
  padding: 0px 0px;
  white-space: nowrap;
  border: 1px solid #eaeaea;
  background-color: #f8f8f8;
  border-radius: 3px;
}

pre>code {
  margin: 0;
  padding: 0;
  white-space: pre;
  border: none;
  background: transparent;
}

pre {
  background-color: #f8f8f8;
  border: 1px solid #ccc;
  font-size: 13px;
  line-height: 19px;
  overflow: auto;
  padding: 6px 10px;
  border-radius: 3px;
}

pre code, pre tt {
  background-color: transparent;
  border: none;
}

kbd {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background-color: #DDDDDD;
    background-image: linear-gradient(#F1F1F1, #DDDDDD);
    background-repeat: repeat-x;
    border-color: #DDDDDD #CCCCCC #CCCCCC #DDDDDD;
    border-image: none;
    border-radius: 2px 2px 2px 2px;
    border-style: solid;
    border-width: 1px;
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    line-height: 10px;
    padding: 1px 4px;
}

/* QUOTES
=============================================================================*/

blockquote {
  border-left: 4px solid #DDD;
  padding: 0 15px;
  color: #777;
}

blockquote>:first-child {
  margin-top: 0px;
}

blockquote>:last-child {
  margin-bottom: 0px;
}

/* HORIZONTAL RULES
=============================================================================*/

hr {
  clear: both;
  margin: 15px 0;
  height: 0px;
  overflow: hidden;
  border: none;
  background: transparent;
  border-bottom: 4px solid #ddd;
  padding: 0;
}

/* TABLES
=============================================================================*/

table th {
  font-weight: bold;
}

table th, table td {
  border: 1px solid #ccc;
  padding: 6px 13px;
}

table tr {
  border-top: 1px solid #ccc;
  background-color: #fff;
}

table tr:nth-child(2n) {
  background-color: #f8f8f8;
}

/* IMAGES
=============================================================================*/

img {
  max-width: 100%
}
</style>
<!--<base href="file:\\\C:\Users\Administrator.USER-20160403YH\Desktop\">--><base href=".">
</head>
<body style="margin:auto">
<p><link rel="stylesheet" href="./数据库分析_files/amazeui.min.css"></p>
<h2><center> 数据库设计</center></h2>

      
	<h2>1.car_brand_info</h2>
		<!--  <pre><code>* car_brand_info</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>BRAND_ID</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>NO</td>
				<td>品牌ID</td>
			</tr>
			
			<tr class="am-success">
				<td>BRAND_NAME</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>品牌名称</td>
			</tr>
			
			<tr class="am-success">
				<td>PIC_URL</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>图片路径</td>
			</tr>
			
			<tr class="am-success">
				<td>FIRST_NUM</td>
				<td>varchar</td>
				<td>2</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>首字母</td>
			</tr>
			
			<tr class="am-success">
				<td>PY</td>
				<td>varchar</td>
				<td>10</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>PYEM</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>ISUSED</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>0：未使用，1：使用中</td>
			</tr>
			
			<tr class="am-success">
				<td>ENAME</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>英文名</td>
			</tr>
			
			<tr class="am-success">
				<td>SORTID</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>排序，有则按顺序显示在列表页</td>
			</tr>
			
			<tr class="am-success">
				<td>recommend</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>是否推荐1:是 0:否</td>
			</tr>
			
			<tr class="am-success">
				<td>national</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>国别</td>
			</tr>
			
			<tr class="am-success">
				<td>national_id</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>国别。参考:select * from t_sys_static_data where codeType = 'CARBARN_GB'</td>
			</tr>
			
			<tr class="am-success">
				<td>create_date</td>
				<td>datetime</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>done_date</td>
				<td>datetime</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>2.car_brand_son_type_info</h2>
		<!--  <pre><code>* car_brand_son_type_info</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>CAR_BRAND_SON_TYPE_ID</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>CAR_BRAND_SON_TYPE_NAME</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>名称</td>
			</tr>
			
			<tr class="am-success">
				<td>PIC_URL</td>
				<td>varchar</td>
				<td>100</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>图片路径</td>
			</tr>
			
			<tr class="am-success">
				<td>BRAND_ID</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>CAR_BRAND_TYPE_ID</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>所属车系</td>
			</tr>
			
			<tr class="am-success">
				<td>SON_TYPE</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>所属车型</td>
			</tr>
			
			<tr class="am-success">
				<td>factory_price_168</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>factory_price</td>
				<td>decimal</td>
				<td></td>
				
				<td>6</td>
				<td>2</td>
				
				<td>YES</td>
				<td>指导价</td>
			</tr>
			
			<tr class="am-success">
				<td>bottom_price</td>
				<td>decimal</td>
				<td></td>
				
				<td>6</td>
				<td>2</td>
				
				<td>YES</td>
				<td>参考价</td>
			</tr>
			
			<tr class="am-success">
				<td>CAR_BRAND_SON_TYPE_NAME_168</td>
				<td>varchar</td>
				<td>500</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>url_168</td>
				<td>varchar</td>
				<td>500</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>sale_state</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>销售状态，1：停售，0：正在销售</td>
			</tr>
			
			<tr class="am-success">
				<td>CSJG</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>ENGINE</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>ENGINE_AI_FORM</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>ENGINE_CAPACITY</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>ENGINE_FUEL_TYPE</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>ZWS</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>SHORT_NAME</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>DRIVING_MODE</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>PAN_SKY</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>全景天窗</td>
			</tr>
			
			<tr class="am-success">
				<td>ELEC_SKY</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>电动天窗</td>
			</tr>
			
			<tr class="am-success">
				<td>MAIN_ELEC_ADJ</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>电动调节座椅</td>
			</tr>
			
			<tr class="am-success">
				<td>STAB_CON</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>车身ESP</td>
			</tr>
			
			<tr class="am-success">
				<td>HID</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>氙气大灯</td>
			</tr>
			
			<tr class="am-success">
				<td>GPS</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>GPS导航</td>
			</tr>
			
			<tr class="am-success">
				<td>CRUISE_CON</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>定速巡航</td>
			</tr>
			
			<tr class="am-success">
				<td>LEA</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>真皮座椅</td>
			</tr>
			
			<tr class="am-success">
				<td>REAR_PARK_RAD</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>倒车雷达</td>
			</tr>
			
			<tr class="am-success">
				<td>AIR_CON_MODEL</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>全自动空调</td>
			</tr>
			
			<tr class="am-success">
				<td>MULT_STEEL</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>多功能方向盘</td>
			</tr>
			
			<tr class="am-success">
				<td>LED</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>LED大灯</td>
			</tr>
			
			<tr class="am-success">
				<td>REV_VIDEO</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>倒车影像</td>
			</tr>
			
			<tr class="am-success">
				<td>NOKEY_START</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>无钥匙启动</td>
			</tr>
			
			<tr class="am-success">
				<td>FRONT_HEAT</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>座椅加热</td>
			</tr>
			
			<tr class="am-success">
				<td>DAY_RUN</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>日间行车灯</td>
			</tr>
			
			<tr class="am-success">
				<td>AUTO_PARK</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>自动泊车</td>
			</tr>
			
			<tr class="am-success">
				<td>BLCP</td>
				<td>varchar</td>
				<td>128</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>蓝牙/车载电话</td>
			</tr>
			
			<tr class="am-success">
				<td>channel_price</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>channel_photo</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>model_number</td>
				<td>varchar</td>
				<td>63</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>vin_code</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>3.car_brand_type_info</h2>
		<!--  <pre><code>* car_brand_type_info</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>CAR_BRAND_TYPE_ID</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>NO</td>
				<td>车系ID</td>
			</tr>
			
			<tr class="am-success">
				<td>CAR_BRAND_TYPE_NAME</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>车系名</td>
			</tr>
			
			<tr class="am-success">
				<td>PIC_URL</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>图片路径</td>
			</tr>
			
			<tr class="am-success">
				<td>BRAND_ID</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>品牌ID</td>
			</tr>
			
			<tr class="am-success">
				<td>BRAND_TYPE_ID</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>品牌类型ID</td>
			</tr>
			
			<tr class="am-success">
				<td>BRAND_TYPE</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>品牌类型</td>
			</tr>
			
			<tr class="am-success">
				<td>SCFS</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>生成方式</td>
			</tr>
			
			<tr class="am-success">
				<td>FIRST_NUM</td>
				<td>varchar</td>
				<td>2</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>TJ</td>
				<td>varchar</td>
				<td>1</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>是否推荐</td>
			</tr>
			
			<tr class="am-success">
				<td>SORTID</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>排序</td>
			</tr>
			
			<tr class="am-success">
				<td>ISUSED</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>是否显示</td>
			</tr>
			
			<tr class="am-success">
				<td>ISSHOW</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>是否直接显示</td>
			</tr>
			
			<tr class="am-success">
				<td>LEVEL</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>是否在列表页加载时就显示，1：显示</td>
			</tr>
			
			<tr class="am-success">
				<td>SHOWNAME</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>初始显示在页面上的车系文字</td>
			</tr>
			
			<tr class="am-success">
				<td>zhidaoPrice</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>指导价。例如：10.00-110.00万</td>
			</tr>
			
			<tr class="am-success">
				<td>car_model_name</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>car_model</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>url</td>
				<td>varchar</td>
				<td>500</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>bodyStructure</td>
				<td>varchar</td>
				<td>500</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>车身结构</td>
			</tr>
			
			<tr class="am-success">
				<td>engine</td>
				<td>varchar</td>
				<td>500</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>发动机</td>
			</tr>
			
			<tr class="am-success">
				<td>transmission</td>
				<td>varchar</td>
				<td>500</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>变速箱</td>
			</tr>
			
			<tr class="am-success">
				<td>color</td>
				<td>varchar</td>
				<td>1000</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>车身外部颜色</td>
			</tr>
			
			<tr class="am-success">
				<td>color_name</td>
				<td>varchar</td>
				<td>1000</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>车身外部颜色名称</td>
			</tr>
			
			<tr class="am-success">
				<td>color_inner</td>
				<td>varchar</td>
				<td>1000</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>车身内部颜色</td>
			</tr>
			
			<tr class="am-success">
				<td>color_name_inner</td>
				<td>varchar</td>
				<td>1000</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>车身内部颜色名称</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>4.s_area_city</h2>
		<!--  <pre><code>* s_area_city</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>cityId</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>NO</td>
				<td>城市ID</td>
			</tr>
			
			<tr class="am-success">
				<td>city</td>
				<td>varchar</td>
				<td>20</td>
				
				<td></td>
				<td></td>
				
				<td>NO</td>
				<td>城市名称</td>
			</tr>
			
			<tr class="am-success">
				<td>fid</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>NO</td>
				<td>省外键ID</td>
			</tr>
			
			<tr class="am-success">
				<td>apiCityId</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>NO</td>
				<td>开户支行外键id,对应p2p_open_account_bank表中的apiCityId</td>
			</tr>
			
			<tr class="am-success">
				<td>shortName</td>
				<td>varchar</td>
				<td>20</td>
				
				<td></td>
				<td></td>
				
				<td>NO</td>
				<td>城市名简称</td>
			</tr>
			
			<tr class="am-success">
				<td>offencesRulesId</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>isopen</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>是否提供服务，1,提供，0不提供</td>
			</tr>
			
			<tr class="am-success">
				<td>FIRST_NUM</td>
				<td>varchar</td>
				<td>2</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>city_spell</td>
				<td>varchar</td>
				<td>10</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>5.t_auth_validate</h2>
		<!--  <pre><code>* t_auth_validate</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>NO</td>
				<td>有效性ID</td>
			</tr>
			
			<tr class="am-success">
				<td>type</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>NO</td>
				<td>验证码类型 0：短信 1：邮箱</td>
			</tr>
			
			<tr class="am-success">
				<td>code</td>
				<td>varchar</td>
				<td>10</td>
				
				<td></td>
				<td></td>
				
				<td>NO</td>
				<td>发送内容</td>
			</tr>
			
			<tr class="am-success">
				<td>destination</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>NO</td>
				<td>手机号或者 邮箱</td>
			</tr>
			
			<tr class="am-success">
				<td>userid</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>用户</td>
			</tr>
			
			<tr class="am-success">
				<td>source</td>
				<td>varchar</td>
				<td>10</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>操作来源 0：PC端，1：M站，2：ios，3：android',</td>
			</tr>
			
			<tr class="am-success">
				<td>addtime</td>
				<td>datetime</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>NO</td>
				<td>创建记录的时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>6.tb_achievement_system</h2>
		<!--  <pre><code>* tb_achievement_system</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>name</td>
				<td>varchar</td>
				<td>100</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>成就名称</td>
			</tr>
			
			<tr class="am-success">
				<td>description</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>描述</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			<tr class="am-success">
				<td>state</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>状态 0:有效 1：无效</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>7.tb_app_banner</h2>
		<!--  <pre><code>* tb_app_banner</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>NO</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>name</td>
				<td>varchar</td>
				<td>100</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>名称</td>
			</tr>
			
			<tr class="am-success">
				<td>type</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>类型 0：车型页banner</td>
			</tr>
			
			<tr class="am-success">
				<td>sort</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>排序</td>
			</tr>
			
			<tr class="am-success">
				<td>state</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>状态 默认0有效 1无效</td>
			</tr>
			
			<tr class="am-success">
				<td>jump_url</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>跳转url</td>
			</tr>
			
			<tr class="am-success">
				<td>image_url</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>图片url</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>8.tb_app_version</h2>
		<!--  <pre><code>* tb_app_version</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>version</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>version_code</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>type_</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>客户端类型 0：android 1:ios</td>
			</tr>
			
			<tr class="am-success">
				<td>force_update</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>0：不强制更新 1：强制更新</td>
			</tr>
			
			<tr class="am-success">
				<td>content</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新内容</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>9.tb_auth_record</h2>
		<!--  <pre><code>* tb_auth_record</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>uid</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>用户Id</td>
			</tr>
			
			<tr class="am-success">
				<td>real_name</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>真实姓名</td>
			</tr>
			
			<tr class="am-success">
				<td>idcard_code</td>
				<td>varchar</td>
				<td>60</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>身份证号码</td>
			</tr>
			
			<tr class="am-success">
				<td>idcard_front</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>身份证前照url</td>
			</tr>
			
			<tr class="am-success">
				<td>idcard_back</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>身份证后照url</td>
			</tr>
			
			<tr class="am-success">
				<td>idcard_hand</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>handle</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>处理类型：0:未操作 2：已操作</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>10.tb_car_apply</h2>
		<!--  <pre><code>* tb_car_apply</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>from_user_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>申请看车uid</td>
			</tr>
			
			<tr class="am-success">
				<td>to_user_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车源所有者uid</td>
			</tr>
			
			<tr class="am-success">
				<td>car_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车源id</td>
			</tr>
			
			<tr class="am-success">
				<td>state</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>状态（0申请中 ，1申请通过， 2申请失败</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>11.tb_car_assess</h2>
		<!--  <pre><code>* tb_car_assess</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>from_user_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>NO</td>
				<td>估价用户id</td>
			</tr>
			
			<tr class="am-success">
				<td>to_user_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车源用户id</td>
			</tr>
			
			<tr class="am-success">
				<td>car_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>NO</td>
				<td>车源id</td>
			</tr>
			
			<tr class="am-success">
				<td>state</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>状态：0已估价， 1.申请中， 2. 已忽略-看车申请被拒，3已同意 看车申请同意，4车主确认成交（已中标），5未中标（其他人未中标）</td>
			</tr>
			
			<tr class="am-success">
				<td>assess_price</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>NO</td>
				<td>估价的价格 单位元</td>
			</tr>
			
			<tr class="am-success">
				<td>comment</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>估价评价</td>
			</tr>
			
			<tr class="am-success">
				<td>labels</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>估价标签组</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间 估价时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>操作时间:确认 忽略</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>12.tb_car_assess_expert</h2>
		<!--  <pre><code>* tb_car_assess_expert</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>uid</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>用户id</td>
			</tr>
			
			<tr class="am-success">
				<td>assess_star</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>是否是明星估价师 0 不是，1：是</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			<tr class="am-success">
				<td>expert_achievement</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>成就名称以|分割</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>13.tb_car_assess_label_</h2>
		<!--  <pre><code>* tb_car_assess_label_</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>name</td>
				<td>varchar</td>
				<td>20</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>标签名称</td>
			</tr>
			
			<tr class="am-success">
				<td>state</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>状态 0启用 1：不启用</td>
			</tr>
			
			<tr class="am-success">
				<td>type</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>标签类型 0：系统标签 1：用户标签</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>14.tb_car_assess_who</h2>
		<!--  <pre><code>* tb_car_assess_who</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>uid</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>car_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车源id</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>15.tb_car_collect</h2>
		<!--  <pre><code>* tb_car_collect</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>uid</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>收藏者用户id</td>
			</tr>
			
			<tr class="am-success">
				<td>car_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车源id 可能车已经卖了</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>收藏时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>16.tb_car_complain</h2>
		<!--  <pre><code>* tb_car_complain</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>user_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>用户id</td>
			</tr>
			
			<tr class="am-success">
				<td>contact_info</td>
				<td>varchar</td>
				<td>56</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>举报人联系信息</td>
			</tr>
			
			<tr class="am-success">
				<td>car_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车源id</td>
			</tr>
			
			<tr class="am-success">
				<td>report_type</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>举报类型 默认为0</td>
			</tr>
			
			<tr class="am-success">
				<td>report_type_name</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>举报类型内容</td>
			</tr>
			
			<tr class="am-success">
				<td>remark</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>备注</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>举报时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>17.tb_car_condition_label</h2>
		<!--  <pre><code>* tb_car_condition_label</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>car_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车源id</td>
			</tr>
			
			<tr class="am-success">
				<td>label_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>标签定义id</td>
			</tr>
			
			<tr class="am-success">
				<td>label_sup_id</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>标签父id</td>
			</tr>
			
			<tr class="am-success">
				<td>label_sub_id</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>标签子标签</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>18.tb_car_discover</h2>
		<!--  <pre><code>* tb_car_discover</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>special_name</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>发现里的专题名称</td>
			</tr>
			
			<tr class="am-success">
				<td>cover</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>封面图片</td>
			</tr>
			
			<tr class="am-success">
				<td>url</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>如果是url，则跳转url</td>
			</tr>
			
			<tr class="am-success">
				<td>search_words</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>关键词</td>
			</tr>
			
			<tr class="am-success">
				<td>state</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>状态：0正常</td>
			</tr>
			
			<tr class="am-success">
				<td>sort</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>排序权重</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>19.tb_car_photos</h2>
		<!--  <pre><code>* tb_car_photos</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>car_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车源id</td>
			</tr>
			
			<tr class="am-success">
				<td>pic_url</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>type</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>类型 默认为0</td>
			</tr>
			
			<tr class="am-success">
				<td>cover</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>是否是封面 0:否 1:是</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>20.tb_car_series_hot</h2>
		<!--  <pre><code>* tb_car_series_hot</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>CAR_BRAND_TYPE_ID</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车系id，参考：car_brand_type_info</td>
			</tr>
			
			<tr class="am-success">
				<td>CAR_BRAND_TYPE_NAME</td>
				<td>varchar</td>
				<td>100</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>车系名称 如:汉兰达</td>
			</tr>
			
			<tr class="am-success">
				<td>BRAND_ID</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>品牌ID</td>
			</tr>
			
			<tr class="am-success">
				<td>BRAND_TYPE_ID</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>品牌类型Id</td>
			</tr>
			
			<tr class="am-success">
				<td>BRAND_NAME</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>品牌名称 如:大众</td>
			</tr>
			
			<tr class="am-success">
				<td>sort</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>排序</td>
			</tr>
			
			<tr class="am-success">
				<td>state</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>有效无效 0：有效 1：无效</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>21.tb_car_share</h2>
		<!--  <pre><code>* tb_car_share</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>uid</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>用户id</td>
			</tr>
			
			<tr class="am-success">
				<td>car_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车源id</td>
			</tr>
			
			<tr class="am-success">
				<td>share_type</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>分享类型 0微信朋友圈 1：微信好友 2：QQ 3：微博</td>
			</tr>
			
			<tr class="am-success">
				<td>visit_times</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>url访问次数</td>
			</tr>
			
			<tr class="am-success">
				<td>full_url</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>完整url</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>22.tb_car_source</h2>
		<!--  <pre><code>* tb_car_source</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>uid</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>NO</td>
				<td>发布者id</td>
			</tr>
			
			<tr class="am-success">
				<td>BRAND_ID</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>品牌id</td>
			</tr>
			
			<tr class="am-success">
				<td>BRAND_NAME</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>品牌名称</td>
			</tr>
			
			<tr class="am-success">
				<td>CAR_BRAND_TYPE_ID</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车系id</td>
			</tr>
			
			<tr class="am-success">
				<td>CAR_BRAND_TYPE_NAME</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>车系名称</td>
			</tr>
			
			<tr class="am-success">
				<td>CAR_BRAND_SON_TYPE_ID</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车型id</td>
			</tr>
			
			<tr class="am-success">
				<td>CAR_BRAND_SON_TYPE_NAME</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>车型名称</td>
			</tr>
			
			<tr class="am-success">
				<td>location</td>
				<td>varchar</td>
				<td>100</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>位置信息</td>
			</tr>
			
			<tr class="am-success">
				<td>location_code</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>城市地区代码</td>
			</tr>
			
			<tr class="am-success">
				<td>lng</td>
				<td>double</td>
				<td></td>
				
				<td>20</td>
				<td>5</td>
				
				<td>YES</td>
				<td>gps定位经度</td>
			</tr>
			
			<tr class="am-success">
				<td>lat</td>
				<td>double</td>
				<td></td>
				
				<td>20</td>
				<td>5</td>
				
				<td>YES</td>
				<td>gps定位纬度</td>
			</tr>
			
			<tr class="am-success">
				<td>car_state</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车的状态（0:估价中 1：看车中 2：已售出)</td>
			</tr>
			
			<tr class="am-success">
				<td>car_mil</td>
				<td>double</td>
				<td></td>
				
				<td>22</td>
				<td></td>
				
				<td>YES</td>
				<td>车行驶里程 单位公里</td>
			</tr>
			
			<tr class="am-success">
				<td>car_first_register</td>
				<td>date</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>首次上牌时间</td>
			</tr>
			
			<tr class="am-success">
				<td>car_trans_times</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>过户次数 五次以上为6</td>
			</tr>
			
			<tr class="am-success">
				<td>car_identity</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>NO</td>
				<td>车的身份（0：个人 1：商家）</td>
			</tr>
			
			<tr class="am-success">
				<td>car_desc</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>车源描述</td>
			</tr>
			
			<tr class="am-success">
				<td>car_contact_mobile</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>车源联系号码（失效）</td>
			</tr>
			
			<tr class="am-success">
				<td>car_contacts_name</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>联系人名称（失效）</td>
			</tr>
			
			<tr class="am-success">
				<td>cover_image</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>NO</td>
				<td>封面图片地址</td>
			</tr>
			
			<tr class="am-success">
				<td>user_assess_min</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>用户最低估价</td>
			</tr>
			
			<tr class="am-success">
				<td>sys_assess_min</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>最低系统估价</td>
			</tr>
			
			<tr class="am-success">
				<td>user_assess_max</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>用户最高估价</td>
			</tr>
			
			<tr class="am-success">
				<td>user_assess_max_assess_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>最高估价id</td>
			</tr>
			
			<tr class="am-success">
				<td>sys_assess_basic_price</td>
				<td>double</td>
				<td></td>
				
				<td>22</td>
				<td></td>
				
				<td>YES</td>
				<td>系统估价基准值</td>
			</tr>
			
			<tr class="am-success">
				<td>sys_assess_max</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>最高系统估价</td>
			</tr>
			
			<tr class="am-success">
				<td>assess_price_avg</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>估价均值</td>
			</tr>
			
			<tr class="am-success">
				<td>assess_user_total</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>估价的次数</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			<tr class="am-success">
				<td>hot_series</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>默认为0，不为热门车系 1为热门车系</td>
			</tr>
			
			<tr class="am-success">
				<td>car_total_score</td>
				<td>double</td>
				<td></td>
				
				<td>22</td>
				<td></td>
				
				<td>YES</td>
				<td>车况得分</td>
			</tr>
			
			<tr class="am-success">
				<td>wish_sell</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>是否有意愿卖车 0：没有 1：有</td>
			</tr>
			
			<tr class="am-success">
				<td>car_other_score</td>
				<td>double</td>
				<td></td>
				
				<td>22</td>
				<td></td>
				
				<td>YES</td>
				<td>其他得分=平均估价-基础得分/基础得分</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>23.tb_car_source_trigger_temp</h2>
		<!--  <pre><code>* tb_car_source_trigger_temp</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>car_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>CAR_BRAND_TYPE_ID</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>24.tb_car_topic</h2>
		<!--  <pre><code>* tb_car_topic</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>专题</td>
			</tr>
			
			<tr class="am-success">
				<td>name</td>
				<td>varchar</td>
				<td>20</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>专题名称</td>
			</tr>
			
			<tr class="am-success">
				<td>state</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>状态 0:有效，1：无效</td>
			</tr>
			
			<tr class="am-success">
				<td>sort</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>专题排序</td>
			</tr>
			
			<tr class="am-success">
				<td>type</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>类别 0：用户 1：运营</td>
			</tr>
			
			<tr class="am-success">
				<td>times</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>专题标记次数，只对用户专题有效</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>25.tb_condition_label_defi</h2>
		<!--  <pre><code>* tb_condition_label_defi</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>sup_id</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>父标签id</td>
			</tr>
			
			<tr class="am-success">
				<td>sub_id</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>子标签id</td>
			</tr>
			
			<tr class="am-success">
				<td>sup_tag</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>父标签 如：事故</td>
			</tr>
			
			<tr class="am-success">
				<td>sub_tag</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>子标签 如有事故</td>
			</tr>
			
			<tr class="am-success">
				<td>select_type</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>单选多选 0：单选 1：多选</td>
			</tr>
			
			<tr class="am-success">
				<td>sup_sort</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>外部排序</td>
			</tr>
			
			<tr class="am-success">
				<td>sub_sort</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>内部排序</td>
			</tr>
			
			<tr class="am-success">
				<td>weight</td>
				<td>double</td>
				<td></td>
				
				<td>22</td>
				<td></td>
				
				<td>YES</td>
				<td>权重</td>
			</tr>
			
			<tr class="am-success">
				<td>score</td>
				<td>double</td>
				<td></td>
				
				<td>22</td>
				<td></td>
				
				<td>YES</td>
				<td>得分=权重*分数</td>
			</tr>
			
			<tr class="am-success">
				<td>total_result</td>
				<td>double</td>
				<td></td>
				
				<td>22</td>
				<td></td>
				
				<td>YES</td>
				<td>最后得分=weight*score</td>
			</tr>
			
			<tr class="am-success">
				<td>descript</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>描述</td>
			</tr>
			
			<tr class="am-success">
				<td>color_type</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>标签颜色 {0：绿色 1：感叹号}</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>26.tb_credit_defi_</h2>
		<!--  <pre><code>* tb_credit_defi_</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>single_credits</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>单项积分数</td>
			</tr>
			
			<tr class="am-success">
				<td>desc</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>积分描述</td>
			</tr>
			
			<tr class="am-success">
				<td>start_time</td>
				<td>datetime</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>规则开始时间</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>datetime</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>27.tb_credit_record</h2>
		<!--  <pre><code>* tb_credit_record</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>credits</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>积分数</td>
			</tr>
			
			<tr class="am-success">
				<td>type_id</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>积分类型,查看tb_credit_defi表</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>28.tb_feedback</h2>
		<!--  <pre><code>* tb_feedback</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>user_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>用户id</td>
			</tr>
			
			<tr class="am-success">
				<td>email</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>邮箱地址</td>
			</tr>
			
			<tr class="am-success">
				<td>content</td>
				<td>varchar</td>
				<td>1500</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>反馈内容</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>29.tb_invite</h2>
		<!--  <pre><code>* tb_invite</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>from_user_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>邀请者用户id</td>
			</tr>
			
			<tr class="am-success">
				<td>to_user_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>被邀请者用户id</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>30.tb_login_logs</h2>
		<!--  <pre><code>* tb_login_logs</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>uid</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>登录时间</td>
			</tr>
			
			<tr class="am-success">
				<td>city</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>城市</td>
			</tr>
			
			<tr class="am-success">
				<td>ip</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>type_</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>登录类型 0：登录 1：登出</td>
			</tr>
			
			<tr class="am-success">
				<td>desc</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>登录登出</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>31.tb_message</h2>
		<!--  <pre><code>* tb_message</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>title</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>标题</td>
			</tr>
			
			<tr class="am-success">
				<td>message_content</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>信息内容</td>
			</tr>
			
			<tr class="am-success">
				<td>from_uid</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>激发者uid</td>
			</tr>
			
			<tr class="am-success">
				<td>to_uid</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>去向者uid</td>
			</tr>
			
			<tr class="am-success">
				<td>car_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车源id</td>
			</tr>
			
			<tr class="am-success">
				<td>type</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>消息类别 0:用户消息 1:系统消息</td>
			</tr>
			
			<tr class="am-success">
				<td>state</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>消息状态（0:未读,1:已读）</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>32.tb_message_template</h2>
		<!--  <pre><code>* tb_message_template</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>message_type</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>消息类别</td>
			</tr>
			
			<tr class="am-success">
				<td>content_template</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>消息模板</td>
			</tr>
			
			<tr class="am-success">
				<td>desc</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>描述信息</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			<tr class="am-success">
				<td>Operator</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>操着者信息</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>33.tb_search_every_all_words</h2>
		<!--  <pre><code>* tb_search_every_all_words</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>words</td>
				<td>varchar</td>
				<td>100</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>大家都在看 如：比亚迪F3</td>
			</tr>
			
			<tr class="am-success">
				<td>search_times</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>搜索次数</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>34.tb_topic_record</h2>
		<!--  <pre><code>* tb_topic_record</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>car_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车源Id</td>
			</tr>
			
			<tr class="am-success">
				<td>assess_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>topic_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>专题</td>
			</tr>
			
			<tr class="am-success">
				<td>source</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>来源 0:车源 1：估价</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>35.tb_user</h2>
		<!--  <pre><code>* tb_user</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>open_id</td>
				<td>varchar</td>
				<td>100</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>微信id</td>
			</tr>
			
			<tr class="am-success">
				<td>code</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>对应大账户code码</td>
			</tr>
			
			<tr class="am-success">
				<td>user_name</td>
				<td>varchar</td>
				<td>56</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>用户名称</td>
			</tr>
			
			<tr class="am-success">
				<td>password</td>
				<td>varchar</td>
				<td>256</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>密码</td>
			</tr>
			
			<tr class="am-success">
				<td>bail</td>
				<td>varchar</td>
				<td>56</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>保证金</td>
			</tr>
			
			<tr class="am-success">
				<td>account</td>
				<td>varchar</td>
				<td>56</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>余额</td>
			</tr>
			
			<tr class="am-success">
				<td>mobile</td>
				<td>varchar</td>
				<td>40</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>手机号码</td>
			</tr>
			
			<tr class="am-success">
				<td>avatar</td>
				<td>varchar</td>
				<td>256</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>头像</td>
			</tr>
			
			<tr class="am-success">
				<td>sex</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>0：女 1：男 2：未知</td>
			</tr>
			
			<tr class="am-success">
				<td>province</td>
				<td>varchar</td>
				<td>30</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>省/直辖市</td>
			</tr>
			
			<tr class="am-success">
				<td>province_id</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>省/直辖市id</td>
			</tr>
			
			<tr class="am-success">
				<td>city</td>
				<td>varchar</td>
				<td>30</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>城市/区</td>
			</tr>
			
			<tr class="am-success">
				<td>city_id</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>城市代码</td>
			</tr>
			
			<tr class="am-success">
				<td>introduce</td>
				<td>varchar</td>
				<td>256</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>介绍，签名</td>
			</tr>
			
			<tr class="am-success">
				<td>auth_status</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td> 0未校验 1校验通过 2校验失败 3已认证未审核</td>
			</tr>
			
			<tr class="am-success">
				<td>user_status</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>用户状态：0正常 1:非正常无法登陆平台</td>
			</tr>
			
			<tr class="am-success">
				<td>inviter_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>邀请人id</td>
			</tr>
			
			<tr class="am-success">
				<td>invite_code</td>
				<td>varchar</td>
				<td>30</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>邀请码</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>36.tb_user_achievement</h2>
		<!--  <pre><code>* tb_user_achievement</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>uid</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>NO</td>
				<td>用户Id</td>
			</tr>
			
			<tr class="am-success">
				<td>achieve_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>对应成就定义表Id，可为空</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>37.tb_user_ext</h2>
		<!--  <pre><code>* tb_user_ext</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>uid</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>assess_car_num</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>估车的数量</td>
			</tr>
			
			<tr class="am-success">
				<td>public_car_total</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>发布的车源数</td>
			</tr>
			
			<tr class="am-success">
				<td>order_car_total</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>申请看车数</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>38.tb_user_focus_topic</h2>
		<!--  <pre><code>* tb_user_focus_topic</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>uid</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>topic_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>NO</td>
				<td>专题id</td>
			</tr>
			
			<tr class="am-success">
				<td>focus</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>是否关注 0：没有，1：有</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>39.tb_user_friend</h2>
		<!--  <pre><code>* tb_user_friend</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>sup_uid</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>用户主id</td>
			</tr>
			
			<tr class="am-success">
				<td>sub_uid</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>用户从id</td>
			</tr>
			
			<tr class="am-success">
				<td>sup_open_id</td>
				<td>varchar</td>
				<td>100</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>主微信id</td>
			</tr>
			
			<tr class="am-success">
				<td>sub_open_id</td>
				<td>varchar</td>
				<td>100</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>从微信id</td>
			</tr>
			
			<tr class="am-success">
				<td>relation</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>关系 0：好友 1：非好友</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>40.tb_user_growup_system</h2>
		<!--  <pre><code>* tb_user_growup_system</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>assesser_name</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>名称</td>
			</tr>
			
			<tr class="am-success">
				<td>auth</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>是否需要认证 0：需要认证 1：无需认证</td>
			</tr>
			
			<tr class="am-success">
				<td>assess_times</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>估价次数</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>41.tb_user_integral</h2>
		<!--  <pre><code>* tb_user_integral</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>user_id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>NO</td>
				<td>用户id</td>
			</tr>
			
			<tr class="am-success">
				<td>credits</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>积分数</td>
			</tr>
			
			<tr class="am-success">
				<td>operate</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>操作说明</td>
			</tr>
			
			<tr class="am-success">
				<td>operate_code</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>操作唯一编码</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>42.tb_user_medal</h2>
		<!--  <pre><code>* tb_user_medal</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>medal_name</td>
				<td>varchar</td>
				<td>50</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>勋章级别</td>
			</tr>
			
			<tr class="am-success">
				<td>assess_price_verify</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>估价并确认的次数</td>
			</tr>
			
			<tr class="am-success">
				<td>carsource_stated_maintain</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车源定期保养得次数</td>
			</tr>
			
			<tr class="am-success">
				<td>assess_price_time</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>估价的次数</td>
			</tr>
			
			<tr class="am-success">
				<td>desc</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>说明</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>43.tb_vip_integral_regime</h2>
		<!--  <pre><code>* tb_vip_integral_regime</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>name</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>credits</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>积分数</td>
			</tr>
			
			<tr class="am-success">
				<td>operate_desc</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>操作说明</td>
			</tr>
			
			<tr class="am-success">
				<td>operate_code</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>操作唯一编码</td>
			</tr>
			
			<tr class="am-success">
				<td>defunct</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>是否删除，0正常，1删除</td>
			</tr>
			
			<tr class="am-success">
				<td>create_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>update_time</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>更新时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>44.tb_vip_level</h2>
		<!--  <pre><code>* tb_vip_level</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>credits</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>积分要求</td>
			</tr>
			
			<tr class="am-success">
				<td>grade_label</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>等级标示</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>45.view_achievement</h2>
		<!--  <pre><code>* view_achievement</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>uid</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>NO</td>
				<td>用户Id</td>
			</tr>
			
			<tr class="am-success">
				<td>achieveName</td>
				<td>varchar</td>
				<td>100</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>成就名称</td>
			</tr>
			
			<tr class="am-success">
				<td>achieveId</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>description</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>描述</td>
			</tr>
			
			<tr class="am-success">
				<td>achieveState</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>状态 0:有效 1：无效</td>
			</tr>
			
			<tr class="am-success">
				<td>createTime</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>46.view_assess_user</h2>
		<!--  <pre><code>* view_assess_user</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>assessId</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>carId</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>NO</td>
				<td>车源id</td>
			</tr>
			
			<tr class="am-success">
				<td>state</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>状态：0已估价， 1.申请中， 2. 已忽略-看车申请被拒，3已同意 看车申请同意，4车主确认成交（已中标），5未中标（其他人未中标）</td>
			</tr>
			
			<tr class="am-success">
				<td>assessPrice</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>NO</td>
				<td>估价的价格 单位元</td>
			</tr>
			
			<tr class="am-success">
				<td>comment</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>估价评价</td>
			</tr>
			
			<tr class="am-success">
				<td>assessPriceStr</td>
				<td>varchar</td>
				<td>20</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>createTime</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间 估价时间</td>
			</tr>
			
			<tr class="am-success">
				<td>createTimeStr</td>
				<td>varchar</td>
				<td>30</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>updateTime</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>操作时间:确认 忽略</td>
			</tr>
			
			<tr class="am-success">
				<td>labels</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>估价标签组</td>
			</tr>
			
			<tr class="am-success">
				<td>username</td>
				<td>varchar</td>
				<td>56</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>用户名称</td>
			</tr>
			
			<tr class="am-success">
				<td>avatar</td>
				<td>varchar</td>
				<td>256</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>头像</td>
			</tr>
			
			<tr class="am-success">
				<td>uid</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>YES</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>authStatus</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td> 0未校验 1校验通过 2校验失败 3已认证未审核</td>
			</tr>
			
			<tr class="am-success">
				<td>expertName</td>
				<td>varchar</td>
				<td>20</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>introduce</td>
				<td>varchar</td>
				<td>256</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>介绍，签名</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>47.view_car_assess_topic</h2>
		<!--  <pre><code>* view_car_assess_topic</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>carId</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车源Id</td>
			</tr>
			
			<tr class="am-success">
				<td>assessId</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>topicId</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>专题</td>
			</tr>
			
			<tr class="am-success">
				<td>source</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>来源 0:车源 1：估价</td>
			</tr>
			
			<tr class="am-success">
				<td>createTime</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>topicName</td>
				<td>varchar</td>
				<td>20</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>专题名称</td>
			</tr>
			
			<tr class="am-success">
				<td>state</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>状态 0:有效，1：无效</td>
			</tr>
			
			<tr class="am-success">
				<td>sort</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>专题排序</td>
			</tr>
			
			<tr class="am-success">
				<td>type</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>类别 0：用户 1：运营</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>48.view_car_condition</h2>
		<!--  <pre><code>* view_car_condition</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>labelId</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>carId</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车源id</td>
			</tr>
			
			<tr class="am-success">
				<td>supId</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>标签父id</td>
			</tr>
			
			<tr class="am-success">
				<td>subId</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>标签子标签</td>
			</tr>
			
			<tr class="am-success">
				<td>supTag</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>父标签 如：事故</td>
			</tr>
			
			<tr class="am-success">
				<td>subTag</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>子标签 如有事故</td>
			</tr>
			
			<tr class="am-success">
				<td>supSort</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>外部排序</td>
			</tr>
			
			<tr class="am-success">
				<td>subSort</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>内部排序</td>
			</tr>
			
			<tr class="am-success">
				<td>colorType</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>标签颜色 {0：绿色 1：感叹号}</td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>49.view_carsource_user</h2>
		<!--  <pre><code>* view_carsource_user</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>carId</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>NO</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>uid</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>YES</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>avatar</td>
				<td>varchar</td>
				<td>256</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>头像</td>
			</tr>
			
			<tr class="am-success">
				<td>userName</td>
				<td>varchar</td>
				<td>56</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>用户名称</td>
			</tr>
			
			<tr class="am-success">
				<td>authStatus</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td> 0未校验 1校验通过 2校验失败 3已认证未审核</td>
			</tr>
			
			<tr class="am-success">
				<td>createTime</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>创建时间</td>
			</tr>
			
			<tr class="am-success">
				<td>createTimestr</td>
				<td>varchar</td>
				<td>30</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>coverImage</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>NO</td>
				<td>封面图片地址</td>
			</tr>
			
			<tr class="am-success">
				<td>carTotalScore</td>
				<td>double</td>
				<td></td>
				
				<td>22</td>
				<td></td>
				
				<td>YES</td>
				<td>车况得分</td>
			</tr>
			
			<tr class="am-success">
				<td>brandName</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>品牌名称</td>
			</tr>
			
			<tr class="am-success">
				<td>brandId</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>品牌id</td>
			</tr>
			
			<tr class="am-success">
				<td>carSeriesName</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>车系名称</td>
			</tr>
			
			<tr class="am-success">
				<td>carSeriesId</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车型id</td>
			</tr>
			
			<tr class="am-success">
				<td>modelName</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>车型名称</td>
			</tr>
			
			<tr class="am-success">
				<td>calModelId</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车型id</td>
			</tr>
			
			<tr class="am-success">
				<td>userAssessMax</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>用户最高估价</td>
			</tr>
			
			<tr class="am-success">
				<td>carState</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>车的状态（0:估价中 1：看车中 2：已售出)</td>
			</tr>
			
			<tr class="am-success">
				<td>assessPriceAvg</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>估价均值</td>
			</tr>
			
			<tr class="am-success">
				<td>assessPriceAvgStr</td>
				<td>varchar</td>
				<td>20</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>userAssessMaxStr</td>
				<td>varchar</td>
				<td>20</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>maxAssessId</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>最高估价id</td>
			</tr>
			
			<tr class="am-success">
				<td>assessUserTotal</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>NO</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>carDesc</td>
				<td>varchar</td>
				<td>255</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>车源描述</td>
			</tr>
			
			<tr class="am-success">
				<td>hotSeries</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>默认为0，不为热门车系 1为热门车系</td>
			</tr>
			
			<tr class="am-success">
				<td>expertName</td>
				<td>varchar</td>
				<td>20</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>achieveName</td>
				<td>varchar</td>
				<td>100</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			</tbody>
		</table>
      
	<h2>50.view_topic_focus</h2>
		<!--  <pre><code>* view_topic_focus</code></pre>-->
		<table class="am-table  am-table-bordered">
			<thead>
				<tr>
				<th>字段名</th>
				<th>类型</th>
		<th>长度</th>
		<th>数字长度</th>
		<th>小数长度</th>
		<th>是否允许空值</th>
		<th>注释</th>
		</tr>
			</thead>
			<tbody>
			
			<tr class="am-success">
				<td>id</td>
				<td>bigint</td>
				<td></td>
				
				<td>20</td>
				<td>0</td>
				
				<td>YES</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>topicId</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>专题id</td>
			</tr>
			
			<tr class="am-success">
				<td>uid</td>
				<td>bigint</td>
				<td></td>
				
				<td>19</td>
				<td>0</td>
				
				<td>YES</td>
				<td>主键</td>
			</tr>
			
			<tr class="am-success">
				<td>focus</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>是否关注 0：没有，1：有</td>
			</tr>
			
			<tr class="am-success">
				<td>createTime</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>updateTime</td>
				<td>timestamp</td>
				<td></td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td></td>
			</tr>
			
			<tr class="am-success">
				<td>topicName</td>
				<td>varchar</td>
				<td>20</td>
				
				<td></td>
				<td></td>
				
				<td>YES</td>
				<td>专题名称</td>
			</tr>
			
			<tr class="am-success">
				<td>state</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>状态 0:有效，1：无效</td>
			</tr>
			
			<tr class="am-success">
				<td>sort</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>专题排序</td>
			</tr>
			
			<tr class="am-success">
				<td>type</td>
				<td>tinyint</td>
				<td></td>
				
				<td>3</td>
				<td>0</td>
				
				<td>YES</td>
				<td>类别 0：用户 1：运营</td>
			</tr>
			
			<tr class="am-success">
				<td>times</td>
				<td>int</td>
				<td></td>
				
				<td>10</td>
				<td>0</td>
				
				<td>YES</td>
				<td>专题标记次数，只对用户专题有效</td>
			</tr>
			
			</tbody>
		</table>

</body></html>