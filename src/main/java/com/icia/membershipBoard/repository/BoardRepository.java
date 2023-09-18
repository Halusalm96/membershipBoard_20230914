package com.icia.membershipBoard.repository;

import com.icia.membershipBoard.dto.BoardDTO;
import com.icia.membershipBoard.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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
    public List<BoardDTO> pagingList(Map<String, Integer> pagingParams) {
        return sql.selectList("Board.pagingList", pagingParams);
    }

    public int boardCount() {
        return sql.selectOne("Board.count");
    }

    public List<BoardDTO> searchList(Map<String, Object> searchParam) {
        return sql.selectList("Board.search", searchParam);
    }

    public int boardSearchCount(Map<String, String> pagingParams) {
        return sql.selectOne("Board.searchCount", pagingParams);
    }
    public BoardDTO save(BoardDTO boardDTO) {
        System.out.println("insert 전 boardDTO = " + boardDTO);
        sql.insert("Board.save", boardDTO);
        System.out.println("insert 후 boardDTO = " + boardDTO);
        return boardDTO;
    }
}
