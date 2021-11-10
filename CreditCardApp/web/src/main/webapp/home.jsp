<%-- 
    Document   : home
    Created on : 8 Nov 2021, 15:32:51
    Author     : Ben
--%>



<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.WebObjectFactory"%>
<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.PropertiesDao"%>
<%@page import ="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@page import="org.solent.com504.oodd.bank.client.impl.BankRestClientImpl"%>
<%@page import="org.solent.com504.oodd.bank.model.client.BankRestClient"%>
<%@page import="org.solent.com504.oodd.bank.model.dto.BankTransactionStatus"%>
<%@page import="org.solent.com504.oodd.bank.model.dto.CreditCard"%>
<%@page import="org.solent.com504.oodd.bank.model.dto.TransactionReplyMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    PropertiesDao propertiesDao = WebObjectFactory.getPropertiesDao();
    
    String url = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.url");
    String username = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.username");
    String password = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.password");
    String cardnumber = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cardnumber");
    String cvv = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cvv");
    String expirydate = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.expirydate");
    String name = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.name");
    String message = "";
    
    String action = (String) request.getParameter("action");
    if ("sendmoney".equals(action)) {
        String custcardnumber = request.getParameter("custcardnumber");
        String custcvv = request.getParameter("custcvv");
        String custexpirydate = request.getParameter("custexpirydate");
        String custname = request.getParameter("custname");
        String money = request.getParameter("money");
        

        
        message = "Connecting with bank";
        String bankUrl = "http://localhost:8080/bank/rest";
        CreditCard fromCard = null;
        CreditCard toCard = null;

        String toUsername=null;
        String toPassword=null;
    
        fromCard = new CreditCard();
        fromCard.setCardnumber(custcardnumber);
        fromCard.setCvv(custcvv);
        fromCard.setEndDate(custexpirydate);
        fromCard.setIssueNumber("01"); 
        fromCard.setName(custname);

        toCard = new CreditCard();
        toCard.setCardnumber(cardnumber);
        toCard.setCvv(cvv);
        toCard.setEndDate(expirydate);
        toCard.setIssueNumber("01");
        toCard.setName(name);
        
        toUsername = "testuser2";
        toPassword = "defaulttestpass";
    
        
        BankRestClient client = new BankRestClientImpl(bankUrl);
        Double amount = 0.0;
        try{
            amount = Double.parseDouble(money);
            System.out.println(amount);
        }catch (Exception e){
            
        }
       
        TransactionReplyMessage reply = client.transferMoney(fromCard, toCard, amount);
        
    
        
     

       
    
    
    
        //BankRestClient client = new BankRestClientImpl(bankUrl);

 

        // testing with auth
 
        //TransactionReplyMessage reply = client.transferMoney(fromCard, toCard, amount, toUsername, toPassword);
        
       

    

    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <p><%=cardnumber%></p>
        <p><%=username%></p>
        <p><%=password%></p>
        <p><%=expirydate%></p>
        
        
        <h1>Card Details</h1>
        <p><%=message %></p>
        <form action="./home.jsp" method="POST">
            <p>Card Number: <input type="text" name="custcardnumber" value="custcardnumber"></p>
            <p>CVV: <input type="text" name="custcvv" value="custcvv"></p>
            <p>Expiry Date: <input type="text" name="custexpirydate" value="custexpirydate"></p>
            <p>Name: <input type="text" name="custname" value="custname"></p>
            <p>Amount: <input type="text" name="money" value="money"></p>
            <input type="hidden" name="action" value="sendmoney">

            <button class="btn" type="submit" >Send Transfer</button>
        </form>
            
        <form action="http://localhost:8080/properties.jsp/properties.jsp">
            <button type="submit">Update Shopkeeper's details</button>
        </form>
    </body>
</html>

