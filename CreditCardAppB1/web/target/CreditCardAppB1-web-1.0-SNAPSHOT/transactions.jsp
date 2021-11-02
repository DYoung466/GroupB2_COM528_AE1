<%-- 
    Document   : transactions
    Created on : 2 Nov 2021, 13:24:44
    Author     : Ben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setAttribute("selectedPage","transactions");
%>
<jsp:include page="header.jsp" />
<!-- Begin page content -->
<main role="main" class="container">
    <H1>Transactions</H1>
    <div class="container">         
        <table class="table">
            <thead>
                <tr>
                    <th>Time</th>
                    <th>Transaction ID</th>
                    <th>From Account</th>
                    <th>To Account</th>
                    <th>Amount(£)</th>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
    </div>

</main>




<jsp:include page="footer.jsp" />