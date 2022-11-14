package db_connect;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
	public ArrayList<MemberVO> list() {
		// vo를 넣어줄 커다란 박스역할을 할 수 있는 부품 생성
		//가변길이인 경우 arraylist
		//MemberVO가 많이 들어간 arraylist박스를 하나 만들어줌.
		ArrayList<MemberVO> list = new ArrayList<>();

	
		//1. 드라이버 설정 - 드라이버 (커넥터 로딩)
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		 // 특정한 위치에 있는 드라이버 파일을 램에 읽어들여 설정
		System.out.println("1. 드라이버 설정 성공.@@@");
		
		//2. db연결mySQL: school,oracle: xe
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		Connection con = DriverManager.getConnection(url, user, password);
		System.out.println("2. db 연결 성공.@@@@@@@");
		// 연결 STREAM(강물)
		//3. sql문을 만든다.
		String sql = "select * from member";
		PreparedStatement ps= con.prepareStatement(sql);
		
		System.out.println("3. sql문 생성 성공.@@@@");
		//스트링 문을 sql로 인식하도록 준비된 문장을 사용
		//준비된 문장
		//Url urㅣ = new Url(site);
		
		//4. sql문을 db서버에 보낸다.---> 결과가 어떻게 되었는지 자바프로그램에 알려줌
		// read select의 결과는 table,cud insert upadate delete의 결과는 숫자(실행된 row 수) 
		ResultSet rs=ps.executeQuery();//
		
		//System.out.println("4. sql문 db서버로 보내기 성공.read" +result.next());
		while (rs.next()) {//검색 결과값이 있으면 
			System.out.println("검색결과가 있음.");
			//1. 한 행의 값들을 추출
			String id = rs.getString(1);
			String pw = rs.getString("pw");
			String name = rs.getString(3);
			String tel = rs.getString(4);
			System.out.println("검색한 결과 >>"+id+ " "+pw+" "+name+" "+tel);
			//2. VO를 만들어준다.
			MemberVO bag = new MemberVO();
			bag.setId(id);
			bag.setPw(pw);
			bag.setName(name);
			bag.setTel(tel);
			//3. VO를 arraylist에 값을 넣어준다.
			list.add(bag);
			// 4개의 데이터를 UI에게 return!! 해주자.
			//데이터를 담아서
			// UI에 전달
		}//while문
		System.out.println("box(list)에 들어간 가방의 갯수"+list.size());
		ps.close();
		con.close();
		rs.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	public MemberVO one(String id) {
		System.out.println(id);
		MemberVO bag=null;
		//자바에서 DBMS를 연결하려고 함.
		//JDBC 프로그래밍 절차
		//4단계 절차
		//1. 드라이버 설정 - 드라이버 (커넥터 로딩)
		//db의 유형, 버전에 따라 매우 많음
		//필요할 때 다운로드 받아 써야 함.
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		 // 특정한 위치에 있는 드라이버 파일을 램에 읽어들여 설정
		System.out.println("1. 드라이버 설정 성공.@@@");
		
		//2. db연결mySQL: school,oracle: xe
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		Connection con = DriverManager.getConnection(url, user, password);
		System.out.println("2. db 연결 성공.@@@@@@@");
		// 연결 STREAM(강물)
		//3. sql문을 만든다.
		String sql = "select * from member where id= ?";
		PreparedStatement ps= con.prepareStatement(sql);
		ps.setString(1, id);// index번 물음표에 id에 저장해놓은 값을 스트링으로 넣어줘!
		
		System.out.println("3. sql문 생성 성공.@@@@");
		//스트링 문을 sql로 인식하도록 준비된 문장을 사용
		//준비된 문장
		//String site="http://www.naver.com";
		//Url urㅣ = new Url(site);
		
		//4. sql문을 db서버에 보낸다.---> 결과가 어떻게 되었는지 자바프로그램에 알려줌
		// read select의 결과는 table,cud insert upadate delete의 결과는 숫자(실행된 row 수) 
		ResultSet rs=ps.executeQuery();//
		
		//System.out.println("4. sql문 db서버로 보내기 성공.read" +result.next());
		if (rs.next()==true) {//검색 결과값이 있으면 
			System.out.println("검색결과가 있음.");
			String id2 = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString(3);
			String tel = rs.getString(4);
			System.out.println("검색한 결과 >>"+id2+ " "+pw+" "+name+" "+tel);
			//UI에서 사용자가 검색한 결과를 볼 수 있어야 한다.
			// 4개의 데이터를 UI에게 return!! 해주자.
			//가방을 만들어서
			bag = new MemberVO();
			//데이터를 담아서
			bag.setId(id2);
			bag.setPw(pw);
			bag.setName(name);
			bag.setTel(tel);
			// UI에 전달
		}
		
		ps.close();
		con.close();
		rs.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return bag;
	}//one
	// 기능 하나만 메서드 구현 (검색 1명 기능 - row 1개)
	public int login(MemberVO bag) {
		System.out.println(bag);
		int result =0;//0인 경우 실패
		//자바에서 DBMS를 연결하려고 함.
		//JDBC 프로그래밍 절차
		//4단계 절차
		//1. 드라이버 설정 - 드라이버 (커넥터 로딩)
		//db의 유형, 버전에 따라 매우 많음
		//필요할 때 다운로드 받아 써야 함.
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		 // 특정한 위치에 있는 드라이버 파일을 램에 읽어들여 설정
		System.out.println("1. 드라이버 설정 성공.@@@");
		
		//2. db연결mySQL: school,oracle: xe
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		Connection con = DriverManager.getConnection(url, user, password);
		System.out.println("2. db 연결 성공.@@@@@@@");
		// 연결 STREAM(강물)
		//3. sql문을 만든다.
		String sql = "select * from member where id= ? and pw = ?";
		PreparedStatement ps= con.prepareStatement(sql);
		ps.setString(1, bag.getId());// index번 물음표에 id에 저장해놓은 값을 스트링으로 넣어줘!
		ps.setString(2, bag.getPw());// index번 물음표에 pw에 저장해놓은 값을 스트링으로 넣어줘!
		
		System.out.println("3. sql문 생성 성공.@@@@");
		//스트링 문을 sql로 인식하도록 준비된 문장을 사용
		//준비된 문장
		//String site="http://www.naver.com";
		//Url urㅣ = new Url(site);
		
		//4. sql문을 db서버에 보낸다.---> 결과가 어떻게 되었는지 자바프로그램에 알려줌
		// read select의 결과는 table,cud insert upadate delete의 결과는 숫자(실행된 row 수) 
		ResultSet rs=ps.executeQuery();// table 형태의 결과값을 받는 과정
		
		//System.out.println("4. sql문 db서버로 보내기 성공.read" +result.next());
		if (rs.next()) {//검색 결과값이 있으면 
			System.out.println("id pw 일치.");
			result=1;
			//UI에서 사용자가 검색한 결과를 볼 수 있어야 한다.
			// 4개의 데이터를 UI에게 return!! 해주자.
			//가방을 만들어서
			
			//데이터를 담아서
		
			// UI에 전달
		}
		
		ps.close();
		con.close();
		rs.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}//ONE
	//가입기능
	public void insert(MemberVO bag) {

		//자바에서 DBMS를 연결하려고 함.
		//JDBC 프로그래밍 절차
		//4단계 절차
		//1. 드라이버 설정 - 드라이버 (커넥터 로딩)
		//db의 유형, 버전에 따라 매우 많음
		//필요할 때 다운로드 받아 써야 함.
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		 // 특정한 위치에 있는 드라이버 파일을 램에 읽어들여 설정
		System.out.println("1. 드라이버 설정 성공.@@@");
		
		//2. db연결mySQL: school,oracle: xe
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		Connection con = DriverManager.getConnection(url, user, password);
		System.out.println("2. db 연결 성공.@@@@@@@");
		// 연결 STREAM(강물)
		//3. sql문을 만든다.
		String sql = "insert into member values (?, ?, ?, ?)";
		PreparedStatement ps= con.prepareStatement(sql);
		ps.setString(1, bag.getId());// index번 물음표에 id에 저장해놓은 값을 스트링으로 넣어줘!
		ps.setString(2, bag.getPw());// 타입에 따라 달라짐 정수면 setInteger
		ps.setString(3, bag.getName());
		ps.setString(4, bag.getTel());
		System.out.println("3. sql문 생성 성공.@@@@");
		//스트링 문을 sql로 인식하도록 준비된 문장을 사용
		//준비된 문장
		//String site="http://www.naver.com";
		//Url urㅣ = new Url(site);
		
		//4. sql문을 db서버에 보낸다.---> 결과가 어떻게 되었는지 자바프로그램에 알려줌
		// read select의 결과는 table,cud insert upadate delete의 결과는 숫자(실행된 row 수) 
		String result2;
		result2 = "실패";
		try {
			int result =ps.executeUpdate();
			System.out.println("4. sql문 db서버로 보내기 성공.insert" +result);
			if (result ==1) {
				result2="성공";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(result2);
		ps.close();
		con.close();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}//insert end
	//기능 하나당 메써드 하나 구현 (탈퇴기능)
	public void delete(MemberVO bag) {

		//자바에서 DBMS를 연결하려고 함.
		//JDBC 프로그래밍 절차
		//4단계 절차
		//1. 드라이버 설정 - 드라이버 (커넥터 로딩)
		//db의 유형, 버전에 따라 매우 많음
		//필요할 때 다운로드 받아 써야 함.
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		 // 특정한 위치에 있는 드라이버 파일을 램에 읽어들여 설정
		System.out.println("1. 드라이버 설정 성공.@@@");
		
		//2. db연결mySQL: school,oracle: xe
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		Connection con = DriverManager.getConnection(url, user, password);
		System.out.println("2. db 연결 성공.@@@@@@@");
		// 연결 STREAM(강물)
		//3. sql문을 만든다.
		String sql = "delete from member where id= ?";
		PreparedStatement ps= con.prepareStatement(sql);
		ps.setString(1, bag.getId());// index번 물음표에 id에 저장해놓은 값을 스트링으로 넣어줘!
		
		System.out.println("3. sql문 생성 성공.@@@@");
		//스트링 문을 sql로 인식하도록 준비된 문장을 사용
		//준비된 문장
		//String site="http://www.naver.com";
		//Url urㅣ = new Url(site);
		
		//4. sql문을 db서버에 보낸다.---> 결과가 어떻게 되었는지 자바프로그램에 알려줌
		// read select의 결과는 table,cud insert upadate delete의 결과는 숫자(실행된 row 수) 
		int result =ps.executeUpdate();
		System.out.println("4. sql문 db서버로 보내기 성공.delete" +result);
		ps.close();
		con.close();
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
