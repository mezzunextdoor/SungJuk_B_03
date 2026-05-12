package A;

public class 교수 {
	 
    private String 교수id;
 
    public 교수() { }
 
    public void set교수id(String 교수id) { this.교수id = 교수id; }
    public String get교수id()             { return 교수id; }
 
    /**
     * 교수체크 — 교수 id 가 "inha" 인지 확인
     */
    public boolean 교수체크(String 교수id) {
        return "inha".equals(교수id);
    }
}
