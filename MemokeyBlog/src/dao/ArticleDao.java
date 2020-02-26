package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Article;
import util.DBHelp;

public class ArticleDao {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	DBHelp dbhelp=null;
	public ArticleDao(){
		dbhelp=new DBHelp();
		conn=dbhelp.getConnection();
	}
	//��������
	public boolean addArticle(Article article){
		String sql="insert into article(articletitle,username,articlestar,articlecontent,profile,sortname,labelname) values(?,?,?,?,?,?,?)";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, article.getArticletitle());
			ps.setString(2, article.getUsername());
			ps.setInt(3, article.getArticlestar());
			ps.setString(4, article.getArticlecontent());
			ps.setString(5, article.getProfile());
			ps.setInt(6, article.getSortid());
			ps.setString(7, article.getLabelname());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	//��ѯ��������
	public List selectArticle(){
		List articlelist=new ArrayList();
		String sql="select * from article";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				Article article=new Article();
				article.setArticleid(rs.getInt(1));
				article.setArticletitle(rs.getString(2));
				article.setUsername(rs.getString(3));
				article.setArticlestar(rs.getInt(4));
				article.setArticlecontent(rs.getString(5));
				article.setProfile(rs.getString(6));
				article.setSortid(rs.getInt(7));
				article.setLabelname(rs.getString(8));
				articlelist.add(article);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return articlelist;
	}
	
	//����id��ѯ����
	public Article selectByid(int articleid){
		Article article=null;
		String  sql="select * from article where articleid=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, articleid);
			rs=ps.executeQuery();
			while(rs.next()){
				article=new Article();
				article.setArticleid(rs.getInt(1));
				article.setArticletitle(rs.getString(2));
				article.setUsername(rs.getString(3));
				article.setArticlestar(rs.getInt(4));
				article.setArticlecontent(rs.getString(5));
				article.setProfile(rs.getString(6));
				article.setSortid(rs.getInt(7));
				article.setLabelname(rs.getString(8));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return article;
	}
	//�������ID��ѯ
	public List selectByTypeid(int typeid){
		List articlelist=new ArrayList();
		String  sql="select * from article where Sortid = ?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, typeid);
			rs=ps.executeQuery();
			while(rs.next()){
				Article article=new Article();
				article.setArticleid(rs.getInt(1));
				article.setArticletitle(rs.getString(2));
				article.setUsername(rs.getString(3));
				article.setArticlestar(rs.getInt(4));
				article.setArticlecontent(rs.getString(5));
				article.setProfile(rs.getString(6));
				article.setSortid(rs.getInt(7));
				article.setLabelname(rs.getString(8));
				articlelist.add(article);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return articlelist;
	}
	//����id�޸�
	public boolean updateArticle(Article article){
		String sql="update article set articletitle=?,username=?,articlestar=?,articlecontent=?,profile=?,sortid=?,labelname=?   where articleid=?";
		try {
			ps=conn.prepareStatement(sql);
			article.setArticletitle(rs.getString(1));
			article.setUsername(rs.getString(2));
			article.setArticlestar(rs.getInt(3));
			article.setArticlecontent(rs.getString(4));
			article.setProfile(rs.getString(5));
			article.setSortid(rs.getInt(6));
			article.setLabelname(rs.getString(7));
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteArticle(int articleid){
		String sql="delete from article where articleid=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, articleid);
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

}
