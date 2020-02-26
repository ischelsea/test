package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBHelp;
import entity.Sort;

public class SortDao {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	DBHelp dbhelp=null;
	public SortDao(){
		dbhelp=new DBHelp();
		conn=dbhelp.getConnection();
	}
	public List selectAll(){
		List typelist=new ArrayList();
		String sql="select * from sort ";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				Sort sort=new Sort();
				sort.setSortid(rs.getInt(1));
				sort.setSortname(rs.getString(2));
				typelist.add(sort);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return typelist;
	}
	public List selectSort(){
		List typelist=new ArrayList();
		String sql="select * from tb_articletype ";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				Sort sort=new Sort();
				sort.setSortid(rs.getInt(1));
				sort.setSortname(rs.getString(2));
				typelist.add(sort);
		} 
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return typelist;
	}
	public Sort selectBySort(String sortname){
		Sort sortname=null;
		String sql="select * from sort where sortname=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1,sortname );
			rs=ps.executeQuery();
			while(rs.next()){
				sort=new Sort();
				sort.setSortid(rs.getInt(1));
				sort.setSortname(rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sort;
	}
	public Sort selectById(int sortid){
		Sort sort=null;
		String sql="select * from sort where sortid=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1,sortid );
			rs=ps.executeQuery();
			while(rs.next()){
				sort=new Sort();
				sort.setSortid(rs.getInt(1));
				sort.setSortname(rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sort;
	}
	public boolean addSort(Sort sort){
		String sql="insert into sort(sortname) values(?)";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, sort.getSortname());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	public boolean updateSort(Sort sort) {
		String sql="update sort set sortname=? where sortid=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, sort.getSortname());
			ps.setInt(2,sort.getSortid());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	public boolean deleteSort(int sortid){
		String sql="delete from sort where sortid=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, sortid);
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

}
