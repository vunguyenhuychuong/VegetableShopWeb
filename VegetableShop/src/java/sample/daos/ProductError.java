/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.daos;

/**
 *
 * @author DELL
 */
public class ProductError {
    
    private String productIDError;
    private String productNameError;
    private String imageError;
    private float priceError;
    private int quantityError;
    private String categoryIDError;
    private String importDateError;
    private String usingDateError;

    public ProductError() {
        this.productIDError = "";
        this.productNameError = "";
        this.imageError = "";
        this.priceError = 0;
        this.quantityError = 0;
        this.categoryIDError = "";
        this.importDateError = "";
        this.usingDateError = "";
    }

    public ProductError(String productIDEror, String productNameError, String imageError, float priceError, int quantityError, String categoryIDError, String importDateError, String usingDateError) {
        this.productIDError = productIDEror;
        this.productNameError = productNameError;
        this.imageError = imageError;
        this.priceError = priceError;
        this.quantityError = quantityError;
        this.categoryIDError = categoryIDError;
        this.importDateError = importDateError;
        this.usingDateError = usingDateError;
    }

    public String getProductIDError() {
        return productIDError;
    }

    public void setProductIDError(String productIDEror) {
        this.productIDError = productIDEror;
    }

    public String getProductNameError() {
        return productNameError;
    }

    public void setProductNameError(String productNameError) {
        this.productNameError = productNameError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public float getPriceError() {
        return priceError;
    }

    public void setPriceError(float priceError) {
        this.priceError = priceError;
    }

    public int getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(int quantityError) {
        this.quantityError = quantityError;
    }

    public String getCategoryIDError() {
        return categoryIDError;
    }

    public void setCategoryIDError(String categoryIDError) {
        this.categoryIDError = categoryIDError;
    }

    public String getImportDateError() {
        return importDateError;
    }

    public void setImportDateError(String importDateError) {
        this.importDateError = importDateError;
    }

    public String getUsingDateError() {
        return usingDateError;
    }

    public void setUsingDateError(String usingDateError) {
        this.usingDateError = usingDateError;
    }
    
    
}
