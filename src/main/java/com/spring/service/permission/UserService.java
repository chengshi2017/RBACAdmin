package com.spring.service.permission;

import com.github.pagehelper.Page;
import com.spring.model.Staff;
import com.spring.model.permission.User;
import com.spring.param.UserFilter;
import org.apache.ibatis.session.RowBounds;

import java.util.List;
import java.util.logging.Filter;

/**
 * @Author 施成
 * @Date 2018/2/17
 * @time 9:52
 * @Describe:
 */
public interface UserService {
    Page<Staff> getAllUserMessage(RowBounds rowBounds, UserFilter filter);

    Staff getUserMessageById(String userId);

    void insert(Staff staff);

    void update(Staff staff);

    void delete(String userId);

    List<User> getAllUsers();

    User getUserByName(String username);

    Integer getCountByUserName(String userName);

    void batchDelete(List<String> list);

    Page<Staff> getMessageByCondition(RowBounds rowBounds, UserFilter filter);

    Integer getCountByFilter(Integer count);

    User getUserByUserId(String userId);

    void cascadeUpdate(Staff staff);
}
