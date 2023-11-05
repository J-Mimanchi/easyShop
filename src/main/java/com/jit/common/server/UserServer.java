package com.jit.common.server;

import com.jit.common.dao.UserDao;
import com.jit.common.domain.User;

import java.sql.SQLException;

public class UserServer {
    UserDao userDao = new UserDao();
    public boolean register(User user){
        try {
            userDao.saveUser(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public void active(String activeCode){
        try {
            userDao.updateStateBycode(activeCode);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    public boolean checkUsername(String username) {
        //调用dao判断是否存在
        Long count = 0L;

        try {
            count = userDao.checkUsername(username);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return count>0?true:false;
    }

}
