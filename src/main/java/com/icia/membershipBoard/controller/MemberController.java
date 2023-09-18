package com.icia.membershipBoard.controller;

import com.icia.membershipBoard.dto.MemberDTO;
import com.icia.membershipBoard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
    @GetMapping ("/member/memberLogin")
    public String memberLogin(){
        return "member/memberLogin";
    }
    @PostMapping("/member/save/date")
    public String memberSaveDate(@ModelAttribute MemberDTO memberDTO){
        memberService.memberSave(memberDTO);
        return "index";
    }
    @GetMapping("/login")
    public ResponseEntity login(@ModelAttribute MemberDTO memberDTO, HttpSession session,Model model){
        boolean result = memberService.login(memberDTO);
        if (result){
            session.setAttribute("loginMemberEmail",memberDTO.getMemberEmail());
            model.addAttribute("loginMemberEmail",memberDTO.getMemberEmail());
            return new ResponseEntity<>(HttpStatus.OK); // http status code 200
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }
    @GetMapping("/logout")
    public String logout(){
        return "index";
    }
    @PostMapping("/email-check")
    public ResponseEntity emailCheck(@RequestParam("memberEmail") String memberEmail) {
        MemberDTO memberDTO = memberService.emailCheck(memberEmail);
        if (memberDTO == null) {
            return new ResponseEntity<>(HttpStatus.OK); // http status code 200
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }
}
