017 문자에서 특정 철자 추출하기(SUBSTR)

문법 : 
substr(출력할 컬럼, 문자출력 시작할 지점, 문자출력할 수)

e.g) 
select ename, substr(ename, 1,1) <- ename의 철자를 출력하는데 첫번째 글자기준으로 우측으로 한글자만 출력하라!
from emp12;


숫자로 보는 글자의 자리수 기준
    김     승      순
    1      2       3 
   -3     -2      -1 

둘다 가능!

substr(ename, 시작점이될 자리의 위치, 몇번째까지 표시할것인지)

이름이 3글자 김.승.순 이면 김 은 1번째 혹은 -3, 승 은 2번째, 혹은 -2, 순 은 3번째 자리를 의미

substr(ename, 2,2) 면 이름 데이터에서 2번째 글자부터 2개를 읽어라 라는 의미!
-> 승 (2번째 글자) 부터 2글자 인 '승순'으로 읽게 되는 것.

substr(ename, -3,2) 면 이름 이터에서 뒤에서 3번째인 글자 (김) 부터 2글자를 읽으라는의미 
-> 김승 이라고 나옴.


e.g)
select ename, substr(ename,1,1)
	from emp12;
	


e.g)
성씨가 '이'씨인 학생들의 이름을 출력하시오. like 쓰지 않고, in 과 substr 만을 써서 나타내시오.

내 생각
select ename, substr(ename,1,1)
    from emp12
    where substr(ename,1,1) in '이';

조건이 하나여서 사실 in 대신 =을 써도 되긴 하다.


select ename, substr(ename,1,1) -> 이름과 이름의 첫글자 데이터를 선택하고
    from emp12 
    where substr(ename,1,1) in '이'; -> where 절이 조건을 지정하는 절! 
   어떤 데이터를 추출할 것인지 조건을 부여하는 것이므로 substr 을 쓴다. 그리고 그중에 '이'라는 글자를 가진 데이터   
    만 골라내는 것

where 절에 검색조건을 줘야 원하는 데이터를 볼 수 있는 것.
select 절은 데이터를 선택할 뿐. 필터링 하진 않아!





문제 64. 성씨가 김, 이, 유씨인 학생들의 이름과 나이를 출력하는데 like 를 쓰지 말고 in 과 substr 을 써서 출력하시오.


내 생각 : 맞음

select ename, age
	from emp12
	where substr(ename,1,1) in ('김','이','유');
	



018 문자열의 길이를 출력하기(LENGTH)

철자의 길이를 출력하는 함수
select ename, length(ename) 
	from emp;

-> emp에서 ename라는 컬럼에서 출력되는 데이터 각 값의 길이가 몇자인지 출력하라는 뜻





문제 65. 우리반 테이블에서 이메일과 이메일 철자의 길이를 출력하는데, 이메일 철자의 길이가 긴 것부터 출력되도록 하시오.

내 생각 : 맞음

select ename, email, length(email)
    from emp12
    order by length(email) desc;




응용 해보고 싶어진 것
Q. 이메일 글자순으로 나열하고, 이름을 가나다 순으로 나열하는 법은?

select ename, email, length(email)
	from emp12
	order by length(email) desc, ename desc;
	


다른 조건 명령어들은 and 나 not 등을 붙여서 처음엔 
order by length(email) desc and ename desc; 요렇게 했는데 오류!

order by 에서 여러조건을 입력할때는 전치사 없이 조건 추가할때 콤마로 구분만 하면 됨!
(전에 실습하며 해본 적이 있는데 기억을 못했던 듯. 역시 복습이 중요!) 


문제 66. EMP 테이블에서 ename 을 출력하고 그 옆에 ename 의 첫번째 철자를 출력하시오.

내 생각 : 맞음
select ename, substr(ename,1,1)
    from emp;



문제 67. 위의 결과를 다시 출력하는데 이름의 첫번째 철자로 출력되는 부분은 소문자로 출력하시오.

내 생각 : 맞음

select ename, lower(substr(ename,1,1))
    from emp;

or

선생님이 알려주신 다른 답
select ename, substr(lower(ename),1,1)
    from emp;

이렇게 해도 됨.


도출하려는 값중 대/소 문자 등으로 변경하고 싶은 것은 맨 앞에 와야 하는 구나! 


문제 68. (오늘의 마지막 문제) 답글로 검사 받으세요~!
아래의 결과를 initcap 쓰지 말고, upper, lower, substr, || (연결연산자) 사용해서 출력하시오!

select initcap(ename)
	from emp;

결과값
King
Blake
Clark
Jones
Martin
Allen
Turner
James
Ward
Ford
Smith
Scott
Adams
Miller
	



내 생각

select substr(upper(ename),1,1)||substr(lower(ename),2,5) as "INITCAP(ENAME)"
    from emp; 

이것도 맞긴함.  근데 글자수를 전부 다 알고 있어서 맞추서 5라고 카운팅한것!

다른 사람 답변 보니!
select substr(upper(ename),1,1)||substr(lower(ename),2,length(ename)-1)
    from emp;

라고 해서 length 함수도 쓰면서 맨 뒷자리는 몇글자가 되든 -1인 것을 응용함! (똑똑해!!!)

가장 완벽한 답은 이거 같음!

select upper(substr(ename,1,1))||lower(substr(ename,2))
from emp;

-> 선택해라 대문자로 이름의 첫번째 글자 기준으로 1글자 || (연결연산) 소문자로 이름의 2번째 글자부터 전부!
emp 테이블로 부터

substr 을 쓸때 데이터를 고를 컬럼을 선택하고 콤마/숫자/괄호(끝날 순번 지정하지 않음) 하면 해당 숫자부터 끝까지 별도의 지정 없이 다 선택이 되는 것이구나! 
꼭 substr(컬럼, 숫자,숫자) 이런 식으로 입력할 필요 없구나!


응용문제 만들어 보자.
Q. 68번의 결과 + job 을 출력하는데 initcap 쓰지 말고, upper, lower, substr, || (연결연산자) 사용해서 출력하시오!

select initcap(ename), initcap(job)
    from emp;

결과값
King	President
Blake	Manager
Clark	Manager
Jones	Manager
Martin	Salesman
Allen	Salesman
Turner	Salesman
James	Clerk
Ward	Salesman
Ford	Analyst
Smith	Clerk
Scott	Analyst
Adams	Clerk
Miller	Clerk


위 결과 처럼 만들기

select upper(substr(ename,1,1))||lower(substr(ename,2))as "INITCAP ENAME",
upper(substr(job,1,1))||lower(substr(job,2)) as "INITCAP JOB"
    from emp;


