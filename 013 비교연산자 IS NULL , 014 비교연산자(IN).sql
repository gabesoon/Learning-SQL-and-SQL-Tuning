013 비교 연산자 배우기 4(IS NULL)

NULL 값을 조회할 때 사용하는 연산자가 is null 이다.
null 값이란, data가 없는 상태 혹은 알 수 없는 값(unkown-> oracle 메뉴얼에서만 표현 -> 의미가 더 명확화됨) 이라는 의미.


문제 40. 이름과 월급과 커미션을 출력하세요 (1).  커미션이 null 인 사원들의 이름과 커미션을 출력하시오.(2)

(1) 내생각 : 맞음
select ename, sal, comm
	from emp;

결과값에서 null 로 나오는 사람들이 커미션이 없는(받지않는) 사람들.

(2) 내 생각 : 맞음
select ename, comm
	from emp
	where comm is null;
	

	

만약, 수식을 is null 이 아닌 where comm = null 이라고 하면 값이 나오지 않음.
왜냐하면 null은  알 수 없는 값이므로, 비교 연산자인 = 로는 조회할 수 없다.
null 을 조회 하려면 '기타 비교연산자'인 is null 을 써야 한다.

*해석하면 결국 comm is null 이나 comm = null 이나 머리속으론 같은 의미로 생각되어서 헷갈려 할수 있다!
*null 은 비교연산자와 쓸수없다! 그래서 '기타 비교연산자' 로 사용한다!





문제 41. 커미션이 'null 이 아닌' 사원들의 이름과 커미션을 출력하시오.

내 생각 
select ename, comm
	from emp
	where comm is not null;
	



문제 42. mgr(관리자의 사원번호) 이 null 인 사원의 이름과 직업을 출력하시오

내 생각
select ename
	from emp
	where mgr is null;
	




문제 43. 사원번호, 이름, 관리자 번호를 출력하시오. 

select empno, ename, mgr
    from emp;

결과를 보면..
사장(PRESIDENT) 은 관리자 번호(mgr)가 없다. (총 책임자 니까)




014 비교 연산자 배우기 5(IN)

where 절의 검색 조건에서 여러개의 행을 비교할때는 in 을 사용해야 합니다.
i.e) 사원번호가 7788, 7902 인 사원들의 사원번호와 이름을 조회하시오.

select empno, ename
	from emp
	where empno in (7788, 7902)
	


= (equal) 연산자는 하나의 값만 비교할 수 있다. 여러개의 값을 비교할 때는 in 을 사용해야 합니다.




문제 44. 직업이 SALESMAN, ANALYST 인 사원들의 이름과 직업을 출력하시오.

내 생각 : 맞음
select ename, job
	from emp
	where job in ('SALESMAN' , 'ANALYST');
	
	
	
여러개를 비교하는 것이니까 'in'을 써야 하고, 괄호 로 묶어 줘야 한다!
ename 은 검은색인데, job 은 파란색인 이유? -> job 이 오라클의 명령어중 하나여서 그럼.
보통 회사에서는 job이라고 안씀.

문제 45. 직업이 SALESMAN, ANALYST 가 아닌 사원들의 이름과 직업을 출력하세요.

내 생각 : 맞음

select ename, job
	from emp
	where job not in ('SALESMAN' , 'ANALYST');




select ename, job
	from emp
	where not job in ('SALESMAN' , 'ANALYST');
	
라고 써도 값은 나오는데, 이건 오라클이 문법을 자동수정 해준 것. (정확하게 배우는 것이 중요!)


조금 더 현업에 가까운 데이터를 만들기 위해 우리반 만의 데이터를 생성해서 실습할 예정

i.e) 

통신사 : sk, lg, kt

insert into emp12
values('김승순',33,'남','국제통상학과','skt','nostelgia18@gmail.com','서울시 도봉구 쌍문동' );

로 해서 카페에 댓글 달기 (완료)


<점심시간 문제! >
문제 46. 직업이 SALESMAN 이 아닌 사원들의 이름과 월급과 직업을 출력하시오.

내 생각 
select ename, job, sal
	from emp
	where job != 'SALESMAN';





문제 47. 위의 결과를 다시 출력하는데 월급이 높은 사원부터 출력하시오.

내 생각 : 맞음

select ename, sal, job
    from emp
    where job != 'SALESMAN'
    order by sal desc;




수업을 위해 emp12 테이블을 만든 scott 유저 창에서 emp와 dept 테이블을 생성하기!
카페 게시글 2번 복사 후 오라클 scott 창에 붙여 넣기


문제 48. 우리반 테이블에서 이름과 나이를 출력하는데 나이가 높은 학생부터 출력하시오.

내 생각 : 맞음
select ename, age
	from emp12
	order by age desc;



	
문제 49. 이름과 나이와 주소를 출력하는데, 30살 이상인 학생들만 출력하시오.

내 생각 : 맞음
select ename, age
	from emp12
	where age >=30;
	

	
	
문제 50. 성씨가 '김씨' 인 학생들의 이름과 통신사를 출력하시오.

내 생각 : 맞음
select ename, telecom
	from emp12
	where ename like '김%';
	




문제 51. 전공에 통계를 포함하고 있는 학생들의 이름과  전공을 출력하시오.


정답
select ename, major
	from emp12
	where major like '%통계%';
	


like 연산자를 사용할 때 특정 단어를 포함하고 있는 데이터를 검색하려면 '%단어%' (양쪽에 와일드카드) 라고 하면 됩니다.

문제 52. 우리반에 gmail 사용하는 학생들의 이름과 메일을 출력하시오.

내 생각 (반만 정답)
select ename, email
	from emp12
	where email like '%@gmail%';
	
	? @는 안썼어도 되긴함.
    
select ename, email
    from emp12
    where email like '%gmail%';



문제 53. 우리반에 나이가 27에서 34사이인 학생들의 이름과 나이를 출력하시오.

내 생각 : 맞음
select ename, age
	from emp12
	where age between 27 and 34;
	
	

	
문제 54. 우리반에서 나이가 27에서 34 사이가 아닌 학생들의 이름과 나이를 출력하시오.

내 생각 : 
select ename, age
	from emp12
	where age not between 27 and 34;
	

	

문제 55. 주소가 경기도인 학생들의 이름과 나이와 주소를 출력하시오.

내 생각 :

select ename, age, address
	from emp12
	where address like '%경기도%';
	




문제 56. 통신사가 sk, lg 인 학생들의 이름과 통신사를 출력하시오.

내 생각 : 맞음

select ename, telecom
	from emp12
	where telecom in ('sk','lg');
	




근데 우리반 데이터 테이블에는 오기입으로 인해 Sk, skt 등도 있어서 실무에선 올바르게 짠 코딩이 아닐 수도있음!




문제 57. 서울에서 사는 학생들의 이름과 나이와 전공을 출력하는데 나이가 높은학생부터 출력하시오.


내 생각 : 맞음
select ename, age, major
	from emp12
	where address like '%서울%'
	order by age desc;
	

	

문제 58. 이메일이 gmail이 아닌 학생들의 이름과 이메일을 출력하시오.

내 생각 : 맞음

select ename, email
	from emp12
	where email not like '%gmail%';
	



문제 59. 아래와 같이 결과가 출력되도록 하시오.

김** 학생의 나이는 44세 입니다. <-git hub 업로드 용이라 암호화함. (실제론 반 구성원 이름)
권** 학생의 나이는 36세 입니다.
          .
          .
          .
          .
          
내 생각 : 맞음 

select ename || ' 학생의 나이는' ||age|| '세 입니다.'
	from emp12
	order by age desc;
	


연결연산자 코딩은 의외로 어렵다. 배울때는 쉽다고 생각했는데 오랜만에 나와서 응용하려니 바로 생각이 나지 않아서 노트를 찾아 봤다. 
(찾아 보고도 오래걸렸다..) -> 역시 복습만이 살길!