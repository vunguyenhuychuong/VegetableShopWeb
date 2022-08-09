<%-- 
    Document   : insertProduct
    Created on : Mar 8, 2022, 5:09:16 PM
    Author     : DELL
--%>

<%@page import="sample.daos.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InsertProduct Page</title>
    </head>
    <body>
        <h1>Insert More Product</h1>
        <%
            ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
            if (productError == null) {
                productError = new ProductError();
            }
        %>
        <form action="MainController">
            Product ID<input type="text" name="productID" required=""/>
            <%= productError.getProductIDError()%> </br>
            Product Name<input type="text" name="productName" required=""/>
            <%= productError.getProductNameError()%> </br>
            Price<input type="number" name="price" required="" min="1"/></br>
            Quantity<input type="number" name="quantity" required="" min="1"/></br>
            Category ID<input type="text" name="categoryID" required="" min="1" max="4"/>
            <%= productError.getCategoryIDError()%> </br>
            Import Date<input type="date" name="importDate" required="" min="1/3/2022" max="1/1/2023"/>
            <%= productError.getImportDateError()%> </br>
            Using Date<input type="date" name="usingDate" required=""/>
            <%= productError.getUsingDateError()%> </br>
            Image<input type="text" name="image" required=""/>
            <%= productError.getImageError()%> </br>
            <input class="form-element is-submit" type="submit" name="action" value="CreateProduct">
            <input class="form-element is-submit" type="reset"  value="Reset">      
        </form>
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%= error%>

        <a href="admin.jsp">Back to admin page</a>
    </body>
</html>
