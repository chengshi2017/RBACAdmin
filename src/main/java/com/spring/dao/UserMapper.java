package com.spring.dao;

import com.github.pagehelper.Page;
import com.spring.model.permission.User;
import com.spring.param.UserFilter;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(@Param("userId") String userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    Page<User> getAll(RowBounds rowBounds,UserFilter filter);

    List<User> getAllUsers();

    //根据用户名获取用户对象
    User getUserByName(String username);

    Integer getCountByUserName(String userName);

    int batchDelete(List<String> list);

    Page<User> getMessageByCondition(RowBounds rowBounds, UserFilter filter);
}