    007 WHERE절 배우기 1(숫자 데이터 검색)
        
        where 절을 사용하면, 특정 조건에 대한 데이터만 선별해서 출력할 수 있다.
        
    i.e) 
    select ename, sal
        from emp
        where sal = 3000;
    
    해석: emp 테이블에서 이름과 월급을 출력하는데 월급이 3000인 데이터만 출력하라!        
        
        
    문제 16. 사원번호가 7788번인 사원의 사원번호와 이름과 월급을 출력하시오. 
    
    내 생각 (맞음)
    select empno, ename, sal
        from emp
        where empno = 7788;
        
        
        
        
    문제 17. 30번 부서번호에서 근무하는 사원들의 이름과 월급과 부서번호를 출력하세요.
    
    내 생각 (맞음)
    select ename, sal, deptno
        from emp
        where deptno = 30;
        
        
    
    문제 18. 문제 17의 결과를 월급이 높은 사원순으로 출력하시오.
    
     정답
    select ename, sal, deptno
        from emp
        where deptno = 30
        order by sal desc;
        
        
        
    문제 19. 부서번호가 20번인 사원들의 이름과 입사일과 부서번호를 출력하는데 최근에 입사한 사원부터 출력하시오.
    
    내 생각
    select ename, hiredate, deptno
        from emp
        where deptno = 20
        order by hiredate desc;
        
        
    
    
    008 WHERE절 배우기 2(문자와 날짜 검색)
    where 절로 검색할때 숫자와는 다르게 문자는 양쪽에 싱글 쿼테이션 마크를 둘러줘야 합니다.
    
    e.g)
    select ename, sal
        from emp
        where ename='SCOTT';
    

    SQL은 대소문자를 구분하지 않으나, 데이터는 대소문자를 구분한다. 그래서 where 등으로 지정할때 명확하게 구분 해줘야 한다.
    
    현재 emp table 의 경우 소문자로 하면 데이터가 없기 때문에 결과값이 나오지 않는다.
    
    
    그 외에도 문자와 날짜 데이터는 싱글 쿼테이션이 없으면 식별되지 않음.주의!
    
    
    즉, 싱글 쿼테이션 마크안에 있는 데이터는 '문자 또는 날짜이다' 라고 오라클에게 알려주는 것임.
    
    문제 20. 직업이 salesman 인 사원들의 이름과 월급과 직업을 출력하시오
    
    내 생각 (맞음)
    select ename, sal, job
        from emp
        where job = 'SALESMAN';
    
    
    
     
    문제 21. 81년 11월 17일에 입사한 사원의 이름과 입사일을 출력하시오.
    
     답 : 
    select ename, hiredate
        from emp
        where hiredate = '81/11/17';
        
        
    
    
    Tip. 날짜 검색을 할때는 연도/월/일 순으로 검색을 하면 된다. 단, 나라마다 순서가 다를 수 있다.
    미국이나 영국에서의 날짜 검색은 일/월/년 순서 입니다. (반대로 한국에서는 년/월/일 순이다.)
