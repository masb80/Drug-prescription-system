<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href ="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
<link href ="<c:url value='/resources/css/style.css'/>" rel="stylesheet" type="text/css">
<link href ="<c:url value='/resources/css/home.css'/>" rel="stylesheet" type="text/css">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	 var drugPosition = 0;
	  $("#getDetails").click(function(){
		  var arogyaId = $("#patientau360Id").val();
		  alert(arogyaId);
	    $.get("./selectPatient.html?arogyaId="+arogyaId+"&",function(data,status){
	      $("#patientDetailsDiv").html(data);
	    });
	  });
	  
	  
	  $("#addDrug").click(function(){
		$("#totalNumber").val(drugPosition);
		alert($("#totalNumber").val());
		var x = '<tr>'+
          '<td><input type="hidden" value="'+$("#drugId").val()+'" id="prescriptionDrugRel'+drugPosition+'.presDrugRelDrugId" name="prescriptionDrugRel['+drugPosition+'].presDrugRelDrugId" "/>'+
          '<input value="'+$("#drugId option:selected").text()+'" id="prescriptionDrugRel'+drugPosition+'.presDrugRelDrugName" name="prescriptionDrugRel['+drugPosition+'].presDrugRelDrugName" class="form-control"/></td>'+
          '<td><input value="'+$("#drugDosage").val()+'" id="prescriptionDrugRel'+drugPosition+'.presDrugRelDosage"  name="prescriptionDrugRel['+drugPosition+'].presDrugRelDosage" class="form-control"/></td>'+
          '<td><input value="'+$("#drugFrequency").val()+'" id="prescriptionDrugRel'+drugPosition+'.presDrugRelFrequency"  name="prescriptionDrugRel['+drugPosition+'].presDrugRelFrequency" class="form-control"/></td>'+
       '</tr>';
       $("#drugDivison_medicines_body").append(x)
       drugPosition++;
		  
	  });
	  
	  
	});

</script>

<title>Doctor Page</title>
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
              </button><
              <a class="navbar-brand" href="#">Aarogya360</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <c:if test="${role=='Doctor'}">	           
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dr.${doctor_details.doctorName } <span class="caret"></span></a>
                        </c:if>
                        <c:if test="${role=='Patient'}">	
                           <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${patient_details.aa360id } <span class="caret"></span></a>
                        </c:if>
                        <c:if test="${role=='Chemist'}">	
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${chemist_details.chemistName } <span class="caret"></span></a>
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
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main " style="margin-top:5px;">
			<!--p>
				<c:forEach items="${drugList}" var="current" varStatus="i">
				</c:forEach>
	   			<a class="button" href="${pageContext.request.contextPath}/indexPrescriptionByDoctorId.html?doctorId=${doctor_details.doctorId}&">Prescriptions</a>
			</p-->
		<div class="row ">
		
		<div class="">
			<div class="col-sm-6 col-sm-offset-3" style="margin-top: 200px;">
				<div id="mainDiv" class="row"  >				
  					<div id="right" class="col-sm-12 form-horizontal box-inner">
	  					<div class="box-content ">
	  						<div class="form-group">
	  							<label for="drugDosage" class="col-sm-3 col-md-4 control-label">Patient Auid</label>
		  							<div class="col-sm-3 col-md-4">
			     				  		<input type="text" id="patientau360Id" name="patientau360Id" class="form-control"/>
			     				  	</div>
			     				  	<div class="col-sm-4 col-md-2">
			     				  	
			       						<input type="button" value="Get Details" id="getDetails" class="btn btn-primary">
			       					</div>
		       				</div>
					   	<div id="patientDetailsDiv">&nbsp;
					          
					    </div>
				   	</div>
  				</div> 	
  			</div>				
				
			</div>	
		  
		    	
			        </div>
		        </div>	   
  		</div>
	</div>
</div>

</body>
</html>