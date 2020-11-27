    005 중복된 데이터를 제거해서 출력하기(DISTINCT)
    
    distinct 키워드를 컬럼명 앞에 작성하고 실행하면 중복된 데이터를 제거하고 
    출력할 수 있다.
    e.g) 
    
    select job
        from emp; 
        
    에서 중복되는 데이터(=중복되는 직업) 을 제거하고 출력하고 싶다면,
    
    select distinct job
        from emp;
    
    
    
    문제 12. 부서번호를 출력하는데 중복을 제거해서 출력하시오.
    
    내 생각 : 
    select distinct deptno
        from emp;
        
        
    distinct 뒤에 컬럼명 쓰고, 그 뒤에 다른 컬럼명을 여러 개 쓰면 분리되지 않음. 
    e.g) 
    select distinct ename ,sal
            from emp;
            
    라고 했다면 이미 ename 에서 중복된 데이터를 제거하였기 때문에, 데이터가 걸러짐
    그 상태에서 sal이 중복되는 것을 거르는 것이 아닌, 걸러진 ename 의 데이터의 sal
    을 출력하는 것.
    
	006 데이터를 정렬해서 출력하기(ORDER BY)
	
	order by 절은 데이터를 정렬하는 절이고, 쿼리의 맨마지막(=맨밑)에 기술합니다.
	order by 뒤에 정렬할 컬럼명 , 그 뒤에 정렬하는 방법(asc/desc) 순으로 입력
	
	i.e) 
	select ename, sal
		from emp;
		order by sal asc;
		
	
	asc = 올림차순-낮은 값이 위로 오게
	desc = 내림차순-높은 값이 위로 오게
	
	문제 13. 이름과 월급을 출력하는데, 월급이 높은 사원부터 출력하시오.
	
	내 생각 : (맞음)
	selcet ename, sal
		from emp
		order by sal desc;
		
	
	
	문제 14. 이름과 입사일을 출력하는데, 최근에 입사한 사원부터 출력하시오.
	
	내 생각 : (맞음)
	select ename, hiredate
		from emp
		order by hiredate desc;
    
    desc 는 낮은 것부터 출력 -> 날짜데이터에서는 과거로 갈수록 큰것!
		
	
	
	점심시간 문제
	이름과 월급과 부서번호를 출력하는데 부서번호가 10번, 20번, 30번 순으로 출력되게 하고, 컬럼명이 한글로 이름, 월급, 부서번호로 출력되게 하시오.
	
	
	내 생각 (맞음)
	select ename as 이름, sal as 월급, deptno as 부서번호
		from emp
		order by deptno asc;
	
    
    order by 절에 컬럼을 여러 개 작성할 수 있음.
    How? 
    select ename, deptno, sal
        from emp
        order by deptno asc, sal desc;
    -> 부서 번호 asc 정렬된 것을 기준으로,
    그 안에서 sal이 desc 하게 정렬되어서 나옴.
    
    정렬할 컬럼을 구분할때는 콤마 (,) 로 해주어야 한다!
    and 라고 생각할 수도 있는데 절대 아님!
    
    
    
    현업에서 컬럼명이 너무 길거나, 많을때 팁
    
    select ename, deptno, sal
        from emp
        order by 2 asc, 3 desc;
    
    컬럼 순서에 맞는 번호로 대체하여 입력한 것.
    
    
    
    
    문제 15. 이름과 직업과 입사일을 출력하는데, 직업은 ABCD 순으로 정렬해서 출력하고 그렇게 출력한 값을 기준으로 입사일을 먼저 입사한 사람부터 출력되게 하시오.
    
    내 생각 (맞음)
    select ename, job, hiredate
        from emp
        order by job asc, hiredate asc;
	
	
