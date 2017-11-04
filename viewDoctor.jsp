<%@page language="java" isELIgnored="false" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<html>
<head>
<title>View Doctor</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href ="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
<link href ="<c:url value='/resources/css/home.css'/>" rel="stylesheet" type="text/css">
<link href ="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
</head>
<body>
<c:if test="${loggedIn == 'failure' }">
  <c:redirect url="/error.jsp"></c:redirect>
</c:if>
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
          <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dr.${doctor.doctorName} <span class="caret"></span></a>
            	<ul class="dropdown-menu">
            		<li><a href="#">View profile</a></li>  
                	<li><a href="#">Logout</a></li>                               
              	</ul>
            </li>
            <li><a href="#">Help</a></li>
          </ul>
        </div>
      </div>
 </nav>
 <div class="container-fluid">
	<div class=row>
		<div class="col-sm-3 col-md-2 sidebar">
          	<ul class="nav nav-sidebar">	           
	            <li class="active"><a class="itemLink" href="#"><fmt:message key="navigation.add"/><fmt:message key="prescription.title"/></a></li>
				<li><a class="button" href="${pageContext.request.contextPath}/indexPrescriptionByDoctorId.html?doctorId=${doctor_details.doctorId}&">View prescriptions</a></li>
				<li><a class="itemLink" href="${pageContext.request.contextPath}/indexDoctor.html"><fmt:message key="navigation.list"/></a></li>				
			</ul>
  		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<!-- conditon has to be handled -->
			<p>
				<a class="button" href="${pageContext.request.contextPath}/indexDoctor.html"><fmt:message key="navigation.back"/></a>
			</p>
			
				<h2><fmt:message key="doctor.title"/></h2><br/>
			
			<div class="row">
                        <div class="col-xs-12 col-md-12 profile box-inner box-content">
                              <table class="table table-bordered ">        
                                <tr>
                                    <td class="active col-md-4 col-xs-4"><label><fmt:message key="doctor.doctorid.title"/></label></td>
                                    <td>${doctor.doctorId}</td> 
                                </tr>
                                <tr>
                                    <td class="active"> <label><fmt:message key="doctor.doctorname.title"/></label></td>
                                    <td>${doctor.doctorName}</td>
                                </tr>
                                <tr>
                                    <td class="active"><label><fmt:message key="doctor.aa360id.title"/></label></td>
                                    <td>${doctor.aa360id}</td>
                                </tr>
                                <tr>
                                    <td class="active"><label><fmt:message key="doctor.phoneno.title"/></label></td>
                                    <td>${doctor.phoneNo}</td> 
                                </tr>
                                <tr>
                                    <td class="active"><label><fmt:message key="doctor.emailid.title"/></label></td>
                                    <td>${doctor.emailId}</td>
                                </tr>
                                <tr>
                                    <td class="active"> <label><fmt:message key="doctor.password.title"/></label> </td>
                                    <td>${doctor.password}</td>
                                </tr>                               
                            </table>
                        </div>
                    </div>				
				</div>
				</div>
				</div>
</body>
</html>