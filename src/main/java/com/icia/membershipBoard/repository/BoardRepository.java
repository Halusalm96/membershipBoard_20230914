package com.icia.membershipBoard.repository;

import com.icia.membershipBoard.dto.BoardDTO;
import com.icia.membershipBoard.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void boardSaveDate(BoardDTO boardDTO) {
        sql.insert("Board.insert", boardDTO);
    }

    public List<BoardDTO> boardList() {
        return sql.selectList("Board.list");
    }

    public BoardDTO boardDetail(Long id) {
        return sql.selectOne("Board.detail", id);
    }
}
