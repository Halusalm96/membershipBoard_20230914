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
import java.util.List;

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
    public String logout(HttpSession session){
        session.removeAttribute("loginMemberEmail");
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
    @GetMapping ("/delete")
    public String delete(@RequestParam("id") Long id){
        memberService.delete(id);
        return "index";
    }
    @GetMapping("/member/main")
    public String memberMail(@RequestParam("memberEmail") String memberEmail, Model model){
        System.out.println("memberEmail = " + memberEmail + ", model = " + model);
        MemberDTO memberDTO = memberService.findOne(memberEmail);
        model.addAttribute("memberDTO",memberDTO);
        System.out.println(memberDTO);
        return "member/memberMain";
    }
    @PostMapping("/member/save/update")
    public String memberSaveUpdate(@ModelAttribute MemberDTO memberDTO, Model model){
        MemberDTO memberDTO1 =  memberService.update(memberDTO);

        model.addAttribute("loginMemberEmail",memberDTO1);
        return "member/memberLogin";
    }
    @GetMapping("/member/list")
    public String memberList(Model model){
        List<MemberDTO> memberDTOList = memberService.list();
        model.addAttribute("memberList",memberDTOList);
        return "/member/memberList";
    }
    @GetMapping("member/detail")
    public String memberDetail(@RequestParam("id") Long id, Model model){
        MemberDTO memberDTO = memberService.detail(id);
        model.addAttribute("member",memberDTO);
        return "member/memberDetail";
    }
    @GetMapping("/member/delete")
    public String memberDelete(@RequestParam("id") Long id){
        memberService.delete(id);
        return "index";
    }
    @GetMapping("/member/main/delete")
    public String memberMainDelete(@RequestParam("id") Long id,Model model){
        memberService.delete(id);
        List<MemberDTO> memberDTOList = memberService.list();
        model.addAttribute("memberList",memberDTOList);
        return "member/memberList";
    }
}