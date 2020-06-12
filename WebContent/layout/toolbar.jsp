<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- ToolBar Start /////////////////////////////////////-->
	<head>  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<div class="navbar  navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">amazon</a>
		
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
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  ȸ������ DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >ȸ������</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">����������ȸ</a></li>
	                         
	                         <c:if test="${sessionScope.user.role == 'admin'}">
	                         	<li><a href="#">ȸ��������ȸ</a></li>
	                         </c:if>
	                         
	                         <li class="divider"></li>
	                         <li><a href="#">etc...</a></li>
	                     </ul>
	                 </li>
	                 
	              <!-- �ǸŻ�ǰ���� DrowDown  -->
	               <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >�ǸŻ�ǰ����</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">�ǸŻ�ǰ���</a></li>
		                         <li><a href="#">�ǸŻ�ǰ����</a></li>
		                         <li class="divider"></li>
		                         <li><a href="#">���Ÿ����ȸ</a></li>
		                     </ul>
		                </li>
	                 </c:if>
	                 
	              <!-- ���Ű��� DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >��ǰ����</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">�� ǰ �� ��</a></li>
	                         
	                         <c:if test="${sessionScope.user.role == 'user'}">
	                           <li><a href="#">�����̷���ȸ</a></li>
	                         </c:if>
	                         
	                         <li><a href="#">�ֱٺ���ǰ</a></li>
	                         <li class="divider"></li>
	                         <li><a href="#">etc..</a></li>
	                     </ul>
	                 </li>
	                 
<!-- <!-- 	                 <li><a href="#">��������ϱ�</a></li> --> 
<!-- 	                 <li><a href="#"></a></li> -->
	             </ul>
	             
	             <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">�α׾ƿ�</a></li>
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
<!-- history dialog start....-->
	<div id="dialog" title="�ֱ� �� ��ǰ">
  <p>
  <%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String history = null;
	Cookie[] cookies = request.getCookies();
	if (cookies!=null && cookies.length > 0) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			if (cookie.getName().equals("history")) {
				history = cookie.getValue();
			}
		}
		if (history != null) {
			String[] h = history.split(",");
			for (int i = 0; i < h.length; i++) {
				if (!h[i].equals("null")) {
%>
<a href="/product/getProduct?prodNo=<%=h[i]%>&menu=search"
	><%=h[i]%></a>
<br>
<%
				}
			}
		}
	}
%>
  
  </p>
</div> 	
<!-- history dialog end....-->
<!-- coupon dialog start... -->
<div id="coupon" title="">
<!-- <div id="coupon" title="��������ϱ�"> -->

<!-- coupon dialog start... -->
<p>
<!-- 	���� ��ȣ�� �Է��ϼ���. -->
<!-- <br> -->
<!-- <br> -->
<%-- <c:if test="${user.coupon!=null && user.coupon.discountCoupon10=='1' }"> --%>
<!-- <h5>������ �߱޵Ǿ����ϴ�.<br> �ߺ� �߱޵��� �ʽ��ϴ�.<br><br></h5> -->
<%-- </c:if> --%>
<%-- <c:if test="${user.coupon==null}"> --%>
<!-- <h5>��ϵ� ������ �����ϴ�.<br> ���� ��ȣ�� �Է����ּ���.<br><br></h5> -->
<!-- <input type="text" name="couponId"> -->
<%-- </c:if> --%>
<%-- <c:if test="${user.coupon!=null && user.coupon.discountCoupon10!='1' }"> --%>
<!-- <h5>�̹� ������ ����ϼ̽��ϴ�.<br> �ߺ� �߱޵��� �ʽ��ϴ�.<br><br></h5> -->
<%-- </c:if> --%>


</p>
</div>
<!-- coupon dialog end... -->
</div>
		<!-- ToolBar End /////////////////////////////////////-->

   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('�α׾ƿ�')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= ȸ��������ȸ Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('ȸ��������ȸ')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  ����������ȸȸ Event  ó�� =============	
	 	$( "a:contains('����������ȸ')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
		//============= �����̷���ȸ Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('�����̷���ȸ')").on("click" , function() {
				$(self.location).attr("href","/purchase/listPurchase");
				//self.location = "/user/logout"
			}); 
		 });
		
			//============= ��۰��� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('���Ÿ����ȸ')").on("click" , function() {
				$(self.location).attr("href","/purchase/listPurchase");
				//self.location = "/user/logout"
			}); 
		 });
		
			//============= �� ǰ �� �� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('�� ǰ �� ��')").on("click" , function() {
				$(self.location).attr("href","/product/listProduct?menu=search");
				//self.location = "/user/logout"
			}); 
		 });
		 
			//============= �ǸŻ�ǰ��� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('�ǸŻ�ǰ���')").on("click" , function() {
				$(self.location).attr("href","/product/addProduct");
				//self.location = "/user/logout"
			}); 
		 });
		 
			//============= �ǸŻ�ǰ���� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('�ǸŻ�ǰ����')").on("click" , function() {
				$(self.location).attr("href","/product/listProduct?menu=manage");
				//self.location = "/user/logout"
			}); 
		 });
			
		
			//============= �ֱٺ���ǰ Event  ó�� =============	
		$(function(){
			$("#dialog").dialog({
				autoOpen:false
			})
		})
		
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('�ֱٺ���ǰ')").on("click" , function() {
		 		$( "#dialog" ).dialog( "open" );
		 		//self.location = "/user/logout"
			}); 
			console.log("����");
		 });
			
		//============= coupon Event  ó�� =============	
 		$(function(){
			$("#coupon").dialog({
				autoOpen:false,
				buttons:{
					"���" : function(){
							console.log($('input[name="couponId"]').val())
							var inputCouponId = $('input[name="couponId"]').val();
							$.ajax({
								url : "/user/json/addCoupon?couponId="+inputCouponId+"",
								method : "GET",
								dataType : "json",
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData, status){
									//alert(status);
									//alert("JSONData : \n"+JSONData.message);
									//alert( "JSON.stringify(JSONData) : \n"+JSON.stringify(JSONData) );
									//alert( JSONData != null );
									if(JSONData.message=="ok"){
										//alert("��� ������ ���̵��Դϴ�.")
										$('h5').html("������ �߱޵Ǿ����ϴ�.<br> �ߺ� �߱޵��� �ʽ��ϴ�.<br><br>");
										$('input').remove()
									}else if(JSONData.message=="no good"){
										$('h5').html("�˸��� ���� ���� ��ȣ�Դϴ�.<br> �ٽ� �Է����ּ���.<br><br>");
									}else if(JSONData.message=="already"){
										$('h5').html("�ٽ� ������ ����Ͻ� �� �����ϴ�.<br> ������ ������Ʈ�Ǹ� �˷��帱�Կ�!<br><br>");
									}
								},
								error : function(jqXHR, textStatus, errorThrown){
									alert("error: "+textStatus)
									alert(jqXHR.status)
									alert(errorThrown)
								}
							})
						}
				}
			})
		})
		
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('')").on("click" , function() {
// 		 		$("a:contains('����')").on("click" , function() {
		 		
		 		$( "#coupon" ).dialog( "open" );
		 		//self.location = "/user/logout"
			}); 
		 }); 
	</script>  