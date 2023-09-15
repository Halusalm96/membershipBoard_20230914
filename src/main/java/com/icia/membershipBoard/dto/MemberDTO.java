package com.icia.membershipBoard.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Setter
@Getter
@ToString
public class MemberDTO {
    private String memberEmail;
    private String memberPassword;
    private String memberName;
    private String memberMobile;
    private List<MultipartFile> memberProfile;
}
