<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// �α��ν� Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   -->
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
		
		//============= ȸ�������� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('ȸ������')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= �α��� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('�� �� ��')").on("click" , function() {
				self.location = "/user/login"
			});
		});
		
	</script>	
	<!-- īī���� �α��� -->
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
	                 <li><a href="#">ȸ������</a></li>
	                 <li><a href="#">�� �� ��</a></li>
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->
   	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		
		<!-- �ٴܷ��̾ƿ�  Start /////////////////////////////////////-->
		<div class="row">
	
			<!--  Menu ���� Start /////////////////////////////////////-->     	
			<div class="col-md-3">
		        
		       	<!--  ȸ������ ��Ͽ� ���� -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> ȸ������
         			</div>
         			<!--  ȸ������ ������ -->
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">����������ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">ȸ��������ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> �ǸŻ�ǰ����
         			</div>
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">�ǸŻ�ǰ���</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">�ǸŻ�ǰ����</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-shopping-cart"></i> �����Խ���
	    			</div>
					<ul class="list-group">
						 <li class="list-group-item"><a href="#">HOT�Խ���</a></li>
						  <li class="list-group-item">
						  	<a href="#">BEST�Խ���</a> <i class="glyphicon glyphicon-ban-circle"></i>
						  </li>
						 <li class="list-group-item">
						 	<a href="#">���� �� ��</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
				</div>
				
			</div>
			<!--  Menu ���� end /////////////////////////////////////-->   

	 	 	<!--  Main start /////////////////////////////////////-->   		
	 	 	<div class="col-md-9">
				<div class="jumbotron">
			  		<h1>amazon</h1>
			  		<p>�α��� �� ��밡��...</p>
			  		<p>ȸ�������� �̿밡���մϴ�.</p>
			  		<p>ȸ���������ּ���</p>
			  		
<!-- 			  		//facevbook -->



<!-- facebook end -->
	

			  		<div class="text-center">
			  			<a class="btn btn-info btn-lg" href="#" role="button">ȸ������</a>
			  			<a class="btn btn-info btn-lg" href="#" role="button">�� �� ��</a>
			  			<a id="kakao-login-btn"></a>
						<script type='text/javascript'>
						  //<![CDATA[
						    // ����� ���� JavaScript Ű�� ������ �ּ���.
// 						        Kakao.init('8b2d26ebbec91d10d4351ba7c7de8284');
						        Kakao.init('be66e2ae299d83ab01eb06371adaf23f'); 
						        // īī�� �α��� ��ư�� �����մϴ�.
						        Kakao.Auth.createLoginButton({
						          container: '#kakao-login-btn',
						          success: function(authObj) {
						            // �α��� ������, API�� ȣ���մϴ�.
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
																alert("īī���� �����ǵ��� Model2MVCShop������ ȸ�������� �� �ּ���~")
												               	//console.log($('form').html())
												               	$('form').attr("action", "/user/addUserForKakao").attr("method", "POST").submit();
															}else if(JSONData.message!="ok"){
																alert("īī�� �������� �α����մϴ�.")
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
		<!-- �ٴܷ��̾ƿ�  end /////////////////////////////////////-->
		
	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>