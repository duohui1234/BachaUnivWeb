package com.worldfriends.bacha.model;

import java.util.Date;
import lombok.Data;


@Data
public class Member {

   private String user_id;
   private String password;
   private String user_name;
   private String cell_phone;
   private String email;
   private String address;
   private int grade;
   private Date reg_date;
   private Date update_date;
	
}
