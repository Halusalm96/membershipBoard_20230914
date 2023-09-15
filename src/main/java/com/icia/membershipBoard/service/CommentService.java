package com.icia.membershipBoard.service;

import com.icia.membershipBoard.dto.CommentDTO;
import com.icia.membershipBoard.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    CommentRepository commentRepository = new CommentRepository();
    public void commentSaveDate(CommentDTO commentDTO) {
        commentRepository.commentSaveDate(commentDTO);
    }

    public List<CommentDTO> commentList() {
        return commentRepository.commentList();
    }
}
