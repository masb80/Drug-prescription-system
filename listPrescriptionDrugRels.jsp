<%@ page language="java" isELIgnored="false" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>List PrescriptionDrugRels</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href ="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
<link href ="//cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.css" type="text/css">
<link href ="<c:url value='/resources/css/home.css'/>" rel="stylesheet" type="text/css">
<link href ="<c:url value='/resources/css/style.css'/>" rel="stylesheet" type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
<script src="<c:url value='/resources/js/logic.js'/>"></script>


<title>List Prescription DrugRels</title>

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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${chemist_details.pharmacyStaffName }<span class="caret"></span></a>
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
                        <li><a class="button" href="${pageContext.request.contextPath}/indexPrescriptionByDoctorId.html?doctorId=${doctor_details.doctorId}&">View prescriptions</a></li>
                    </c:if>
                    <c:if test="${role=='Patient'}">	
                        <li class="active"><a class="button" href="${pageContext.request.contextPath}/indexPrescriptionByPatientId.html?patientId=${patient_details.patientId}&">View prescriptions</a></li>
                    </c:if>
                    <c:if test="${role=='Chemist'}">	
                        <li class=""><a class="button" href="${pageContext.request.contextPath}/successfulChemistLogin.html">New prescriptions</a></li>
                        <li class="active"><a class="button" href="${pageContext.request.contextPath}/successfulChemistLogin.html">View prescriptions</a></li>
                    </c:if>	    
                </ul>
            </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main box">
                <div class="box-inner">
                    <div class="box-header-customized">
                        <h2>Prescription Drug</h2>
                    </div>
                    <div class="box-content">
                        <table id="prescriptiondrugrelTable"  class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th class="hidden"><fmt:message key="prescriptiondrugrel.presdrugrelid.title"/></th>
                                    <th><fmt:message key="prescriptiondrugrel.presdrugrelupn.title"/></th>
                                    <th><fmt:message key="prescriptiondrugrel.presdrugreldrugid.title"/></th>
                                    <th><fmt:message key="prescriptiondrugrel.presdrugreldosage.title"/></th>
                                    <th><fmt:message key="prescriptiondrugrel.presdrugrelfrequency.title"/></th>
                                    <th><fmt:message key="prescriptiondrugrel.presdrugrelstatus.title"/></th>
                                    <c:if test="${current.status == 'To Deliver' && role == 'Chemist'}" >
                                    <th>&nbsp;</th>
                                    </c:if>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${prescriptiondrugrels}" var="current" varStatus="i">
                                <c:choose>
                                    <c:when test="${(i.count) % 2 == 0}">
                                    <c:set var="rowclass" value="tableRow1"/>
                                    </c:when>
                                    <c:otherwise>
                                    <c:set var="rowclass" value="tableRow2"/>
                                    </c:otherwise>
                                </c:choose>			
                                <tr class="${rowclass}">
                                    <td class="hidden">
                                        <a href="${pageContext.request.contextPath}/selectPrescriptionDrugRel.html?presDrugRelId=${current.presDrugRelId}&">${current.presDrugRelId}</a>
                                    </td>
                                    <td>								
                                        ${current.upn}
                                        <input type="hidden" id="upn" value="${current.upn}">									
                                    </td>
                                    <td>									
                                        ${current.drugName}									
                                    </td>
                                    <td>									
                                        ${current.dosage}									
                                    </td>
                                    <td>									
                                        ${current.frequency}									
                                    </td>
                                    <td>									
                                        ${current.status}									
                                    </td>
                                    <c:if test="${current.status == 'To Deliver' && role == 'Chemist'}" >
                                        <td>							
                                            <input type="checkbox" id="${current.presDrugRelId}"  
                                            value="${current.presDrugRelId}" onclick="updateRelValues(this)" />																									
                                        </td>
                                    </c:if>	
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <c:if test="${role == 'Chemist'}" >
                        <form action="./prescriptionStatusChange.html">
                            <input type="hidden" id="drugPresId" name="drugPresId"> 
                            <input type="hidden" id="upnNumber" name="upnNumber" value="${upnNumber}">
                            <input type="hidden" id="auid" name="auid" value="${auid}">  
                            <input type="submit" id="idValues"  class="btn btn-purple pull-right"  style=" margin-right:10px;margin-bottom:10px;" value="Deliver">				
                        </form>
                    </c:if>                                             
                </div>                              
            </div>
        </div>
    </div>
    <nav class="navbar navbar-inverse navbar-fixed-bottom">     
    </nav> 
</body>
<script>
var IdValuesArray = [];

$("#idValues").hide();

function updateRelValues(oCheckBox){
    
var checkBocValue = oCheckBox.value;

if (oCheckBox.checked == true){
	IdValuesArray.push(checkBocValue);
}else{
	for(var i = IdValuesArray.length - 1; i >= 0; i--) {
	    if(IdValuesArray[i] == checkBocValue) {
	    	IdValuesArray.splice(i, 1);
	    }
	}
}
if (IdValuesArray.length > 0){
	$("#idValues").show();
}else{
	$("#idValues").hide();
}
$("#drugPresId").val(IdValuesArray);
}





</script>
</html>

