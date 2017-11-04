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
<link href ="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
<link href ="<c:url value='/resources/css/home.css'/>" rel="stylesheet" type="text/css">
<link href ="<c:url value='/resources/css/style.css'/>" rel="stylesheet" type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
<script src="<c:url value='/resources/js/logic.js'/>"></script>
</head>
<c:if test="${loggedIn == 'failure' }">
  <c:redirect url="/error.jsp"></c:redirect>
</c:if>
<body style="background-color: #E3F5ED">
<fmt:setBundle basename="resources.eprescription-resources"/>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
          <img alt="Aarogya360" src="<c:url value='/resources/images/a360logo2.png'/>" style="width: 50px; float: left;" alt="Aarogya 360" >
        <a class="navbar-brand" href="#">Aarogya360</a>
      </div>
      <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> ${chemist_details.pharmacyStaffName }<span class="caret"></span></a>
              <ul class="dropdown-menu">   		
                      <li><a href="${pageContext.request.contextPath}/Login.html">Logout</a></li>                               
              </ul>
          </li>
          <li><a href="#">Help</a></li>
        </ul>
      </div>
    </div>
</nav>
<div class="container">      
    <div class="col-md-5 well center" style="margin-top: 120px;min-height: 250px;">       
        <h2 class="form-signin-heading " style="font-size: 20px;margin-bottom: 30px;">Patient prescription detials</h2>
            <form:form  action="${pageContext.request.contextPath}/prescriptionDetails.html" id="chemistGetPatientDetial">
                <div class="form-group">
                <label for="au360id" class="sr-only"><fmt:message key="login.au360id.title"/></label>
                <input name="au360id" type="text" id="au360id" class="form-control" placeholder="<fmt:message key="login.au360id.title"/>" >
                </div>
                <div class="form-group">
                <label for="upn" class="sr-only"><fmt:message key="login.upn.title"/></label>
                <input name="upn" type="text" id="upn" class="form-control" placeholder="<fmt:message key="login.upn.title"/>" >       
                <div class="form-group">
                    <div class="form-group">
                        <button class="btn btn-lg btn-purple btn-block" style="margin-top: 10px;" id="getPrescription" type="submit" value="Get Prescription">Get Prescription</button>
                    </div>
                    </form:form>
    </div>
    <div  style="color: red"> 
                    <% if ((String)request.getParameter("message") != null ){%>
                             <%= request.getParameter("message") %>
                    <%}%> 
    </div>
</div>
    </div>
</div>
    <nav class="navbar navbar-inverse navbar-fixed-bottom">     
</nav>
</body>
</html>
