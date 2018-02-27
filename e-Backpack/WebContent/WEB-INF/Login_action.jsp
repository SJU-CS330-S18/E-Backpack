<%@ page language="java" import="java.sql.*,apec.*, apec.users.*"%>
<jsp:useBean id="emp" class="apec.users.UserIdentity" scope="request"/>
<jsp:useBean id="admin" class="apec.users.Admin" scope="session"/>
<jsp:useBean id="customer" class="apec.users.Customer" scope="session"/>
<jsp:setProperty name="emp" property="*"/>

<%       
    int validUser = emp.login();
    if(validUser == 1){   
        response.sendRedirect("Menu/AdminMenu.jsp");
        admin.setAdmin(emp);
    }else if(validUser == 0){
        customer.setCustomer(emp);
        customer.login();
        response.sendRedirect("Menu/CustomerMenu.jsp");
    }else{
    	response.sendRedirect("Login.jsp");
    }
%> 
