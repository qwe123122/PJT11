<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style></style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원원가입 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('회원가입')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= 로그인 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('로 그 인')").on("click" , function() {
				self.location = "/user/login"
			});
		});
		
	</script>	
	<!-- 카카오톡 로그인 -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#">amazon</a>
			
			<!-- toolBar Button Start //////////////////////// -->
			<div class="navbar-header">
			    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
			<!-- toolBar Button End //////////////////////// -->
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#">회원가입</a></li>
	                 <li><a href="#">로 그 인</a></li>
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->
   	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		<!-- 다단레이아웃  Start /////////////////////////////////////-->
		<div class="row">
	
			<!--  Menu 구성 Start /////////////////////////////////////-->     	
			<div class="col-md-3">
		        
		       	<!--  회원관리 목록에 제목 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> 회원관리
         			</div>
         			<!--  회원관리 아이템 -->
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">개인정보조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">회원정보조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> 판매상품관리
         			</div>
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">판매상품등록</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">판매상품관리</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-shopping-cart"></i> 자유게시판
	    			</div>
					<ul class="list-group">
						 <li class="list-group-item"><a href="#">HOT게시판</a></li>
						  <li class="list-group-item">
						  	<a href="#">BEST게시판</a> <i class="glyphicon glyphicon-ban-circle"></i>
						  </li>
						 <li class="list-group-item">
						 	<a href="#">내가 쓴 글</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
				</div>
				
			</div>
			<!--  Menu 구성 end /////////////////////////////////////-->   

	 	 	<!--  Main start /////////////////////////////////////-->   		
	 	 	<div class="col-md-9">
				<div class="jumbotron">
			  		<h1>amazon</h1>
			  		<p>로그인 후 사용가능...</p>
			  		<p>회원가입후 이용가능합니다.</p>
			  		<p>회원가입해주세요</p>
			  		
<!-- 			  		//facevbook -->



<!-- facebook end -->
	

			  		<div class="text-center">
			  			<a class="btn btn-info btn-lg" href="#" role="button">회원가입</a>
			  			<a class="btn btn-info btn-lg" href="#" role="button">로 그 인</a>
			  			<a id="kakao-login-btn"></a>
						<script type='text/javascript'>
						  //<![CDATA[
						    // 사용할 앱의 JavaScript 키를 설정해 주세요.
// 						        Kakao.init('8b2d26ebbec91d10d4351ba7c7de8284');
						        Kakao.init('be66e2ae299d83ab01eb06371adaf23f'); 
						        // 카카오 로그인 버튼을 생성합니다.
						        Kakao.Auth.createLoginButton({
						          container: '#kakao-login-btn',
						          success: function(authObj) {
						            // 로그인 성공시, API를 호출합니다.
						            Kakao.API.request({
						              url: '/v2/user/me',
						              success: function(res) {
						            	
						            	alert(JSON.stringify(res))
						            	var userId = res.id;
										//	console.log(userId)
										 	$.ajax( 
													{
														url : "/user/json/checkKakao/"+userId,
														method : "POST" ,
														dataType : "json" ,
														headers : {
															"Accept" : "application/json",
															"Content-Type" : "application/json"
														},
														success : function(JSONData , status) {
					
															//Debug...
															//alert(status);
															//alert("JSONData : \n"+JSONData);
															//alert( "JSON.stringify(JSONData) : \n"+JSON.stringify(JSONData) );
															//alert( JSONData != null );
															$('#kakaoId').val(res.id);
												                //alert(res.id);
											                $('#nickname').val(res.properties.nickname)
											                $('#profileImage').val(res.properties.profile_image)
											               	$('#thumbnailImage').val(res.properties.thumbnail_image)
											               	
															if(JSONData.message=="ok"){
																alert("카카오와 연동되도록 Model2MVCShop에서도 회원가입을 해 주세요~")
												               	//console.log($('form').html())
												               	$('form').attr("action", "/user/addUserForKakao").attr("method", "POST").submit();
															}else if(JSONData.message!="ok"){
																alert("카카오 계정으로 로그인합니다.")
																$('form').attr("action", "/user/login").attr("method", "POST").submit();
															}
														}
												});
										
						            	//console.log("_"+res.id+"_");
						                //alert(JSON.stringify(res));
						                
						              },
						              fail: function(error) {
						                alert(JSON.stringify(error));
						              }
						            });
						          },
						          fail: function(err) {
						            alert(JSON.stringify(err));
						          }
						        });
						
						  //]]>
						</script>
						<form>
							<input type="hidden" id="kakaoId" name="kakaoId" value=""/>
							<input type="hidden" id="nickname" name="nickname" value=""/>
							<input type="hidden" id="profileImage" name="profileImage" value=""/>
							<input type="hidden" id="thumbnailImage" name="thumbnailImage" value=""/>
						</form>
			  		</div>
			  		
			  	
			  	</div>
	        </div>
	   	 	<!--  Main end /////////////////////////////////////-->   		
	 	 	
		</div>
		<!-- 다단레이아웃  end /////////////////////////////////////-->
		
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>