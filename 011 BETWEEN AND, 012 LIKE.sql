011 비교 연산자 배우기 2(BETWEEN AND)

    between 하한값(낮은값) and 상한값(높은값) 으로 작성해서 검색해야 한다.
    영어 문법 between A and B 를 생각하면 편함! (단 순서는 낮은거 -> 높은거)
    
    
    
    문제 30. 월급이 1000에서 3000 사이인 사원들의 이름과 월급을 출력하시오.
    
    답 :
    select ename, sal
        from emp
        where sal between 1000 and 3000
        
    혹은
    
    select ename, sal
        from emp
        where sal >= 1000 and sal<=3000;
        
    
    
    
    문제 31. 월급이 1000에서 3000 사이가 아닌 사원들의 이름과 월급을 출력 하시오.
    
    내 생각  (맞음)
    select ename, sal
        from emp
        where sal not between 1000 and 3000;
        
    
    
    '이 아닌' 을 풀 경우 일반 수식에 앞에 'not' 을 붙여주면 된다. (영문법과 같음)


012 비교 연산자 배우기 3(LIKE)

    e.g) : 이름의 첫 글자가 S로 시작하는 사원들의 이름을 출력하시오.
    
    답 : 
    select ename
        from emp
        where ename like 'S%';
    
    
    
    (예제 기준) LIKE  는 ~일 것 같은 라는 영어 뜻 처럼 이름의 첫번째 철자가 'S' 로 시작할 것 같은 이라는 의미로 쓰임.
    여기서 %는 '와일드 카드' 로서 '%의 자리에 뭐가 와도 관계없다. 철자의 갯수가 몇개여도 상관없다.' 라는 뜻임.
    
    Tip. 명령어 속 %가 와일드 카드가 되려면 앞에 반드시 like 가 와야함. 예를들어 equal 을 쓴뒤 %를 입력하면 말그대로 퍼센트의 의미로 받아들여짐.
    
    문제 33. 이름의 끝글자가 T로 '끝나는' 사원들의 이름을 출력하시오.
    
    내 생각 (맞음)
    select ename
        from emp
        where ename like '%T';
        
    
        
    
    문제 34. 81년도에 입사한 사원들의 이름과 입사일을 출력하는데 between and 사용하지 않고 like를 사용해서 출력하시오.
    
    내 생각
    select ename, hiredate
        from emp
        where hiredate like '81/%/%'; (요건 안됨)
        
        였는데
        where hiredate like '81%' 로만 해도 충분.
        %는 설명대로 뭐가 와도 상관없다. 이기때문에 81뒤에 오는 81/11/12 에서  /11/12 (/든 숫자든) 
        무엇이든 상관이 없다는 것!
        
        
        
        
        
    문제 35. 이름의 2번째 철자가 M인 사원들의 이름을 출력하시오.
    
    정답
    select ename
        from emp
        where ename like '_M%';
        
    
    
    like 와 쓸 수 있는 키워드는 2개
    % : 와일드카드 = 이 자리에 뭐가와도 관계 없고, 그 갯수가 몇개가 되던 상관없다는 뜻.
    _ : 언더바 = 이 자리에 뭐가 와도 관계없는데 자릿수는 한개여야 한다.
    
    
    
    문제 36. 이름 '세번째 철자'가 A인 사원들의 이름을 출력하시오.
    
    내 생각 (맞음)
    select ename
        from emp
        where ename like '__A%'; (<- 언더바 2번임)
        
    문제 37. 이름의 첫번째 철자가 A 로 시작하는 사원들의 이름과 월급을 출력하시오.


    내 생각 : 맞음
    select ename, sal
        from emp
        where ename like 'A%'




    If, where ename = 'A%'; 로 썼다면, 와일드 카드가 아닌 문자 그대로 A%라고 적힌 데이터를 찾았을 것
    %가 특수문자로서가 아닌 '와일드 카드'로서 사용되려면 '기타 비교연산자' 중 하나인 like를 반드시 사용해야 한다!

    'like' 연산자의 키워드 2가지 잊지말자! %(와일드카드=whatever)와 _(언더바=1개의 자리수를 나타냄)

    So, like 와 같이 쓰이지 않는 와일드카드% 와 언더바(_) 는 그저 특수문자일 뿐이다.

    i.e) where ename = '_A%' 로 입력되면 그저 특수문자 언더바와 특수문자 %로 인식 될 뿐이다! 





    문제 38. 이름이 SCOTT 인 사원의 이름과 월급과 직업을 출력하시오.

    내 생각 : 맞음
    select ename, sal, job
        from emp
        where ename ='SCOTT'



    이렇게 해도 나오는 이유는 테이블에 SCOTT 라는 사원이 있기 때문.

    문제 39. 이름의 끝에서 두번째 철자가 T인 사원들의 이름과 월급을 출력하시오.

    내 생각 : 맞음
    select ename, sal
        from emp
        where like ename like '%T_';





