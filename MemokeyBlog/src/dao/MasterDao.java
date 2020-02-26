package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entity.Master;
import util.DBHelp;

public class MasterDao {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	DBHelp dbhelp=null;
	public MasterDao(){
		dbhelp=new DBHelp();
		conn=dbhelp.getConnection();
	}
	public boolean Login(String username,String password){
		boolean flag=false;
		String sql="select * from user where username=? and password=? ";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			rs=ps.executeQuery();
			if(rs.next()){
				flag=true;
			}
			return flag;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	public Master select(){
		Master master=null;
		String sql="select * from tb_master";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				master=new Master();
				master.setMaster_name(rs.getString(1));
				master.setMaster_password(rs.getString(2));
				master.setMaster_sex(rs.getString(3));
				master.setMaster_oicq(rs.getString(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return master;
	}

}
