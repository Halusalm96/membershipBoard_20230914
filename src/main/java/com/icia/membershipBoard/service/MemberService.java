package com.icia.membershipBoard.service;

import com.icia.membershipBoard.dto.MemberDTO;
import com.icia.membershipBoard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
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
}
