<%@page language="java" isELIgnored="false" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<fmt:setBundle basename="resources.eprescription-resources"/>
<div id="navItem"><img src="${pageContext.request.contextPath}/images/navTop.jpg" /><div id="navItemContent">
		<h3><fmt:message key="doctor.title"/></h3>
		<ul>
			<li><a class="itemLink" href="${pageContext.request.contextPath}/indexDoctor.html"><fmt:message key="navigation.list"/></a></li>
			<li><a class="itemLink" href="${pageContext.request.contextPath}/newDoctor.html"><fmt:message key="navigation.add"/> <fmt:message key="navigation.new"/></a></li>
		</ul>
	</div><img src="${pageContext.request.contextPath}/images/navBottom.jpg" /></div>