<%-- 
    Document   : content
    Created on : Jan 4, 2020, 11:19:47 AM
    Author     : cgallen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setAttribute("selectedPage","home");
%>
<jsp:include page="header.jsp" />
<!-- Begin page content -->
<main role="main" class="container">
    <H1>Home</H1>
    <H1>Transfer Money Between Accounts</h1>
    
    <form>
        <input type="submit" value="Submit Transaction">
    </form>
</main>




<jsp:include page="footer.jsp" />
