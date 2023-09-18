package com.icia.membershipBoard.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

@Setter
@Getter
@ToString
public class BoardDTO {
    private Long id;
    private String boardTitle;
    private String boardPassword;
    private String boardWriter;
    private String boardContents;
    private Long boardHits;
    private Timestamp createdAt;
    private Long memberId;
    private int fileAttached;
//    private List<MultipartFile> fileAttached;
}
