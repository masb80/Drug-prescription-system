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
<script src="<c:url value='/resources/js/logic.js'/>"></script>
<script type="text/javascript">




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
		            <li class="active"><a class="itemLink" href="#"><fmt:message key="navigation.add"/><fmt:message key="prescription.title"/></a></li>
                            <li><a class="button" href="${pageContext.request.contextPath}/indexPrescriptionByDoctorId.html?doctorId=${doctor_details.doctorId}&">View prescriptions</a></li>
                        </c:if>
                        <c:if test="${role=='Patient'}">	
                            <li><a class="button" href="${pageContext.request.contextPath}/indexPrescriptionByPatientId.html?patientId=${patient_details.patientId}&">View prescriptions</a></li>
                        </c:if>
                        <c:if test="${role=='Chemist'}">	
                            <li><a class="button" href="${pageContext.request.contextPath}/successfulChemistLogin.html">New prescriptions</a></li>
                        </c:if>	    
				</ul>
  			</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main box ">
			<!--p>
				<c:forEach items="${drugList}" var="current" varStatus="i">
				</c:forEach>
	   			<a class="button" href="${pageContext.request.contextPath}/indexPrescriptionByDoctorId.html?doctorId=${doctor_details.doctorId}&">Prescriptions</a>
			</p-->
		<div class="row box-inner ">
		<div class="box-header-customized">
			<h2>Add prescription</h2>
		</div>
		<div class="box-content">
			<div class="col-sm-6 ">
				<div id="mainDiv" class="row" >				
  					<div id="right" class="col-sm-12 form-horizontal box-inner">
	  					<div class="box-content ">
	  						<div class="form-group">
	  							<label for="drugDosage" class="col-sm-3 col-md-4 control-label">Patient AUID</label>
		  							<div class="col-sm-3 col-md-4">
			     				  		<input type="text" id="patientau360Id" name="patientau360Id" class="form-control"/>
			     				  	</div>
			     				  	<div class="col-sm-4 col-md-2">
			     				  	
			       						<input type="button" value="Get Details" id="getDetails" class="btn btn-purple">
			       					</div>
		       				</div>
                                                    <div id="patientDetailsDiv" class="hidden">&nbsp;
					          
					    </div>
				   	</div>
  				</div> 	
  			</div>				
				<div id="left" class="row">
					<div class="col-sm-12 box-inner">
					 	<div id="drugDisplay" class="form-horizontal box-content">
					 		<div class="form-group">
					 			<label for="drugId" class="col-sm-4 control-label">Drug Name</label>
								    <div class="col-sm-8">
								      <select id="drugId" class="form-control" > 
								  			<option value="choose">--select--</option>
								 				<c:forEach items="${drugList}" var="current" varStatus="i">
								 					 <option value="${current.drugId}"> ${current.drugName} - ${current.drugType}</option>
												</c:forEach>
										</select>
								    </div>
					 		</div>
					 		<div class="form-group">
					 			<label for="drugDosage" class="col-sm-4 control-label">Drug Dosage</label>
							    <div class="col-sm-8">
							    	<input type="text" id="drugDosage" class="form-control">
							    </div>
					 		</div>
					 		<div class="form-group">
					 			<label for="drugFrequency" class="col-sm-4 control-label">Drug Frequency</label>
							    <div class="col-sm-8">
							    	<input type="text" id="drugFrequency" class="form-control">
							    </div>
					 		</div>
					 		<div class="form-group">
					 			<input type="button" id="addDrug" value="Add Drug" class="btn btn-purple pull-right" style="margin-right:10px;">
					 		</div>						
					    </div>
					</div> 
				</div>  
			</div>			  
		    	<div id="drugDivison" class="col-sm-6">
                            <form action="${pageContext.request.contextPath}/savePrescription.html" method="POST" >
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="box-inner box-content">					        
                                        <input type="hidden" id="totalNumber" name="totalNumber" />
                                        <div id="drugDivison_medicines">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Drug Name</th>
                                                        <th>Drug Dosage</th>
                                                        <th>Drug Frequency</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="drugDivison_medicines_body">

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=row>
                                <div class=col-sm-12>
                                    <input type="submit" value="Generate Prescription" class="btn btn-purple pull-right">
                                </div>
                            </div>   
                            </form>
                        </div>
                    
                             
                   
			        </div>
			        </div>
		        </div>	   
  		</div>
	</div>
</div>
<nav class="navbar navbar-inverse navbar-fixed-bottom">     
</nav>
</body>
</html>