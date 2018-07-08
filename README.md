### ToDoList

- 스프링 개념, 동작방식
- bean 개념 알아오기
- tiles 동작방식



###  박하 대학교 웹사이트 

- 회원가입, 로그인 (아이디 찾기, 비밀번호 찾기, 아이디 저장)
- 게시판 기능(CRUD, 댓글)



### spring setting

- New > Spring Legacy Project > Spring MVC 

- 자바버전 1.8 , 스프링 4.1.7

- 우클릭 > property > java build path: java 1.8

- 우클릭 > property > project facets: java 1.8

- web.xml에 문자 인코딩 필터 추가

  ~~~java
  <filter>
      <filter-name>encodingFilter</filter-name>
      <filter-class>
                    org.springframework.web.filter.CharacterEncodingFilter
      </filter-class>
      <init-param>
        <param-name>encoding</param-name>
        <param-value>utf-8</param-value>
      </init-param>
   </filter>
    
    <filter-mapping>
      <filter-name>encodingFilter</filter-name>
      <url-pattern>/*</url-pattern>
    </filter-mapping>
  ~~~

- server.xml 

  ~~~xml
  <!--외부접속 허용 address="0.0.0.0" 추가-->
  <Connector connectionTimeout="20000" port="8000" protocol="HTTP/1.1" redirectPort="8443" address="0.0.0.0"/>  
  ~~~

- pom.xml에 tiles, lombok 설치

- [+lombok 설치](https://projectlombok.org/all-versions)

  ~~~xml
  		<!-- lombok -->
  		<!-- https://mvnrepository.com/artifact/org.projectlombok/lombok -->
  		<dependency>
  			<groupId>org.projectlombok</groupId>
  			<artifactId>lombok</artifactId>
  			<version>1.16.18</version>
  			<scope>provided</scope>
  		</dependency>
  
  
          <!-- tiles -->
  		<!-- https://mvnrepository.com/artifact/org.apache.tiles/tiles-jsp -->
  		<dependency>
  			<groupId>org.apache.tiles</groupId>
  			<artifactId>tiles-jsp</artifactId>
  			<version>3.0.3</version>
  		</dependency>
  
  ~~~

- servlet-context.xml

  ~~~xml
  	<beans:bean id="tilesViewResolver"
  		class="org.springframework.web.servlet.view.UrlBasedViewResolver">
  		<beans:property name="viewClass"
  			value="org.springframework.web.servlet.view.tiles3.TilesView" />
  		<beans:property name="order" value="1" />
  	</beans:bean>
  
  
  	<!-- Resolves views selected for rendering by @Controllers to .jsp resources in the /WEB-INF/views directory -->
  	<beans:bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
  		<beans:property name="prefix" value="/WEB-INF/views/" />
  		<beans:property name="suffix" value=".jsp" />
  				<beans:property name="order" value="2" />
  		
  	</beans:bean>
  ~~~

- src/main/webapp/WEB-INF/titles/tiles-layout.xml 파일 생성

  ~~~xml
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE tiles-definitions PUBLIC
  "-//Apache Software Foundation//DTD Tiles Configuration 2.0//EN"
  "http://tiles.apache.org/dtds/tiles-config_2_0.dtd">
  
  <tiles-definitions>
         <!-- default : 템플릿에 설정된 페이지의 구성 요소에 대한 실제 파일 지정 -->
         <definition name="default"
                template="/WEB-INF/views/layouts/default_template.jsp">
                <put-attribute name="menu"
                       value="/WEB-INF/views/layouts/default/menu.jsp" />
                <put-attribute name="header"
                       value="/WEB-INF/views/layouts/default/header.jsp" />
                <put-attribute name="body"
                       value="/WEB-INF/views/layouts/default/body.jsp" />
                <put-attribute name="footer"
                       value="/WEB-INF/views/layouts/default/footer.jsp" />
         </definition>
         
         <!-- 뷰의 이름이 home인 경우 default를 확장하여 아래 설정에 의해서 페이지를 만들게 됩니다. (body를 교체한다.)-->
         <definition name="home" extends="default">
                <put-attribute name="body" value="/WEB-INF/views/home.jsp" />
         </definition>
  
         <!-- 2레벨 -->
         <definition name="*/*" extends="default">
                <put-attribute name="body" value="/WEB-INF/views/{1}/{2}.jsp" />
         </definition>
  </tiles-definitions>
  ~~~

- servlet-context.xml

  ~~~xml
  <resources mapping="/resources/**" location="/resources/"  cache-period="0"/>
  <!-- cache-period="0" => CSS 변경 사항을 바로 확인 할 수 있음 -->
  ~~~

- my-batist설정 - pom.xml에 추가

  ~~~xml
  <repositories>
        <repository>
           <id>ojdbc</id>
           <url>http://www.datanucleus.org/downloads/maven2/</url>
        </repository>
     </repositories>
  
  
  <!-- MyBatis를 위한 의존 라이브러리 -->
  		<dependency>
  			<groupId>org.springframework</groupId>
  			<artifactId>spring-jdbc</artifactId>
  			<version>${org.springframework-version}</version>
  		</dependency>
  		<dependency>
  			<groupId>commons-dbcp</groupId>
  			<artifactId>commons-dbcp</artifactId>
  			<version>1.4</version>
  		</dependency>
  		<dependency>
  			<groupId>org.mybatis</groupId>
  			<artifactId>mybatis</artifactId>
  			<version>3.2.2</version>
  		</dependency>
  		<dependency>
  			<groupId>org.mybatis</groupId>
  			<artifactId>mybatis-spring</artifactId>
  			<version>1.2.0</version>
  		</dependency>
  		<dependency>
  			<groupId>oracle</groupId>
  			<artifactId>ojdbc6</artifactId>
  			<version>11.2.0.3</version>
  		</dependency>
  ~~~

- web.xml

  ~~~xml
  <context-param>
  		<param-name>contextConfigLocation</param-name>
  		<param-value>
  		/WEB-INF/spring/root-context.xml
  		classpath:config/*-context.xml
  		</param-value>
  	</context-param>
  ~~~

- src/main/resources/database.properties 파일 생성

  ~~~xml
  database.driver=oracle.jdbc.driver.OracleDriver
  database.url=jdbc:oracle:thin:@localhost:1521:xe
  database.username=iot
  database.password=1234
  ~~~

- src/main/resources/config 폴더 생성

- src/main/resources/config/mybatis-config.xml 생성

  ~~~xml
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE configuration
    PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
    "http://mybatis.org/dtd/mybatis-3-config.dtd">
  <configuration>
  
     <properties resource="database.properties" />
  
     <settings>
        <setting name="cacheEnabled" value="false" />
        <setting name="mapUnderscoreToCamelCase" value="true" />
        <!-- 자동발급되는 키 추출하기 -->
        <setting name="useGeneratedKeys" value="true" />
     </settings>
     
  </configuration>
  ~~~

- src/main/resources/config/database-context.xml 생성

  - beans, context, tx 체크

  ~~~xml
  <?xml version="1.0" encoding="UTF-8"?>
  <beans xmlns="http://www.springframework.org/schema/beans"
  	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  	xmlns:context="http://www.springframework.org/schema/context"
  	xmlns:tx="http://www.springframework.org/schema/tx"
  	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
  		http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.1.xsd
  		http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx-4.1.xsd">
  
     <context:property-placeholder location="classpath:database.properties" />
     <bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource"
        destroy-method="close">
        <property name="driverClassName" value="${database.driver}" />
        <property name="url" value="${database.url}" />
        <property name="username" value="${database.username}" />
        <property name="password" value="${database.password}" />
     </bean>
  
     <bean id="transactionManager"
        class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <property name="dataSource" ref="dataSource" />
     </bean>
     <tx:annotation-driven transaction-manager="transactionManager" />
  
     <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
        <property name="dataSource" ref="dataSource" />
        <property name="typeAliasesPackage" value="com.worldfriends.bacha.model" />
        <property name="configLocation" value="classpath:config/mybatis-config.xml" />
        <property name="mapperLocations">
           <list>
              <value>classpath:mapper/**/*-mapper.xml</value>
           </list>
        </property>
     </bean>
  
     <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
        <property name="basePackage" value="com.worldfrieds.bacha.dao" />
     </bean>
      
  
  </beans>
  
  ~~~



### sql developer

- system 111111

  ~~~sql
  -- 테이블스페이스 생성
  CREATE TABLESPACE BACHA_CANDY_TS
  DATAFILE 'bacha_candy_ts.dbf'
  SIZE 50M;
  
  -- 사용자 생성
  CREATE USER BACHA_CANDY -- 사용자명
  IDENTIFIED BY 1234 --비밀번호
  DEFAULT TABLESPACE bacha_candy_ts
  TEMPORARY TABLESPACE TEMP;
  
  -- 권한 부여
  GRANT CONNECT, RESOURCE TO BACHA_CANDY; --CONNECT와 RESOURCE 롤 부여
  ~~~


- 테이블 

  - members(id,pw,name,phone_number,address,email,grade,reg_date,update_date)

  ~~~sql
  create table members(
    user_id VARCHAR2(20),
    password VARCHAR2(20),
    user_name VARCHAR2(20),
    cell_phone VARCHAR2(20),
    email VARCHAR2(50),
    address VARCHAR2(200),
    grade NUMBER,
    reg_date DATE DEFAULT SYSDATE,
    update_date DATE DEFAULT SYSDATE,
    PRIMARY KEY(user_id)
  );
  ~~~



- ecplipse oracle 연동 (Data Source Explorer)
- sql 파일 `src/main/resources/` 경로에 넣기



### mybatis

- model class

  ~~~java
  package com.worldfriends.bacha.model;
  
  import java.util.Date;
  import lombok.Data;
  
  
  @Data  //lombok getter,setter,생성자 자동으로 만드라줌
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
  ~~~

- mapper.xml

  ~~~java
  <?xml version="1.0" encoding="UTF-8" ?>
  <!DOCTYPE mapper
     PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
     "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
  
  <mapper namespace="com.worldfriends.bacha.dao.MemberDao">
  	<!-- SQL문과 태그를 매핑 -->
  
  
      <!-- 멤버명수 -->
  	<select id="getCount" resultType="int"><![CDATA[
        select count(*) as total from members
     ]]></select>
  
  	<!-- Member객체에 알아서 넣어주는데, CamelCase=true이므로 setcell_phone이 아니라 setCellPhone을 
  		호출한다. -->
  		
  		
  	<select id="selectList" resultType="Member"
  		parameterType="Pagination"><![CDATA[
        select user_id, user_name, password, cell_phone, email, address,
         grade, reg_date, update_date from(
         select row_number() over (order by reg_date desc) as seq, 
         user_id, user_name, password, cell_phone, email, address, grade, reg_date, update_date
         from members) where seq between #{start} and #{end}
     ]]></select>
  
  	<select id="selectOne" resultType="Member"
  		parameterType="String"><![CDATA[
        select * from members
        where user_id = #{userId}
     ]]></select>
  
  	<!-- CamelCase=true이므로 getcell_phone이 아니라 getCellPhone을 호출한다. -->
  	<insert id="insert" parameterType="Member"><![CDATA[
        insert into members
        (user_id, user_name, password, cell_phone, email, address, grade)
        values(#{userId}, #{userName}, #{password}, #{cellPhone}, #{email},
        #{address}, 1)
     ]]></insert>
  
  	<update id="update" parameterType="Member"><![CDATA[
        update members set
        cell_phone=#{cellPhone},
        email=#{email},
        address=#{address},
        update_date = sysdate
        where user_id=#{userId} and password=#{password}
     ]]></update>
  
  
  	<delete id="delete" parameterType="String"><![CDATA[
        delete from members
        where user_id = #{userId}
     ]]></delete>
  
  	<update id="updateByAdmin" parameterType="Member"><![CDATA[
        update members set
        cell_phone=#{cellPhone},
        email=#{email},
        address=#{address},
        update_date = sysdate
        where user_id=#{userId}
     ]]></update>
  
  	<update id="changePassword" parameterType="Password"><![CDATA[
        update members set
        password=#{newPassword},
        update_date = sysdate
        where user_id=#{userId} and password=#{oldPassword}
     ]]></update>
  
  	<update id="changePasswordByAdmin" parameterType="Password"><![CDATA[
        update members set
        password=#{newPassword},
        update_date = sysdate
        where user_id=#{userId}
     ]]></update>
  
  
  	<select id="selectListWithMessages" resultType="Member"
  		parameterType="String"><![CDATA[
        select *
        from
           members m,
           ( SELECT with_talk, count(*) newMessages FROM talks
           WHERE checked = 0 and user_Id = #{userId}
           group by with_talk
           ) t
        where
           m.user_id <> #{userId} and
           m.user_id = t.with_talk(+)
           order by newMessages ASC
     ]]></select>
     
  </mapper>   
  ~~~

- BaseDao (src/main/java/com.worldfriends.bacha.dao/BaseDao 인터페이스 생성)

  ~~~java
  package com.worldfriends.bacha.dao;
  
  import java.util.List;
  import java.util.Map;
  
  public interface BaseDao<M, K> {
      
  	 int getCount() throws Exception;
  	 List<M> selectList(Map map) throws Exception;
  	 int insert(M m) throws Exception;
  	 M selectOne(K k) throws Exception;
  	 int update(M m) throws Exception;
  	 int delete(K k) throws Exception;
  	 
  }
  ~~~

- MemberDao (src/main/java/com.worldfriends.bacha.dao/MemberDao 클래스 생성)

  ~~~java
  package com.worldfriends.bacha.dao;
  
  import com.worldfriends.bacha.model.Member;
  import com.worldfriends.bacha.model.Password;
  
  public interface MemberDao extends BaseDao<Member, String> {
  
     
        
  	   int updateByAdmin(Member member) throws Exception;
  	   int changePassword(Password password) throws Exception;
  	   int changePasswordByAdmin(Password password) throws Exception;
  	                                                      
  	
  }
  ~~~

  

### login 기능

- Login모델 클래스 생성 (with @valid 어노테이션)

  - pom.xml에 depencency 추가

  ~~~java
  //pom.xml
  
  <!-- https://mvnrepository.com/artifact/org.hibernate/hibernate-validator -->
  <dependency>
  	<groupId>org.hibernate</groupId>
  	<artifactId>hibernate-validator</artifactId>
  	<version>6.0.10.Final</version>
  </dependency>
  ~~~

  - login model 클래스 생성

  ~~~java
  package com.worldfriends.bacha.model;
  
  
  import javax.validation.constraints.NotEmpty;
  
  import org.hibernate.validator.constraints.Length;
  
  import lombok.Data;
  
  @Data  //자동으로 생성자, getter, setter 생성
  public class Login {
  	
     @NotEmpty(message="아이디를 입력하세요")  
     private String userId;
     
     @NotEmpty(message= "비밀번호를 입력하세요")
     //@Length(min=4, message="최소4자이상입력")
     private String password;
  }
  ~~~

  - service 인터페이스

  ~~~java
  package com.worldfriends.bacha.service;
  
  
  public interface MemberService {
  	
     Member checkLogin(Login login) throws Exception;
  	
  }
  ~~~

  - service 클래스 작성

  ~~~java
  package com.worldfriends.bacha.service;
  
  import org.springframework.beans.factory.annotation.Autowired;
  import org.springframework.stereotype.Service;
  import org.springframework.transaction.annotation.Transactional;
  import com.worldfriends.bacha.dao.MemberDao;
  import com.worldfriends.bacha.exeption.LoginFailException;
  import com.worldfriends.bacha.model.Login;
  import com.worldfriends.bacha.model.Member;
  
  
  @Service
  public class MemberServiceImpl implements MemberService {
  
  	@Autowired
  	MemberDao dao;
  
  	@Override
  	public Member checkLogin(Login login) throws Exception {
  		
  		    Member member = dao.selectOne(login.getUserId());
  	
  			if(member!=null && member.getPassword().equals(login.getPassword()))
  			    return member;	
  
  			
              //로그인 실패 경우
  			String msg = "";
  			if(member==null) {
  				msg = "존재하지 않는 ID입니다"; 
  
  			}else if(!member.getPassword().equals(login.getPassword())) {
  				msg = "비밀번호가 틀립니다";
  			}
               
  			throw new LoginFailException(msg);
   
  	}
  	
  }
  
  ~~~

  - controller 메서드 작성

  ~~~java
  package com.worldfriends.bacha.controller;
  
  
  @Controller
  public class AccountController {
  
  	@Autowired
  	MemberService service;
  
  	@ExceptionHandler(LoginFailException.class)
  	public String handlerLoginError(HttpServletRequest request, Exception e) {
  		request.setAttribute("login", new Login());
  		request.setAttribute("error", e.getMessage());
  		return "account/login";
  	}
  	
  
  	// 로그인 폼 페이지
  	@RequestMapping(value = "/login", method = RequestMethod.GET)
  	public String loginForm(Login login) {
  		return "account/login";
  	}
  
  	// 실제 로그인 기능
  	@RequestMapping(value = "/login", method = RequestMethod.POST)
  	public String loginSubmit(@Valid Login login, BindingResult result, HttpSession session) throws Exception {
  
  		if (result.hasErrors()) {
  			return "account/login";
  		}
  
  		Member member = service.checkLogin(login);
  
  		session.setAttribute("USER", member);
  
  		return "redirect:/login_success";	
  		
       }
  	
  	@RequestMapping(value = "/login_success", method = RequestMethod.GET)
  	public String login_success() {
  		
  		return "account/login_success";
  	}
  		
  
  }
  
  ~~~

  - jsp페이지 생성 (view)

  ~~~java
  //wevapp/WEB-INF/views/account/login.jsp
  
  <%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
  //폼 라이브러리 추가
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>로그인</title>
  </head>
  <body>
   
     
     <!-- action 태그 생략시 현재 url로 전송, form:form에서 method 생략시 post 방식 -->
     <form:form commandName="login"> 
        <p>
           id : 
           <form:input path="userId"/>   <!-- name과 id가 userId로 정해짐 -->
           <form:errors path="userId" element="div" cssClass="error"/> <!-- BindingResult 결과메시지 출력 -->
        </p>
        <p>
           pw : 
           <form:password path="password"/>
           <form:errors path="password" element="div" cssClass="error"/>
        </p>
  
        <button type="submit">
           로그인
        </button>
     </form:form>
     
      <p>${error }</p>
  
     
     
  </body>
  </html>
  ~~~

  ~~~java
  //wevapp/WEB-INF/views/account/login_success.jsp
  
  <%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8" %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
  </head>
  <body>
    ${USER.userName} 
  </body>
  </html>
  ~~~

  - 예외 처리를 위한 LoginFailException클래스 생성

  ~~~java
  package com.worldfriends.bacha.exeption;
  
  public class LoginFailException extends Exception {
  
       public LoginFailException(String msg) {
      	 super(msg);
       }
  	
  }
  ~~~

  

