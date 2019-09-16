package com.alpaca.comment;

public class CommentVO {
	private int boardNumber;
	private int commentNumber;
	private int commentParent;
	private int commentChild;
	private String commentContents;
	private String commentWriter;
	private String commentRegister;

	public int getBoardNumber() {
		return boardNumber;
	}

	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}

	public int getCommentNumber() {
		return commentNumber;
	}

	public void setCommentNumber(int commentNumber) {
		this.commentNumber = commentNumber;
	}

	public int getCommentParent() {
		return commentParent;
	}

	public void setCommentParent(int commentParent) {
		this.commentParent = commentParent;
	}

	public int getCommentChild() {
		return commentChild;
	}

	public void setCommentChild(int commentChild) {
		this.commentChild = commentChild;
	}

	public String getCommentContents() {
		return commentContents;
	}

	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}

	public String getCommentWriter() {
		return commentWriter;
	}

	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}

	public String getCommentRegister() {
		return commentRegister;
	}

	public void setCommentRegister(String commentRegister) {
		this.commentRegister = commentRegister;
	}

	@Override
	public String toString() {
		return "CommentVO [boardNumber=" + boardNumber + ", commentNumber=" + commentNumber + ", commentParent="
				+ commentParent + ", commentChild=" + commentChild + ", commentContents=" + commentContents
				+ ", commentWriter=" + commentWriter + ", commentRegister=" + commentRegister + "]";
	}

}