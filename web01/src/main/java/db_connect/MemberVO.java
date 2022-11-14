package db_connect;

public class MemberVO {
	//가방에 데이터 넣을 공간
	//회원테이블은 4개의 항목을 가짐
	// 회원테이블의 항목과 동일하게 저장공간을 생성
	private String id;// 변수에 바로 접근하지 못하게 private 설정
	private String pw;
	private String name;
	private String tel;
	//getters/setters메서드
	//값을 넣은 메서드(set변수명(넣을 값))
	public void setId(String id) {
		this.id = id;
	}
	public String getId() {
		return id;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPw() {
		return pw;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTel() {
		return tel;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", tel=" + tel + "]";
	}
}
