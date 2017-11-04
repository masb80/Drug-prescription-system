<%@page language="java" isELIgnored="false" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<html>
<head>
<title> Login</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<META Http-Equiv="Expires" Content="-1">
<link href ="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
<link href ="<c:url value='/resources/css/style.css'/>" rel="stylesheet" type="text/css">
</head>

<body>
<fmt:setBundle basename="resources.eprescription-resources"/>
<div class="container-fluid">
	<div class="row">
		<div class="col-xs-4 col-md-4 center login-box">
			<!--  --p>
			<c:if test='${login.au360Id != null}'>
				<a class="button" href="${pageContext.request.contextPath}/selectLogin.html?au360id=${login.au360Id}&"><fmt:message key="navigation.back"/></a>
			</c:if>
			<c:if test='${login.au360Id == null}'>
				<a class="button" href="${pageContext.request.contextPath}/indexLogin.html"><fmt:message key="navigation.back"/></a>
			</c:if>
			</p-->
	        <div class="row">
	            <div class="col-md-12 logincol-padding" >
	               <div class="login-header" style="padding:5px;">
		            	<h1 style="margin-top:0;"><fmt:message key="login.title"/></h2>
	                </div> 
	            </div>
	        </div> 
	        <div class="row login-inner-box ">
            	<div class="col-xs-10 col-md-10 center logincol-margin form-horizontal">
              		<form:form action="${pageContext.request.contextPath}/verifyLogin.html"  method="POST" modelAttribute ="login"> 
              		<div class=form-horizontal>   
                    	<div class="form-group">
                    		                       
                        		<input name="au360Id" class="form-control" id="au360id" placeholder="<fmt:message key="login.au360id.title"/>"/>
                    	</div>
                    	<div class="clearfix"></div>
                    	<div class="form-group">  
                    	
                        	<input name="password" id="password" class="form-control" type="password" placeholder="<fmt:message key="login.password.title"/>"/>
                    	</div>
                     	<div class="form-group">  
                    		<label><fmt:message key="login.role.title"/></label> 
                        		<form:select path="role" cssClass="form-control">
						          <form:option value="doctor">Doctor</form:option>
						          <form:option value="Patient">Patient</form:option>
						          <form:option value="Chemist">Chemist</form:option>
						      </form:select>
                    	</div>                
	                    <div class="form-group" style="color:red">
	                    	                           
	                        	<% if ((String)request.getParameter("message") != null ){%>
	 								<%= request.getParameter("message") %>
	 							<%}%>                                
	                    	                  
	                    </div>                  
	                   <div class="form-group logincol-padding"> 
	                        <button type="submit" Class="btn btn-purple btn-block pull-right" id="save" >Login</button>                      
	                    </div>	                    
	                    </div> 
                 	</form:form>                                                 
            	</div>
        	</div> 			
		</div>
	</div>
</div>

</body>

</html>