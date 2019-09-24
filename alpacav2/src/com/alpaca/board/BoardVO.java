package com.alpaca.board;

public class BoardVO {
	private int boardNumber;
	private String boardTitle;
	private String boardContents;
	private String boardWriter;
	private String boardRegister;
	private int boardHits;
	private int boardRecommend;

	public int getBoardNumber() {
		return boardNumber;
	}

	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContents() {
		return boardContents;
	}

	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getBoardRegister() {
		return boardRegister;
	}

	public void setBoardRegister(String boardRegister) {
		this.boardRegister = boardRegister;
	}

	public int getBoardHits() {
		return boardHits;
	}

	public void setBoardHits(int boardHits) {
		this.boardHits = boardHits;
	}

	public int getBoardRecommend() {
		return boardRecommend;
	}

	public void setBoardRecommend(int boardRecommend) {
		this.boardRecommend = boardRecommend;
	}

	@Override
	public String toString() {
		return "BoardVo [boardNumber=" + boardNumber + ", boardTitle=" + boardTitle + ", boardContents=" + boardContents
				+ ", boardWriter=" + boardWriter + ", boardRegister=" + boardRegister + ", boardHits=" + boardHits
				+ ", boardRecommend=" + boardRecommend + "]";
	}

}