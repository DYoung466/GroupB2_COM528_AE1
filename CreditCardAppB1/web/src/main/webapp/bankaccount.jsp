<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setAttribute("selectedPage","bankaccount");
%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<jsp:include page="header.jsp" />
<!-- Begin page content -->
<main role="main" class="container">
    <H1>Accounts</H1>
    <form action="./accountview.jsp">
        <label for="first">First Name:</label>
        <input type="text" id="first" name="first">
        <label for="last">Last Name:</label>
        <input type="text" id="last" name="last">
        <input type="submit" value ="Create Account">
    </form>
    
    <div class="container">         
        <table class="table">
            <thead>
                <tr>
                    <th>Sort Code</th>
                    <th>Account Number</th>
                    <th>Card Number</th>
                    <th>Owner</th>
                    <th>Balance(£)</th>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>John</td>
                    <td>Doe</td>
                    <td>john@example.com</td>
                    <td>fdsfdsfdsa</td>
                    <td>fdsfdsfdsa</td>
                    <td>
                        <form action="./accountview.jsp">
                            <input type="submit" value="View Account">
                        </form>
                        
                        <form action="./home.jsp">
                            <input type="submit" value="Send Money">
                            <input type="submit" value="Recieve Money">
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>John</td>
                    <td>Doe</td>
                    <td>john@example.com</td>
                    <td>fdsfdsfdsa</td>
                    <td>fdsfdsfdsa</td>
                    <td>
                    <form action="./accountview.jsp">
                            <input type="submit" value="View Account">
                        </form>
                        
                        <form action="./home.jsp">
                            <input type="submit" value="Send Money">
                            <input type="submit" value="Recieve Money">
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>John</td>
                    <td>Doe</td>
                    <td>john@example.com</td>
                    <td>fdsfdsfdsa</td>
                    <td>fdsfdsfdsa</td>
                    <td>
                        <form action="./accountview.jsp">
                            <input type="submit" value="View Account">
                        </form>
                        
                        <form action="./home.jsp">
                            <input type="submit" value="Send Money">
                            <input type="submit" value="Recieve Money">
                        </form>
                    </td>
                </tr>
          </tbody>
        </table>
    </div>
    
</main>




<jsp:include page="footer.jsp" />
