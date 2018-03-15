<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="./" />
    <meta charset="UTF-8">
    <meta content="telephone=no, address=no" name="format-detection">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <!--<link href="${cssPath}/index/v1/base.css" rel="stylesheet">
    <link href="../resources/css/evaluation_detail.css" rel="stylesheet">-->
    <link href="http://static.che.com/checdn/app/aichegujia/evaluation_detail.css" rel="stylesheet">
    <title>爱车估价</title>
    <script>!function (a, b) { var c = document.documentElement, d = "orientationchange" in window ? "orientationchange" : "resize", e = function () { var a = c.clientWidth; a > 750 && (a = 750); c.style.fontSize = 100 * (a / 750) + "px" }; e(); a.addEventListener && b.addEventListener(d, e, !1) }(document, window);</script>
</head>
<body>
<!--
<div class="content">
    <div class="content_top">
        <div class="ad_title">
            <p>最大的人工在线估价社区</p><a href="">下载APP</a><b class="closeApp"></b>
        </div>
        <div class="slider slide-photos" id="photo_slide">
            <ul>
             <c:forEach var="images" items="${carInfo.images}">
                <li>
                    <a href="javascript:void(0);">
                        <img src="${images.picUrl}" alt="">
                    </a>
                </li>
                 <c:out value="${images.picUrl}"></c:out>
        </c:forEach>
            </ul>
            <div class="brief">
                <div class="userbrief clearfix">
                    <img src="${carInfo.detail.avatar}" alt="">
                    <span>${carInfo.detail.userName}</span>
                    <p>${carInfo.detail.publishTimeStr}</p>
                </div>
                <div class="desc clearfix">
                    <p class="point">${carInfo.detail.carDesc}</p>
                    <span class="num_pics">1/<c:out value="${fn:length(carInfo.images)}"></c:out></span>
                </div>
            </div>
            <div class="sale">
            <c:if test="${carInfo.detail.sell == 0}">
           			无出售意向
            </c:if>
            <c:if test="${carInfo.detail.sell == 1}">
           			有出售意向
            </c:if>
            </div>
        </div>
        <div class="strip clearfix">
            <span class="lt"><c:out value="${carInfo.detail.brandName} ${carInfo.detail.carSeriesName} ${carInfo.detail.modelName}"></c:out></span>
            <span class="rt">当前评分：<c:out value="${carInfo.detail.carTotalScore}"></c:out>分</span>
        </div>
        <div class="user_info">
            <h4>当前最高估价</h4>
            <div class="username">
                <img src="${carInfo.assess.avatar}" alt="">
                <span class="name"><c:out value="${carInfo.assess.userName}"></c:out></span>
                <span class="price">${carInfo.assess.assessPriceStr}万</span>
                
            </div>
            
            <div class="impress clearfix">
                <span>TA的印象：</span>
                <c:forEach var="arrlabel" items="${carInfo.assess.arrLabels}">
                <a class="green">${arrlabel}</a>
                </c:forEach>
            </div>
            <div class="evaluate">
                <span>TA的评价：</span>
              <c:out value="${carInfo.assess.comment}"></c:out>
            </div>
        </div>
    </div>
    <div class="content_bottom">
        <div class="nav">
            <span class="sel">车况</span>
            <span>估价(<c:out value="${fn:length(assess)}"></c:out>)</span>
        </div>
        <ul class="choose clearfix">
            <li class="active">
                <div class="car_brief">
                    <span class="title">车辆基本信息</span>
                    <div class="brief_info">
                        <div class="clearfix">
                            <div class="brief1">
                                <span>表显里程</span>
                                <p><c:out value="${conditionR.carinfo.carMil}"></c:out>公里</p>
                            </div>
                            <div class="brief1">
                                <span>首次上牌</span>
                                <p>${conditionR.carinfo.carFirstRegisterStr}</p>
                            </div>
                            <div class="brief1">
                                <span>过户次数</span>
                                <p>${conditionR.carinfo.carTransTimes}次</p>
                            </div>
                        </div>
                        <div class="brief2 clearfix">
                            <span>车辆所在地</span>
                            <p>${conditionR.carinfo.location}</p>
                        </div>
                    </div>
                </div>
                <div class="car_detail">
                    <span class="title">车况详情</span>
                   
                    
                    <table>
                     <c:forEach var="lableInfos" items="${conditionR.lableInfo}">
                        <tr>
                            <td class="lt">${lableInfos.supTag}</td>
                            <td>
                                <p class="succ">${lableInfos.subTag}</p>
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                    
                </div>
                <div class="tip">
                    以上车况由车主提供，仅供参考！实际车况请以现场看车为准，以免交易中产生不必要的损失和纠纷。
                </div>
            </li>
            <li>
               <div class="eva_price">
                   <p class="average">该车平均估价<span>￥<c:out value="${carInfo.detail.assessPriceAvgStr}"></c:out>万</span></p>
                   
                    <c:if test="${fn:length(assess)!=0}">
                   <c:forEach var="assesser" items="${assess}" begin="0" varStatus="test" step="1">
                   
                   <div class="list clearfix">
                       <img src="${assesser.avatar}" alt="">
                       <div class="price_rt">
                           <div class="price_rt_top clearfix">
                               <span class="lt">${assesser.userName}</span>
                               <div class="rt">
                               <c:if test="${test.index == 0}">
                                <b>最高</b>
                               </c:if>
                                   <span>￥${assesser.assessPriceStr}</span>
                               </div>
                           </div>
                           <div class="price_rt_bottom">
                             ${assesser.comment}
                               <p>${assesser.createTimeStr}</p>
                           </div>
                       </div>
                   </div>
                   </c:forEach>
                   </c:if>

               </div>
                <div class="tip">
                    以上车况由车主提供，仅供参考！实际车况请以现场看车为准，以免交易中产生不必要的损失和纠纷。
                </div>
            </li>
        </ul>
        <div class="content_fixed">
            下载爱车估价，查看全部(<c:out value="${fn:length(assess)}"></c:out>)条估价
        </div>
    </div>
    <div class="likeSee">
        <h4>大神们爱看</h4>
        <c:if test="${fn:length(recommeds) != 0}">
        <c:forEach var="hot" items="${recommeds}">
        <div class="likeSeeList">
            <div class="seeTop clearfix">
                <img src="${hot.avatar}" alt=""/>
                <i></i>
                <span>${hot.userName}</span>
                <b></b>
                <p>${hot.createTimestr}</p>
            </div>
            <div class="seeMiddle clearfix">
                <div class="middleLt">
                    <img src="${hot.coverImage}" alt=""/>
                    <span class="score sp">${hot.carTotalScore}分</span>
                </div>
                <div class="middleRt">
                    <span>${hot.brandName} ${hot.carSeriesName}</span>
                    <p>${hot.modelName}</p>
                    <div class="price">
                        最高价<span>${hot.userAssessMaxStr}</span>${hot.assessUserTotal}人估价
                    </div>
                    
                    <div class="impress clearfix">
                    <c:if test="${fn:length(hot.arrComment)!=0}">
                    <c:forEach var="arrComm" items="${hot.arrComment}">
                    	<a class="green">${arrComm}</a>
                    </c:forEach>
                    </c:if>
                    </div>
                </div>
            </div>
            <div class="seeBottom">
                <span><c:out value="${hot.assesserName}"></c:out>：</span>
               ${hot.carDesc}
            </div>
        </div>
         </c:forEach>
         </c:if>
    </div>
</div> -->
<img style="width:100%;" src="http://192.168.7.138/share-page.png"/>
<script src="http://static.che.com/checdn/app/aichegujia//base.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script src="http://static.che.com/checdn/app/aichegujia/evaluation_detail.js"></script>
</body>
</html>