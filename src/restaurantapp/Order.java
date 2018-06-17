/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author w0k0b
 */
 public class Order extends Object {
    public int oid;
    public String ftitle;
    public String sname;
    
    public Order (int oid, String ftitle, String sname) {
        this.oid = oid;
        this.ftitle = ftitle;
        this.sname = sname;
    }
}