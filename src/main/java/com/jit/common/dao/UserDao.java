package com.jit.common.dao;

import com.jit.common.domain.User;
import com.jit.common.utils.DataSourceUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;

public class UserDao {
    public void saveUser(User user) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
        String sql="insert into user(uid,username,password,name,email,telephone,state,code) values(?,?,?,?,?,?,?,?)";
        runner.update(sql,user.getUid(),user.getUsername(),user.getPassword(),
                user.getName(),user.getEmail(),user.getTelephone(),0,user.getCode());

    }

    /**
     * 根据激活码修改用户状态
     * @param code
     */
    public void updateStateBycode(String code) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
        String sql="update user set state = 1 where code = ? ";
        int update = runner.update(sql, code);
    }


    public Long checkUsername(String username) throws SQLException {
        QueryRunner runner =  new QueryRunner(DataSourceUtil.getDataSource());
        String sql ="select count(*) from user where username = ?" ;
        Long count = (Long)runner.query(sql, new ScalarHandler(), username);
        return count;
    }

}
