009 산술 연산자 배우기(*, /, +, -)

SQL에서 데이터의 사칙연산은 다음과 같은 기호를 사용한다.

곱하기 : *
나누기 : /
더하기 : +
빼 기 : -

e.g)
select ename, sal, sal + 3000
	from emp;

이름, 월급, 월급에 3000이 더해진 결과값 이 출력된다.
	
	
문제 22. 이름과 연봉 (sal*12) 을 출력하는데 컬럼명을 한글로 이름, 연봉으로 출력하시오.

내 생각 (맞음)
select ename as 이름, sal*12 as 연봉
	from emp;
	
	
	
문제 23. 위의 결과를 다시 출력하는데 연봉이 36000인 사원들의 이름과 연봉을 출력하시오.

	
	내 생각
	select ename as 이름, sal*12 as 연봉
		from emp
		where sal*12 = 36000;
		
		
		
		select ename as 이름, sal*12 as 연봉
			from emp
			where 연봉 = 36000;
			
		으로 하면 값이 나오지 않음
		
			
    오라클이 내부적으로 실행하는 순서는 from 절 -> where 절 -> select 절 순서임. (코딩 순서와 다름) 그렇기 때문에 위의 명령어가 실행되지 않는 것.
    
    입력 순서 : select -> from -> where (-> order by)
    실행 순서 : from -> where -> select (-> order by)
    
   
			
문제 24. 이름과 연봉을 출력하는데 연봉이 높은 사원부터 출력하시오.

내 생각 (맞음)

select ename, sal*12
	from emp
	order by sal*12 desc;

	입력 순서 : select -> from -> order by
	실행 순서 : from -> select -> order by
	
문제 25. 아래의 SQL에서 더하기가 먼저 실행되게 하려면?

select ename, sal + 200 * 2
	from emp;
	
	내 생각 (맞음)
	select ename, (sal+200)*2
		from emp;
		
일반 수학 공식 처럼 괄호를 사용하면 된다.

		
	010 비교 연산자 배우기 1(〉, 〈, 〉=,〈=, =, !=,〈〉, ^=)
	
	 !=,〈〉, ^= 는 모두 '같지 않거나' 를 의미 (3가지) (사실상 같지 않다./ 다르다)
	
	!= 를 제일 많이 씀.
	
	오늘 복습을 해보니 크거나 작다 혹은 작거나 크다 할때 부등호를 많이 헷갈려함.
	- >= + 숫자 는 '숫자' 보다 크거나 같다.(=이상) 
	- <= + 숫자 는 '숫자' 보다 작거나 같다.(=이하)
    
	
문제 26번. 커미션이 150 이상인 사원들의 이름과 커미션을 출력하시오.

    select ename, comm
        from emp
        where comm >=150;

	
문제 27. 월급이 3000 이상인 사원들의 월급과 이름을 출력하시오.
	
	내 생각
	select ename, sal
		from emp
		where sal >= 3000;
		

		
		
문제 28. 직업이 SALESMAN 이 아닌 사원들의 이름과 직업을 출력하시오.

내 생각 (맞음)
select ename, job
	from emp
	where job != 'SALESMAN';
	


	
문자와 날짜는 반드시 양쪽에 싱글 쿼테이션 마크를 둘러줘야 한다.
더블 쿼테이션 마크는 오라클 전체를 통틀어서 '딱 하나의 케이스'에서만 사용함. 
컬럼별칭 사용할때 공백문자, 특수문자, 대소문자를 구분해서 컬럼별칭을 출력하고자 할때만 사용한다. 
(그 외의 모든 케이스는 싱글쿼테이션!!)

문제 29. 월급이 2400 이하인 사원들의 이름과 월급을 출력하는데, 월급이 높은 사원부터 출력하시오
    select ename, sal
        from emp
        where sal <=2400
        order by sal desc;

