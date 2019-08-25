package com.alpaca.member;

public class MemberVO {
	private String memberID;
	private String memberPassword;
	private String memberName;
	private String memberGender;
	private String memberBirthday;
	private String memberEmail;
	private String memberTel;
	private String memberRegister;
	private int memberManager;

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public String getMemberBirthday() {
		return memberBirthday;
	}

	public void setMemberBirthday(String memberBirthday) {
		this.memberBirthday = memberBirthday;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberTel() {
		return memberTel;
	}

	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}

	public String getMemberRegister() {
		return memberRegister;
	}

	public void setMemberRegister(String memberRegister) {
		this.memberRegister = memberRegister;
	}

	public int getMemberManager() {
		return memberManager;
	}

	public void setMemberManager(int memberManager) {
		this.memberManager = memberManager;
	}

	@Override
	public String toString() {
		return "MemberVO [memberID=" + memberID + ", memberPassword=" + memberPassword + ", memberName=" + memberName
				+ ", memberGender=" + memberGender + ", memberBirthday=" + memberBirthday + ", memberEmail="
				+ memberEmail + ", memberTel=" + memberTel + ", memberRegister=" + memberRegister + ", memberManager="
				+ memberManager + "]";
	}
}