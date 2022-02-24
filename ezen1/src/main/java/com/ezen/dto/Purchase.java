package com.ezen.dto;

import org.springframework.stereotype.Component;
import java.sql.Date;

import lombok.ToString;
import lombok.Builder;
import lombok.Data;

import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
@Data
@ToString
public class Purchase {

	private int purchase_idx;
	private int cart_list_idx;
	private int user_idx;
	private int purchase_total_price;
	private String purchase_buyer_name;
	private String purchase_buyer_phone;
	private String purchase_buyer_address;
	private String purchase_payment;
	private String purchase_buyer_request;
	private Date purchase_date;
	private String purchase_statemnet;
	
	@Builder
	public Purchase(int purchase_idx, int cart_list_idx, int user_idx, int purchase_total_price,
			String purchase_buyer_name, String purchase_buyer_phone, String purchase_buyer_address,
			String purchase_payment, String purchase_buyer_request, Date purchase_date, String purchase_statemnet) {
		super();
		this.purchase_idx = purchase_idx;
		this.cart_list_idx = cart_list_idx;
		this.user_idx = user_idx;
		this.purchase_total_price = purchase_total_price;
		this.purchase_buyer_name = purchase_buyer_name;
		this.purchase_buyer_phone = purchase_buyer_phone;
		this.purchase_buyer_address = purchase_buyer_address;
		this.purchase_payment = purchase_payment;
		this.purchase_buyer_request = purchase_buyer_request;
		this.purchase_date = purchase_date;
		this.purchase_statemnet = purchase_statemnet;
	}
	
	
}
