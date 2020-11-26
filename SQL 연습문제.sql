(유형1)
연습문제1. 직업,직업별 토탈월급을 출력하는데 직업이 SALESMAN인 사람은 제외하고
직업별 토탈월급이 4000이상인 사람의 것만 출력하고, 직업별 토탈월급이 높은 순으로
정렬하시오.

select job, sum(sal)
    from emp
    where job !='SALESMAN'
    having sum(sal) >=4000
    group by job
    order by sum(sal) desc;
    
(유형2)    
연습문제2. 이름, 직업, 월급을 출력하는데 직업은 abcd순으로 정렬하고, 그 기준 아래
월급이 높은 순으로 출력하시오.

select ename, job, sal
    from emp
    order by job asc, sal desc; <- order by 절 추가 조건 구분은 콤마(,) 로!

(유형2 연습)
연습문제 3. 이름, 부서번호, 입사일을 출력하는데 부서번호를 ascending 하게 출력하고
그 기준아래 입사일을 descending 하게 출력하시오.

select ename, deptno, hiredate
    from emp
    order by deptno asc, hiredate desc;
    
(유형3) - rollup | rollup(정렬할컬럼명) <-group by 절에 쓰인다.
연습문제 4. 직업, 직업별 토탈월급을 출력하는데 맨 아래에 전체 토탈월급이 나오게 하시오.

select job, sum(sal)
    from emp
    group by rollup(job);
    
rollup 함수는 집계한 결과를 맨 아래에 출력하고자 할때 사용한다.

(유형3 변형) - rollup을 여러개의 컬럼에 적용하고 싶을때 ! grouping sets 를 사용한다
연습문제 5. 연습문제 4의 결과를 grouping sets 를 사용해서 출력하시오.

select job, sum(sal)
    from emp
    group by grouping sets (job, ());
    
grouping sets 함수는 rollup 처럼 집계결과를 출력하는 함수이다.
group by + grouping sets (컬럼명, () ) 로 쓰인다.
set 뒤의 괄호에는 그룹해서 집계할 컬럼명 , ()는 전체를 의미한다.
여러개의 컬럼을 쓸때는 grouping sets ( (컬럼명1) , (컬럼명2) ) 로 입력한다.

(유형3 연습)
연습문제 6.아래의 SQL 결과를 union all 로 변경해서 출력하시오.

select deptno, job, sum(sal)
    from emp
    group by grouping sets( ( deptno), (job) );
    
답

select deptno, to_number(null) as job, sum(sal)
    from emp
    group by deptno
union all
select to_number(null) as deptno, job, sum(sal)
    from emp
    group by job;
    
unioin all 할때 주의사항
1) 위 아래 쿼리의 컬럼 개수가 동일해야함
2) 위 아래 쿼리의 데이터 타입이 동일해야함 -> to_number  로 맞춰준 이유
3) 위 라애 쿼리의 컬럼 이름도 (가급적)동일해야함 -> 그래야 order by 절 쓸때 동일하게 정렬됨

(유형3 연습) - union all 함수 /  컬럼명 변경해서 출력하기 / 컬럼 유형 변경하기 
연습문제 7. 아래의 SQL을 union all로 변경하시오.

select deptno, job, sum(sal)
    from emp
    group by grouping sets ((deptno),(job),()) ;
    
답

select deptno, to_char(null) as job, sum(sal)
    from emp
    group by deptno
union all
select to_number(null) as deptno, job, sum(sal)
    from emp
    group by job
union all
select to_number(null) as deptno ,to_char(null) as job, sum(sal)
    from emp
    order by job asc, deptno asc;
    
직업의 정렬순서는 옵티마이저가 정렬해서 나오는거라 조금씩 다를 수 있음.

(유형4) to_char (컬럼, '999,999')
연습문제 8. 부서위치, 부서위치별 토탈월급을 출력하는데 부서위치별 토탈월급 출력시
1000단위별로 콤마를 부여해서 출력하시오.

select d.loc, to_char(sum(e.sal),'999,999') as "sum(sal)"
    from emp e, dept d
    where e.deptno = d.deptno
    group by d.loc;

(유형5) - sum+decode
연습문제 9. 연습문제 8을 출력하는데 값이 가로로 출력되게 하시오.

select sum(decode(d.loc,'NEW YORK',e.sal)) as "NEW YORK",
        sum(decode(d.loc,'DALLAS',e.sal)) as "DALLAS",
        sum(decode(d.loc,'CHICAGO',e.sal)) as "CHICAGO",
        sum(decode(d.loc,'BOSTON',e.sal)) as "BOSTON"
    from emp e, dept d
    where e.deptno = d.deptno;
    
(유형6) - where 절의 서브쿼리
연습문제 10. ALLEN보다 늦게 입사한 사원들의 이름, 입사일을 출력하는데 최근에 입사한
사원부터 출력하시오.

select ename, hiredate
    from emp
    where hiredate < (select hiredate from emp
                        where ename='ALLEN')
    order by hiredate desc;
    
(유형7) not in을 사용한 서브쿼리
연습문제 11. 관리자가 아닌 사원들의 이름을 출력하시오.
(자기 밑에 직속부하가 1명도 없는 사원들을 출력하시오)
(=다른 사원의 mgr 이 자신의 deptno 인 사원!)

select ename
    from emp
    where empno not in(select mgr from emp
                        where mgr is not null);
                        
혹은

select ename
    from emp
    where empno not in (select nvl(mgr,0) from emp);
    
not in을 사용한 서브쿼리
not in 은 서브쿼리절의 내용이 where 의 조건이 되는 컬럼과 같지 않음을 의미.
not it 사용시 서브쿼리에서 null값이 하나라도 리턴되면 값이 출력되지 않는다.
이를 예방하고자 not null / nvl 함수를 사용해 null값이 나오는 것을 방지한다.

(유형8) rank() over + partition by 
연습문제 11. 직업, 이름, 월급의 순위를 출력하는데 순위가 직업별로 각각 월급이
높은 순서대로 순위를 부여하시오. 

select job, ename, sal,
    rank ()over (partition by job
                order by sal desc) as 순위
    from emp;
    
순위를 매기는 함수 : rank () over
순위 매길시 범주와 순서 정하기 by 'partition by order by'
    
(유형8연습) - from 절의 서브쿼리
연습문제 12. 연습문제 11의 결과를 다시 출력하는데 순위가 1등인 사원들만 출력하시오.;

select *
    from (select job, ename, sal,
            rank () over (partition by job order by sal desc) 순위
            from emp)
    where 순위 = 1;
    

(유형9) - 제약걸기 (primary key)
연습문제 13. 아래의 테이블을 생성하고 empno에 primary key 제약을 거시오!

테이블명 : emp460
컬럼명 : empno <---primary key
        ename
        sal
        hiredate
        
답!

1. 테이블 만든 후 제약을 거는 방법

create table emp460
    (empno  number(10),
    ename   varchar2(10),
    sal     number(10),
    hiredate date);
    
alter table emp460
    add constraint emp460_empno_pk primary key(empno);
    

2. 테이블 만들면서 동시에 제약을 거는 방법;

create table emp460
    (empno number(10) constraint emp460_empno_pk primary key(empno),
    ename   varchar2(10),
    sal     number(10),
    hiredate date);
    
(유형9연습) - 제약걸기 unique 제약 ver
연습문제 14. 아래의 데이터를 담는 테이블을 emp461로 생성하고 아래의 데이터를 입력하는데
ename 컬럼에 unique 제약을 거시오.

테이블명 : emp461
입력할 데이터 
1111	scott	3000	81/11/17
2222	smith	4000	82/12/21
3333	allen	5000	83/05/02

1. 테이블 생성

create table emp461
    (empno  number(10),
    ename   varchar2(10),
    sal     number(10),
    hiredate date);
    
2. 테이블에 데이터 입력

insert into emp461 values (1111,'scott',3000,to_date('81/11/17','RR/MM/DD'));
insert into emp461 values (2222,'smith',5000,to_date('82/12/21','RR/MM/DD'));
insert into emp461 values (3333,'allen',5000,to_date('83/05/02','RR/MM/DD'));

3. 컬럼에 제약 걸기;

alter table emp461
    add constraint emp461_ename_un unique(ename);
    

(유형10) from 절의 서브쿼리
연습문제 15. 이름,월급, 부서번호, 자기가 속한 '부서번호의 평균월급'을 출력하시오.;
단순 평균 월급이 아닌 '부서번호'별 평균 월급!;

select e.ename, e.sal, e.deptno, d.부서평균 as 부서평균
    from emp e, (select deptno, avg(sal) 부서평균
                    from emp
                    group by deptno) d
    where e.deptno = d.deptno;
    
*from 절의 서브쿼리문으로 부서번호와 그 데이터 속의 평균 월급을 출력하여 d 테이블을 지정.
기존의 emp 와 부서평균을 계산한 임시테이블을 'JOIN' 한 것!

(유형10연습) with 절을 활용해 풀기
연습문제 16. 연습문제 15를 with절을 사용해 구현하시오.

with deptno_avg as (select deptno, avg(sal) 부서평균
                        from emp group by deptno)
select e.ename, e.sal, e.deptno, d.부서평균
    from emp e, deptno_avg d
    where e.deptno = d.deptno;
    
*from 절의 서브쿼리를 with절에서 deptno_avg 라는 가상의 임시 테이블을 만들었고
그 테이블과 emp 테이블을 'JOIN' 한 것!


(유형11) SQL 알고리즘 - mod 사용
연습문제 17. 1부터 10까지의 숫자중에서 홀수만 출력하시오.

with num_table as (select level as num1
                    from dual
                    connect by level <=10)
select num1
    from num_table
    where mod(num1,2) = 1;
    
1. 1~10이 있는 num_table 을 만든다.
2. 1에서 만든 테이블을 mod 를 사용해 나누어준다.
3. where 절에 조건을 부여해 원하는 수만 뽑아준다.

*mod(나누려는 수, 나눌 수) 

(유형12) SQL 알고리즘 1번
밑수가 자연상수 (e) 이고 진수가 10인 로그 값을 출력하시오.
= ln10을 출력하라.

select ln(10) from dual;

(유형13) SQL알고리즘 1번
자연상수 (e) 의 10승을 구하시오.

select exp(10) from dual;

(유형14) SQL 알고리즘 1번
1부터 10까지의 곱을 SQL로 구현하시오.

select round(exp(sum(ln(level ) ) ) )
    from dual
    connect by level <=10;
    
    
