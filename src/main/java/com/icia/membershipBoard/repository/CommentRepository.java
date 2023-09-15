package com.icia.membershipBoard.repository;

import com.icia.membershipBoard.dto.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void commentSaveDate(CommentDTO commentDTO) {
        sql.insert("Comment.insert",commentDTO);
    }
    public List<CommentDTO> commentList() {
        return sql.selectList("Comment.list");
    }
}
