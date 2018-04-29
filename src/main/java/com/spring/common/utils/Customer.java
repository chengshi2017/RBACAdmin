package com.spring.common.utils;

import java.text.DecimalFormat;

/**
 * @Author Sunny
 * @Date 2018/3/1
 * @time 17:58
 * @Describe:
 */
public class Customer {
    private static int totalCount = 0;
    private int customerID;
    public Customer(){
        ++totalCount;
        customerID = totalCount;
    }
    public String getCustomerID() {
        DecimalFormat decimalFormat = new DecimalFormat("000000");
        return decimalFormat.format(customerID);
    }

    public static void main(String args[]){
        Customer c1 = new Customer();
        System.out.println(c1.getCustomerID());
        Customer c2 = new Customer();
        System.out.println(c2.getCustomerID());
    }
}
