package teamC;

public class DTO 
{
	public boolean DoInsert(VO vo) 
	{
		String sql = "";
		
		System.out.println(sql);
		DBM dbm = new DBM ();
		dbm.DBOpen();
		dbm.Excute(sql);
		dbm.DBClose();
		return true;
	}
	public boolean DoDelete(VO vo)
	{
		String sql = "";
		
		// vo.�ڿ� get�޼ҵ� ���
		System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		dbm.Excute(sql);
		dbm.DBClose();
		return true;
	}
	public boolean DoUpdate(VO vo)
	{
		String sql = "";
		
		// vo.�ڿ� get�޼ҵ� ���
		System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		dbm.Excute(sql);
		dbm.DBClose();
		return true;
	}
	
	public boolean DoSelect(VO vo)
	{
		String sql = "";
		
		// vo.�ڿ� get�޼ҵ� ���
		System.out.println(sql);
		DBM dbm = new DBM();
		dbm.DBOpen();
		dbm.OpenQuery(sql);
		dbm.ResultNext();
		dbm.CloseQuery();
		dbm.DBClose();
		return true;
	}
	
}