001 테이블에서 특정 열(COLUMN) 선택하기

	1. 데이터 만들기
	1) 카페로 간다.
	2) 오라클 실습 데이터 스크립트 게시글로 들어간다.
	3) 명령어들을 복사한다.
	4) 도스창으로 간다.
	5) 커서에서 우클릭! (자동입력됨) -> 짜잔~!
	6) 이작업은 오늘만 하면 되는 것
	
	
	2. 데이터 검색하기
	명령어 : select ename, sal from emp; 라고 입력 + 엔터
	명령어 해석
	'select' = 검색 / 조회 해라
	'ename' = 이름 하고
	'sal' = 월급을 
	'from' =무엇으로 부터?
	'emp' = emp라는 table 로 부터
	' ; ' (세미 콜론) = 세미콜론 앞에 있는 (SQL) 문장 '실행해라' 라는 뜻(명령어)
	
	i.e) emp라는 table로부터 이름(ename)과 월급(sal)을 검색해라 라는 말!
	
	
	3. emp table 의 컬럼(COLUMN)들 (수업위해 필요한 정보)
	
	empno : 사원번호
	ename : 사원이름
	sal : 월급
	job : 직업
	comm : 커미션
	mgr : 관리자 번호
	hiredate : 입사일
	deptno : 부서번호
	
	

	문제 1.  이름과 월급과 직업을 출력하시오
	
	나의 생각 select ename, sal, job from emp; (맞음)
	
	
	
	문제 2. 이름과 입사일과 부서번호를 출력하시오
    
	나의 생각 : select ename, hiredate, deptno from emp; (맞음)
	
	
문제 3. emp 테이블에 컬럼이 무엇무엇이있는지 확인하시오.

desc (or decsribe) emp 라고 입력하면 됨.


문제 4. 이름, 월급, 커미션을 출력하시오
내생각 : select ename, sal, comm from emp;  (맞음)



Tip. SQL 입력시 주의 사항
	- SQL 은 대/소문자를 가리지 않는다. 
	소문자 : select ename, sal from emp;
	대문자 : SELECT ENAME, SAL FROM EMP; 
	
위의 두 쿼리문 모두 같은 결과를 출력한다! 
	
	
												
	
- SQL 에서 '절'은 다음 라인으로 '분리'해서 작성한다
	절의 종류 
	SELECT 절 
	FROM 절
	그 외에도
	where 
	group by
	having
	등등 이 있음.
	
	Tip. 실제 작업을 하다보면 내용이 길어지기때문에 옆으로 늘리지 말고 아래로 내리자!
	- 들여쓰기('tap 버튼')를 사용해서 SQL의 '가독성'을 높이는 것이 중요!

e.g)  문제 4의 쿼리를 다시 써보자면..

select ename, sal, comm <- select 절
    from emp;  <- from 절 (+ 명확한 구분을 위해 들여쓰기도 추가했다)

	
	
SQL 코딩한 것에서 에러를 찾기에는 '소문자'가 더 좋음! -> 그러니 가급적 소문자로 입력할것

문제 5. 이름, 직업, 입사일, 부서번호를 출력하시오.

내 생각 : select ename, job, hiredate, deptno
	(들여쓰기) from emp; (맞음)
	


문제 6. emp 테이블에 '모든 컬럼'을 검색하시오.

내 생각 : desc emp (맞음)
+ 
검색된 컬럼들을 다 select 해서 보면 파일이 너무 김.

결과 화면의 가로사이즈 조절하는 명령어(도스창일때만)
set lines 300 (수치는 임의로) -> 이거는 SQL 아님. (SQL + 명령어일뿐)
 
직전에 입력했던 명령어들을 다시 입력하기 귀찮다면 
/ + 엔터 


결과 화면에서 세로 사이즈 조절하는 명령어(도스창일때만)
set pages 300 (수치는 임의로)

컬럼이 이처럼 1자리수가 아니라 수백개라면? 모든 데이터를 어떻게 볼까?
	
002 테이블에서 '모든 열(COLUMN)' 출력하기

select *
   from emp;
를 입력

 * (특수문자 별) 은 asterisk (아스탈리스크) 라고 함. 모든 컬럼을 다 선택할때 사용한다.


문제 7. dept table 에서 모든 컬럼을 출력하시오

내 생각 : (맞음)
select * 
  from dept;



	dept 는 부서 테이블이고 컬럼은 3개가 있는데 다음과 같다.
	deptno = 부서번호
	dname = 부서명
	loc = 부서위치
	
	결과값에서 각 데이터의 한 행은 'row' 라고 함
	즉, 테이블은 컬럼 by 로우 로 구성되어 있음.
