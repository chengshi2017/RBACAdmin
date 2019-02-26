package com.spring.common.quartz.Repository;

import com.spring.common.quartz.bean.CScheduleTrigger;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * @Author: Jeremy
 * @Date: 2018/7/16
 * @Time: 11:23
 * @Version: 1.0
 * @Describe:
 */
public interface CScheduleTriggerRepository extends CrudRepository<CScheduleTrigger,Long> {

    List<CScheduleTrigger> findAll();

}
