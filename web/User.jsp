<%-- 
    Document   : User
    Created on : Nov 16, 2019, 4:23:41 PM
    Author     : zilas
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="Entities.User"%>
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
            <a class="navbar navbar-brand" href="/user">                
                <b>Generic</b>
            </a>            
        </nav>
        
        <h1>User form</h1>
        
        <div>
            <%
                if(request.getAttribute("error") != null){%>
                    <div class="alert alert-warning" role="alert">
                        <%= request.getAttribute("error")%>
                    </div>
                <%}
            %>
            
            <%
                User selectedUser = new User();
                String flag = null;
                if(request.getAttribute("selected_user") != null){
                    flag = "update";
                    selectedUser = (User) request.getAttribute("selected_user");                    
                }else{
                    flag = "insertion";
                }
            %>            
            <form action="user" method="POST">
                <div class="form-group">
                    
                    <input type="hidden" name="flag" value="<%= flag%>">
                    
                    <%
                        if(flag.equals("update")){
                            %>
                            <input type="hidden" name="user_id" value="<%= selectedUser.getId()%>">
                            <%
                        }
                    %>
                    
                    <div class="form-group" id="name_group">
                        <label id=label_name for="input_name">Name</label>
                        <%
                           String name = flag.equals("update") ? selectedUser.getName() : null;
                        %>
                        <input class="form-control" id="input_name" name="input_name" type="text" required value="<%= name%>">
                    </div>
                    
                    <div class="form-group" id="email_group">
                        <label id=label_email for="input_email">Email</label>
                        <%
                            String email = flag.equals("update") ? selectedUser.getEmail() : null;
                        %>
                        <input class="form-control" id="input_email" name="input_email" type="email" required value="<%= email%>">
                    </div>
                    
                    <div class="form-group" id="birthday_group">
                        <label id="label_birthday" for="input_birthday">Birthday</label>                        
                        <input class="form-control" id="input_birthday" name="input_birthday" type="date" required></input>
                    </div>
                    
                    <div class="form-group" id="password_group">
                        <label id=label_password for="input_password">Password</label>                        
                        <input class="form-control" id="input_password" name="input_password" type="password" required>
                    </div>
                    
                    <div class="form-group" id="confirm_group">
                        <label id=label_confirm for="input_confirm">Confirm Password</label>
                        <input class="form-control" id="input_confirm" name="input_confirm" type="password" required>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Send</button>                                        
                </div>
            </form>            
        </div>
        
        <div class="container">
            <table class="table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Birthday</th>
                        <th>Password Hash</th>
                        <th>Created At</th>
                        <th>Updated At</th>
                        <th colspan="2"></th>
                    <tr>
                </thead>
                <tbody>
                    <%                        
                        List<User> list; 
                        list = (List<User>) request.getAttribute("all");
                    %>
                    <%
                        for(User user : list){                            
                    %>
                    <tr>
                        <td><%= user.getName()%></td>
                        <td><%= user.getEmail()%></td>
                        <td><%= user.getBirthday().toString()%></td>
                        <td><%= user.getHashPass()%></td>
                        <td><%= user.getCreatedAt().toString()%></td>
                        <td><%= user.getUpdatedAt().toString()%></td>
                        <td>
                            <a href="user?edit=<%= user.getId()%>">
                                <button class="btn btn-primary">
                                    edit
                                </button>
                            </a>
                        </td>
                        <td>
                            <a href="user?deatroy=<%= user.getId()%>">
                                <button class="btn btn-primary">
                                    destroy
                                </button>
                            </a>
                        </td>
                    </tr>                   
                    <%}%>
                </tbody>
            </table>            
        </div>
    </body>
</html>
