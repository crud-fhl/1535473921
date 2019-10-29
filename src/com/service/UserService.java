package com.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.Address;
import com.entity.Meeting;
import com.entity.Notice;
import com.entity.Schedule;
import com.entity.Sms;
import com.entity.User;
import com.entity.Worklog;

public interface UserService {
	/*登陆*/
	User login(String username,String password);
	/*注册验证*/
	boolean queryuser(@Param("username")String username);
	/*通讯录*/
	public List<Address> find(@Param("username")String username,@Param("name")String name,@Param("mobile")String mobile,@Param("start")int start,@Param("size")int size);
	/*查询数据总条数*/
	public int totalCount(@Param("username")String username,@Param("name")String name,@Param("mobile")String mobile);
	/*用户*/
	public List<User> findU(@Param("username")String username,@Param("role")String role,@Param("start")int start,@Param("size")int size);
	/*查询用户数据总条数*/
	public int totalU(@Param("username")String username,@Param("role")String role);
	/*会议*/
	public List<Meeting> findM(@Param("sender")String sender,@Param("address")String address,@Param("title")String title,@Param("start")int start,@Param("size")int size);
	/*查询会议数据总条数*/
	public int totalM(@Param("sender")String sender,@Param("address")String address,@Param("title")String title);
	/*公告*/
	public List<Notice> findN(@Param("sender")String sender,@Param("title")String title,@Param("start")int start,@Param("size")int size);
	/*查询公告数据总条数*/
	public int totalN(@Param("sender")String sender,@Param("title")String title);
	/*日程安排计划*/
	public List<Schedule> findS(@Param("username")String username,@Param("day")Integer day,@Param("plan")String plan,@Param("start")int start,@Param("size")int size);
	/*查询日程数据总条数*/
	public int totalS(@Param("username")String username,@Param("day")Integer day,@Param("plan")String plan);
	/*工作日志*/
	public List<Worklog> findW(@Param("username")String username,@Param("day")Integer day,@Param("title")String title,@Param("start")int start,@Param("size")int size);
	/*查询日志数据总条数*/
	public int totalW(@Param("username")String username,@Param("day")Integer day,@Param("title")String title);
	/*短消息*/
	public List<Sms> findSms(@Param("username")String username,@Param("sender")String sender,@Param("isRead")String isRead,@Param("start")int start,@Param("size")int size);
	/*查询短消息数据总条数*/
	public int totalSms(@Param("username")String username,@Param("sender")String sender,@Param("isRead")String isRead);
	/*查询单个通讯录*/
	Address viewAddress(@Param("aid")Integer aid);
	/*添加单个通讯录*/
	boolean addAddress(Address address);
	/*修改单个通讯录*/
	boolean mdfAddress(Address address);
	/*删除联系人*/
	boolean delAddress(Integer aid);
	/*查询用户*/
	User viewUser(@Param("id")Integer id);
	/*添加用户*/
	boolean addUser(User user);
	/*修改用户*/
	boolean mdfUser(User user);
	/*删除用户*/
	boolean delUser(Integer delId);
	/*查询单个会议*/
	Meeting viewMeeting(@Param("mid")Integer mid);
	/*添加会议*/
	boolean addMeeting(Meeting meeting);
	/*修改会议*/
	boolean mdfMeeting(Meeting meeting);
	/*取消会议*/
	boolean delMeeting(Integer mid);
	/*查询日程*/
	Schedule viewSchedule(@Param("sid")Integer sid);
	/*添加日程*/
	boolean addSchedule(Schedule schedule);
	/*修改日程*/
	boolean mdfSchedule(Schedule schedule);
	/*删除日程*/
	boolean delSchedule(Integer sid);
	/*查询日志*/
	Worklog viewWorklog(@Param("wid")Integer wid);
	/*添加日志*/
	boolean addWorklog(Worklog worklog);
	/*修改日志*/
	boolean mdfWorklog(Worklog worklog);
	/*删除日志*/
	boolean delWorklog(Integer wid);
	/*查询单个公告*/
	Notice viewNotice(@Param("nid")Integer nid);
	/*添加公告*/
	boolean addNotice(Notice notice);
	/*修改公告*/
	boolean mdfNotice(Notice notice);
	/*取消公告*/
	boolean delNotice(Integer nid);
	/*查询短消息*/
	Sms viewSms(@Param("id")Integer id);
	/*发送短消息*/
	boolean addSms(Sms sms);
	/*查询用户*/
	List<User> userlist();
	/*已读短消息*/
	boolean mdfSms(@Param("id")Integer id);
	/*删除日志*/
	boolean delSms(Integer id);
	/*修改密码*/
	boolean updatePwd(@Param("id")int id,@Param("password")String password);
	/*修改个人信息*/
	boolean updatePerson(@Param("id")int id,@Param("username")String username,@Param("email")String email);
}
