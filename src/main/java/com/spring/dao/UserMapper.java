package com.spring.dao;

import com.github.pagehelper.Page;
import com.spring.model.Staff;
import com.spring.model.permission.User;
import com.spring.param.UserFilter;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(String userId);

    int insert(Staff staff);

    int insertSelective(User record);

    Staff selectByPrimaryKey(String userId);

    int updateByPrimaryKeySelective(Staff record);

    int updateByPrimaryKey(User record);

    Page<Staff> getAll(RowBounds rowBounds, UserFilter filter);

    List<User> getAllUsers();

    //根据用户名获取用户对象
    User getUserByName(String username);

    Integer getCountByUserName(String userName);

    int batchDelete(List<String> list);

    Page<Staff> getMessageByCondition(RowBounds rowBounds, UserFilter filter);

    Integer getCountByFilter(String startTime);

    List<User> getAllMessage();

    User getUserByUserId(String userId);

    void cascadeUpdate(Staff staff);
}