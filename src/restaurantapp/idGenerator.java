/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package restaurantapp;

/**
 *
 * @author w0k0b
 */
public class idGenerator {
    public  int mid;
    public  int cid;
    public  int sid;
    public  int oid;
    
    
    
    public idGenerator() {
        this.mid = 0;
        this.cid = 0;
        this.oid = 0;
        this.sid = 0;
    }
    
    public int getNext(String str) {
        switch (str) {
            case "mid": { this.mid++;
                        return this.mid;
            }
            case "sid": {
                this.sid++;
                return this.sid;
            }
            case "oid": {
                this.oid++;
                return this.oid;
            }
            case "cid": {
                this.cid++;
                return this.cid;
            }
            default: return 0;
        }
    }
}
