package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dao.user.UserMapper;
import com.entity.Address;
import com.entity.Meeting;
import com.entity.Notice;
import com.entity.Schedule;
import com.entity.Sms;
import com.entity.User;
import com.entity.Worklog;
@Service
public class UserServiceImpl implements UserService{
	@Resource
	private UserMapper um;	
	@Override
	public boolean queryuser(String username) {
		// TODO Auto-generated method stub
		User user =um.login(username);
		if(user != null){
			return false;
		}else{
			return true;
		}
	}
	@Override
	@Transactional(propagation=Propagation.SUPPORTS)
	public User login(String username, String password) {
		// TODO Auto-generated method stub
		User user = um.login(username);
		if(user != null && !user.getPassword().equals(password)){
			user = null;
		}
		return user;
	}
	@Override
	public List<Address> find(String username, String name, String mobile,
			int start, int size) {
		// TODO Auto-generated method stub
		start = (start-1)*size;
		return um.find(username, name, mobile, start, size);
	}
	@Override
	public int totalCount(String username, String name, String mobile) {
		// TODO Auto-generated method stub
		return um.totalCount(username, name, mobile);
	}
	@Override
	public boolean updatePwd(int id, String password) {
		// TODO Auto-generated method stub
		return um.updatePwd(id, password);
	}
	@Override
	public boolean updatePerson(int id, String username, String email) {
		// TODO Auto-generated method stub
		return um.updatePerson(id, username, email);
	}
	@Override
	public Address viewAddress(Integer aid) {
		// TODO Auto-generated method stub
		Address address=um.viewAddress(aid);
		return address;
	}
	@Override
	public boolean mdfAddress(Address address) {
		// TODO Auto-generated method stub
		return um.mdfAddress(address);
	}
	@Override
	public List<User> findU(String username, String role, int start, int size) {
		// TODO Auto-generated method stub
		start = (start-1)*size;
		return um.findU(username, role, start, size);
	}
	@Override
	public int totalU(String username, String role) {
		// TODO Auto-generated method stub
		return um.totalU(username, role);
	}
	@Override
	public boolean addAddress(Address address) {
		// TODO Auto-generated method stub
		return um.addAddress(address);
	}
	@Override
	public User viewUser(Integer id) {
		// TODO Auto-generated method stub
		User user=um.viewUser(id);
		return user;
	}
	@Override
	public boolean addUser(User user) {
		// TODO Auto-generated method stub
		return um.addUser(user);
	}
	@Override
	public boolean mdfUser(User user) {
		// TODO Auto-generated method stub
		return um.mdfUser(user);
	}
	@Override
	public boolean delUser(Integer delId) {
		// TODO Auto-generated method stub
		return um.delUser(delId);
	}
	@Override
	public boolean delAddress(Integer aid) {
		// TODO Auto-generated method stub
		return um.delAddress(aid);
	}
	@Override
	public List<Meeting> findM(String sender, String address, String title,
			int start, int size) {
		// TODO Auto-generated method stub
		start = (start-1)*size;
		return um.findM(sender, address, title, start, size);
	}
	@Override
	public int totalM(String sender, String address, String title) {
		// TODO Auto-generated method stub
		return um.totalM(sender, address, title);
	}
	@Override
	public boolean addMeeting(Meeting meeting) {
		// TODO Auto-generated method stub
		return um.addMeeting(meeting);
	}
	@Override
	public Meeting viewMeeting(Integer mid) {
		// TODO Auto-generated method stub
		Meeting meeting=um.viewMeeting(mid);
		return meeting;
	}
	@Override
	public boolean mdfMeeting(Meeting meeting) {
		// TODO Auto-generated method stub
		return um.mdfMeeting(meeting);
	}
	@Override
	public boolean delMeeting(Integer mid) {
		// TODO Auto-generated method stub
		return um.delMeeting(mid);
	}
	@Override
	public List<Notice> findN(String sender, String title, int start, int size) {
		// TODO Auto-generated method stub
		start = (start-1)*size;
		return um.findN(sender, title, start, size);
	}
	@Override
	public int totalN(String sender, String title) {
		// TODO Auto-generated method stub
		return um.totalN(sender, title);
	}
	@Override
	public Notice viewNotice(Integer nid) {
		// TODO Auto-generated method stub
		Notice notice = um.viewNotice(nid);
		return notice;
	}
	@Override
	public boolean addNotice(Notice notice) {
		// TODO Auto-generated method stub
		return um.addNotice(notice);
	}
	@Override
	public boolean mdfNotice(Notice notice) {
		// TODO Auto-generated method stub
		return um.mdfNotice(notice);
	}
	@Override
	public boolean delNotice(Integer nid) {
		// TODO Auto-generated method stub
		return um.delNotice(nid);
	}
	@Override
	public List<Schedule> findS(String username, Integer day, String plan,
			int start, int size) {
		// TODO Auto-generated method stub
		start = (start-1)*size;
		return um.findS(username, day, plan, start, size);
	}
	@Override
	public int totalS(String username, Integer day, String plan) {
		// TODO Auto-generated method stub
		return um.totalS(username, day, plan);
	}
	@Override
	public Schedule viewSchedule(Integer sid) {
		// TODO Auto-generated method stub
		Schedule schedule=um.viewSchedule(sid);
		return schedule;
	}
	@Override
	public boolean addSchedule(Schedule schedule) {
		// TODO Auto-generated method stub
		return um.addSchedule(schedule);
	}
	@Override
	public boolean mdfSchedule(Schedule schedule) {
		// TODO Auto-generated method stub
		return um.mdfSchedule(schedule);
	}
	@Override
	public boolean delSchedule(Integer sid) {
		// TODO Auto-generated method stub
		return um.delSchedule(sid);
	}
	@Override
	public List<Worklog> findW(String username, Integer day, String title,
			int start, int size) {
		// TODO Auto-generated method stub
		start = (start-1)*size;
		return um.findW(username, day, title, start, size);
	}
	@Override
	public int totalW(String username, Integer day, String title) {
		// TODO Auto-generated method stub
		return um.totalW(username, day, title);
	}
	@Override
	public Worklog viewWorklog(Integer wid) {
		// TODO Auto-generated method stub
		Worklog worklog=um.viewWorklog(wid);
		return worklog;
	}
	@Override
	public boolean addWorklog(Worklog worklog) {
		// TODO Auto-generated method stub
		return um.addWorklog(worklog);
	}
	@Override
	public boolean mdfWorklog(Worklog worklog) {
		// TODO Auto-generated method stub
		return um.mdfWorklog(worklog);
	}
	@Override
	public boolean delWorklog(Integer wid) {
		// TODO Auto-generated method stub
		return um.delWorklog(wid);
	}
	@Override
	public List<Sms> findSms(String username, String sender, String isRead,
			int start, int size) {
		// TODO Auto-generated method stub
		start = (start-1)*size;
		return um.findSms(username, sender, isRead, start, size);
	}
	@Override
	public int totalSms(String username, String sender, String isRead) {
		// TODO Auto-generated method stub
		return um.totalSms(username, sender, isRead);
	}
	@Override
	public Sms viewSms(Integer id) {
		// TODO Auto-generated method stub
		Sms sms=um.viewSms(id);
		return sms;
	}
	@Override
	public boolean addSms(Sms sms) {
		// TODO Auto-generated method stub
		return um.addSms(sms);
	}
	@Override
	public List<User> userlist() {
		// TODO Auto-generated method stub
		return um.userlist();
	}
	@Override
	public boolean mdfSms(Integer id) {
		// TODO Auto-generated method stub
		return um.mdfSms(id);
	}
	@Override
	public boolean delSms(Integer id) {
		// TODO Auto-generated method stub
		return um.delSms(id);
	}
	
	

}
