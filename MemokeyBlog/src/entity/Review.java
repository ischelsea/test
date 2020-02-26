package entity;

public class Review {
	private int id;
	private int review_articleId;
	private String review_author;
	private String review_content;
	private String review_sdTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getReview_articleId() {
		return review_articleId;
	}
	public void setReview_articleId(int review_articleId) {
		this.review_articleId = review_articleId;
	}
	public String getReview_author() {
		return review_author;
	}
	public void setReview_author(String review_author) {
		this.review_author = review_author;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_sdTime() {
		return review_sdTime;
	}
	public void setReview_sdTime(String review_sdTime) {
		this.review_sdTime = review_sdTime;
	}
    
}
