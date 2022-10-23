package aa.logon01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Vector;

import org.apache.catalina.tribes.MessageListener;

import oracle.jdbc.proxy.annotation.Pre;
import aa.loader.JdbcUtil;

public class LogonDBBean {
	
	//singleTon Pattern => 사용법 : LongDBBean m = LogonDBBean.getInstance();
	private static LogonDBBean instance= new LogonDBBean();		//LogonDataBean 객체 생성
	
	
	public static LogonDBBean getInstance() {		//생성된 LogonDataBean 객체 리턴
		return instance;
	}
	
	private LogonDBBean () {}  //LogonDBBean 생성자 정의 - 외부접근 방지 : private
	
	
	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:apache:commons:dbcp:/pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	

	
	//inputPro.jsp에서 회원가입 할 때 사용
	public void insertMember(LogonDataBean memebr) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"insert into members01(id, passwd, name, jumin1, jumin2, email, blog, reg_date) values (?,?,?,?,?,?,?,?)");
			
			pstmt.setString(1, memebr.getId());
			pstmt.setString(2, memebr.getPasswd());
			pstmt.setString(3, memebr.getName());
			pstmt.setString(4, memebr.getJumin1());
			pstmt.setString(5, memebr.getJumin2());
			pstmt.setString(6, memebr.getEmail());
			pstmt.setString(7, memebr.getBlog());
			pstmt.setTimestamp(8, memebr.getReg_date());
			
			pstmt.executeUpdate();	// SELECT 구문이 아니라 executeUpdate(). 행결과로 int 값 반환
		
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	
	
	//loginPro.jsp에서 로그온을 시도 시 사용자 확인할 때 호출 ௹💌💢💥💫🤎💖
	public int userCheck(String id, String passwd) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select passwd from members01 where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("passwd");
				
				if(dbpasswd.equals(passwd)) {
					x = 1; 	// 인증 성공
				} else {
					x = 0;	//비밀번호 틀림
				}
				
			} else {
				x = -1;		//해당 아이디 없음
			}
		
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return x;
	}
	
	
	
	//confirmId.jsp에서 ID를 체크할 때 사용
	public int confirmId(String id) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select id from members01 where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				x = 1;	// 해당 아이디 있음
			} else {
				x = -1;	//해당 아이디 없음
			}
					
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return x;
	}

	
	
	//updateMember.jsp에서 수정폼에 기존 입력된 회원의 정보를 보여줄 떄 사용
	public LogonDataBean getMember(String id) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogonDataBean member = new LogonDataBean();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from members01 where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			member.setId(rs.getString("id"));
			member.setPasswd(rs.getString("passwd"));
			member.setName(rs.getString("name"));
			member.setJumin1(rs.getString("jumin1"));
			member.setJumin2(rs.getString("jumin2"));
			member.setEmail(rs.getString("email"));
			member.setBlog(rs.getString("blog"));
			member.setReg_date(rs.getTimestamp("reg_date"));
		
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return member;
	}
	
	
	
	/*//회원 리스트 출력
	public List<LogonDataBean> getMemberList(int firstRow, int endRow) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<LogonDataBean> messageList = null;
		LogonDataBean member = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select id, name, passwd, jumin1, jumin2, email, blog, reg_date, zipcode, address from "
				  + " (select rownum rnum, id, name, pass, jumin1, jumin2, email, blog, reg_date, zipcode, address from "
				  + " (select * from members01 m order by m.id desc where rownum <= ?) where rnum >= ?");
			pstmt.setInt(1, endRow);
			pstmt.setInt(1, firstRow);
			rs = pstmt.executeQuery();
			
				if (rs.next()) {
					messageList = new ArrayList<LogonDataBean>();
					
					do {
						member = new LogonDataBean();
							member.setId(rs.getString("id"))
					}
					
					
					
				}
					
		}
	}
	
	
	
	//입력된 행의 수 모두 가저오기
	public int selectCount() throws Exception{
		
	}*/
	
	
	
	//updateMember.jsp에서 수정폼에서 수정된 값 저장
	public void updateMember(LogonDataBean member) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"update members01 set passwd=?, name=?, email=?, blog=?, zipcode=?, address=? where id=?");
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(1, member.getName());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getBlog());
			pstmt.setString(4, member.getZipcode());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getId());
			
			pstmt.executeUpdate();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
	}
	
	
	
	//회원 정보 삭제
	public int deleteMember(String id, String passwd) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from members01 where id=? ");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				
				if(dbpasswd.equals(passwd)) {
					pstmt = conn.prepareStatement("delete from members01 where id = ?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x = 1;	// 비밀번호 일치, 탈퇴 성공
				} else
					x = 0;	// 비밀번호 불일치, 탈퇴 실패
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return x;
	}
	
	
	
	//우편번호 가저오기
	public Vector zipcodeRead(String area3) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<ZipcodeBean> vecList = new Vector<ZipcodeBean>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from zipcode where area3 like '%"+area3+"%'");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {	//찾을 떄까지 반복
				ZipcodeBean tempZip = new ZipcodeBean();
					tempZip.setZipcode(rs.getString("zipcode"));
					tempZip.setArea1(rs.getString("area1"));
					tempZip.setArea2(rs.getString("area2"));
					tempZip.setArea3(rs.getString("area3"));
					tempZip.setArea4(rs.getString("area4"));
					
					vecList.addElement(tempZip);
			}
		
		} catch (Exception ex) {
			System.out.println("예외 발생 : " +ex);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return vecList;
	}
}





























