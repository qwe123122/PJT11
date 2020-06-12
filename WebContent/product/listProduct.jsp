<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>상품 목록조회</title> 

<!-- jQuery autoComplete -->
<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
body {
	padding-top: 50px;
}
</style>
                <style>
                    .thumbnail{
                       // min-width: 300px;
                    }
                </style>
<script type="text/javascript">
	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage);
		var uri = "/product/listProduct?menu=${param.menu}";
		uri = $("form").attr("method", "POST").attr("action", uri);
		uri.submit();
	}

	$(function() {
		
////////////////검색버튼 눌렀을 때 start...
		$('button.btn-block:contains("검색"),input[value="prodNo"],input[value="priceASC"],input[value="priceDESC"],input[value="recently"]').on(						"click",
						function() {
							$("#currentPage").val('1');
							if($("#searchKeyword1").val()==''){
								$("#searchKeyword1").val(0)
							}
							if($("#searchKeyword2").val()==''){
								$("#searchKeyword2").val(0)
							}
							var uri = "/product/listProduct?menu=${param.menu}";
							$("form").attr("method", "POST")
									.attr("action", uri).submit();
						})
////////////////검색버튼 눌렀을 때 end...

///////////////상품 간략정보 ajax start...
		$(".ct_list_pop td:nth-child(3)")
				.on(
						"click",
						function() {
							var prodNo = $(this).next('td').next('td').next(
									'td').next('td').text().trim();
							//var uri = "/product/getProduct?prodNo="+prodNo+"&menu=search";
							var tran = $(this).next('td').next('td').next('td')
									.next('td').next('td').next('td').text()
									.trim();
							if ('${param.menu}' == 'manage' && tran == '판매중') {
								uri = "/product/getProduct?prodNo=" + prodNo
										+ "&menu=manage";
								self.location = uri;
							} else {
								if ($("#" + prodNo + "").html().length != 0) {
									$("#" + prodNo + "").empty();
								} else {
									$
											.ajax({
												url : "/product/json/getProduct/"
														+ prodNo,
												method : "GET",
												dataType : "json",
												headers : {
													"Accept" : "application/json",
													"Content-Type" : "application/json"
												},
												success : function(JSONData,
														status) {
													//alert(status);
													//alert("JSONData : \n"+JSONData);

													var displayValue = "<h3>"
															+ "상품번호: "
															+ JSONData.prodNo
															+ "<br>"
															+ "상품명: "
															+ JSONData.prodName
															+ "<br>"
															+ "상세 설명: "
															+ JSONData.prodDetail
															+ "<br>";
													if (JSONData.fileNames != null) {
														displayValue += "상품 이미지:<br>"
														console
																.log(JSONData.fileNames);
														for ( var i in JSONData.fileNames) {
															console
																	.log(JSONData.fileNames[i])
															displayValue += "<img src='../images/uploadFiles/"+JSONData.fileNames[i]+"' width='500'/><br/>"
														}
													} else {
														displayValue += "상품 이미지:<img src='../images/uploadFiles/"+JSONData.fileName+"' width='500'/>"
													}

													displayValue += "가격: "
															+ JSONData.price
															+ "<br>" + "제조일: "
															+ JSONData.manuDate
															+ "<br>" + "등록일: "
															+ JSONData.regDate
															+ "<br>" + "<hr>";
													if (JSONData.proTranCode == '1  ') {
														displayValue += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='/purchase/addPurchase?prodNo="
																+ JSONData.prodNo
																+ "'>"
																+ JSONData.prodName
																+ " 구매하기</a>"
													}
													displayValue += "</h3>"
													$("#" + prodNo + "").html(
															displayValue);
												},
												error : function(jqXHR) {
													alert("url:"
															+ "/product/json/getProduct/"
															+ prodNo)
													alert("error:"
															+ jqXHR.status);
												}
											})
								}
							}

						})
///////////////상품 간략정보 ajax start...

///////autoComplete start...
		$('input[name="searchKeyword"]').on("keyup", function() {
			//alert("success");
			var searchKeyword = $(this).val();
			var searchCondition = $('select[name=searchCondition]').val();
			//console.log("searchKeyword:"+searchKeyword+"\nsearchCondition:"+searchCondition);
			$.ajax({
				url : "/product/json/autoCompleteUser",
				method : "POST",
				data : JSON.stringify({
					"searchKeyword" : searchKeyword,
					"searchCondition" : searchCondition
				}),
				dataType : "text",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status) {

					//Debug...
					//alert(status);
					//Debug...
					//alert("JSONData : \n"+JSONData);
					//alert("list : \n"+JSON.stringify(JSONData))
					var jsonarr = $.parseJSON(JSONData);
					//alert("jsonarr:\n"+jsonarr)
					//var autoC = jsonarr;
					//alert("autoC : \n"+autoC);

					$('input[name="searchKeyword"]').autocomplete({
						source : jsonarr
					});
				}
			})
		})
/////////autoComplete end...

////////param.menu==manage 일 때 배송하기 start...
		$('span[id^=deliver]').on(
				"click",
				function() {
					var prodNo = $($(this).next('span').html()).val();
					console.log(prodNo);
					location = "/purchase/updateTranCodeByProd?prodNo="
							+ prodNo + "&tranCode=3"
				})
				
////////param.menu==manage 일 때 배송하기 end...

///////타이틀 눌렀을 때 reload start...
	$('h3').on("click", function(){
		location="/product/listProduct?menu=${param.menu}"
	})
///////타이틀 눌렀을 때 reload end...
	})

</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

<!-- div container start... -->
	<div class="container">

		<div class="page-header text-info">
			<c:if test="${!empty param.menu && param.menu=='manage'}">
				<h3>상품관리</h3>
			</c:if>
			<c:if test="${!empty param.menu && param.menu=='search'}">
				<h3>상품 목록 조회</h3>
			</c:if>
		</div>
		<div class="row">
		<form class="form-inline">
			<div class="col-md-3 text-left">
				<p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재
					${resultPage.currentPage} 페이지</p>
	
	
<!-- 	

<!-- 					가격조건 정렬 -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">가격조건</h3>
						</div>
						<div class="panel-body">
							<input style="width: 160px" class="form-control inline"
								type="text" id="searchKeyword1" name="searchKeyword1"
								value="${search.searchKeyword1!=0 ? search.searchKeyword1 : '0'}">원
							~ <input style="width: 160px" class="form-control" type="text"
								name="searchKeyword2" id="searchKeyword2"
								value="${search.searchKeyword2!=0 ? search.searchKeyword2 : '0'}">원
						</div>
					</div>


					<button type="button" class="btn btn-warning btn-block">검색</button>
				</div>
				<input type="hidden" id="currentPage" name="currentPage" value="" />
			</form>

			<div class="col-md-9">
			<div class="panel panel-default">
                        <div class="panel-heading">
                            조회 결과
                        </div>
                        <!--panel-body start--->
                        <div class="panel-body">
				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					    
						
                                <div class=" col-md-4">
									<!--thumbnail start--->
                                  <div class="thumbnail">
										<c:if test="${empty product.fileNames && !empty product.fileName}">
											<p><img src="../images/uploadFiles/${product.fileName}" width="200" height="200" /></p>
										 </c:if> 
										 <c:if test="${!empty product.fileNames}">
											<p><img src="../images/uploadFiles/${product.fileNames[0]}" onerror="this.src='http://placehold.it/200x200'" width="200" height="200" /></p>
										 </c:if> 
										 <c:if test="${empty product.fileName}">
											<p><img src="http://placehold.it/200x200" /></p>
										 </c:if>
                                    <div class="caption">
                                      <h3>${product.prodName}</h3>
                                      <p>상품번호: ${product.prodNo}<br>가격:${product.price}<br>
                                      	재고: ${product.stock} &nbsp;&nbsp;&nbsp;&nbsp;판매량: ${product.quantity-product.stock}</p>
                                      <p>
                                      
                                      <c:if test="${param.menu=='manage' && product.proTranCode=='1  ' && product.stock==product.quantity}">
                                      	<a href="/product/getProduct?prodNo=${product.prodNo}&menu=manage" class="btn btn-warning btn-block" role="button"><u>상품 정보 수정</u></a>
                                      </c:if>
                                      <c:if test="${!(param.menu=='manage' && product.proTranCode=='1  ' && product.stock==product.quantity)}">
                                     	 <a href="/product/getProduct?prodNo=${product.prodNo}&menu=search" class="btn btn-warning btn-block" role="button"><u>상세페이지</u></a>
                                     </c:if>
                                      
									 </p>
                                    </div>
                                  </div>
								  <!--thumbnail end--->
                                </div>
				</c:forEach>
						</div>
						<!--panel-body end--->
					</div>
			</div>
		</div>

	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp" />
	<!-- PageNavigation End... -->


	</div>
</body>
</html>