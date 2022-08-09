/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.validate;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Scanner;

/**
 *
 * @author DELL
 */
public class MyValidation {
   public static Scanner sc = new Scanner(System.in);
    
   public static LocalDate getDate(String msg) {
        LocalDate data = null;
        boolean getflag = true;
        do {
            try {
                System.out.println(msg);
                data = LocalDate.parse(sc.nextLine(), DateTimeFormatter.ISO_LOCAL_DATE);
                getflag = false;
            } catch (Exception e) {
                System.out.println(e);
            }
        } while (getflag);
        return data;
    }
   
   public static boolean CheckDateImport(String stringDate) {
        boolean check = false;
        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        Date expiredDate = null;
        Date today = new Date();
        do {
            try {               
                df.setLenient(false);
                df.parse(stringDate);
                check = false;
                expiredDate = df.parse(stringDate);
                if (expiredDate.before(today)) {                                      
                    check = true;
                    break;
                }
            } catch (Exception e) {               
                check = true;
                break;
            }
        } while (check);
        return check;
    }
   
}
