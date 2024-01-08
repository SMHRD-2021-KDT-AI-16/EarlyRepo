# :pushpin: 하우스 커니티_하티
> 내 집 마련 꿈을 위한 SNS
>> 사용자의 정보를 바탕으로 대출 정보와 지역별 주거 환경 정보를 종합적으로 제공하는 부동산SNS


</br>

## 1. 제작 기간 & 참여 인원
- 2023년 12월 1일 ~ 2024년 1월 5일
- 팀 프로젝트

</br>

## 2. 사용 기술
#### `Back-end`
  - Java
  - Python
  - oracle database
  - Apache Tomcat9.0
    
#### `Front-end`
  - JavaScript
  - css

#### `IDE`
  - Eclipse
  - Visual Studio Code
  - Jupyter NoteBook


</br>

## 3. ERD 설계
![ERD2](https://github.com/SMHRD-2021-KDT-AI-16/EarlyRepo/assets/152379979/e8b3d332-67c3-44b9-b3b4-1b408d41bc71)



## 4. 핵심 기능
사용자 맞춤 부동산 정보 제공 
게시판과 채팅을 통한 실시간 정보 공유  
맞춤 대출 서비스 소개


<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 전체 흐름
![](https://github.com/SMHRD-2021-KDT-AI-16/EarlyRepo/assets/152265634/1bcd4450-d787-4794-b7b4-049210de72dd)


### 4.2. 사용자 요청

- **자산정보 입력 및 대출 서비스 소개
  - 사용자가 입력한 정보에 따라 조건에 부합하는 대출목록을 보여줍니다.   
![image](https://github.com/SMHRD-2021-KDT-AI-16/EarlyRepo/assets/152265634/e7371fd4-87b5-4d85-9517-cb07cc870176)

### 4.3. Controller

- **요청 처리**
  - 화면에서 요청된 데이터 값을 Service로 전달해줍니다.

- **결과 응답** :pushpin: [코드 확인]()
  - Service 계층에서 넘어온 로직 처리 결과를 카카오맵api를 활용하여 화면상에 보여줍니다.
    
### 4.4. Service

- **JsonArray / text/plain 방식으로 데이터 변환** :pushpin: [코드 확인]()
  - 데이터 베이스에서 받아온 데이터를 jsp파일에서 사용할 수 있게 하기 위해 데이터를 변환합니다.



### 4.5. Map api
<img src="https://github.com/SMHRD-2021-KDT-AI-16/EarlyRepo/assets/152379979/b611efc0-7b1a-49b7-8d4a-ae2384e31726" width="450px" height="300px" title="px(픽셀) 크기 설정"></img><br/>

- ** 사용자가 입력한 값과 DB에 저장된 값과 비교해서 적합한 대출을 추출 ** :📌:[코드 확인](https://github.com/SMHRD-2021-KDT-AI-16/EarlyRepo/blob/ca21383ecc3d21a0e8497b68094cb30ecd287e8b/GitTest1/src/main/webapp/html/Profile.jsp#L240)
  - DB에서 받은 대출 값과 사용자가 입력한 재산정보를 합쳐서 DB에 저장된 Apt_Realprice보다 크면 Apt_Loc를 가져옵니다.
  - 외부api로 적용한 카카오맵api를 통해 ajax를 사용하여 가져온 Apt_Loc의 위치를 지도에 마커로 표시해줍니다.
  - Json을 이용해 아파트세부정보를 저장하고 지도에 표시된 값들 DB에 저장된 Apt_Code와 일치하는 아파트의 세부정보를 보여줍니다.   

<img src="https://github.com/SMHRD-2021-KDT-AI-16/EarlyRepo/assets/152379979/475b7f1f-440e-42f0-9b2b-5dd77d2718b2" width="450px" height="300px" title="px(픽셀) 크기 설정"></img><br/>



### 4.6. DB
- **금액비교**
  - 대출금액과 가용자산을 합하여 DB에 저장되어있는 실거래가와 비교
    
</div>
</details>

</br>

## 5. 핵심 트러블 슈팅
### 5.1. MyBatis 쿼리 오류 해결 문제
- 프로젝트를 기획하며 사용자에게 필요한 부동산 정보만 제공해주고 싶었습니다.
그래서 사용자의 정보를 입력 받고 입력 받은 정보와 DB에 저장된 데이터를 비교해야했습니다.

- 하지만 이전에 DB에 접근하기 위해 사용했던 JDBC는 쿼리를 실행하기 전과 후에 연결 생성, 명령문 등 많은 코드를 작성해야 하고
커넥션 관리와 예외 처리 등에 불편함이 있어 MyBatis를 사용하여 이를 보완하고자 했습니다.

- 그런데 쿼리를 작성하다 비교연산자인(>,<)를 사용하게 되면 XML파일에서는 부등호가 태그의 시작과 끝을 알리는 특수부호로
인식되기 때문에 아래의 **기존 코드** 를 사용했을때 발생하는 오류를 해결해야 했습니다.

<details>
<summary><b>기존 코드</b></summary>
<div markdown="1">

~~~java
/**
 * 대출 추천
 * @tb_loan 대출 정보
 * @tb_loan_criteria 비교할 대출 정보
 * @loan_name 대출 명
 * @loan_limit 대출 한도
 * @loan_seq 대출 코드
 * #{FIRST_HOUSE_YN} 최초 주택 구입 여부
 * #{DUPLICATE_YN} 중복 대출 여부
 * #{MARRIAGE_YEARS} 결혼 기간
 * #{INCOME} 연소득
 */

	<select id="SelectLoans" parameterType="com.early.model.LoanVO"
		resultType="com.early.model.LoanNameVO">
		SELECT a.loan_name, a.loan_limit
		FROM tb_loan a
		JOIN
		tb_loan_criteria b ON a.loan_seq = b.loan_seq
		WHERE FIRST_HOUSE_YN =
		#{FIRST_HOUSE_YN}
		AND DUPLICATE_YN = #{DUPLICATE_YN}
		AND
		MARRIAGE_YEARS >= #{MARRIAGE_YEARS}
		AND INCOME <= #{INCOME}
	</select>

/**
 * 부동산 추천
 * @tb_apartment 아파트
 * @tb_apartment_info 아파트 상세정보
 * @apt_name 아파트 명
 * @apt_realprice 실거래가
 * @apt_loc 아파트 주소
 * @apt_code 아파트 코드
 * #{total} 자산정보
 */

	<select id="getCompare" parameterType="String" resultType="com.early.model.CompareVO">
		SELECT a.apt_name, b.apt_realprice, a.apt_loc
		FROM tb_apartment a,
		tb_apartment_info b
		WHERE a.apt_code = b.apt_code
		AND b.apt_realprice <#{total}
	</select>

/**
 * 부동산 추천2
 * #{total_money} 자산정보
 */
	<select id="getCompare2" parameterType="int" resultType="com.early.model.CompareVO">
        SELECT a.apt_name, a.apt_loc, b.apt_realprice
        FROM tb_apartment a
        JOIN tb_apartment_info b ON a.apt_code = b.apt_code
        WHERE b.apt_realprice < #{total_money}
~~~

</div>
</details>

- 이 때 카테고리(tag)로 게시물을 필터링 하는 경우,  
각 게시물은 최대 3개까지의 카테고리(tag)를 가질 수 있어 해당 카테고리를 포함하는 모든 게시물을 질의해야 했기 때문에  
- 아래 **개선된 코드**와 같이 QueryDSL을 사용하여 다소 복잡한 Query를 작성하면서도 페이징 처리를 할 수 있었습니다.

<details>
<summary><b>개선된 코드</b></summary>
<div markdown="1">

~~~java
/**
 * 게시물 필터 (Tag Name)
 */
@Override
public Page<Post> findAllByTagName(String tagName, Pageable pageable) {

    QueryResults<Post> results = queryFactory
            .selectFrom(post)
            .innerJoin(postTag)
                .on(post.idx.eq(postTag.post.idx))
            .innerJoin(tag)
                .on(tag.idx.eq(postTag.tag.idx))
            .where(tag.name.eq(tagName))
            .orderBy(post.idx.desc())
                .limit(pageable.getPageSize())
                .offset(pageable.getOffset())
            .fetchResults();

    return new PageImpl<>(results.getResults(), pageable, results.getTotal());
}
~~~

</div>
</details>

</br>

## 6. 그 외 트러블 슈팅
<details>
<summary>npm run dev 실행 오류</summary>
<div markdown="1">

- Webpack-dev-server 버전을 3.0.0으로 다운그레이드로 해결
- `$ npm install —save-dev webpack-dev-server@3.0.0`

</div>
</details>

<details>
<summary>vue-devtools 크롬익스텐션 인식 오류 문제</summary>
<div markdown="1">
  
  - main.js 파일에 `Vue.config.devtools = true` 추가로 해결
  - [https://github.com/vuejs/vue-devtools/issues/190](https://github.com/vuejs/vue-devtools/issues/190)
  
</div>
</details>

<details>
<summary>ElementUI input 박스에서 `v-on:keyup.enter="메소드명"`이 정상 작동 안하는 문제</summary>
<div markdown="1">
  
  - `v-on:keyup.enter.native=""` 와 같이 .native 추가로 해결
  
</div>
</details>

<details>
<summary> Post 목록 출력시에 Member 객체 출력 에러 </summary>
<div markdown="1">
  
  - 에러 메세지(500에러)
    - No serializer found for class org.hibernate.proxy.pojo.javassist.JavassistLazyInitializer and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationConfig.SerializationFeature.FAIL_ON_EMPTY_BEANS)
  - 해결
    - Post 엔티티에 @ManyToOne 연관관계 매핑을 LAZY 옵션에서 기본(EAGER)옵션으로 수정
  
</div>
</details>
    
<details>
<summary> 프로젝트를 git init으로 생성 후 발생하는 npm run dev/build 오류 문제 </summary>
<div markdown="1">
  
  ```jsx
    $ npm run dev
    npm ERR! path C:\Users\integer\IdeaProjects\pilot\package.json
    npm ERR! code ENOENT
    npm ERR! errno -4058
    npm ERR! syscall open
    npm ERR! enoent ENOENT: no such file or directory, open 'C:\Users\integer\IdeaProjects\pilot\package.json'
    npm ERR! enoent This is related to npm not being able to find a file.
    npm ERR! enoent

    npm ERR! A complete log of this run can be found in:
    npm ERR!     C:\Users\integer\AppData\Roaming\npm-cache\_logs\2019-02-25T01_23_19_131Z-debug.log
  ```
  
  - 단순히 npm run dev/build 명령을 입력한 경로가 문제였다.
   
</div>
</details>    

<details>
<summary> 태그 선택후 등록하기 누를 때 `object references an unsaved transient instance - save the transient instance before flushing` 오류</summary>
<div markdown="1">
  
  - Post 엔티티의 @ManyToMany에 영속성 전이(cascade=CascadeType.ALL) 추가
    - JPA에서 Entity를 저장할 때 연관된 모든 Entity는 영속상태여야 한다.
    - CascadeType.PERSIST 옵션으로 부모와 자식 Enitity를 한 번에 영속화할 수 있다.
    - 참고
        - [https://stackoverflow.com/questions/2302802/object-references-an-unsaved-transient-instance-save-the-transient-instance-be/10680218](https://stackoverflow.com/questions/2302802/object-references-an-unsaved-transient-instance-save-the-transient-instance-be/10680218)
   
</div>
</details>    

<details>
<summary> JSON: Infinite recursion (StackOverflowError)</summary>
<div markdown="1">
  
  - @JsonIgnoreProperties 사용으로 해결
    - 참고
        - [http://springquay.blogspot.com/2016/01/new-approach-to-solve-json-recursive.html](http://springquay.blogspot.com/2016/01/new-approach-to-solve-json-recursive.html)
        - [https://stackoverflow.com/questions/3325387/infinite-recursion-with-jackson-json-and-hibernate-jpa-issue](https://stackoverflow.com/questions/3325387/infinite-recursion-with-jackson-json-and-hibernate-jpa-issue)
        
</div>
</details>  
    
<details>
<summary> H2 접속문제</summary>
<div markdown="1">
  
  - H2의 JDBC URL이 jdbc:h2:~/test 으로 되어있으면 jdbc:h2:mem:testdb 으로 변경해서 접속해야 한다.
        
</div>
</details> 
    
<details>
<summary> 컨텐츠수정 모달창에서 태그 셀렉트박스 드랍다운이 뒤쪽에 보이는 문제</summary>
<div markdown="1">
  
   - ElementUI의 Global Config에 옵션 추가하면 해결
     - main.js 파일에 `Vue.us(ElementUI, { zIndex: 9999 });` 옵션 추가(9999 이하면 안됌)
   - 참고
     - [https://element.eleme.io/#/en-US/component/quickstart#global-config](https://element.eleme.io/#/en-US/component/quickstart#global-config)
        
</div>
</details> 

<details>
<summary> HTTP delete Request시 개발자도구의 XHR(XMLHttpRequest )에서 delete요청이 2번씩 찍히는 이유</summary>
<div markdown="1">
  
  - When you try to send a XMLHttpRequest to a different domain than the page is hosted, you are violating the same-origin policy. However, this situation became somewhat common, many technics are introduced. CORS is one of them.

        In short, server that you are sending the DELETE request allows cross domain requests. In the process, there should be a **preflight** call and that is the **HTTP OPTION** call.

        So, you are having two responses for the **OPTION** and **DELETE** call.

        see [MDN page for CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS).

    - 출처 : [https://stackoverflow.com/questions/35808655/why-do-i-get-back-2-responses-of-200-and-204-when-using-an-ajax-call-to-delete-o](https://stackoverflow.com/questions/35808655/why-do-i-get-back-2-responses-of-200-and-204-when-using-an-ajax-call-to-delete-o)
        
</div>
</details> 

<details>
<summary> 이미지 파싱 시 og:image 경로가 달라서 제대로 파싱이 안되는 경우</summary>
<div markdown="1">
  
  - UserAgent 설정으로 해결
        - [https://www.javacodeexamples.com/jsoup-set-user-agent-example/760](https://www.javacodeexamples.com/jsoup-set-user-agent-example/760)
        - [http://www.useragentstring.com/](http://www.useragentstring.com/)
        
</div>
</details> 
    
<details>
<summary> 구글 로그인으로 로그인한 사용자의 정보를 가져오는 방법이 스프링 2.0대 버전에서 달라진 것</summary>
<div markdown="1">
  
  - 1.5대 버전에서는 Controller의 인자로 Principal을 넘기면 principal.getName(0에서 바로 꺼내서 쓸 수 있었는데, 2.0대 버전에서는 principal.getName()의 경우 principal 객체.toString()을 반환한다.
    - 1.5대 버전에서 principal을 사용하는 경우
    - 아래와 같이 사용했다면,

    ```jsx
    @RequestMapping("/sso/user")
    @SuppressWarnings("unchecked")
    public Map<String, String> user(Principal principal) {
        if (principal != null) {
            OAuth2Authentication oAuth2Authentication = (OAuth2Authentication) principal;
            Authentication authentication = oAuth2Authentication.getUserAuthentication();
            Map<String, String> details = new LinkedHashMap<>();
            details = (Map<String, String>) authentication.getDetails();
            logger.info("details = " + details);  // id, email, name, link etc.
            Map<String, String> map = new LinkedHashMap<>();
            map.put("email", details.get("email"));
            return map;
        }
        return null;
    }
    ```

    - 2.0대 버전에서는
    - 아래와 같이 principal 객체의 내용을 꺼내 쓸 수 있다.

    ```jsx
    UsernamePasswordAuthenticationToken token =
                    (UsernamePasswordAuthenticationToken) SecurityContextHolder
                            .getContext().getAuthentication();
            Map<String, Object> map = (Map<String, Object>) token.getPrincipal();

            String email = String.valueOf(map.get("email"));
            post.setMember(memberRepository.findByEmail(email));
    ```
        
</div>
</details> 
    
<details>
<summary> 랭킹 동점자 처리 문제</summary>
<div markdown="1">
  
  - PageRequest의 Sort부분에서 properties를 "rankPoint"를 주고 "likeCnt"를 줘서 댓글수보다 좋아요수가 우선순위 갖도록 설정.
  - 좋아요 수도 똑같다면..........
        
</div>
</details> 
    
</br>

## 6. 회고 / 느낀점
>프로젝트 개발 회고 글: https://zuminternet.github.io/ZUM-Pilot-integer/
