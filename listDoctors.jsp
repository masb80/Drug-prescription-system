<%@ page language="java" isELIgnored="false" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<html>
<head>
<title>List Doctors</title>
</head>
<body>
<c:if test="${loggedIn == 'failure' }">
  <c:redirect url="/error.jsp"></c:redirect>
</c:if>
<fmt:setBundle basename="resources.eprescription-resources"/>

	<p>
		<a class="button" href="${pageContext.request.contextPath}/newDoctor.html"><fmt:message key="navigation.new"/> <fmt:message key="doctor.title"/></a>
	</p>
	
	<table id="doctorTable">
		<thead>
		<tr>
			<th><fmt:message key="doctor.doctorid.title"/></th>
			<th><fmt:message key="doctor.doctorname.title"/></th>
			<th><fmt:message key="doctor.aa360id.title"/></th>
			<th><fmt:message key="doctor.phoneno.title"/></th>
			<th><fmt:message key="doctor.emailid.title"/></th>
			<th><fmt:message key="doctor.password.title"/></th>
		</tr>
		</thead>
		<tbody>
	<c:forEach items="${doctors}" var="current" varStatus="i">
		<c:choose>
			<c:when test="${(i.count) % 2 == 0}">
		    	<c:set var="rowclass" value="tableRow1"/>
			</c:when>
			<c:otherwise>
		    	<c:set var="rowclass" value="tableRow2"/>
			</c:otherwise>
		</c:choose>			
		<tr class="${rowclass}">
			<td>
				<a href="${pageContext.request.contextPath}/selectDoctor.html?doctorId=${current.doctorId}&">${current.doctorId}</a>
			</td>
			<td>
						
								${current.doctorName}
						
			</td>
			<td>
						
								${current.aa360id}
						
			</td>
			<td>
						
								${current.phoneNo}
						
			</td>
			<td>
						
								${current.emailId}
						
			</td>
			<td>
						
								${current.password}
						
			</td>
		</tr>
	</c:forEach>
		</tbody>
	</table>
</body>
</html>