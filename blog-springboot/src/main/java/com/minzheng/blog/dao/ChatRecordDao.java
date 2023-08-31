package com.minzheng.blog.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.minzheng.blog.entity.ChatRecord;
import org.springframework.stereotype.Repository;

/**
 * 聊天记录
 *
 */
@Repository
public interface ChatRecordDao extends BaseMapper<ChatRecord> {
}
