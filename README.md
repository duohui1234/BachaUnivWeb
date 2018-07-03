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

- server.xml 

  ~~~xml
  <!--외부접속 허용 -->
  <Connector connectionTimeout="20000" port="8000" protocol="HTTP/1.1" redirectPort="8443" address="0.0.0.0"/>  
  ~~~

- pom.xml에 tiles, lombok 설치

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

- src/main/webapp/WEB-INF/titles/tiles-layout.xml 

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

- my-batis

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

- src/main/wepapp/resources/database.properties 파일 생성

  ~~~xml
  database.driver=oracle.jdbc.driver.OracleDriver
  database.url=jdbc:oracle:thin:@localhost:1521:xe
  database.username=iot
  database.password=1234
  ~~~

- src/main/wepapp/resources/config 폴더 생성

- src/main/wepapp/resources/config/mybatis-config.xml 생성

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

- src/main/wepapp/resources/config/database-context.xml 생성

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

- src/main/java/com.worldfriends.bacha.dao 패키지 생성

- src/main/java/com.worldfriends.bacha.dao/BaseDao 인터페이스 생성

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

  