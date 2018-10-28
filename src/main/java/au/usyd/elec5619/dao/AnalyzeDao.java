package au.usyd.elec5619.dao;

import java.util.ArrayList;
import java.util.List;


import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;

import au.usyd.elec5619.domain.Booking;
import au.usyd.elec5619.domain.Comment;
@Repository(value = "analyzeDao")
public class AnalyzeDao {
	@Autowired
    private SessionFactory sessionFactory;
	@Autowired
    private JdbcTemplate jdbcTemplate;
    
    public int[] getAnalyzeBBT(){
        int BBT_List[] = new int[13]; 
        BBT_List[0]=0;BBT_List[1]=0;BBT_List[2]=0;BBT_List[3]=0;BBT_List[4]=0;BBT_List[5]=0;BBT_List[6]=0;BBT_List[7]=0;BBT_List[8]=0;BBT_List[9]=0;BBT_List[10]=0;BBT_List[11]=0;BBT_List[12]=0;
	    String sql_1="SELECT count(*) from booking where substr(startTime,12,2)=08";String sql_2="SELECT count(*) from booking where substr(startTime,12,2)=09";String sql_3="SELECT count(*) from booking where substr(startTime,12,2)=10";String sql_4="SELECT count(*) from booking where substr(startTime,12,2)=11";String sql_5="SELECT count(*) from booking where substr(startTime,12,2)=12";
	    String sql_6="SELECT count(*) from booking where substr(startTime,12,2)=13";String sql_7="SELECT count(*) from booking where substr(startTime,12,2)=14";String sql_8="SELECT count(*) from booking where substr(startTime,12,2)=15";String sql_9="SELECT count(*) from booking where substr(startTime,12,2)=16";
	    String sql_10="SELECT count(*) from booking where substr(startTime,12,2)=17";String sql_11="SELECT count(*) from booking where substr(startTime,12,2)=18";String sql_12="SELECT count(*) from booking where substr(startTime,12,2)=19";String sql_13="SELECT count(*) from booking where substr(startTime,12,2)=20";
	    
	    BBT_List[0] = jdbcTemplate.queryForInt(sql_1);BBT_List[1] = jdbcTemplate.queryForInt(sql_2);BBT_List[2] = jdbcTemplate.queryForInt(sql_3);BBT_List[3] = jdbcTemplate.queryForInt(sql_4);BBT_List[4] = jdbcTemplate.queryForInt(sql_5);
	    BBT_List[5] = jdbcTemplate.queryForInt(sql_6);BBT_List[6] = jdbcTemplate.queryForInt(sql_7);BBT_List[7] = jdbcTemplate.queryForInt(sql_8);BBT_List[8] = jdbcTemplate.queryForInt(sql_9);
	    BBT_List[9] = jdbcTemplate.queryForInt(sql_10);BBT_List[10] = jdbcTemplate.queryForInt(sql_11);BBT_List[11] = jdbcTemplate.queryForInt(sql_12);BBT_List[12] = jdbcTemplate.queryForInt(sql_13);

        return BBT_List;
     }
    
    public int[][] getAnalyzeRC() {
    	String sql_cid="SELECT classroom_id FROM Classroom";
    	List result = jdbcTemplate.queryForList(sql_cid);
 	    int RC_List[][] = new int[result.size()][6];
 	    for(int i=0;i<result.size();i++) {
		    Object CID = result.get(i);
		    String SCID = CID.toString().replace("{","").replace("}","").replace("classroom_id","").replace("=","");
		    int ICID = Integer.parseInt(SCID);
		    RC_List[i][0] = ICID;
		    String sql_1="SELECT count(*) from Rating where score=1 and classroom_id = ?";
		    int score_1 = jdbcTemplate.queryForInt(sql_1,ICID);
		    RC_List[i][1] = score_1;
		    String sql_2="SELECT count(*) from Rating where score=2 and classroom_id = ?";
		    int score_2 = jdbcTemplate.queryForInt(sql_2,ICID);
		    RC_List[i][2] = score_2;
		    String sql_3="SELECT count(*) from Rating where score=3 and classroom_id = ?";
		    int score_3 = jdbcTemplate.queryForInt(sql_3,ICID);
		    RC_List[i][3] = score_3;
		    String sql_4="SELECT count(*) from Rating where score=4 and classroom_id = ?";
		    int score_4 = jdbcTemplate.queryForInt(sql_4,ICID);
		    RC_List[i][4] = score_4;
		    String sql_5="SELECT count(*) from Rating where score=5 and classroom_id = ?";
		    int score_5 = jdbcTemplate.queryForInt(sql_5,ICID);
		    RC_List[i][5] = score_5;
//		    System.out.println(score_5+score_4+score_3);
 	    	
 	    }
    	return RC_List;
    }
    
    public int[][] getAnalyzeCC() {
	    String sql_cid="SELECT classroom_id FROM Classroom";
	    List result = jdbcTemplate.queryForList(sql_cid);
	    int CC_List[][] = new int[result.size()][2];
	    for(int i=0;i<result.size();i++) {
		    Object CID = result.get(i);
		    String SCID = CID.toString().replace("{","").replace("}","").replace("classroom_id","").replace("=","");
		    int ICID = Integer.parseInt(SCID);
		    CC_List[i][0] = ICID;
//	    	System.out.println(ICID);
		   	String sql_score="SELECT AVG(score) FROM Rating WHERE classroom_id =?";
		    int score_avg = jdbcTemplate.queryForInt(sql_score,SCID);
//		    String score = score_avg+"";
		    CC_List[i][1] = score_avg;
//		    System.out.println(score_avg);
	    }
	    return CC_List;
    }
}

