package com.icia.membershipBoard.repository;

import com.icia.membershipBoard.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void memberSave(MemberDTO memberDTO) {
        sql.insert("Member.insert", memberDTO);
    }
    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login",memberDTO);
    }

    public MemberDTO emailCheck(String memberEmail) {
        return sql.selectOne("Member.emailCheck",memberEmail);
    }

    public void delete(Long id) {
        sql.delete("Member.delete",id);
    }

    public MemberDTO findOne(String memberEmail) {
        return sql.selectOne("Member.findOne",memberEmail);
    }

    public void update(MemberDTO memberDTO) {
        sql.update("Member.update",memberDTO);
    }

    public List<MemberDTO> list() {
        return sql.selectList("Member.list");
    }

    public MemberDTO detail(Long id) {
        return sql.selectOne("Member.detail",id);
    }
}
