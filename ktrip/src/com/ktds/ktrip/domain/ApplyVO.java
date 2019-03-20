package com.ktds.ktrip.domain;

public class ApplyVO {

	private int apply_id;
	private int user_id;
	private int item_id;
	private String name;
	private String comment;
	private String start_date;
	private String end_date;
	private int entry;
	private int item_status;
	private String statusToString;

	public String getStatusToString() {
		return statusToString;
	}

	public void setStatusToString(String statusToString) {
		this.statusToString = statusToString;
	}

	public int getEntry() {
		return entry;
	}

	public void setEntry(int entry) {
		this.entry = entry;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getApply_id() {
		return apply_id;
	}

	public void setApply_id(int apply_id) {
		this.apply_id = apply_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getItem_id() {
		return item_id;
	}

	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public int getItem_status() {
		return item_status;
	}

	public void setItem_status(int item_status) {
		this.item_status = item_status;
	}

}