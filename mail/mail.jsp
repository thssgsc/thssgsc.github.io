<%@ page contentType="text/html" language="java" errorPage="" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*,javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%

    try{
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String content = request.getParameter("message");

        int department = Integer.parseInt(request.getParameter("department"));

        if(null != name && null != email && null != phone && null != content){
            String qm ="thss_yhnlb!"; //您的邮箱密码
            String tu = "163.com"; //你邮箱的后缀域名
            String tto="thss_yhshb@163.com"; //接收邮件的邮箱
            String ttitle="清软研会 landing page 来信";
            String departmentName = "";
            switch(department){
                case 0:departmentName = "内联部";break;
                case 1:departmentName = "内联部";break;
                case 2:departmentName = "内联部";break;
                case 3:departmentName = "内联部";break;
                case 4:departmentName = "内联部";break;
                case 5:departmentName = "内联部";break;
                case 6:departmentName = "内联部";break;
                default : departmentName = "随意";
            }
            String tcontent="联系人：" + name + ", 联系邮箱：" + email + ", 联系电话：" + phone +  "，联系部门:" + departmentName +   "，联系内容：" + content;
            Properties props=new Properties();
            props.put("mail.smtp.host","smtp."+tu);//发信的主机，这里我填写的是我们公司的主机！可以不用修改！
            props.put("mail.smtp.auth","true");
            Session s=Session.getInstance(props);
            s.setDebug(true);
            MimeMessage message=new MimeMessage(s);
            //给消息对象设置发件人/收件人/主题/发信时间
            InternetAddress from=new InternetAddress("thss_yhnlb@"+tu); //这里的thss_yhnlb要修改为邮箱名
            message.setFrom(from);
            InternetAddress to=new InternetAddress(tto);
            message.setRecipient(Message.RecipientType.TO,to);
            message.setSubject(tcontent);
            message.setSentDate(new Date());
            //给消息对象设置内容
            BodyPart mdp=new MimeBodyPart();//新建一个存放信件内容的BodyPart对象
            mdp.setContent(tcontent,"text/html;charset=gb2312");//给BodyPart对象设置内容和格式/编码方式
            Multipart mm=new MimeMultipart();//新建一个MimeMultipart对象用来存放BodyPart对
            //象(事实上可以存放多个)
            mm.addBodyPart(mdp);//将BodyPart加入到MimeMultipart对象中(可以加入多个BodyPart)
            message.setContent(mm);//把mm作为消息对象的内容
            message.saveChanges();
            Transport transport=s.getTransport("smtp");
            transport.connect("smtp."+tu,"thss_yhnlb",qm); //这里的thss_yhnlb也要修改为邮箱名
            transport.sendMessage(message,message.getAllRecipients());
            transport.close();
        }else{
            response.sendRedirect("../index.html");
        }
    }catch(Exception e){
        e.printStackTrace();
    }

%>