package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Word;
import util.DBHelp;

public class WordDao {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	DBHelp dbhelp=null;
	public WordDao(){
		dbhelp=new DBHelp();
		conn=dbhelp.getConnection();
	}
	public List selectAll(){
		List wordlist=new ArrayList();
		String sql="select * from tb_word";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				Word word=new Word();
				word.setId(rs.getInt(1));
				word.setWord_title(rs.getString(2));
				word.setWord_content(rs.getString(3));
				word.setWord_sdTime(rs.getString(4));
				word.setWord_author(rs.getString(5));
				wordlist.add(word);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return wordlist;
	}
	public boolean deleteWord(int id){
		String sql="delete from tb_word where id=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	public boolean addWord(Word word){
		String sql="insert into tb_word(word_title,word_content,word_sdTime,word_author) values(?,?,?,?)";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, word.getWord_title());
			ps.setString(2, word.getWord_content());
			ps.setString(3, word.getWord_sdTime());
			ps.setString(4, word.getWord_author());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

}
