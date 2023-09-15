package com.icia.membershipBoard.service;

import com.icia.membershipBoard.dto.BoardDTO;
import com.icia.membershipBoard.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    BoardRepository boardRepository = new BoardRepository();
    public void boardSaveDate(BoardDTO memberDTO) {
        boardRepository.boardSaveDate(memberDTO);
    }

    public List<BoardDTO> boardList() {
        return boardRepository.boardList();
    }

    public BoardDTO boardDetail(Long id) {
        return boardRepository.boardDetail(id);
    }
}
