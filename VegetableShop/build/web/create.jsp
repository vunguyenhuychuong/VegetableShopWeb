<%-- 
    Document   : create
    Created on : Mar 1, 2022, 11:55:36 PM
    Author     : DELL
--%>

<%@page import="sample.daos.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CreateAccount Page</title>
        <link rel="stylesheet" href="assets/mystyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();

            }
        %>
        <div class="container">           
            <form action="MainController" method="POST" id="check">
                <div class="title">Create New User</div>
                <div class="input-box underline">
                    <input type="text" placeholder="Enter Your UserID " name="userID" required/>
                    <div class="underline"></div>
                    <%=userError.getUserIDError()%>
                </div>  
                <div class="input-box underline">
                    <input type="text" placeholder="Enter Your FullName" name="fullName" required/>
                    <div class="underline"></div>
                    <%=userError.getFullNameError()%>
                </div>
                <div class="input-box">
                    <input type="text" placeholder="Enter Your RoleID"  name="roleID" required readonly="" value="1">
                    <div class="underline"></div>
                </div>
                <div class="input-box">
                    <input type="text" placeholder="Enter Your Address"  name="address" required>
                    <div class="underline"></div>
                    <%= userError.getAddressError()%>
                </div>
                <div class="input-box">
                    <input type="date" placeholder="Enter Your Birthday"  name="birthday" required>
                    <div class="underline"></div>
                    <%= userError.getBirthdayError()%>
                </div>
                <div class="input-box">
                    <input type="text" placeholder="Enter Your Phone"  name="phone" required>
                    <div class="underline"></div>
                    <%= userError.getPhoneError()%>
                </div>
                <div class="input-box">
                    <input type="email" placeholder="Enter Your Email"  name="email" required>
                    <div class="underline"></div>
                    <%= userError.getEmailError()%>
                </div> 
                <div class="input-box">
                    <input type="password" placeholder="Enter Your Password"  name="password" required>
                    <div class="underline"></div>
                </div>                        
                <div class="input-box">
                    <input type="password" placeholder="Enter Your Password again!!"  name="confirm" required>
                    <div class="underline"></div>
                    <%= userError.getConfirmError()%>
                </div>
                <div class="g-recaptcha" data-sitekey="6LdV5rAeAAAAAEstD7Dd5sXIxQ6Ck32mKoQJeqJP"></div> 
                <div id="error"></div>
                <div class="input-box button" >
                    <input type="submit" name="action" value="Create"/>
                    <a href="MainController?action=Logout" style="text-align: center; font-size:10px; text-decoration: none"><h1>Return to Login </h1></a>                    
                </div>
            </form>
        </div>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            window.onload = function () {
                const recap = document.getElementById("check");
                const error = document.getElementById("error");
                recap.addEventListener("submit", function (event) {

                    const response = grecaptcha.getResponse();
                    if (response) {
                        recap.submit();
                    } else {
                        event.preventDefault();
                        error.innerHTML = "Please check recaptcha!";
                    }
                });
            }
        </script>
    </body>
</html>
