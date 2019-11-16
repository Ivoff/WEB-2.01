<%-- 
    Document   : User
    Created on : Nov 16, 2019, 4:23:41 PM
    Author     : zilas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
        <title>User Form</title>
    </head>
    <body>        
        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar navbar-brand" href="user">                
                <b>Generic</b>
            </a>            
        </nav>
        
        <h1>User form</h1>
        
        <div class="container">
            <%
                if(request.getAttribute("error") != null){%>
                    <div class="alert alert-warning" role="alert">
                        <%= request.getAttribute("error")%>
                    </div>
                <%}
            %>
            <form action="user" method="POST">
                <div class="form-group">
                    
                    <input type="hidden" name="flag" value="not_null">
                    
                    <div class="form-group" id="name_group">
                        <label id=label_name for="input_name">Name</label>
                        <input class="form-control" id="input_name" name="input_name" type="text" required="true">
                    </div>
                    
                    <div class="form-group" id="email_group">
                        <label id=label_email for="input_email">Email</label>
                        <input class="form-control" id="input_email" name="input_email" type="email" required="true">
                    </div>
                    
                    <div class="form-group" id="password_group">
                        <label id=label_password for="input_password">Password</label>
                        <input class="form-control" id="input_password" name="input_password" type="password" required="true">
                    </div>
                    
                    <div class="form-group" id="confirm_group">
                        <label id=label_confirm for="input_confirm">Confirm Password</label>
                        <input class="form-control" id="input_confirm" name="input_confirm" type="password" required="true">
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Send</button>                                        
                </div>
            </form>
            
        </div>
        
    </body>
</html>
