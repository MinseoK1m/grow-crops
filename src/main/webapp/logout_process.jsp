jsp
Copy code
<%@ page contentType="text/html; charset=utf-8" %>

<%

    session.invalidate();
    
    String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
%>