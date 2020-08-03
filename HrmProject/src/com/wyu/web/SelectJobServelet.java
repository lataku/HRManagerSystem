package com.wyu.web;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.wyu.mapper.JobMapper;
import com.wyu.pojo.Job;
import com.wyu.pojo.JobExample;
import com.wyu.pojo.JobExample.Criteria;

/**
 * Servlet implementation class SelectJobServelet
 */
@WebServlet("/SelectJobServelet")
public class SelectJobServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectJobServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		SqlSession session = getSqlSession();
		JobMapper jobMapper = session.getMapper(JobMapper.class);
		JobExample jobExample = new JobExample();
		Criteria criteria = jobExample.createCriteria();
		
		criteria.andJidIsNull();
		List<Job> jobList = jobMapper.selectByExample(jobExample);
		jobList.forEach(li->System.out.println(li));
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public static SqlSession getSqlSession() throws IOException {
		//		1.读取核心mybatis配置文件(在内存中只是流的方式)
				String config ="mybatis/SqlMapConfig.xml";
						InputStream  is = Resources.getResourceAsStream(config);
		
		//		2.创建SqlSessionFactory对象，此对象可以完成对配置文件的读取
		
				SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(is);
		
		//		3.创建SqlSession对象,该对象的作用是调用mapper文件进行数据操作(一定要先引mapper)
				SqlSession session = sf.openSession(true); // true自动提交
		return session;
	}
}
