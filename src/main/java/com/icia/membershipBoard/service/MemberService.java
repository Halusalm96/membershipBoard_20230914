package com.icia.membershipBoard.service;

import com.icia.membershipBoard.dto.MemberDTO;
import com.icia.membershipBoard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MemberService {
    @Autowired
    MemberRepository memberRepository = new MemberRepository();
    public void memberSave(MemberDTO memberDTO) {
        memberRepository.memberSave(memberDTO);
    }
    public boolean login(MemberDTO memberDTO) {
        MemberDTO dto = memberRepository.login(memberDTO);
        if(dto != null){
            return true;
        }else {
            return false;
        }
    }

    public MemberDTO emailCheck(String memberEmail) {
        return memberRepository.emailCheck(memberEmail);
    }

    public void delete(Long id) {
        memberRepository.delete(id);
    }

    public MemberDTO findOne(String memberEmail) {
        return memberRepository.findOne(memberEmail);
    }

    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }

    public List<MemberDTO> list() {
        return memberRepository.list();
    }

    public MemberDTO detail(Long id) {
        return memberRepository.detail(id);
    }
}
