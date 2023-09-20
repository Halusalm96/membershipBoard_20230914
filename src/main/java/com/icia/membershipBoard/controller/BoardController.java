package com.icia.membershipBoard.controller;

import com.icia.membershipBoard.dto.BoardDTO;
import com.icia.membershipBoard.dto.CommentDTO;
import com.icia.membershipBoard.dto.MemberDTO;
import com.icia.membershipBoard.dto.PageDTO;
import com.icia.membershipBoard.service.BoardService;
import com.icia.membershipBoard.service.CommentService;
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
    @Autowired
    CommentService commentService = new CommentService();
    @GetMapping ("/board/save")
    public String boardSave(@ModelAttribute MemberDTO memberDTO, Model model){
        model.addAttribute("member",memberDTO);
        return "board/boardSave";
    }
    @PostMapping("/board/save/date")
    public String boardSaveDate(@ModelAttribute BoardDTO boardDTO){
        boardService.boardSaveDate(boardDTO);
        return "member/memberLogin";
    }
    @GetMapping("/board/list")
    public String boardList(Model model){
        List<BoardDTO> boardDTOList = boardService.boardList();
        model.addAttribute("boardList", boardDTOList);

        return "board/boardList";
    }
    @GetMapping("/board/detail")
    public String boardDetail(@RequestParam("id") Long id, Model model, HttpSession session){
        BoardDTO boardDTO = boardService.boardDetail(id);
        model.addAttribute("board",boardDTO);
        session.setAttribute("board",boardDTO);
        List<CommentDTO> commentDTOList = commentService.commentList();
        model.addAttribute("commentList", commentDTOList);
        return "board/boardDetail";
    }
    @GetMapping("/board/check")
    public String findAll(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                          @RequestParam(value = "q", required = false, defaultValue = "") String q,
                          @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
                          Model model) {
        // 검색이든 아니든 필요한 정보: boardList, paging
        List<BoardDTO> boardDTOList = null;
        PageDTO pageDTO = null;

        // 검색요청인지 아닌지 구분
        if (q.equals("")) {
            // 일반 페이지 요청
            boardDTOList = boardService.pagingList(page);
            pageDTO = boardService.pageNumber(page);
        } else {
            // 검색결과 페이지 요청
            boardDTOList = boardService.searchList(q, type, page);
            pageDTO = boardService.searchPageNumber(q, type, page);
        }
        model.addAttribute("boardList", boardDTOList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        model.addAttribute("page", page);
        return "boardPages/boardList";
    }
    @GetMapping("/sample")
    public String sampleData() {
        for (int i = 1; i <= 20; i++) {
            BoardDTO boardDTO = new BoardDTO();
            boardDTO.setBoardWriter("aa");
            boardDTO.setBoardTitle("title" + i);
            boardDTO.setBoardContents("contents" + i);
            boardDTO.setBoardPassword("password" + i);
            boardService.sampleData(boardDTO);
        }
        return "redirect:/board/list";
    }
}
