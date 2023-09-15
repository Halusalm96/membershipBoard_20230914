package com.icia.membershipBoard.controller;

import com.icia.membershipBoard.dto.BoardDTO;
import com.icia.membershipBoard.dto.MemberDTO;
import com.icia.membershipBoard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class BoardController {
    @Autowired
    BoardService boardService = new BoardService();
    @GetMapping ("/board/save")
    public String boardSave(@ModelAttribute MemberDTO memberDTO, Model model){
        model.addAttribute("member",memberDTO);
        return "board/boardSave";
    }
    @PostMapping("/board/save/date")
    public String boardSaveDate(@ModelAttribute BoardDTO boardDTO){
        boardService.boardSaveDate(boardDTO);
        System.out.println("boardDTO = " + boardDTO);
        return "member/memberLogin";
    }
    @GetMapping("/board/list")
    public String boardList(Model model){
        List<BoardDTO> boardDTOList = boardService.boardList();
        model.addAttribute("boardList", boardDTOList);
        return "board/boardList";
    }
    @GetMapping("/board/detail")
    public String boardDetail(@RequestParam("id") Long id, Model model){
        BoardDTO boardDTO = boardService.boardDetail(id);
        System.out.println("boardDTO = " + boardDTO);
        model.addAttribute("board",boardDTO);
        return "board/boardDetail";
    }
}
