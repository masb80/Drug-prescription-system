<%@page language="java" isELIgnored="false" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<title>View Patient</title>
</head>
<body>
<fmt:setBundle basename="resources.eprescription-resources"/>

<table class="table table-bordered ">        
                                <tr class="hidden">
                                    <td class="active col-md-4 col-xs-4"><label><fmt:message key="patient.patientid.title"/></label></td>
                                    <td id="patient_id">${patient.patientId}</td> 
                                </tr>
                                <tr>
                                    <td class="active"> <label><fmt:message key="patient.patientname.title"/></label></td>
                                    <td>${patient.patientName}</td>
                                </tr>
                                <tr>
                                    <td class="active"><label><fmt:message key="patient.aa360id.title"/></label></td>
                                    <td>${patient.aa360id}</td>
                                </tr>
                                <tr>
                                    <td class="active"><label><fmt:message key="patient.phoneno.title"/></label></td>
                                    <td>${patient.phoneNo}</td> 
                                </tr>
                                <tr>
                                    <td class="active"><label><fmt:message key="patient.emailid.title"/></label></td>
                                    <td>${patient.emailId}</td>
                                </tr>
                                <tr class="hidden">
                                    <td class="active"> <label><fmt:message key="patient.password.title"/></label> </td>
                                    <td>${patient.password}</td>
                                </tr>                               
                            </table>
	
</body>
</html>