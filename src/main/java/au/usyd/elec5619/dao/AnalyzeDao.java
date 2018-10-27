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
    
    public String[] getAnalyzeBBT(){
        String BBT_List[] = new String[13]; 
        BBT_List[0]="0";BBT_List[1]="0";BBT_List[2]="0";BBT_List[3]="0";BBT_List[4]="0";BBT_List[5]="0";BBT_List[6]="0";BBT_List[7]="0";BBT_List[8]="0";BBT_List[9]="0";BBT_List[10]="0";BBT_List[11]="0";BBT_List[12]="0";
        Query query_8 = sessionFactory.getCurrentSession().createQuery("SELECT count(*) from Booking where substr(startTime,12,2)=8");Query query_9 = sessionFactory.getCurrentSession().createQuery("SELECT count(*) from Booking where substr(startTime,12,2)=9");Query query_10 = sessionFactory.getCurrentSession().createQuery("SELECT count(*) from Booking where substr(startTime,12,2)=10");
        Query query_11 = sessionFactory.getCurrentSession().createQuery("SELECT count(*) from Booking where substr(startTime,12,2)=11");Query query_12 = sessionFactory.getCurrentSession().createQuery("SELECT count(*) from Booking where substr(startTime,12,2)=12");Query query_13 = sessionFactory.getCurrentSession().createQuery("SELECT count(*) from Booking where substr(startTime,12,2)=13");Query query_14 = sessionFactory.getCurrentSession().createQuery("SELECT count(*) from Booking where substr(startTime,12,2)=14");
        Query query_15 = sessionFactory.getCurrentSession().createQuery("SELECT count(*) from Booking where substr(startTime,12,2)=15");Query query_16 = sessionFactory.getCurrentSession().createQuery("SELECT count(*) from Booking where substr(startTime,12,2)=16");Query query_17 = sessionFactory.getCurrentSession().createQuery("SELECT count(*) from Booking where substr(startTime,12,2)=17");
        Query query_18 = sessionFactory.getCurrentSession().createQuery("SELECT count(*) from Booking where substr(startTime,12,2)=18");Query query_19 = sessionFactory.getCurrentSession().createQuery("SELECT count(*) from Booking where substr(startTime,12,2)=19");Query query_20 = sessionFactory.getCurrentSession().createQuery("SELECT count(*) from Booking where substr(startTime,12,2)=20");
        
        List<Booking> result_8 = (List<Booking>)query_8.list();List<Booking> result_9 = (List<Booking>)query_9.list();List<Booking> result_10 = (List<Booking>)query_10.list();
        List<Booking> result_11 = (List<Booking>)query_11.list();List<Booking> result_12 = (List<Booking>)query_12.list();List<Booking> result_13 = (List<Booking>)query_13.list();
        List<Booking> result_14 = (List<Booking>)query_14.list();List<Booking> result_15 = (List<Booking>)query_15.list();List<Booking> result_16 = (List<Booking>)query_16.list();List<Booking> result_17 = (List<Booking>)query_17.list();
        List<Booking> result_18 = (List<Booking>)query_18.list();List<Booking> result_19 = (List<Booking>)query_19.list();List<Booking> result_20 = (List<Booking>)query_20.list();
       
        String json_8 = new Gson().toJson(result_8);String json_9 = new Gson().toJson(result_9);String json_10 = new Gson().toJson(result_10);
        String json_11 = new Gson().toJson(result_11);String json_12 = new Gson().toJson(result_12);String json_13 = new Gson().toJson(result_13);
        String json_14 = new Gson().toJson(result_14);String json_15 = new Gson().toJson(result_15);String json_16 = new Gson().toJson(result_16);
        String json_17 = new Gson().toJson(result_17);String json_18 = new Gson().toJson(result_18);String json_19 = new Gson().toJson(result_19);String json_20 = new Gson().toJson(result_20);
        BBT_List[0]=json_8.replace("[","").replace("]","");BBT_List[1]=json_9.replace("[","").replace("]","");BBT_List[2]=json_10.replace("[","").replace("]","");
        BBT_List[3]=json_11.replace("[","").replace("]","");BBT_List[4]=json_12.replace("[","").replace("]","");BBT_List[5]=json_13.replace("[","").replace("]","");
        BBT_List[6]=json_14.replace("[","").replace("]","");BBT_List[7]=json_15.replace("[","").replace("]","");BBT_List[8]=json_16.replace("[","").replace("]","");
        BBT_List[9]=json_17.replace("[","").replace("]","");BBT_List[10]=json_18.replace("[","").replace("]","");BBT_List[11]=json_19.replace("[","").replace("]","");BBT_List[12]=json_20.replace("[","").replace("]","");
        
        return BBT_List;
     }
    
    public int[][] getAnalyzeRC() {
    	String sql_cid="SELECT classroom_id FROM Classroom";
    	List result = jdbcTemplate.queryForList(sql_cid);
 	    int RC_List[][] = new int[20][6];
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
 	    	
 	    }
    	return RC_List;
    }
    
    public int[][] getAnalyzeCC() {
	    String sql_cid="SELECT classroom_id FROM Classroom";
	    List result = jdbcTemplate.queryForList(sql_cid);
	    int CC_List[][] = new int[20][2];
	    for(int i=0;i<result.size();i++) {
		    Object CID = result.get(i);
		    String SCID = CID.toString().replace("{","").replace("}","").replace("classroom_id","").replace("=","");
		    int ICID = Integer.parseInt(SCID);
		    CC_List[i][0] = ICID;
	    	System.out.println(ICID);
		   	String sql_score="SELECT AVG(score) FROM Rating WHERE classroom_id =?";
		    int score_avg = jdbcTemplate.queryForInt(sql_score,ICID);
		    CC_List[i][1] = score_avg;
		    System.out.println(score_avg);
	    }
	    return CC_List;
    }
}

