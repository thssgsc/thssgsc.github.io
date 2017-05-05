<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.regex.*"%>
 <html>
<head>
</head>
<body>
<%
	BufferedWriter writeFile  = null;
  try{
	 request.setCharacterEncoding("UTF-8");
  	 String name = request.getParameter("name");
	 String message = request.getParameter("message");
out.print(name);
		 	 out.print(message);
	String regEx_script="<script[^>]*?>[\\s\\S]*?<\\/script>"; //定义script的正则表达式 
	String regEx_style="<style[^>]*?>[\\s\\S]*?<\\/style>"; //定义style的正则表达式 
	String regEx_html="<[^>]+>"; //定义HTML标签的正则表达式 
	
	Pattern p_script=Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE); 
	Matcher m_script=p_script.matcher(name); 
	name=m_script.replaceAll(""); //过滤script标签 
	
	Pattern p_style=Pattern.compile(regEx_style,Pattern.CASE_INSENSITIVE); 
	Matcher m_style=p_style.matcher(name); 
	name=m_style.replaceAll(""); //过滤style标签 
	
	Pattern p_html=Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE); 
	Matcher m_html=p_html.matcher(name); 
	name=m_html.replaceAll(""); //过滤html标签 
	
	 p_script=Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE); 
	 m_script=p_script.matcher(message); 
	message=m_script.replaceAll(""); //过滤script标签 
	
	 p_style=Pattern.compile(regEx_style,Pattern.CASE_INSENSITIVE); 
	 m_style=p_style.matcher(message); 
	message=m_style.replaceAll(""); //过滤style标签 
	
	 p_html=Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE); 
	 m_html=p_html.matcher(message); 
	message=m_html.replaceAll(""); //过滤html标签 
		
	 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
	 String date = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
	 String file = "message/message.txt";
	 	 out.print(name);
		 	 out.print(message);
	 writeFile = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file, true), "utf-8"));   
     writeFile.write(name + "#" + message  + "#" + date + "\n");   
	 out.print("success");
	 writeFile.close();
  }catch(IOException e) {
     out.println("文件读取错误！");
  } finally {   
	   try {   
		   out.close();   
		   writeFile.close();
	   } catch (IOException e) {   
		   e.printStackTrace();   
	   }   
   }
%>
</body>
</html>