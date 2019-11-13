package com.mvc.inssa.postscomm.dto;


public class PostsCommDto {
   private int commnum;
   private int boardnum;
   private String username;
   private String postscomm;
   private String reporting_date;
   private int groupno;
   private int groupsq;
   private int titletab;

   public PostsCommDto() {
   }

   public PostsCommDto(int commnum, int boardnum, String username, String postscomm,
         String reporting_date, int groupno,int groupsq,int titletab) {
      super();
      this.commnum = commnum;
      this.boardnum = boardnum;
      this.username = username;
      this.postscomm = postscomm;
      this.reporting_date = reporting_date;
      this.groupno = groupno;
      this.groupsq = groupsq;
      this.titletab = titletab;
   }

   public int getCommnum() {
      return commnum;
   }

   public void setCommnum(int commnum) {
      this.commnum = commnum;
   }

   public int getBoardnum() {
      return boardnum;
   }

   public void setBoardnum(int boardnum) {
      this.boardnum = boardnum;
   }

   public String getUsername() {
      return username;
   }

   public void setUsername(String username) {
      this.username = username;
   }

   public String getPostscomm() {
      return postscomm;
   }

   public void setPostscomm(String postscomm) {
      this.postscomm = postscomm;
   }

   public String getReporting_date() {
      return reporting_date;
   }

   public void setReporting_date(String reporting_date) {
      this.reporting_date = reporting_date;
   }

   public int getGroupno() {
      return groupno;
   }

   public void setGroupno(int groupno) {
      this.groupno = groupno;
   }

   public int getGroupsq() {
      return groupsq;
   }

   public void setGroupsq(int groupsq) {
      this.groupsq = groupsq;
   }

   public int getTitletab() {
      return titletab;
   }

   public void setTitletab(int titletab) {
      this.titletab = titletab;
   }

   
   
}