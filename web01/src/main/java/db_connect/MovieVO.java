package db_connect;

public class MovieVO {
	
	private String no;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	private String title;
	private String genre;
	private String img;
	private String url;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
}
