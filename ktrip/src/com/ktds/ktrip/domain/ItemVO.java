package com.ktds.ktrip.domain;

public class ItemVO {
	
	private int item_id;
	private int guide_id;
	private String title;
	private String thumbnail;
	private String destination;
	private int duration;
	private int num_max;
	private int num_min;
	private String concept;
	private String contents;
	private String register_time;
	private String update_time;
	private String item_status;
	private int price;
	private int apply_id;
	private int cnt;
	private String guide_photo;
	private String guide_intro;
	private String guide_name;
	

	
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public int getGuide_id() {
		return guide_id;
	}
	public void setGuide_id(int guide_id) {
		this.guide_id = guide_id;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public int getNum_max() {
		return num_max;
	}
	public void setNum_max(int num_max) {
		this.num_max = num_max;
	}
	public int getNum_min() {
		return num_min;
	}
	public void setNum_min(int num_min) {
		this.num_min = num_min;
	}
	public String getConcept() {
		return concept;
	}
	public void setConcept(String concept) {
		this.concept = concept;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegister_time() {
		return register_time;
	}
	public void setRegister_time(String register_time) {
		this.register_time = register_time;
	}
	public String getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}
	public String getItem_status() {
		return item_status;
	}
	public void setItem_status(String item_status) {
		this.item_status = item_status;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public int getApply_id() {
		return apply_id;
	}
	public void setApply_id(int apply_id) {
		this.apply_id = apply_id;
	}
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public String getGuide_photo() {
		return guide_photo;
	}
	public void setGuide_photo(String guide_photo) {
		this.guide_photo = guide_photo;
	}
	public String getGuide_intro() {
		return guide_intro;
	}
	public void setGuide_intro(String guide_intro) {
		this.guide_intro = guide_intro;
	}
	public String getGuide_name() {
		return guide_name;
	}
	public void setGuide_name(String guide_name) {
		this.guide_name = guide_name;
	}
	
	@Override
	public String toString() {
		return "ItemVO [item_id=" + item_id + ", guide_id=" + guide_id + ", title=" + title + ", thumbnail=" + thumbnail
				+ ", concept=" + concept + ", contents=" + contents + ", item_status=" + item_status + ", destination="
				+ destination + ", duration=" + duration + ", num_max=" + num_max + ", num_min=" + num_min + ", price="
				+ price + "]";
	}



}