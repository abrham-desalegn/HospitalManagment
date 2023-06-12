
package beanPack;

import java.io.Serializable;

/**
 *
 * @author Abrham
 */

public class RecpBean implements Serializable {
    
    private String fname;

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    private String lname;
    private String mobile;
}
