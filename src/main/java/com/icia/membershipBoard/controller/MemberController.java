package com.icia.membershipBoard.controller;

import com.icia.membershipBoard.dto.MemberDTO;
import com.icia.membershipBoard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("")
public class MemberController {
    @Autowired
    MemberService memberService = new MemberService();
    @GetMapping ("/member/save")
    public String memberSave(){
        return "member/memberSave";
    }
    @PostMapping("/member/save/date")
    public String memberSaveDate(@ModelAttribute MemberDTO memberDTO){
        memberService.memberSave(memberDTO);
        return "index";
    }
    @GetMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session,Model model){
        boolean result = memberService.login(memberDTO);
        if (result){
            session.setAttribute("loginMemberEmail",memberDTO.getMemberEmail());
            model.addAttribute("loginMemberEmail",memberDTO.getMemberEmail());
            return "member/memberLogin";
        } else {
            model.addAttribute("errorMessage", "이메일 또는 비밀번호가 올바르지 않습니다.");
            return "index";
        }
    }
    @GetMapping("/logout")
    public String logout(){
        return "index";
    }
}
