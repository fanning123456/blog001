package com.minzheng.blog.dao;

import com.minzheng.blog.entity.Message;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;


/**
 * 留言
 *
 */
@Repository
public interface MessageDao extends BaseMapper<Message> {

}
