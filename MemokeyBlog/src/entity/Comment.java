package entity;

public class Comment {
	private int commentid;
	private String commentcontent;
	private int userid;
	private int articleid;
	private int commentstar;
	public int getCommentid() {
		return commentid;
	}
	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}
	public String getCommentcontent() {
		return commentcontent;
	}
	public void setCommentcontent(String commentcontent) {
		this.commentcontent = commentcontent;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getArticleid() {
		return articleid;
	}
	public void setArticleid(int articleid) {
		this.articleid = articleid;
	}
	public int getCommentstar() {
		return commentstar;
	}
	public void setCommentstar(int commentstar) {
		this.commentstar = commentstar;
	}
	
}
