package pt;

import teamC.DBM;
import teamC.VO;

public class PtDAO 
{
	public int findt_no(String u_id)
	{
		String sql = "select t_no from trainer where t_id = '" + u_id + "'";
		
		System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		dbm.OpenQuery(sql);
		int a = 0;
		if(dbm.ResultNext())
		{
			a = dbm.getInt("t_no");
		}
		dbm.CloseQuery();
		dbm.DBClose();
		return a;
	}
	
	public VO alert(int t_no) 
	{
		String sql = "select p_try,u_no,p_send,p_cnt from pt where t_no = '"+t_no +"' and p_state = 'a' ";
		
		DBM dbm = new DBM();
		dbm.DBOpen();
		VO vo   = new VO();
		dbm.OpenQuery(sql);	
		dbm.ResultNext();
		vo.setP_try(dbm.getInt("p_try"));
		vo.setU_no(dbm.getInt("u_no"));
		vo.setP_send(dbm.getString("p_send"));		
		vo.setP_cnt(dbm.getInt("p_cnt"));		
		dbm.CloseQuery();
		dbm.DBClose();
		return vo;
	}
	
	public void accept(int u_no)
	{
		String sql = "";  
		sql += "update pt set p_state ='b', p_ok = now() where u_no =" + u_no ;
	
		System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		dbm.Excute(sql);
		dbm.DBClose();
	}
	
	public void cancel(int u_no)
	{
		String sql = "";  
		sql += "delete from pt where u_no =" + u_no ;
	
		System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		dbm.Excute(sql);
		dbm.DBClose();
	}
	
}
