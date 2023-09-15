package com.icia.membershipBoard.controller;

import com.icia.membershipBoard.dto.CommentDTO;
import com.icia.membershipBoard.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class CommentController {
    @Autowired
    CommentService commentService = new CommentService();
    @PostMapping("/commnet/save")
    public String commentSave(@ModelAttribute CommentDTO commentDTO, Model model){
        commentService.commentSaveDate(commentDTO);
        List<CommentDTO> commentDTOList = commentService.commentList();
        System.out.println(commentDTOList);
        model.addAttribute("commentList", commentDTOList);
        return "boardDeatil";
    }
}
