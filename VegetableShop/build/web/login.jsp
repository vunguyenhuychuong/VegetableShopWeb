<%-- 
    Document   : login
    Created on : Feb 21, 2022, 4:37:26 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="assets/mystyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="container">
            <form action="MainController" method="POST" id="check">
                <div class="title">Login</div>
                <div class="input-box underline">
                    <input type="text" placeholder="Enter Your UserID or Email" name="userID" required>
                    <div class="underline"></div>
                </div>
                <div class="input-box">
                    <input type="password" placeholder="Enter Your Password"  name="password" required>
                    <div class="underline"></div>
                </div>
                <div class="g-recaptcha" data-sitekey="6Lfr98AeAAAAACdBP_Etf0HLuGar7AGWW1lIDpo2"></div> 
                <div id="error"></div>
                <div class="input-box button">
                    <input type="submit" name="action" value="Login">
                </div>
                <%
                    String error = (String) request.getAttribute("ERROR");
                    if (error == null) {
                        error = "";
                    }
                %>
                <%= error %>
            </form>
            <div class="option"><a href="create.jsp"">Create new user</a><br></div>
            <div class="option">or Connect With Social Media</div>
            <div class="facebook">
                <a href="#"><i class="fab fa-facebook-f"></i>Sign in With FaceBook</a>
            </div>
            <div class="google">
                <a href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8082/VegetableShop/LoginGoogleHandler&response_type=code
                   &client_id=416290682037-rh1vhe220s41n7mo0og4p6ijnt3nkt4g.apps.googleusercontent.com&approval_prompt=force&MainController?action=LoginGG">
                    <i class="fab fa-google"></i>Sign in With Google</a>
                </a>
            </div>

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
