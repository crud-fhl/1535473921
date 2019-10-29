package com.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Address;
import com.entity.Meeting;
import com.entity.Notice;
import com.entity.Schedule;
import com.entity.Sms;
import com.entity.User;
import com.entity.Worklog;
import com.service.UserService;
import com.util.Page;

@Controller
public class UserController {	
	@Resource
	private UserService us;
	/*未登录拦截*/
	@RequestMapping("/errlogin")
	public String errlogin(){
		return "401";
	}
	/*申请权限*/
	@RequestMapping("/sys/qrole")
	public String qRole(HttpSession session){
		User user=(User) session.getAttribute("user");
		int id=user.getId();
		String sender=user.getUsername();
		Sms sms=new Sms(id, "admin", sender, "申请权限", null, "0");
		us.addSms(sms);
		return "user/frame";
	}
	/*权限功能拦截*/
	@RequestMapping("/errRole")
	public String errRole(){
		return "user/401";
	}
	/*登陆*/
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	/*登陆*/
	@RequestMapping("/doregister")
	public String doregister(User user,@RequestParam(value="username",required=false) String username,Model model,HttpSession session){
		if(us.queryuser(username)){
			if(us.addUser(user)){
				session.setAttribute("success","注册成功 现在可以登陆");
				return "/login";
			}
			session.setAttribute("error","注册失败");
			return "redirect:/login";
		}else{
			session.setAttribute("error","用户名已存在");
			return "redirect:/login";
		}
	}
	/*登陆响应*/
	@RequestMapping(value="/dologin",method=RequestMethod.POST)
	public String doLogin(HttpSession session,@RequestParam String username,@RequestParam(value="password") String password){
		User user = us.login(username, password);
		if(user != null){
			session.setAttribute("user", user);
			session.setAttribute("error","");
			session.setAttribute("success","");
			return "redirect:/sys/frame";
		}else{
			session.setAttribute("error","用户名或密码错误");
			return "redirect:/login";
		}		
	}
	/*登陆后界面*/
	@RequestMapping("/sys/frame")
	public String frame(){		
		return "user/frame";
	}
	/*通讯录*/
	@RequestMapping(value="/sys/address",method=RequestMethod.GET)
	public String address(@RequestParam(value="pageIndex",required=false)Integer currPageNo,
			@RequestParam(value="username",required=false) String username,
			@RequestParam(value="queryname",required=false) String name,
			@RequestParam(value="querymobile",required=false) String mobile,Model model,
			HttpSession session){
		User user=(User) session.getAttribute("user");/*获取当前session*/
		username=user.getUsername();/*获取当前用户*/
		Page page = new Page();
		if(currPageNo==null){
	        currPageNo=1;//判断当前页是否为空
	    }
		int totalCount = us.totalCount(username, name, mobile);
		page.setTotalCount(totalCount);
		if(page.getTotalPage()>0){		
			if(currPageNo>=page.getTotalPage()){
	    		currPageNo=page.getTotalPage();
	    	}
		}		
	    page.setCurrPageNo(currPageNo);	    
	    List<Address> addresslist=us.find(username, name, mobile, currPageNo, page.getSize());
	    model.addAttribute("addressList",addresslist);
	    model.addAttribute("Page", page);
	    model.addAttribute("queryname", name);
	    model.addAttribute("querymobile", mobile);
		return "user/addresslist";
	}
	/*用户管理*/
	@RequestMapping(value="/sys/user",method=RequestMethod.GET)
	public String user(@RequestParam(value="pageIndex",required=false)Integer currPageNo,			
			@RequestParam(value="queryusername",required=false) String username,
			@RequestParam(value="queryrole",required=false) String role,Model model,
			HttpSession session){
		Page page = new Page();
		if(currPageNo==null){
	        currPageNo=1;
	    }
		int totalCount = us.totalU(username, role);
		page.setTotalCount(totalCount);
		if(page.getTotalPage()>0){		
			if(currPageNo>=page.getTotalPage()){
	    		currPageNo=page.getTotalPage();
	    	}
		}		
	    page.setCurrPageNo(currPageNo);
	    List<User> userList=us.findU(username, role, currPageNo, page.getSize());
	    model.addAttribute("Page", page);
	    model.addAttribute("userList",userList);
	    model.addAttribute("queryusername", username);
	    model.addAttribute("queryrole", role);
		return "user/userlist";
	}
	/*会议管理*/
	@RequestMapping(value="/sys/meeting",method=RequestMethod.GET)
	public String meeting(@RequestParam(value="pageIndex",required=false)Integer currPageNo,
			@RequestParam(value="querysender",required=false) String sender,
			@RequestParam(value="queryaddress",required=false) String address,
			@RequestParam(value="querytitle",required=false) String title,Model model,
			HttpSession session){
		Page page = new Page();
		if(currPageNo==null){
	        currPageNo=1;//判断当前页是否为空
	    }
		int totalCount = us.totalM(sender, address, title);
		page.setTotalCount(totalCount);
		if(page.getTotalPage()>0){		
			if(currPageNo>=page.getTotalPage()){
	    		currPageNo=page.getTotalPage();
	    	}
		}		
	    page.setCurrPageNo(currPageNo);	    
	    List<Meeting> meetinglist=us.findM(sender, address, title, currPageNo, page.getSize());
	    model.addAttribute("meetingList",meetinglist);
	    model.addAttribute("Page", page);
	    model.addAttribute("querysender", sender);
	    model.addAttribute("queryaddress", address);
	    model.addAttribute("querytitle", title);
		return "meeting/meetinglist";
	}
	/*公告管理*/
	@RequestMapping(value="/sys/notice",method=RequestMethod.GET)
	public String notice(@RequestParam(value="pageIndex",required=false)Integer currPageNo,
			@RequestParam(value="querysender",required=false) String sender,
			@RequestParam(value="querytitle",required=false) String title,Model model,
			HttpSession session){
		Page page = new Page();
		if(currPageNo==null){
	        currPageNo=1;//判断当前页是否为空
	    }
		int totalCount = us.totalN(sender, title);
		page.setTotalCount(totalCount);
		if(page.getTotalPage()>0){		
			if(currPageNo>=page.getTotalPage()){
	    		currPageNo=page.getTotalPage();
	    	}
		}		
	    page.setCurrPageNo(currPageNo);	    
	    List<Notice> noticelist=us.findN(sender, title, currPageNo, page.getSize());
	    model.addAttribute("noticeList",noticelist);
	    model.addAttribute("Page", page);
	    model.addAttribute("querysender", sender);
	    model.addAttribute("querytitle", title);
		return "notice/noticelist";
	}
	/*日程安排*/
	@RequestMapping(value="/sys/schedule",method=RequestMethod.GET)
	public String schedule(@RequestParam(value="pageIndex",required=false)Integer currPageNo,
			@RequestParam(value="username",required=false) String username,
			@RequestParam(value="queryday",required=false) Integer day,
			@RequestParam(value="queryplan",required=false) String plan,Model model,
			HttpSession session){
		User user=(User) session.getAttribute("user");/*获取当前session*/
		username=user.getUsername();/*获取当前用户*/
		Page page = new Page();
		if(currPageNo==null){
	        currPageNo=1;//判断当前页是否为空
	    }
		int totalCount = us.totalS(username, day, plan);
		page.setTotalCount(totalCount);
		if(page.getTotalPage()>0){		
			if(currPageNo>=page.getTotalPage()){
	    		currPageNo=page.getTotalPage();
	    	}
		}		
	    page.setCurrPageNo(currPageNo);	    
	    List<Schedule> schedulelist=us.findS(username, day, plan, currPageNo, page.getSize());
	    model.addAttribute("scheduleList",schedulelist);
	    model.addAttribute("Page", page);
	    model.addAttribute("queryday", day);
	    model.addAttribute("queryplan", plan);
		return "schedule/schedulelist";
	}
	/*工作日志*/
	@RequestMapping(value="/sys/worklog",method=RequestMethod.GET)
	public String worklog(@RequestParam(value="pageIndex",required=false)Integer currPageNo,
			@RequestParam(value="username",required=false) String username,
			@RequestParam(value="queryday",required=false) Integer day,
			@RequestParam(value="querytitle",required=false) String title,Model model,
			HttpSession session){
		User user=(User) session.getAttribute("user");/*获取当前session*/
		username=user.getUsername();/*获取当前用户*/
		Page page = new Page();
		if(currPageNo==null){
	        currPageNo=1;//判断当前页是否为空
	    }
		int totalCount = us.totalW(username, day, title);
		page.setTotalCount(totalCount);
		if(page.getTotalPage()>0){		
			if(currPageNo>=page.getTotalPage()){
	    		currPageNo=page.getTotalPage();
	    	}
		}		
	    page.setCurrPageNo(currPageNo);	    
	    List<Worklog> workloglist=us.findW(username, day, title, currPageNo, page.getSize());
	    model.addAttribute("worklogList",workloglist);
	    model.addAttribute("Page", page);
	    model.addAttribute("queryday", day);
	    model.addAttribute("querytitle", title);
		return "worklog/workloglist";
	}
	/*工作日志*/
	@RequestMapping(value="/sys/sms",method=RequestMethod.GET)
	public String sms(@RequestParam(value="pageIndex",required=false)Integer currPageNo,
			@RequestParam(value="username",required=false) String username,
			@RequestParam(value="querysender",required=false) String sender,
			@RequestParam(value="queryisRead",required=false) String isRead,Model model,
			HttpSession session){
		User user=(User) session.getAttribute("user");/*获取当前session*/
		username=user.getUsername();/*获取当前用户*/
		Page page = new Page();
		if(currPageNo==null){
	        currPageNo=1;//判断当前页是否为空
	    }
		int totalCount = us.totalSms(username, sender, isRead);
		page.setTotalCount(totalCount);
		if(page.getTotalPage()>0){		
			if(currPageNo>=page.getTotalPage()){
	    		currPageNo=page.getTotalPage();
	    	}
		}		
	    page.setCurrPageNo(currPageNo);	    
	    List<Sms> smslist=us.findSms(username, sender, isRead, currPageNo, page.getSize());
	    model.addAttribute("smsList",smslist);
	    model.addAttribute("Page", page);
	    model.addAttribute("querysender", sender);
	    model.addAttribute("queryisRead", isRead);
		return "sms/smslist";
	}
	/*添加通讯录*/
	@RequestMapping(value="/sys/addressadd",method=RequestMethod.GET)
	public String addressAdd(){
		return "user/addressadd";
	}
	/*储存添加通讯录*/
	@RequestMapping(value="/sys/saveaddressadd",method=RequestMethod.POST)
	public String saveaddressAdd(Address address,HttpServletRequest request){
		if(us.addAddress(address)){
			return "redirect:/sys/address";
		}else{
			request.setAttribute("message", "添加失败！");
			return "user/addressadd";
		}
		
	}
	/*修改通讯录*/
	@RequestMapping("/sys/addressmdf")
	public String addressMdf(@RequestParam(value="aid")Integer aid,Model model){
		Address address = us.viewAddress(aid);
		model.addAttribute("address", address);
		return "user/addressmdf";
	}
	/*储存修改通讯录*/
	@RequestMapping(value="/sys/saveaddressmdf")
	public String savaaddressMdf(Address address,@RequestParam(value="aid")Integer aid,HttpServletRequest request){
		address.setAid(us.viewAddress(aid).getAid());
		if(us.mdfAddress(address)){
			return "redirect:/sys/address";
		}else {
			request.setAttribute("message", "修改失败！");
			return "user/addressmdf";
		}
		
	}
	/*删除联系人*/
	@RequestMapping(value="/sys/addressdel")
	public String addressdel(@RequestParam(value="aid") Integer aid){
		if(us.delAddress(aid)){
			return "redirect:/sys/address";
		}else{
			return "";
		}
		
	}
	/*添加日程*/
	@RequestMapping(value="/sys/scheduleadd",method=RequestMethod.GET)
	public String scheduleAdd(){
		return "schedule/scheduleadd";
	}
	/*储存添加日程*/
	@RequestMapping(value="/sys/savescheduleadd",method=RequestMethod.POST)
	public String savescheduleAdd(Schedule schedule,HttpServletRequest request){
		if(us.addSchedule(schedule)){
			return "redirect:/sys/schedule";
		}else{
			request.setAttribute("message", "添加失败！");
			return "schedule/scheduleadd";
		}
		
	}
	/*修改日程*/
	@RequestMapping("/sys/schedulemdf")
	public String scheduleMdf(@RequestParam(value="sid")Integer sid,Model model){
		Schedule schedule = us.viewSchedule(sid);
		model.addAttribute("schedule", schedule);
		return "schedule/schedulemdf";
	}
	/*储存修改日程*/
	@RequestMapping(value="/sys/saveschedulemdf")
	public String savascheduleMdf(Schedule schedule,@RequestParam(value="sid")Integer sid,HttpServletRequest request){
		schedule.setSid(us.viewSchedule(sid).getSid());
		if(us.mdfSchedule(schedule)){
			return "redirect:/sys/schedule";
		}else {
			request.setAttribute("message", "修改失败！");
			return "schedule/schedulemdf";
		}
		
	}
	/*删除日程*/
	@RequestMapping(value="/sys/scheduledel")
	public String scheduledel(@RequestParam(value="sid") Integer sid){
		if(us.delSchedule(sid)){
			return "redirect:/sys/schedule";
		}else{
			return "";
		}
		
	}
	/*添加日志*/
	@RequestMapping(value="/sys/worklogadd",method=RequestMethod.GET)
	public String worklogAdd(){
		return "worklog/worklogadd";
	}
	/*储存添加日志*/
	@RequestMapping(value="/sys/saveworklogadd",method=RequestMethod.POST)
	public String saveworklogAdd(Worklog worklog,HttpServletRequest request){
		if(us.addWorklog(worklog)){
			return "redirect:/sys/worklog";
		}else{
			request.setAttribute("message", "添加失败！");
			return "worklog/worklogadd";
		}
		
	}
	/*修改日志*/
	@RequestMapping("/sys/worklogmdf")
	public String worklogMdf(@RequestParam(value="wid")Integer wid,Model model){
		Worklog worklog = us.viewWorklog(wid);
		model.addAttribute("worklog", worklog);
		return "worklog/worklogmdf";
	}
	/*储存修改日志*/
	@RequestMapping(value="/sys/saveworklogmdf")
	public String savaworklogMdf(Worklog worklog,@RequestParam(value="wid")Integer wid,HttpServletRequest request){
		worklog.setWid(us.viewWorklog(wid).getWid());
		if(us.mdfWorklog(worklog)){
			return "redirect:/sys/worklog";
		}else {
			request.setAttribute("message", "修改失败！");
			return "worklog/worklogmdf";
		}
		
	}
	/*删除日志*/
	@RequestMapping(value="/sys/worklogdel")
	public String worklogdel(@RequestParam(value="wid") Integer wid){
		if(us.delWorklog(wid)){
			return "redirect:/sys/worklog";
		}else{
			return "";
		}
		
	}
	/*发送短消息*/
	@RequestMapping(value="/sys/smsadd",method=RequestMethod.GET)
	public String smsAdd(Model model){
		List<User> userlist=us.userlist();
		model.addAttribute("userlist", userlist);
		return "sms/smsadd";
	}
	/*储存发送短消息*/
	@RequestMapping(value="/sys/savesmsadd",method=RequestMethod.POST)
	public String savesmsAdd(Sms sms,Model model,HttpServletRequest request){
		if(sms.getUsername() == ""){
			request.setAttribute("message", "未选择接收人！");
			List<User> userlist=us.userlist();
			model.addAttribute("userlist", userlist);
			return "sms/smsadd";
		}else{			
			if(us.addSms(sms)){
				return "redirect:/sys/sms";
				}else{
					request.setAttribute("message", "发送失败！");
					return "sms/smsadd";
				}
		}
		
	}
	/*已读消息*/
	@RequestMapping("/sys/smsmdf")
	public String smsMdf(@RequestParam(value="id")Integer id){
		if(us.mdfSms(id)){
			return "redirect:/sys/sms";
		}
		return "err/error";
	}
	/*回复消息*/
	@RequestMapping("/sys/smsreply")
	public String smsReply(@RequestParam(value="id")Integer id,Model model){
		Sms sms=us.viewSms(id);
		model.addAttribute("sms", sms);
		return "sms/smsreply";
	}
	/*储存回复消息*/
	@RequestMapping("/sys/savesmsreply")
	public String saveSmsReply(Sms sms,HttpServletRequest request){
		if(us.addSms(sms)){
			return "redirect:/sys/sms";
		}else {
			request.setAttribute("message", "修改失败！");
			return "sms/smsreply";
		}
	}
	/*删除短消息*/
	@RequestMapping(value="/sys/smsdel")
	public String smsdel(@RequestParam(value="id") Integer id){
		if(us.delSms(id)){
			return "redirect:/sys/sms";
		}else{
			return "";
		}
		
	}
	/*添加用户*/
	@RequestMapping(value="/sys/role/useradd",method=RequestMethod.GET)
	public String userAdd(){
		return "user/useradd";
	}
	/*储存添加用户*/
	@RequestMapping(value="/sys/role/saveuseradd",method=RequestMethod.POST)
	public String saveuserAdd(User user,HttpServletRequest request){
		if(us.addUser(user)){
			return "redirect:/sys/user";
		}else{
			request.setAttribute("message", "添加失败！");
			return "user/useradd";
		}
		
	}
	/*修改用户*/
	@RequestMapping("/sys/role/usermdf")
	public String userMdf(@RequestParam(value="id")Integer id,Model model){
		User user = us.viewUser(id);
		model.addAttribute("User", user);
		return "user/usermdf";
	}
	/*储存修改用户*/
	@RequestMapping(value="/sys/role/saveusermdf")
	public String savauserMdf(User user,@RequestParam(value="id")Integer id,HttpServletRequest request){
		user.setId(us.viewUser(id).getId());
		if(us.mdfUser(user)){
			return "redirect:/sys/user";
		}else {
			request.setAttribute("message", "修改失败！");
			return "user/usermdf";
		}		
	}
	/*删除用户*/
	@RequestMapping(value="/sys/role/userdel")
	public String userdel(@RequestParam(value="delId") Integer delId,HttpSession session){
		User user=(User) session.getAttribute("user");/*获取当前session*/
		if(delId.equals(user.getId())){
			return "user/duser";
		}else if(us.delUser(delId)){
			return "redirect:/sys/user";
		}else{
			return "user/duser";
		}
		
	}
	/*添加会议*/
	@RequestMapping(value="/sys/role/meetingadd",method=RequestMethod.GET)
	public String meetingAdd(){
		return "meeting/meetingadd";
	}
	/*储存添加会议*/
	@RequestMapping(value="/sys/role/savemeetingadd",method=RequestMethod.POST)
	public String savemeetingAdd(Meeting meeting,HttpServletRequest request){
		if(us.addMeeting(meeting)){
			return "redirect:/sys/meeting";
		}else{
			request.setAttribute("message", "添加失败！");
			return "meeting/meetingadd";
		}
	}
	/*修改会议*/
	@RequestMapping("/sys/role/meetingmdf")
	public String meetingMdf(@RequestParam(value="mid")Integer mid,Model model){
		Meeting meeting = us.viewMeeting(mid);
		model.addAttribute("meeting", meeting);
		return "meeting/meetingmdf";
	}
	/*储存修改会议*/
	@RequestMapping(value="/sys/role/savemeetingmdf")
	public String savameetingMdf(Meeting meeting,@RequestParam(value="mid")Integer mid,HttpServletRequest request){
		meeting.setMid(us.viewMeeting(mid).getMid());
		if(us.mdfMeeting(meeting)){
			return "redirect:/sys/meeting";
		}else {
			request.setAttribute("message", "修改失败！");
			return "meeting/meetingmdf";
		}		
	}
	/*取消会议*/
	@RequestMapping(value="/sys/role/meetingdel")
	public String meetingdel(@RequestParam(value="mid") Integer mid){		
		if(us.delMeeting(mid)){
			return "redirect:/sys/meeting";
		}else{
			return "meeting/duser";
		}
		
	}
	
	/*添加公告*/
	@RequestMapping(value="/sys/role/noticeadd",method=RequestMethod.GET)
	public String noticeAdd(){
		return "notice/noticeadd";
	}
	/*储存添加公告*/
	@RequestMapping(value="/sys/role/savenoticeadd",method=RequestMethod.POST)
	public String savenoticeAdd(Notice notice,HttpServletRequest request){
		if(us.addNotice(notice)){
			return "redirect:/sys/notice";
		}else{
			request.setAttribute("message", "添加失败！");
			return "notice/noticeadd";
		}
	}
	/*修改公告*/
	@RequestMapping("/sys/role/noticemdf")
	public String noticeMdf(@RequestParam(value="nid")Integer nid,Model model){
		Notice notice = us.viewNotice(nid);
		model.addAttribute("notice", notice);
		return "notice/noticemdf";
	}
	/*储存修改公告*/
	@RequestMapping(value="/sys/role/savenoticemdf")
	public String savanoticeMdf(Notice notice,@RequestParam(value="nid")Integer nid,HttpServletRequest request){
		notice.setNid(us.viewNotice(nid).getNid());
		if(us.mdfNotice(notice)){
			return "redirect:/sys/notice";
		}else {
			request.setAttribute("message", "修改失败！");
			return "notice/noticemdf";
		}		
	}
	/*取消公告*/
	@RequestMapping(value="/sys/role/noticedel")
	public String noticedel(@RequestParam(value="nid") Integer nid){		
		if(us.delNotice(nid)){
			return "redirect:/sys/notice";
		}else{
			return "notice/duser";
		}
		
	}
	/*修改密码*/
	@RequestMapping("/sys/pwdmdf")
	public String pwdModify(){
		return "user/pwdmdf";		
	}
	
	/*存储新密码*/
	@RequestMapping("/sys/savepwdmdf")
	public String savepwdModify(@RequestParam String oldpassword,@RequestParam(value="newpassword") String newpassword,HttpSession session,HttpServletRequest request){
		String sessionPwd = ((User)session.getAttribute("user")).getPassword();
		Object obj = session.getAttribute("user");
		 if(oldpassword.equals(sessionPwd)){
			 if(obj !=null&&newpassword!=null){            
				 if(us.updatePwd(((User)obj).getId(), newpassword)){
					 request.setAttribute("message","修改密码成功");
					 session.removeAttribute("user");
					 return "redirect:/login";
				 }else{
					 request.setAttribute("message", "修改密码失败！");
					 return "user/pwdmdf";
				 }
			 }else{
				 request.setAttribute("message", "修改密码失败");
				 return "user/pwdmdf";
			 }
			 
		 }else{
			 request.setAttribute("message","修改失败原密码不正确");
			 return "user/pwdmdf";
         }
        		
	}
	/*个人信息*/
	@RequestMapping("/sys/person")
	public String person(){
		return "user/person";		
	}
	/*修改个人信息*/
	@RequestMapping("/sys/personmdf")
	public String personmdf(){
		return "user/personmdf";		
	}
	/*储存修改信息*/
	@RequestMapping("/sys/saveperson")
	public String saveperson(HttpSession session,HttpServletRequest request,@RequestParam(value="username",required=false) String username,@RequestParam(value="email",required=false) String email){
		User user=(User) session.getAttribute("user");/*获取当前session*/
		int id=user.getId();
		if(us.updatePerson(id, username, email)){
			request.setAttribute("message","修改成功");
			user.setUsername(username);
			user.setEmail(email);
			return "user/person";
		}else{
			request.setAttribute("message","修改失败");
			return "user/personmdf";
		}
		
	}
	/*退出*/
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("user");
		return "redirect:/login";
	}
}
