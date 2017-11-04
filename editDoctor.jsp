<%@page language="java" isELIgnored="false" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<html>
<head>
<title>Edit Doctor</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href ="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
<link href ="<c:url value='/resources/css/home.css'/>" rel="stylesheet" type="text/css">
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
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Profile <span class="caret"></span></a>
            	<ul class="dropdown-menu">
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
	            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
	            <li><a class="button" href="${pageContext.request.contextPath}/indexPrescriptionByDoctorId.html?doctorId=${doctor_details.doctorId}&">View prescriptions</a></li>
	          
	          </ul>
	        </div>
	        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<p>
					<c:if test='${doctor.doctorId != null}'>
						<a class="button" href="${pageContext.request.contextPath}/selectDoctor.html?doctorId=${doctor.doctorId}&"><fmt:message key="navigation.back"/></a>
					</c:if>
					<c:if test='${doctor.doctorId == null}'>
						<a class="button" href="${pageContext.request.contextPath}/indexDoctor.html"><fmt:message key="navigation.back"/></a>
					</c:if>
				</p>
				<h2><fmt:message key="doctor.title"/></h2><br/>
				<div class="row">				
					<div class="col-sm-6 form-horizontal">
						
					</div>
					<div class="col-sm-6 form-horizontal">
						
					</div>
				</div>
				<div class="row">
				
				</div>
					<form:form action="${pageContext.request.contextPath}/saveDoctor.html" 
						method="POST" modelAttribute="doctor">
						<table class="table">
							<tr>
								<td class="tdLabel">
									<fmt:message key="doctor.doctorid.title"/>:
								</td>
								<td>
											<form:input id="doctorId" path="doctorId"/>
											<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "doctorId",widgetType : "dijit.form.NumberTextBox",widgetAttrs : {promptMessage: "<fmt:message key="doctor.doctorid.help"/>", constraints : {places:0}}})); </script>
								</td>
							</tr>
							<tr>
								<td class="tdLabel">
									<fmt:message key="doctor.doctorname.title"/>:
								</td>
								<td>
											<form:input id="doctorName" path="doctorName"/>
											<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "doctorName",widgetType : "dijit.form.ValidationTextBox",widgetAttrs : {promptMessage: "<fmt:message key="doctor.doctorname.help"/>"}})); </script>
								</td>
							</tr>
							<tr>
								<td class="tdLabel">
									<fmt:message key="doctor.aa360id.title"/>:
								</td>
								<td>
											<form:input id="aa360id" path="aa360id"/>
											<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "aa360id",widgetType : "dijit.form.ValidationTextBox",widgetAttrs : {promptMessage: "<fmt:message key="doctor.aa360id.help"/>"}})); </script>
								</td>
							</tr>
							<tr>
								<td class="tdLabel">
									<fmt:message key="doctor.phoneno.title"/>:
								</td>
								<td>
											<form:input id="phoneNo" path="phoneNo"/>
											<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "phoneNo",widgetType : "dijit.form.ValidationTextBox",widgetAttrs : {promptMessage: "<fmt:message key="doctor.phoneno.help"/>"}})); </script>
								</td>
							</tr>
							<tr>
								<td class="tdLabel">
									<fmt:message key="doctor.emailid.title"/>:
								</td>
								<td>
											<form:input id="emailId" path="emailId"/>
											<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "emailId",widgetType : "dijit.form.ValidationTextBox",widgetAttrs : {promptMessage: "<fmt:message key="doctor.emailid.help"/>"}})); </script>
								</td>
							</tr>
							<tr>
								<td class="tdLabel">
									<fmt:message key="doctor.password.title"/>:
								</td>
								<td>
											<form:input id="password" path="password"/>
											<script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "password",widgetType : "dijit.form.ValidationTextBox",widgetAttrs : {promptMessage: "<fmt:message key="doctor.password.help"/>"}})); </script>
								</td>
							</tr>
						</table>
						<p>
							<input class="button" id="save" type="submit" value="<fmt:message key="navigation.save"/>"/>
							<script type="text/javascript">Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'save', event:'onclick'}));</script>
						</p>
					</form:form>
				</div>
			</div>
		</div>
</body>
</html>