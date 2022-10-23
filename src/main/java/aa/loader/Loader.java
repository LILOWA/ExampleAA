package aa.loader;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import java.util.StringTokenizer;

public class Loader extends HttpServlet { //HttpServlet 상속 받은 서블리 Loader

	@Override
	public void init(ServletConfig config) throws ServletException {	//init(ServletConfig config) 오버라이드
			  //ServletConfig(web.xml) 객체 config 받아 생성
		try { 
			String driver = config.getInitParameter("jdbcdriver");	//jdbcdriver 파라미터값 읽어들이기
			StringTokenizer st = new StringTokenizer(driver, ",");	//StringTokenizer객체를 이용해 driver 문자열의 , 로 구분
			
			while(st.hasMoreTokens()) {		//만약 더 읽어들일 객체가 있다면
				String jdbcDriver = st.nextToken();	// jdbcDriver 라고 설정
				Class.forName(jdbcDriver);
			}
		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	}
}