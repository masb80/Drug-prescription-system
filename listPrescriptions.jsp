<%@page import="com.eprescription.aarogya.service.PrescriptionServiceImpl"%>
<%@ page language="java" isELIgnored="false" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>List Prescriptions</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href ="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
<link href ="//cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet" type="text/css">
<link href ="<c:url value='/resources/css/style.css'/>" rel="stylesheet" type="text/css">
<link href ="<c:url value='/resources/css/home.css'/>" rel="stylesheet" type="text/css">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="//cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
<script src="//cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.js"></script>
<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#prescriptionListTable').DataTable();
} );

</script>


</head>
<body>
<c:if test="${loggedIn == 'failure'  }">
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
                <img alt="Aarogya360" src="<c:url value='/resources/images/a360logo2.png'/>" style="width: 50px; float: left;" alt="Aarogya 360" >
              <a class="navbar-brand" href="#">Aarogya360</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <c:if test="${role=='Doctor'}">	           
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dr.${doctor_details.doctorName } <span class="caret"></span></a>
                        </c:if>
                        <c:if test="${role=='Patient'}">	
                           <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${patient_details.patientName } <span class="caret"></span></a>
                        </c:if>
                        <c:if test="${role=='Chemist'}">	
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Name <span class="caret"></span></a>
                        </c:if>	               	
                        <ul class="dropdown-menu">            		
                            <li><a href="${pageContext.request.contextPath}/Login.html">Logout</a></li>                               
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
                    <c:if test="${role=='Doctor'}">	           
                        <li><a class="itemLink" href="${pageContext.request.contextPath}/doctorLogin.html"><fmt:message key="navigation.add"/><fmt:message key="prescription.title"/></a></li>
                        <li class="active"><a class="button" href="${pageContext.request.contextPath}/indexPrescriptionByDoctorId.html?doctorId=${doctor_details.doctorId}&">View prescriptions</a></li>
                    </c:if>
                    <c:if test="${role=='Patient'}">	
                        <li  class="active"><a class="button" href="${pageContext.request.contextPath}/indexPrescriptionByPatientId.html?patientId=${patient_details.patientId}&">View prescriptions</a></li>
                    </c:if>
                    <c:if test="${role=='Chemist'}">	
                        <li  class="active"><a class="button" href="${pageContext.request.contextPath}/successfulChemistLogin.html">Get Prescriptions</a></li>
                    </c:if>	    
                </ul>
            </div>	
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main box-inner-customized">
                <div class=" box-inner">
                    <div class="box-header-customized">
                        <h2>Prescription</h2>
                    </div>
                    <div class="box-content">
                        <table id="prescriptionListTable" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th><fmt:message key="prescription.prescriptionid.title"/></th>
                                    <th><fmt:message key="prescription.upn.title"/></th>
                                    <c:if test="${role != 'Patient' }">
                                    <th><fmt:message key="prescription.patientname.title"/></th>
                                    </c:if>
                                    <c:if test="${role != 'Doctor' }">
                                    <th><fmt:message key="prescription.doctorname.title"/></th>
                                    </c:if>
                                    <th><fmt:message key="prescription.status.title"/></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${prescriptions}" var="current" varStatus="i">
                                    <c:choose>
                                            <c:when test="${(i.count) % 2 == 0}">
                                            <c:set var="rowclass" value="tableRow1"/>
                                            </c:when>
                                            <c:otherwise>
                                            <c:set var="rowclass" value="tableRow2"/>
                                            </c:otherwise>
                                    </c:choose>			
                                        <tr class="${rowclass}">																		<td>								
                                            <a href="${pageContext.request.contextPath}/selectPrescription.html?prescriptionId=${current.prescriptionId}&">${current.prescriptionId}</a>
                                            </td>									
                                            <td>
                                                <a href="${pageContext.request.contextPath}/indexPrescriptionDrugRel.html?upnNumber=${current.upn}&">${current.upn}</a>		
                                            </td>
                                            <c:if test="${role != 'Patient' }">
                                            <td>						
                                                <!--  ${current.patientId}	-->
                                                 <c:set var="patId" value="${current.patientId}"></c:set>
                                                 <%  if (PrescriptionServiceImpl.patientDetailsMap != null){ %>
                                                <%= PrescriptionServiceImpl.patientDetailsMap.get(pageContext.getAttribute("patId"))  %>	
                                                <% } %>
                                            </td>
                                            </c:if>
                                            <c:if test="${role != 'Doctor' }">
                                            <td>					
                                               <!--  ${current.doctorId}	--> 	
                                                <c:set var="docId" value="${current.doctorId}"></c:set>
                                                 <%  if (PrescriptionServiceImpl.doctorDetailsMap != null){ %>
                                                <%= PrescriptionServiceImpl.doctorDetailsMap.get(pageContext.getAttribute("docId"))  %>	
                                                    <% } %>
                                            </td>
                                            </c:if>
                                            <td>						
                                                ${current.status}
                                                			
                                            </td>
                                        </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-inverse navbar-fixed-bottom">     
    </nav>                                                      
</body>
</html>