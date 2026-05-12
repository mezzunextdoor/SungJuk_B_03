package A;

import java.util.HashMap;
import java.util.Map;
 
/**
 *  성적 클래스
 *   - 속성 : 학점, 총점, 평균
 *   - 행위 : 성적입력, 학점조회
 */
public class 성적 {
 
    /* 속성 (데이터 타입은 영문) */
    private String 학점;
    private double 총점;
    private double 평균;
 
    /* 실습용 메모리 저장소 (DB 대용) */
    private static final Map<String, 성적> 저장소 = new HashMap<>();
 
    /* JSP 실행 시 학점조회 데모를 위해 미리 한 건 입력해 둠 */
    static {
        new 성적().성적입력("inha", "20231234", 95, 88, 91);
    }
 
    public 성적() { }
 
    public String get학점() { return 학점; }
    public double get총점() { return 총점; }
    public double get평균() { return 평균; }
 
    /**
     *  성적입력
     *   1) 교수체크 호출
     *   2) 총점 = 자바 + DB + 보안
     *   3) 평균 = 총점 / 3
     *   4) 학점 = 학점계산(평균)
     *   5) 저장소에 보관
     */
    public boolean 성적입력(String 교수id, String 학생id,
                            double 자바, double DB, double 보안) {
 
        교수 pf = new 교수();                       // step 3 : «create»
        boolean check = pf.교수체크(교수id);        // step 4
 
        if (check) {
            this.총점 = 자바 + DB + 보안;            // step 5
            this.평균 = this.총점 / 3.0;             // step 6
            this.학점 = 학점계산(this.평균);          // step 7
            저장소.put(키(교수id, 학생id), this);
            return true;                            // step 8
        }
        return false;                               // step 9
    }
 
    /**
     *  학점조회 — 저장된 학점을 그대로 반환
     */
    public String 학점조회(String 교수id, String 학생id) {
 
        교수 pf = new 교수();
        boolean check = pf.교수체크(교수id);
 
        if (!check) return null;
 
        성적 found = 저장소.get(키(교수id, 학생id));
        if (found == null) return null;
        return found.학점;
    }
 
    /* 학점 부여 규칙 :  A ≥ 90 ,  B ≥ 80 ,  C < 80 */
    private String 학점계산(double 평균) {
        if (평균 >= 90)      return "A";
        else if (평균 >= 80) return "B";
        else                 return "C";
    }
 
    private static String 키(String 교수id, String 학생id) {
        return 교수id + ":" + 학생id;
    }
}
