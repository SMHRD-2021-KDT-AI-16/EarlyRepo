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

![](https://github.com/SMHRD-2021-KDT-AI-16/EarlyRepo/assets/152265634/47587d45-ae45-4e34-9874-b52474d02193)



### 4.2. 사용자 요청

- **자산정보 입력 및 대출 서비스 소개
  - 사용자가 입력한 정보에 따라 조건에 부합하는 대출목록을 보여줍니다.   
<img src="https://github.com/SMHRD-2021-KDT-AI-16/EarlyRepo/assets/152265634/e7371fd4-87b5-4d85-9517-cb07cc870176" width="450px" height="300px" title="px(픽셀) 크기 설정"></img><br/>
- **카카오Map API를 활용하여 시각화
  - 카카오맵api에서 주소를 입력하면 주소에 해당하는 좌표를 마킹해주는 로직을 이용하여 시각화
  - 외부api로 적용한 카카오맵api를 통해 ajax를 사용하여 가져온 Apt_Loc의 위치를 지도에 마커로 표시해줍니다.
  - Json을 이용해 아파트세부정보를 저장하고 지도에 표시된 값들 DB에 저장된 Apt_Code와 일치하는 아파트의 세부정보를 보여줍니다.   
<img src="https://github.com/SMHRD-2021-KDT-AI-16/EarlyRepo/assets/152379979/475b7f1f-440e-42f0-9b2b-5dd77d2718b2" width="450px" height="300px" title="px(픽셀) 크기 설정"></img><br/>


### 4.3. FrontController

- **요청 처리**
  - 화면에서 요청된 데이터 값을 Service로 전달해줍니다.

- **결과 응답**
  - Service 계층에서 넘어온 로직 처리 결과를 jsp로 전달해줍니다.


### 4.4. Service

- **JsonArray / text/plain 방식으로 데이터 변환** 
  - 데이터 베이스에서 받아온 데이터를 jsp파일에서 사용할 수 있게 하기 위해 데이터를 변환합니다.


### 4.5. DB
- **대출소개**
  - 사용자가 입력한 값과 DB에 저장된 값과 비교해서 적합한 대출을 추출 :📌:[코드 확인](https://github.com/SMHRD-2021-KDT-AI-16/EarlyRepo/blob/ca21383ecc3d21a0e8497b68094cb30ecd287e8b/GitTest1/src/main/webapp/html/Profile.jsp#L240)
 
- **실거래비교**
  - DB에서 받은 대출 값과 사용자가 입력한 재산정보를 합쳐서 DB에 저장된 Apt_Realprice보다 크면 Apt_Loc를 가져옵니다.
    

</div>
</details>

</br>

## 5. 핵심 트러블 슈팅
### 5.1. MyBatis 쿼리 오류 해결 문제
- 프로젝트를 기획하며 사용자에게 필요한 부동산 정보를 제공해주고 싶었고
그래서 사용자의 정보를 입력 받고 입력 받은 정보와 DB에 저장된 데이터를 비교해야 했습니다.

- 하지만 이전에 DB에 접근하기 위해 사용했던 JDBC는 쿼리를 실행하기 전과 후에 연결 생성, 명령문 등 많은 코드를 작성해야 하고
커넥션 관리와 예외 처리 등에 불편함이 있어 MyBatis를 사용하여 이를 보완하고자 했습니다.

- 그런데 쿼리를 작성하다 비교연산자인(>,<)를 사용하게 되면 XML파일에서는 부등호가 태그의 시작과 끝을 알리는 특수부호로
인식되기 때문에 아래의 **기존 코드**를 사용했을때 발생하는 오류를 해결해야 했습니다.

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
 * #{total} 사용자 자산정보
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
 * #{total_money} 사용자 자산정보
 */
	<select id="getCompare2" parameterType="int" resultType="com.early.model.CompareVO">
        SELECT a.apt_name, a.apt_loc, b.apt_realprice
        FROM tb_apartment a
        JOIN tb_apartment_info b ON a.apt_code = b.apt_code
        WHERE b.apt_realprice < #{total_money}
~~~

</div>
</details>

- 이 때 사용자에게 필요한 부동산 정보를 제공해주기 위해 불가피하게 쿼리에 부등호를 사용해야 했기 때문에 
- 아래 **개선된 코드**와 같이 <![CDATA] ]>태그를 사용하여 아래의 개선된 코드와 같이 쿼리 작성시 부등호를 사용했을때 발생하는 오류를 해결하면서 MyBatis로 간편하게 DB에 접근할 수 있었습니다.

<details>
<summary><b>개선된 코드</b></summary>
<div markdown="1">

~~~java
/**
 * 대출 추천
 */
	<select id="SelectLoans" parameterType="com.early.model.LoanVO"
		resultType="com.early.model.LoanNameVO">
		<![CDATA[
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
		]]>
	</select>

/**
 * 부동산 추천
 */
	<select id="getCompare" parameterType="String" resultType="com.early.model.CompareVO">
		SELECT a.apt_name, b.apt_realprice, a.apt_loc
		FROM tb_apartment a,
		tb_apartment_info b
		WHERE a.apt_code = b.apt_code
		AND b.apt_realprice <![CDATA[<]]>
		#{total}
	</select>

/**
 * 부동산 추천2
 */
	<select id="getCompare2" parameterType="int" resultType="com.early.model.CompareVO">
	<![CDATA[
        SELECT a.apt_name, a.apt_loc, b.apt_realprice
        FROM tb_apartment a
        JOIN tb_apartment_info b ON a.apt_code = b.apt_code
        WHERE b.apt_realprice < #{total_money}
    ]]>
	</select>
}
~~~

</div>
</details>

</br>

## 6. 그 외 트러블 슈팅
<details>
<summary>GitHub File 복제시 서버 오류 문제</summary>
<div markdown="1">

- TomcatServer 삭제 후 Server 재설정으로 해결

</div>
</details>

<details>
<summary>ID중복확인시 통신 오류</summary>
<div markdown="1">

- ID 입력하는 곳에 값을 부여하고 url재매칭으로 해결
   
</div>
</details>

<details>
<summary>Eclips에 Kakao지도 삽입이 안되는 문제</summary>
<div markdown="1">

- localhost와 함께 포트번호 설정으로 해결

</div>
</details>

<details>
<summary>CSS수정 후 적용이 안되는 문제</summary>
<div markdown="1">

- Browser cookie삭제로 해결
- Browser가 이전에 사용한 CSS를 캐시에 보관해 사용하기 때문
 
</div>
</details>

<details>
<summary>회원탈퇴 기능 구현 문제</summary>
<div markdown="1">

- Session에 있던 값을 불러오고 저장된 ID와 맞는 값을 삭제해주었음. Session값 역시 제거후 해결
 
</div>
</details>

<details>
<summary>Crawling중 랜덤하게 멈추는 오류(1)</summary>
<div markdown="1">

- 1) 아이콘이 겹쳐서 해당현상이 발생하는 것으로 추측 후 페이지의 배율을 올림
- 2) 해당페이지의 구조가 페이지를 겹쳐서 계속 보여주는 방식이기에 다시 뒤로 되돌리는 로직을 추가
 
</div>
</details>

<details>
<summary>Crawling중 랜덤하게 멈추는 오류(2)</summary>
<div markdown="1">

- 1) 다음 데이터에 접근하여 값을 가져온 뒤 다시 처음으로 돌아가 탐색
- 2) 데이터에 새로 접근할 때 마다 주변 요소 리시트를 새롭게 갱신하여 받은 후 중복검사 실행 
 
</div>
</details>

<details>
<summary>selecList를 사용할 때 null값만 받아오는 문제</summary>
<div markdown="1">

- VO모델의 변수값과 DB의 컬럼명을 일치시킨 후 해결
 
</div>
</details>

<details>
<summary>repo에서 데이터 데이터 삭제 후 GitHub에서 pull을 실행했는데 servlet이 동작하는 문제</summary>
<div markdown="1">

- lib에서 cos.zar파일을 제대로 import시킨뒤 해결
 
</div>
</details>
    
</br>

## 6. 회고 / 느낀점

