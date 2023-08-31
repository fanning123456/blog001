package com.minzheng.blog.strategy;

import com.minzheng.blog.dto.ArticleSearchDTO;

import java.util.List;

/**
 * 搜索策略
 *
 */
public interface SearchStrategy {

    /**
     * 搜索文章
     *
     * @param keywords 关键字
     * @return {@link List<ArticleSearchDTO>} 文章列表
     */
    List<ArticleSearchDTO> searchArticle(String keywords);

}
