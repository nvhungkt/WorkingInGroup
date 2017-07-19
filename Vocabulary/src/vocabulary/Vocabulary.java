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
    private String answer;
    private String question;
    private int mistakes = 0;

    public Vocabulary(String nihon, String vietNam) {
        this.answer = nihon;
        this.question = vietNam;
    }

    public String getAnswer() {
        return answer;
    }

    public String getQuestion() {
        return question;
    }

    public int getMistakes() {
        return mistakes;
    }
    
    public void makeMistake() {
        mistakes++;
    }
    
}
