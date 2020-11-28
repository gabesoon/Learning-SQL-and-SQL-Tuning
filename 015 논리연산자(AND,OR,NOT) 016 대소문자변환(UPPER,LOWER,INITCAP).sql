015 논리 연산자 배우기(AND, OR, NOT)


연산자의 종류는 3가지가 있음.
1) 산술 연산자 -> *, /, +, - (사칙연산) 

2) 비교 연산자 -> >, <, >=, <=, =, !=, <>, ^= 
기타 비교 연산자 -> between and , like, is null, in

3) 논리 연산자 -> and , or, not

e.g) 직업이 SALESMAN 이고 월급이 1200 이상인 사원들의 이름과 월급과 직업을 출력하시오.

 정답 

select ename, sal, job
    from emp
    where job = 'SALESMAN' and sal>=1200;



'and' 양 옆의 조건이 모두 true 이기 때문에 값이 나오는 것. 
-> true and true = true



'and' 양옆의 조건중 하나가 false 이면 나머지 하나가 true 여도 false 가 된다.

false and true = false 여서 결과가 출력이 안됨.

What if, 두번째 예시에서 and가 아닌 or 라면?

false or true = true 이기에 결과가 출력됨. (결과물이 나옴)

select ename, sal, job
    from emp
    where job = 'SALESMAN' or sal>=1200;


SALESMAN 은 해당되지 않아도 sal 이 1200 이상인 조건들이 모두 나온 것!

그러므로 'or' 명령어를 쓸때는 매우 주의 해야 함! 조건 하나가 false 여도 값은 나오기 때문에!



문제 60. 직업이 SALESMAN 이거나 ANALYST 인  사원들의 이름과 월급과 직업을 출력하시오.

내 생각 
select ename, sal, job
    from emp
    where job = 'SALESMAN' or 'ANALYST'; 

이라고 했는데 오답!

select ename, sal, job
    from emp
    where job = 'SALESMAN' or job = 'ANALYST';
    라고 해야 나옴.
    where 절에 조건을 쓸때는 같은 걸럼이라 하더라도, 조건2부터는 검색할 조건이 있는
    컬럼명을 명시해줘야 한다!


혹은 
select ename, sal, job
	from emp
	where job in 'SALESMAN' or job = 'ANALYST';
	


문제 61. 성씨가 김씨, 이씨가 아닌 학생 들의 이름을 출력하시오.

어렵다!!!

select ename
    from emp12
    where ename not like '%김%' and ename not like '%이%';





연결 해주는 거니까 명령어 뒤에 (and, or ) 두번째 조건에 또다시  명령어를 입력해주는게 포인트!

 
문제 62. 이메일이 gmail 과 naver 이 아닌 학생들의 이름과 이메일을 출력하시오.

내 생각 : 맞음

select ename, email
	from emp12
	where email not like '%gmail%' and email not like '%naver%';
	


	
	


PART 2「초급」 SQL 기초 다지기


016 대소문자 변환 함수 배우기(UPPER, LOWER, INITCAP)

함수 (function) 이란, 어떤 특정 기능을 구현해 놓은 코드의 집합.

특정 입력값을 '함수'에 넣으면, 어떤 '출력값' 을 보여줌. (무언가가 항상 나옴! 안나오지 않아!)

함수를 사용하는 이유?
함수를 이용하면 좀 더 복잡한 데이터 검색을 할 수 있기 때문.

e.g) 영화 겨울 왕국에는 elsa 가 많이 나올까 anna 가 많이 나올까? 같은 것을 할 수 있음.

e.g) 우리반 학생들이 제일 많이 쓰는 통신사가 어디일까?

함수의 종류는 2가지

1) 단일행 함수 : 하나의 행을 입력받아 하나의 행을 반환하는 함수
- 문자 : upper, lower, initcap // 그외 SUBSTR, LENGTH, CONCAT, INSTR, TRIM, LAPD, RPAD 등등

upper = 대문자로 출력하는 함수
lower = 소문자로 출력하는 함수
initcap = '첫글자만 대문자' 나머지는 다 소문자로 출력하는 함수

추후 배울 유형들
- 숫자 : 
- 날짜 :
- 변환 :
- 일반 :

2) 복수행 함수 : 여러개의 행을 입력 받아 하나의 행을 반환하는 함수.
- max
- min
- avg
- sum
- count
- var
- stddev

단일행 함수 중 문자 함수

e.g)

select upper(ename), lower(ename),initcap(ename)
    from emp;

해석: emp테이블에서 이름을 3번 출력하는데 첫번째는 대문자로 출력하고, 두번째는 소문자로 이름을 출력하고, 
    세번째는 첫글자만 대문자 나머지는 소문자로 하여 출력하라!

이 함수들은 특정 조건을 '찾는 것'이 아니라, 데이터를 내가 '원하는 조건으로 적용' 시켜 주는 함수!
설령 데이터가 대/소문자가 섞여 있어도 내가 원하는 방식으로 정제할 수가 있는 것. 


문제 63. 우리반 테이블에서 통신사가 sk 와 관련된 통신사이면 그 학생의 이름과 통신사를 출력하시오.
정확하게 데이터가 출력되게 끔 SQL 을 작성하시오! (나는 못풀었음)


정답 
select ename, upper(telecom)
	form emp12
	where upper(telecom) like '%SK%';
	
	


where upper(telecom) -> 요부분이 똑똑하게 SQL을 잘 만든 것.
telecom 데이터를 전부 대문자로 바꾸라는 명령어
그 후 like 에 편하게(데이터를 대문자로 전부 바꿨으니까) 대문자만 입력해서 검색하라고 명령 

select 선택하라 , ename 이름과, upper(telecom) 대문자로 된 통신사를
from emp12 -> emp 12 라는 테이블에서
where 선택할 곳은 , upper(telecom) 대문자로 변환한 통신사 자료이고, like '%SK%' -> SK로 표기 되는 모든 자료들을 출력하라.

lower 개념을 적용해서 

select ename, lower(telecom) as telecom
    from emp12
    where lower(telecom) like '%sk%';
    
로 풀 수도 있음!

