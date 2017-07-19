/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vocabulary;

/**
 *
 * @author ahhun
 */
public class Vocabulary {
    private String nihon;
    private String vietNam;
    private int mistakes = 0;

    public Vocabulary(String nihon, String vietNam) {
        this.nihon = nihon;
        this.vietNam = vietNam;
    }

    public String getNihon() {
        return nihon;
    }

    public String getVietNam() {
        return vietNam;
    }

    public int getMistakes() {
        return mistakes;
    }
    
    public void makeMistake() {
        mistakes++;
    }
    
}
