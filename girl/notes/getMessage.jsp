<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*"%>
<%
  try{
     File fp=new File("message/message.txt");
     FileInputStream fistream=new FileInputStream(fp);
     BufferedReader br = new BufferedReader(new InputStreamReader(fistream, "utf-8"));
	 String line = null;
	 StringBuffer sb = new StringBuffer("");
	while((line = br.readLine()) != null){
		sb.insert(0,line + "\n");
		
	}
	out.print(sb.toString());
  }catch(IOException e) {
		   e.printStackTrace();   
  } finally {   
	   try {   
		   out.close();   
	   } catch (IOException e) {   
		   e.printStackTrace();   
	   }   
   }
%>