-- CWICZENIA 1
-- 1. Wybrać numery departamentów, nazwiska pracowników oraz numery pracownicze ich szefów z tabeli emp.
SELECT ename, deptno, mgr
FROM emp;
-- Wybrać nazwy departamentów z tabeli DEPT
SELECT dname 
FROM dept; 

-- 2. Wybrać wszystkie kolumny z tabeli emp.
SELECT *
FROM emp;
-- Wybrać wszystkie kolumny z tabeli Salgrade
SELECT * 
FROM Salgrade;

-- 3. Wyliczyć roczną pensję podstawową dla każdego pracownika.
SELECT ename, sal * 12
FROM emp;
-- Wyliczyć roczną prowizję dla każdego pracownika (czasem  jest null)
SELECT ename, comm * 12 "Roczna prowizja"
FROM emp;

-- 4. Wyliczyć roczną pensje podstawową dla każdego pracownika, jeśli każdy dostanie podwyżkę o 250.
SELECT ename, (sal + 250) * 12
FROM emp;
-- Wyliczyć roczną prowizję  dla każdego pracownika, zakładając że każdy dostanie podwyżkę prowizji o100zł. 
SELECT ename, (comm + 100) * 12 
FROM emp;

-- 5. Wybrane wyrażenie sal * 12 zaetykietować nagłówkiem Roczna.
SELECT ename, sal * 12 Roczna
FROM emp;
-- Wyliczyć roczną prowizję dla każdego pracownika Nazwać ją ProwizjaR
SELECT EMPNO, COMM * 12 "ProwizjaR" 
FROM EMP;

-- 6. Wybrane wyrażenie sal * 12 zaetykietować nagłówkiem Placa Roczna.
SELECT ename, sal * 12 "Placa Roczna"
FROM emp;
-- Wyliczyć roczną prowizję dla każdego pracownika Nazwać ją Prowizja Roczna
SELECT EMPNO, COMM * 12 "ROCZNA PROWIZJA" 
FROM EMP;

-- 7. Połączyć numer pracownika i nazwisko i opatrzyć je nagłówkiem Zatrudniony.
SELECT empno||ename Zatrudniony
FROM emp;
--Połączyć Nazwę i lokalizację departamentów
SELECT dname||' '|| loc FROM dept;

-- 8. Literał: Utworzyć zapytanie zwracające połączony numer i nazwisko pracownika, tekst  „Pracownik pracuje w dziale nr” i numer działu  z nagłówkiem „Dział”.
SELECT empno||' '||ename Pracownik, 'Pracuje w dziale nr', deptno Dzial
FROM emp;
-- Utworzyć zapytanie „Pracownik pracuje na stanowisku” podając jego numer i nazwisko -połączyć w jeden  napis wszystkie kolumny i całość zaetykietować  INFO
SELECT 'Pracownik ' || empno ||' '|| ename ||' pracuje na stanowisku '|| job  Zatrudnienie  
FROM emp;

-- 9. Wyliczyć roczną pensję całkowitą dla każdego pracownika (z uwzględnieniem premii).
SELECT ename, (sal + NVL(comm,0))* 12
FROM emp;
--Wypisać prowizję dla każdego pracownika – jeśli jej nie ma  - wypisać ze ma  zero Uwaga: dwuargumentowa funkcja NVL zwraca wartość podaną jako drugi argument w miejscu wystąpienia pseudowartośći „null”
SELECT ename, NVL(comm,0) FROM emp;

-- 10.	Wyświetlić wszystkie numery departamentów występujące w tabeli EMP.
SELECT deptno
FROM emp;
-- Wyświetlić wszystkie stanowiska występujące w tabeli EMP.
SELECT job from emp;

-- 11.	Wyświetlić wszystkie różne numery departamentów występujące w tabeli EMP.
SELECT DISTINCT deptno
FROM emp;
-- Wyświetlić wszystkie różne  stanowiska występujące w tabeli EMP Klauzula DISTINCT (opcjonalna) eliminuje powtarzające się rekordy
SELECT DISTINCT job from emp;

-- 12.	Wybrać wszystkie wzajemnie różne kombinacje wartości DEPTNO i JOB.
SELECT DISTINCT deptno, job
FROM emp;
-- Wybrać wszystkie wzajemnie różne kombinacje wartości DEPTNO i MGR
SELECT DISTINCT deptno, mgr 
from emp;

-- 13.	Posortować rosnąco wszystkie dane tabeli EMP według ENAME.
SELECT *
FROM emp
ORDER BY ename;
-- Posortować wszystkie dane tabeli Dept według DNAME. Klauzula ORDER BY (opcjonalna) sortuje zwracane w zapytaniu rekordy rosnąco (ASC – domyślne, można opuścić) lub malejąco (DESC) względem kolumn (jednej lub kilku) wyspecyfikowanych po klauzuli. W zapytaniu może pojawić sie tylko raz, na końcu.
SELECT * from emp order by DNAME;

-- 14.	Posortować malejąco wszystkie dane tabeli EMP według daty zatrudnienia począwszy od ostatnio zatrudnionych.
SELECT *
FROM emp
ORDER BY hiredate DESC;.
-- Posortować malejąco wszystkie dane tabeli EMP według numerów pracowników
SELECT * from emp ORDER BY empno DESC;

-- 15.	Posortować dane tabeli EMP według wzrastającej wartości kolumny DEPTNO oraz malejących wartości kolumny SAL.
SELECT *
FROM emp
ORDER BY deptno, sal DESC;
-- Posortować dane tabeli EMP według stanowisk; w ramach jednego stanowiska posortować ze względu na pensje – malejąco. Klauzula WHERE (opcjonalna) ograniczająca zwracane rekordy do tych tylko, które spełniają podany po WHERE warunek logiczny; może być on negacją NOT, koniunkcją AND lub alternatywą OR kilku różnych warunków.
SELECT * from emp ORDER BY job, sal DESC;

-- 16.	Wybrać nazwiska, numery pracowników, stanowiska pracy, płacę i numery departamentów wszystkich zatrudnionych na stanowisku CLERK.
SELECT empno, ename, job, sal, deptno from emp
WHERE job = 'CLERK';
-- Wybrać nazwiska, numery pracowników, stanowiska pracy i płacę wszystkich osób z działu 10
SELECT ename, empno, job, sal from emp WHERE deptno = 10;

-- 17.	Wybrać wszystkie nazwy i numery departamentów większe od 20.
SELECT deptno, dname
FROM dept
WHERE deptno > 20;
-- Wybrać wszystkich pracowników zarabiających więcej niż 3000
SELECT ename from emp WHERE sal > 3000;

-- 18.	Wybrać pracowników, których prowizja przekracza miesięczną pensję.
SELECT ename
FROM emp
WHERE comm > sal;
-- Wybrać pracowników, których pensja przekracza prowizję W obliczeniach założyć, że  brak prowizji równa się prowizji = zero
SELECT ename from emp WHERE nvl(comm,0)=0;

-- 19.	Wybrać dane tych pracowników, których zarobki mieszczą się pomiędzy 1000 a 2000.
SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 2000;
-- Wybrać nazwiska i stanowiska tych pracowników, których zarobki mieszczą się pomiędzy 2000 a 3000
SELECT ename, job from emp WHERE sal BETWEEN 2000 AND 3000;

-- 20.	Wybrać dane tych pracowników, których bezpośrednimi szefami są 7902, 7566 lub 7788.
SELECT ename, mgr
FROM emp
WHERE mgr IN (7902,7566,7788);
-- Wybrać dane tych pracowników, którzy są zatrudnieni na stanowisku Clerk lub Manager
SELECT * from emp WHERE job in ('CLERK', 'MANAGER')

-- 21.	Wybrać dane tych pracowników, których nazwiska zaczynają się na S.
SELECT *
FROM emp
WHERE ename LIKE 'S%';
-- Wybrać dane tych pracowników, których nazwiska kończą  się na Predykat LIKE i znaki uniwersalne ‘_’ (zastępuje dowolny znak) i “%” (zastępuje dowolny ciąg znaków).
SELECT * FROM EMP WHERE ename LIKE '%T';

-- 22.	Wybrać dane tych pracowników, których nazwiska są czteroliterowe.
SELECT *
FROM emp
WHERE RTRIM(ename) LIKE '____';
-- Wybrać dane tych działów, których nazwy są pięcioliterowe
SELECT * FROM dept WHERE RTRIM(dname) LIKE'_____';

-- 23.	Wybrać dane tych pracowników, którzy nie posiadają szefa.
SELECT *
FROM emp
WHERE mgr IS NULL;
-- Wybrać pracowników, którzy nie mają określonej prowizji. 

-- 24.	Wybrać dane tych pracowników, których zarobki są poza przedziałem <1000, 2000>.
SELECT *
FROM emp
WHERE sal NOT BETWEEN 1000 AND 2000;
-- Wybrać dane tych pracowników, których zarobki są poza przedziałem <2000, 3000>.
SELECT * FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;

-- 25.	Wybrać dane tych pracowników, których nazwiska nie zaczynają się na M.
SELECT *
FROM emp
WHERE ename NOT LIKE 'M%';
-- Wybrać dane tych pracowników, których nazwiska nie kończą  się na E
 SELECT * FROM emp WHERE ename NOT LIKE '%E';

-- 26.	Wybrać dane tych pracowników, którzy mają szefa.
SELECT *
FROM emp
WHERE mgr IS NOT NULL;
-- Wybrać dane tych pracowników, którzy nie mają szefa.
SELECT * from EMP  WHERE mgr IS NULL; 

-- 27.	Wybrać dane tych pracowników zatrudnionych na stanowisku CLERK, których zarobki mieszczą się w przedziale <1000, 2000>.
SELECT *
FROM emp
WHERE job = 'CLERK' AND sal BETWEEN 1000 AND 2000;
-- Wybrać dane tych pracowników zatrudnionych w dziale 10, których zarobki mieszczą się w przedziale <1500, 3000>.
SELECT * FROM EMP WHERE DEPTNO = 10 AND sal BETWEEN 1500 AND 3000; 


-- 28.	Wybrać dane tych pracowników, którzy albo są zatrudnieni  na stanowisku CLERK, lub ich zarobki mieszczą się w przedziale <1000, 2000>.
SELECT *
FROM emp
WHERE job = 'CLERK' OR sal BETWEEN 1000 AND 2000;
-- Wybrać dane pracowników zatrudnionych w dziale 10 lub tych, których zarobki mieszczą się w przedziale <1500, 3000>.
SELECT * FROM EMP WHERE DEPTNO = 10 OR sal BETWEEN 1500 AND 3000;

-- 29.	Wybrać wszystkich pracowników zatrudnionych na stanowisku MANAGER z pensją powyżej 1500 oraz wszystkich na stanowisku SALESMAN z dowolną pensją .
SELECT *
FROM emp
WHERE sal > 1500 AND job = 'MANAGER' OR job = 'SALESMAN';
-- Wybrać wszystkich pracowników zatrudnionych w dziale 10 na stanowisku SALESMAN  oraz wszystkich z pensją powyżej 3000 zatrudnionych w  dowolnym dziale.
SELECT ename FROM EMP WHERE DEPTNO = 10 AND job = 'SALESMAN' OR sal > 3000;

-- 30.	Wybrać wszystkich pracowników zatrudnionych na stanowisku MANAGER lub na stanowisku SALESMAN z pensją powyżej 1500.
SELECT *
FROM emp
WHERE sal > 1500 AND (job = 'MANAGER' OR job = 'SALESMAN');
-- Wybrać wszystkich pracowników zatrudnionych w dziale 10 na dowolnym stanowisku z dowolną pensją oraz wszystkich na  stanowisku SALESMAN  z pensją poniżej 3000.
 SELECT ename FROM EMP WHERE (DEPTNO = 10) OR (job = 'Salesman' AND sal < 3000);

-- 31.	Wybrać wszystkich pracowników zatrudnionych na stanowisku MANAGER ze wszystkich departamentów wraz ze wszystkimi pracownikami zatrudnionymi na stanowisku CLERK w departamencie 10.
SELECT *
FROM emp
WHERE job = 'MANAGER' OR (job = 'CLERK' AND deptno = 10);
-- Wybrać pracowników zatrudnionych w 81 roku których pensja przekracza 2000 lub są z działu 10
SELECT ename FROM EMP WHERE (hiredate like '%81' AND sal > 2000) OR DEPTNO=10;

-- 32.	Wybrać nazwisko, stanowisko i pensję tych pracowników, którzy nie pracują na stanowisku salesman, i których zarobki mieszczą się w przedziale <1000, 3000>   Posortować po  stanowiskach a w ramach zadanego stanowiska po pensji malejąco
SELECT ENAME, JOB, SAL FROM EMP WHERE JOB!='SALESMAN' AND SAL BETWEEN 1000 AND 3000;

-- 33.	Wybrać nazwiska tych pracowników, których prowizja jest nieokreślona lub  równa zeru  i u których w nazwisku  nie występuje ciąg liter „TH” lub „LL”. Wypisać też w  tej samej kolumnie  ich pensję w formacie: Pracownik ...... ma pensję:   ..... .  Kolumnę wynikową nazwać  Pracownicy bez prowizji
SELECT 'PRACOWNIK ', ENAME, 'MA PENCJE: ', SAL "PRACOWNICY BEZ PROWIZJI" FROM EMP WHERE NVL(COMM, 0) = 0 AND ENAME NOT LIKE '%TH%' AND ENAME NOT LIKE '%LL%';

-- 34.	Wybrać nazwiska i całoroczne dochody wszystkich pracowników zatrudnionych  w 1983r uwzględniając ich prowizję ( jeśli jest nieokreślona - przyjąć, że  równa się zeru.) Użyć funkcji Extract Year  lub Like ... bazując na przykładzie:
SELECT ename,
       sal * 12 + NVL(comm, 0) AS roczny_dochod
FROM emp
WHERE EXTRACT(YEAR FROM hiredate) = 1983;

-- 35.	Wypisać dane pracowników zatrudnionych w departamentach 10 i 20 w kolejności alfabetycznej ich nazwisk.
SELECT *
FROM emp
WHERE deptno IN (10, 20)
ORDER BY ename;

-- 36.	Wypisać nazwiska i stanowiska pracy wszystkich pracowników z departamentu 20 zatrudnionych na stanowisku CLERK.
SELECT ename, job
FROM emp
WHERE deptno = 20
  AND job = 'CLERK';

-- 37.	Wypisać nazwisko, stanowisko i pensję pracowników, którzy posiadają szefa.
SELECT ename, job, sal
FROM emp
WHERE mgr IS NOT NULL;

-- 38.	Wypisać wszystkie wzajemnie różne stanowiska pracy.
SELECT DISTINCT job
FROM emp;

-- 39.	Wypisać ENAME, DEPTNO i HIREDATE tych pracowników, którzy zostali zatrudnieni w 1982 r.
SELECT ename, deptno, hiredate
FROM emp
WHERE EXTRACT(YEAR FROM hiredate) = 1982;

-- 40.	Wypisać nazwiska, roczną pensję oraz prowizję tych wszystkich sprzedawców, których miesięczna pensja przekracza prowizję. Wyniki posortować według malejących zarobków, potem nazwisk. ( jeśli prowizja jest nieokreślona - przyjąć, że  równa się zeru.)
SELECT ename,
       sal * 12 AS roczna_pensja,
       NVL(comm, 0) AS prowizja
FROM emp
WHERE job = 'SALESMAN'
  AND sal > NVL(comm, 0)
ORDER BY sal * 12 DESC, ename;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CWICZENIA 2
-- 1. Połącz dane z tabeli EMP i DEPT
SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno;
-- Wypisać nazwiska pracowników i nazwy projektów w  których  pracują
SELECT Emp.ename, PROJ.PNAME 
FROM emp, PROJ_EMP, PROJ 
WHERE emp.empno = PROJ_EMP.EMPNO AND PROJ_EMP.PROJNO =PROJ.PROJNO; 

-- 2. Wybierz nazwiska oraz nazwy departamentów wszystkich pracowników w kolejności alfabetycznej.
SELECT ename, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno
ORDER BY emp.ename;
-- Wybierz nazwy departamentów oraz numery, nazwiska  i pensje osób w  nich pracujących. Wynik uporządkuj ze względu na działy a w ramach działu  przedstaw  pracowników w kolejności alfabetycznej.
SELECT Dept.dname, Emp.empno, Emp.ename, Emp.sal 
FROM EMP, DEPT 
WHERE DEPT.DEPTNO = EMP.DEPTNO 
ORDER BY DEPT.DNAME,EMP.ENAME;

-- 3. Wybierz nazwiska wszystkich pracowników wraz z numerami i nazwami departamentów w których są zatrudnieni.
SELECT e.ename, d.dname, d.deptno
FROM emp e, dept d
WHERE e.deptno = d.deptno;
-- Wybierz numery i nazwiska wszystkich pracowników wraz z numerami i nazwami projektów w których są zatrudnieni. Użyj aliasów tabel
SELECT E.EMPNO, E.ename, P.PROJNO, P.PNAME 
FROM emp E,PROJ_EMP PE, PROJ P 
WHERE E.empno = PE.EMPNO AND PE.PROJNO =P.PROJNO; 

--  4. Dla pracowników o miesięcznej pensji  powyżej 1500 podaj ich nazwiska, miejsca usytuowania ich departamentów oraz nazwy tych departamentów.
SELECT e.ename, d.loc, d.dname
FROM emp e, dept d
WHERE e.sal > 1500 AND e.deptno = d.deptno;
-- Dla pracowników na stanowisku MANAGER podaj nazwiska , nazwy projektów w których pracują i ich budżet
SELECT E.ENAME, P.PNAME, P.BUDGET 
FROM emp E,PROJ_EMP PE, PROJ P 
WHERE E.empno = PE.EMPNO AND PE.PROJNO = P.PROJNO AND E.JOB ='MANAGER';

-- 5. Utwórz listę pracowników podając ich nazwisko, zawód, pensję i stopień zaszeregowania.
SELECT e.ename, e.job, e.sal, s.grade
FROM emp e, salgrade s
WHERE e.sal BETWEEN s.losal AND s.hisal;
--  Utwórz listę pracowników  z projektu 1 podając ich nazwisko, zawód, pensję i stopień zaszeregowania.
SELECT ename, job, sal, s.grade
FROM emp e, proj_emp pe, proj p, salgrade s
WHERE p.projno = 1 AND e.empno = pe.empno AND p.projno = pe.projno AND sal BETWEEN s.losal AND s.hisal

-- 6. Wybierz informacje o pracownikach, których zarobki odpowiadają klasie 3 zarobkowej ( GRADE)
SELECT e.ename, e.sal, e.job, d.dname
FROM emp e, dept d, salgrade s
WHERE e.sal BETWEEN s.losal AND s.hisal AND s.grade = 3
AND e.deptno = d.deptno;
-- Wybierz informacje o pracownikach z projektu 2, których zarobki odpowiadają klasie  mniejszej niż 5 ( GRADE)
SELECT e.empno, ename, job, deptno, sal, s.grade
FROM emp e, salgrade s, proj_emp pe
WHERE pe.empno = e.empno AND pe.projno = 2 AND sal BETWEEN s.losal AND s.hisal AND s.grade < 5;

-- 7. Wybierz pracowników z działu 30 i 40 (nazwisko, nr. działu i nazwa działu - wypisz dział 40 w którym nie ma pracowników)
SELECT emp.ename, emp.deptno, dept.dname
FROM emp, dept
WHERE emp.deptno(+) = dept.deptno AND dept.deptno IN (30, 40);
-- Wybierz projekty w których pracują pracownicy  z działu 30 i 40 (wypisz nazwę projektu, nr. działu i nazwa działu - wypisz dział 40 w którym nie ma pracowników)
SELECT p.pname, d.deptno, d.dname, pe.projno
FROM emp e, proj_emp pe, proj p, dept d
WHERE d.deptno = 30 AND d.deptno = e.deptno AND e.empno = pe.empno AND pe.projno = p.projno
UNION
SELECT p.pname, d.deptno, d.dname, pe.projno
FROM emp e, proj_emp pe, proj p, dept d
WHERE d.deptno = 40 AND d.deptno = e.deptno(+) AND e.empno = pe.empno(+) AND pe.projno = p.projno(+);

-- 8. Wybierz pracowników, którzy zarabiają mniej od swoich kierowników
SELECT e.ename emp_name, e.sal emp_sal, m.ename mgr_name, m.sal mgr_sal
FROM emp e, emp m
WHERE e.mgr = m.empno AND e.sal > m.sal
-- Wybierz pracowników z projektu 1, zatrudnionych później od swoich kierowników
SELECT e.ename prac, e.hiredate, mgr.ename, mgr.hiredate
FROM emp e, emp mgr, proj_emp pe
WHERE pe.projno = 1 AND e.hiredate > mgr.hiredate AND e.mgr = mgr.empno AND e.empno = pe.empno;

-- 9. Wypisz stanowiska występujące w dziale 10 i dziale 30
SELECT job
FROM emp
WHERE deptno = 10

UNION

SELECT job
FROM emp
WHERE deptno = 30;
-- Wypisz projekty w których pracują pracownicy  z działów 10  lub 30 
SELECT pe.projno
FROM emp e, proj_emp pe, dept d
WHERE d.deptno = 30 AND e.empno = pe.empno AND d.deptno = e.deptno

UNION

SELECT pe.projno
FROM emp e, proj_emp pe, dept d
WHERE d.deptno = 10 AND e.empno = pe.empno AND d.deptno = e.deptno;

-- 10. Wypisz stanowiska występujące zarówno w dziale 10 jak w dziale 30
SELECT job
FROM emp
WHERE deptno = 10

INTERSECT

SELECT job
FROM emp
WHERE deptno = 30;
--  Wypisz projekty w których pracują pracownicy zarówno z działu 10  jak i 30
SELECT pe.projno, p.pname
FROM emp e, proj_emp pe, proj p
WHERE e.deptno = 10 AND e.empno = pe.empno AND pe.projno = p.projno

INTERSECT

SELECT pe.projno, p.pname
FROM emp e, proj_emp pe, proj p
WHERE e.deptno = 30 AND e.empno = pe.empno AND pe.projno = p.projno;

-- 11. Wypisz stanowiska występujące w dziale 10 a nie występujące w dziale 30
SELECT job
FROM emp
WHERE deptno = 10

MINUS

SELECT job
FROM emp
WHERE deptno = 30;
-- Wypisz projekty w których pracują pracownicy z działu 10   w których nie pracuje  nikt z działu 30
SELECT pe.projno, p.pname
FROM emp e, proj_emp pe, proj p
WHERE e.deptno = 10 AND e.empno = pe.empno AND pe.projno = p.projno

MINUS

SELECT pe.projno, p.pname
FROM emp e, proj_emp pe, proj p
WHERE e.deptno = 30 AND e.empno = pe.empno AND pe.projno = p.projno;

-- 12. Wybierz nazwiska i pensje  oraz grupę zaszeregowania grade  wszystkich pracowników oraz  nazwiska, pensje  i grupę zaszeregowania ich kierowników.  Nie zapomnij o KINGu  - w miejsce jego kierownika  wpisz null.
SELECT E.ENAME, E.SAL, 
(SELECT s.grade FROM salgrade s WHERE E.SAL BETWEEN s.losal AND s.hisal) AS grade, 
(SELECT EMP.ENAME FROM EMP WHERE EMP.EMPNO = E.MGR) AS "MGR NAME", 
(SELECT EMP.SAL FROM EMP WHERE EMP.EMPNO = E.MGR) AS "MGR SAL", 
(SELECT s.grade FROM salgrade s, EMP WHERE EMP.SAL BETWEEN s.losal AND s.hisal AND EMP.EMPNO = E.MGR) AS "MGR GRADE" 
FROM emp E;  

-- 13. Wypisz numery i  nazwy projektów  w których pracuje KING i nie pracuje nikt z 3 lub 4 grupy zarobkowej   ( MINUS)
SELECT P.PROJNO, P.PNAME 
FROM PROJ P, EMP E, PROJ_EMP PE
WHERE E.EMPNO = PE.EMPNO 
  AND PE.PROJNO = P.PROJNO 
  AND E.ENAME = 'KING'

MINUS

SELECT P.PROJNO, P.PNAME 
FROM PROJ P, EMP E, PROJ_EMP PE, SALGRADE S
WHERE E.EMPNO = PE.EMPNO 
  AND PE.PROJNO = P.PROJNO 
  AND E.SAL BETWEEN S.LOSAL AND S.HISAL 
  AND S.GRADE IN (3, 4);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CWICZENIA 3
-- Oblicz średni zarobek w firmie.
SELECT AVG(sal)
FROM emp;
-- Oblicz średni budzet projektów
SELECT AVG(BUDGET) FROM PROJ;

-- Znajdź minimalne zarobki na stanowisku CLERK.
SELECT MIN(sal)
FROM emp
WHERE job = 'CLERK'
-- Znajdź minimalną pensje pracowników z projektu 2
SELECT MIN(E.SAL) FROM EMP E, PROJ_EMP PE WHERE E.EMPNO = PE.EMPNO AND PE.PROJNO = 2;
SELECT MIN(sal) as min FROM emp e,  proj_emp pe WHERE e.empno = pe.empno  AND pe.projno = 2;

-- Znajdź ilu pracowników zatrudniono w departamencie 20.
SELECT count(*)
FROM emp
WHERE deptno = 20;
-- Podać liczbę pracowników bierących udział w projekcie 2
SELECT COUNT(e.ename) FROM EMP E, PROJ_EMP PE WHERE E.EMPNO = PE.EMPNO AND PE.PROJNO = 2;

-- Obliczyć średnie zarobki na każdym ze stanowisk pracy.
SELECT job, AVG(sal)
FROM emp
GROUP BY job;
-- Podaj liczbę praowników każdego projektu
SELECT P.PROJNO, COUNT(PE.EMPNO) 
FROM PROJ P, PROJ_EMP PE 
WHERE P.PROJNO = PE.PROJNO 
GROUP BY P.PROJNO;

-- Obliczyć średnie zarobki na każdym ze stanowisk pracy z wyjątkiem stanowiska MANAGER.
SELECT job, AVG(sal)
FROM emp
WHERE job != 'MANAGER'
GROUP BY job;
-- Obliczyć średnie zarobki w każdym projkecie  z wyjątkiem projektu 5
SELECT PE.projno, round(AVG(e.sal),2) FROM EMP E, PROJ_EMP PE WHERE E.EMPNO = PE.EMPNO AND PE.PROJNO != 5 GROUP BY p.projno;

-- Obliczyć średnie zarobki na każdym ze stanowisk pracy w każdym departamencie.
SELECT deptno, job, AVG(sal)
FROM emp
GROUP BY deptno, job;
-- Obliczyć średnie zarobki na każdym ze stanowisk pracy w każdym projekcie
SELECT e.job, pe.projno, AVG(e.sal) FROM emp e,  proj_emp pe WHERE e.empno = pe.empno  GROUP BY e.job, pe.projno order by 2;

-- Dla każdego stanowiska oblicz maksymalne zarobki.
SELECT MAX (sal), job
FROM emp
GROUP BY job;
-- Dla każdego projektu oblicz maksymalne zarobki jego  pracowników
SELECT PE.PROJNO, MAX(E.SAL) FROM EMP E, PROJ_EMP PE WHERE E.EMPNO = PE.EMPNO GROUP BY PE.PROJNO;

-- Wybrać średnie zarobki tylko tych departamentów, które zatrudniają więcej niż trzech pracowników.
SELECT deptno, AVG(sal)
FROM emp
GROUP BY deptno
HAVING COUNT (*) > 3;
-- Wybrać projekty, które zatrudniają więcej niż dwóch pracowników
SELECT p.pname, count(*) FROM emp e, proj p, proj_emp pe WHERE e.empno = pe.empno AND pe.projno = p.projno GROUP BY p.pname HAVING COUNT(e.ename)>2;

-- Wybrać tylko te stanowiska, na których średni zarobek wynosi 3000 lub więcej.
SELECT job, AVG(sal)
FROM emp
GROUP BY job
HAVING AVG (sal) > =3000;
-- Wybrać średnie zarobki pracowników tylko tych projektów które zatrudniaja wiecej niż dwóch pracowników.
SELECT p.pname, round(AVG(e.sal),2) FROM emp e, proj p, proj_emp pe WHERE e.empno = pe.empno AND pe.projno = p.projno GROUP BY p.pname HAVING COUNT(e.ename)>2;

-- Znajdź średnie miesięczne pensje oraz średnie roczne zarobki dla każdego stanowiska, pamiętaj o prowizji.
SELECT AVG(sal) Avsal, AVG(sal*12 + NVL(comm,0)) Avcomp
FROM emp
GROUP BY job;
-- Znajdź średnie miesięczne pensje oraz średnie roczne zarobki dla każdego projektu, pamiętaj o prowizji
SELECT p.pname, round(AVG(e.sal),2) Avsal, AVG(e.sal*12 + NVL(e.comm,0)) Avcomp
FROM emp e, proj p, proj_emp pe WHERE e.empno = pe.empno AND pe.projno = p.projno
GROUP BY p.pname;

-- Znajdź różnicę miedzy najwyższą i najniższa pensją.
SELECT MAX(sal) - MIN(sal) Diff
FROM emp;
-- Dla każdego projektu znależć różnicę miedzy najwyższą i najniższa pensją jego pracowników
SELECT pe.projno, MAX(e.sal)-MIN(e.sal) FROM emp e,  proj_emp pe WHERE e.empno = pe.empno GROUP BY pe.projno;

-- Znajdź departamenty zatrudniające powyżej trzech pracowników.
SELECT deptno, COUNT(*) 
FROM emp
GROUP BY deptno
HAVING COUNT (*) > 3;
-- Znajdź departamenty zatrudniające powyżej trzech pracowników z projektu 3
SELECT deptno, COUNT(*) FROM emp WHERE empno IN (SELECT EMPNO FROM PROJ_EMP WHERE PROJNO = 3) GROUP BY deptno HAVING COUNT (*) > 3;

-- Sprawdź, czy wszystkie numery pracowników są rzeczywiście wzajemnie różne.
SELECT empno 
FROM emp
GROUP BY empno
HAVING COUNT (*) > 1;
-- Znajdź projekty o takim samym budżecie
SELECT PROJNO FROM PROJ WHERE BUDGET IN (SELECT P.BUDGET FROM PROJ P WHERE PROJ.PROJNO != P.PROJNO);
SELECT budget FROM proj GROUP BY budget HAVING COUNT (*)>1;

-- Podaj najniższe pensje wypłacane podwładnym swoich kierowników. Wyeliminuj grupy o minimalnych zarobkach niższych niż 1000. Uporządkuj według pensji.
SELECT mgr, MIN(sal)
FROM emp
GROUP BY mgr
HAVING MIN (sal) > =1000
ORDER BY MIN(sal);
-- Podaj najniższe pensje wypłacane podwładnym swoich kierowników. Podaj nazwiska kierowników. Wyeliminuj grupy o minimalnych zarobkach niższych niż 1000. Uporządkuj według pensji.
SELECT  m.ename "Nazwisko kierownika", min(e.sal) "Minimalna pensja podwladnego"
FROM emp e, emp m
WHERE e.mgr = m.empno
GROUP BY m.empno,m.ename
HAVING min(e.sal) > 1000
ORDER BY 1;

-- Wypisz ilu pracowników ma dział mający siedzibę w DALLAS.
SELECT COUNT (*)
FROM emp, dept
WHERE dept.loc = 'DALLAS' AND emp.deptno = dept.deptno
GROUP BY dept.deptno;
-- Wypisz ilu pracowników  z projektu 4 ma dział mający siedzibę w DALLAS.
SELECT COUNT (*)
FROM emp, dept, proj, proj_emp
WHERE dept.loc = 'DALLAS' AND emp.deptno = dept.deptno AND emp.empno = proj_emp.empno AND proj_emp.projno = proj.projno AND proj.pname = 'PROJECT4'
GROUP BY dept.deptno;

-- Podaj maksymalne zarobki dla każdej klasy zarobkowej.
SELECT MAX(sal), salgrade.grade 
FROM emp, salgrade
WHERE sal BETWEEN losal AND hisal
GROUP BY salgrade.grade;
-- Podaj maksymalne zarobki dla każdej klasy zarobkowej pracowników projektu 2
SELECT MAX(sal), salgrade.grade 
FROM emp, salgrade, PROJ_EMP PE
WHERE sal BETWEEN losal AND hisal AND EMP.EMPNO = PE.EMPNO AND PE.PROJNO = 2
GROUP BY salgrade.grade;

-- Sprawdź, które wartości zarobków powtarzają się.
SELECT sal 
FROM emp
GROUP BY sal
HAVING COUNT(*) > 1;
--  Sprawdź czy sa projekty ktore zaczynaja sie lub koncza tego samego dnia
SELECT end_date FROM proj GROUP BY end_date HAVING COUNT(*)>1
union
SELECT start_date FROM proj GROUP BY start_date HAVING COUNT(*)>1;

-- Podaj średni zarobek pracowników z drugiej klasy zarobkowej
SELECT AVG(sal )
FROM emp, salgrade
WHERE salgrade.grade = 2 AND sal BETWEEN losal AND hisal 
GROUP BY salgrade.grade;
-- Podaj średni zarobek pracowników projektu 3  z drugiej  lub trzeciej grupy zarobkowej 
SELECT round(AVG(sal ),2)
FROM emp, salgrade,  proj_emp
WHERE (salgrade.grade = 1 OR salgrade.grade = 4) AND sal BETWEEN losal AND hisal AND emp.empno = proj_emp.empno AND proj_emp.projno = 3;

-- Sprawdź ilu podwładnych ma każdy kierownik.
SELECT COUNT(*)
FROM emp
GROUP BY mgr;
-- Sprawdź ilu podwładnych  z projektu 2 ma każdy kierownik
SELECT k.ename, p.mgr,  COUNT(*)
FROM emp p,emp k, proj, proj_emp
WHERE p.mgr=k.empno and p.empno = proj_emp.empno AND proj_emp.projno = proj.projno AND proj.pname = 'PROJECT2'
GROUP BY k.ename, p.mgr;

-- Podaj sumę, którą zarabiają razem wszyscy pracownicy z pierwszej klasy zarobkowej.
SELECT SUM(sal)
FROM emp, salgrade
WHERE salgrade.grade = 1 AND sal BETWEEN losal AND hisal;
-- Podaj maksymalny budżet projketu, w  którym pracują pracownicy z pierwszej klasy zarobkowej.
SELECT MAX(P.BUDGET)
FROM emp, salgrade, PROJ P, PROJ_EMP PE
WHERE salgrade.grade = 1 AND sal BETWEEN losal AND hisal AND EMP.EMPNO = PE.EMPNO AND PE.PROJNO = P.PROJNO;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CWICZENIA 4
-- 1.	Znaleźć pracowników z pensją równą minimalnemu zarobkowi w firmie.
SELECT ename, job, sal
FROM emp
WHERE sal =
(SELECT MIN(sal)
FROM emp);
-- Wskazać project o największym  budzecie
SELECT * FROM PROJ WHERE BUDGET=(SELECT MAX(BUDGET) FROM PROJ);

-- 2.	Znaleźć wszystkich pracowników zatrudnionych na tym samym stanowisku co BLAKE.
SELECT ename
FROM emp
WHERE job =
(SELECT job
FROM emp
WHERE ename = 'BLAKE');
-- Wypisac pracowników, którzy pracowali w tym samym projekcie co KING
SELECT EMP.* FROM EMP, PROJ_EMP PE WHERE EMP.EMPNO = PE.EMPNO AND PE.PROJNO IN (SELECT PROJNO FROM EMP, PROJ_EMP WHERE EMP.EMPNO = PROJ_EMP.EMPNO AND EMP.ENAME = 'KING');   

-- 3.	Znaleźć pracowników o pensjach z listy najniższych zarobków osiąganych w departamentach.
SELECT ename, sal, deptno 
FROM emp
WHERE sal IN
(SELECT MIN(sal)
FROM emp
GROUP BY deptno)

-- 4.	Znaleźć pracowników o najniższych zarobkach w ich departamentach.
SELECT ename, sal, deptno
FROM emp
WHERE (sal, deptno) IN
(SELECT MIN(sal), deptno
FROM emp
GROUP BY deptno);
-- Dla kazdego projektu  wypisac osobę, która zarabia najwięcej
SELECT PE.PROJNO, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, PROJ_EMP PE
WHERE E.EMPNO = PE.EMPNO
AND (PE.PROJNO, E.SAL) IN (
  SELECT PE2.PROJNO, MAX(E2.SAL)
  FROM EMP E2, PROJ_EMP PE2
  WHERE E2.EMPNO = PE2.EMPNO
  GROUP BY PE2.PROJNO
);

-- 5.	Stosując operator ANY ( lub SOME ) wybrać pracowników zarabiających powyżej najniższego zarobku z departamentu 30.
SELECT ename, job, deptno
FROM emp
WHERE sal > ANY
(SELECT DISTINCT sal
FROM emp
WHERE deptno = 30);
  SELECT ename, job, deptno FROM emp WHERE sal > SOME
       (SELECT DISTINCT sal FROM emp WHERE deptno = 30)
--
SELECT ename, job, sal, deptno
FROM emp
WHERE sal > 
(SELECT MIN (sal)
FROM emp
WHERE deptno = 30)
-- Znaleźć pracowników, których zarobki są wyższe od pensji jakiegoś pracownika biorącego udział w projekcie 2.
SELECT E1.EMPNO, E1.ENAME, E1.SAL
FROM EMP E1
WHERE E1.SAL > ANY (
  SELECT E2.SAL
  FROM EMP E2, PROJ_EMP PE2
  WHERE E2.EMPNO = PE2.EMPNO
  AND PE2.PROJNO = 2
);

-- 6.	Znaleźć pracowników, których zarobki są wyższe od pensji każdego pracownika z departamentu 30.
SELECT ename, sal, job, deptno
FROM emp
WHERE sal> ALL
(SELECT DISTINCT sal
FROM emp
WHERE deptno = 30);
--
SELECT ename, job, sal, deptno
FROM emp
WHERE sal > 
(SELECT MAX (sal)
FROM emp
WHERE deptno = 30)
-- 7.	 Znaleźć pracowników, których zarobki są wyższe od pensji każdego pracownika biorącego udział d projekcie 2.
SELECT E1.EMPNO, E1.ENAME, E1.SAL
FROM EMP E1
WHERE E1.SAL > ALL (
  SELECT E2.SAL
  FROM EMP E2, PROJ_EMP PE2
  WHERE E2.EMPNO = PE2.EMPNO
  AND PE2.PROJNO = 2
);

-- 8.	Wybrać departamenty, których średnie zarobki przekraczają średni zarobek departamentu 30.
SELECT deptno, AVG(sal)
FROM emp 
GROUP BY deptno
HAVING AVG (sal)>
(SELECT AVG(sal)
FROM emp
WHERE deptno = 30);
-- Wypisac project, który zatrudnia więcej pracowników niż projekt 1
SELECT PROJNO
FROM PROJ_EMP
GROUP BY PROJNO
HAVING COUNT(*) > (
  SELECT COUNT(*)
  FROM PROJ_EMP
  WHERE PROJNO = 1
);

-- 9.	Znaleźć stanowisko, na którym są najwyższe średnie zarobki.
SELECT job, AVG(sal)
FROM emp
GROUP BY job 
HAVING AVG(sal) =
(SELECT MAX(AVG(sal))
FROM emp
GROUP BY job);
-- Wypisac project, który zatrudnia najwiekszą liczbę pracowników
SELECT PROJNO
FROM PROJ_EMP
GROUP BY PROJNO
HAVING COUNT(*) = (
  SELECT MAX(CNT)
  FROM (
    SELECT COUNT(*) AS CNT
    FROM PROJ_EMP
    GROUP BY PROJNO
  )
);

-- 10.	Znaleźć pracowników, których zarobki przekraczają najwyższe pensje z departamentu SALES.
SELECT ename, job, sal
FROM emp
WHERE sal>
(SELECT MAX(sal)
FROM emp
WHERE deptno =
(SELECT deptno
FROM dept
WHERE dname = 'SALES'));

-- 11.	Znaleźć pracowników, którzy pracują na tym samym stanowisku co pracownik o numerze 7369 i których zarobki są większe niż pracownika o numerze 7876.
SELECT ename, job, sal
FROM emp
WHERE job =
(SELECT job
FROM emp
WHERE empno = 7369)
AND sal >
(SELECT sal
FROM emp
WHERE empno = 7876);
-- Znaleźć pracowników, którzy pracują w tym samym projekcie co pracownik o numerze 7369 i których zarobki przekraczają śdednią pensję .
SELECT DISTINCT E.EMPNO, E.ENAME, E.SAL
FROM EMP E, PROJ_EMP PE
WHERE E.EMPNO = PE.EMPNO
AND PE.PROJNO IN (
  SELECT PROJNO
  FROM PROJ_EMP
  WHERE EMPNO = 7369
)
AND E.SAL > (
  SELECT AVG(SAL)
  FROM EMP
);

-- 12.	Wypisać nazwy działów w których pracują urzędnicy (CLERK)
SELECT dname
FROM dept
WHERE deptno IN
(SELECT deptno
FROM emp
WHERE job like 'CLERK%');
-- Wypisać nazwy projekty w których biorą udział urzędnicy (CLERK)
SELECT DISTINCT P.PNAME
FROM PROJ P, PROJ_EMP PE, EMP E
WHERE P.PROJNO = PE.PROJNO
AND PE.EMPNO = E.EMPNO
AND E.JOB = 'CLERK';

-- 13.	Dla każdego pracownika wypisać jego pensję, oraz policzyć jaki procent stanowi ona  w całkowitym funduszu płac
select ename, job, sal, (select sum(sal) from emp) "suma pensji" , 
sal*100/(select sum(sal) from emp) udzial 
from emp ;
lepiej:
select ename, job, sal,  razem "suma pensji" , sal*100/razem udzial 
  from emp , (select sum(sal) razem from emp) x;
-- Dla każdego projektu wypisać jego budzet, oraz policzyć jaki procent stanowi on  w całościowej kwocie sumy wszystkich budzetów
SELECT PROJNO, PNAME, BUDGET,
       ROUND((BUDGET / (SELECT SUM(BUDGET) FROM PROJ)) * 100, 2) AS PERCENT_TOTAL
FROM PROJ;

-- 14.	Dla każdego stanowiska wypisać średnią pensję, liczbę osób pracujących na tym stanowisku oraz sumę ich pensji. Obliczyć też udział sumy pensji osób na stanowisku w całkowitym funduszu płac. 
select  job, avg(sal), (select sum(sal) from emp) "suma pensji" , 
avg(sal)*100/(select sum(sal) from emp) udzial 
           from emp 
            group by job;
-- Dla każdego projektu wypisać liczbę jego uczestników oraz policzyć jaki to procent  sumarycznej liczby osobo_projektów
SELECT PROJNO, COUNT(*) AS PARTICIPANTS,
       ROUND((COUNT(*) / (SELECT COUNT(*) FROM PROJ_EMP)) * 100, 2) AS PERCENT_TOTAL
FROM PROJ_EMP
GROUP BY PROJNO;

-- 15.	 Dla każdego pracownika wypisać jego  stanowisko i pensję dodatkowo dodając średnią pensję na jego stanowisku
select EMPNO, ENAME,  emp.job,  sal,  sr
from emp , (select  job, round(avg(sal),2) sr from emp group by job ) xx
where emp.job=xx.job;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--CWICZENIA 5
-- 1. Znaleźć pracowników, którzy zarabiają najwięcej w swoich departamentach.
SELECT ename, deptno
FROM emp e
WHERE sal =
(SELECT MAX(sal)
FROM emp
WHERE emp.deptno = e.deptno);
-- Dla każdego projektu znaleźć pracownika, który zarabia najwięcej (skorelowane)
SELECT P.PROJNO, E.ENAME, E.SAL
FROM PROJ P, PROJ_EMP PE, EMP E
WHERE P.PROJNO = PE.PROJNO
  AND E.EMPNO = PE.EMPNO
  AND E.SAL = (
      SELECT MAX(E2.SAL)
      FROM PROJ_EMP PE2, EMP E2
      WHERE PE2.PROJNO = P.PROJNO
        AND E2.EMPNO = PE2.EMPNO
  );

-- 2. Znaleźć pracowników, którzy zarabiają powyżej średniej w ich departamentach.
SELECT empno, ename, sal, deptno
FROM emp e
WHERE sal >
(SELECT AVG(sal)
FROM emp
WHERE deptno = e.deptno)
          ORDER BY deptno;
-- Dla każdego projektu znaleźć pracowników, którzy zarabiają powyżej średniej pensji pracowników tego projektu (skorelowane)
SELECT P.PROJNO, E.ENAME, E.SAL
FROM PROJ P, PROJ_EMP PE, EMP E
WHERE P.PROJNO = PE.PROJNO
  AND E.EMPNO = PE.EMPNO
  AND E.SAL > (
      SELECT AVG(E2.SAL)
      FROM PROJ_EMP PE2, EMP E2
      WHERE PE2.PROJNO = P.PROJNO
        AND E2.EMPNO = PE2.EMPNO
  );

-- 3. Znaleźć pracowników, którzy posiadają podwładnych za pomocą operatora EXISTS.
SELECT empno, ename, job, deptno
FROM emp e
WHERE EXISTS
(SELECT empno
FROM emp
WHERE emp.mgr = e.empno);
-- Znaleźć - za pomocą operatora EXISTS - pracowników, którzy brali udział w jakimś projekcie 
SELECT E.EMPNO, E.ENAME
FROM EMP E
WHERE EXISTS (
    SELECT 1
    FROM PROJ_EMP PE
    WHERE PE.EMPNO = E.EMPNO
);

-- 4.  Znaleźć pracowników, których departament nie występuje w tabeli DEPT.
SELECT ename, deptno
FROM emp
WHERE NOT EXISTS
(SELECT deptno
FROM dept
WHERE dept.deptno = emp.deptno);
-- Znaleźć - za pomocą operatora EXISTS - pracowników, którzy dotychczas nie brali udziału w żadnym projekcie
SELECT E.EMPNO, E.ENAME
FROM EMP E
WHERE NOT EXISTS (
    SELECT 1
    FROM PROJ_EMP PE
    WHERE PE.EMPNO = E.EMPNO
);

-- 5.   Stosując podzapytanie znaleźć departamenty, w których nikt nie pracuje.
SELECT deptno, dname
FROM dept d
WHERE NOT EXISTS
(SELECT 'anything'
FROM emp
WHERE deptno=d.deptno);
-- Stosując podzapytanie znaleźć projekty, w których nikt nie pracuje.
SELECT P.PROJNO, P.PNAME
FROM PROJ P
WHERE NOT EXISTS (
    SELECT 1
    FROM PROJ_EMP PE
    WHERE PE.PROJNO = P.PROJNO
);

-- 6. Znaleźć pracowników zarabiających maksymalną pensję na ich stanowiskach pracy. Uporządkować ich według malejących zarobków.
----Bez korelacji:----

SELECT job, ename, sal
FROM emp
WHERE (sal, job) IN
(SELECT MAX(sal), job
FROM emp
GROUP BY job)
         ORDER BY sal DESC;
          lub  skorelowanie:
SELECT job, ename, sal
FROM emp e
WHERE sal =
(SELECT MAX(sal)
FROM emp
WHERE job= e.job)
ORDER BY sal DESC;
-- Dla każdego projektu znaleźć pracownika zarabiającego maksymalną pensję na każdym stanowisku pracy jakie występuje w danym projekcie. Uporządkować według projektów  a potem według malejących zarobków.
SELECT P.PROJNO, E.JOB, E.ENAME, E.SAL
FROM PROJ P, PROJ_EMP PE, EMP E
WHERE P.PROJNO = PE.PROJNO
  AND E.EMPNO = PE.EMPNO
  AND E.SAL = (
      SELECT MAX(E2.SAL)
      FROM PROJ_EMP PE2, EMP E2
      WHERE PE2.PROJNO = P.PROJNO
        AND E2.EMPNO = PE2.EMPNO
        AND E2.JOB = E.JOB
  )
ORDER BY P.PROJNO, E.SAL DESC;

-- 7.  Wskazać dla każdego departamentu ostatnio zatrudnionych pracowników. Uporządkować według dat zatrudnienia.
SELECT deptno, ename, hiredate
FROM emp e
WHERE hiredate =
(SELECT MAX(hiredate)
FROM emp
WHERE deptno = e.deptno)
ORDER BY hiredate;
-- Wskazać dla każdego projektu pracownika zatrudnionego najpóźniej
SELECT P.PROJNO, E.ENAME, E.HIREDATE
FROM PROJ P, PROJ_EMP PE, EMP E
WHERE P.PROJNO = PE.PROJNO
  AND E.EMPNO = PE.EMPNO
  AND E.HIREDATE = (
      SELECT MAX(E2.HIREDATE)
      FROM PROJ_EMP PE2, EMP E2
      WHERE PE2.PROJNO = P.PROJNO
        AND E2.EMPNO = PE2.EMPNO
  );

-- 8.  Wskazać trzech najlepiej zarabiających pracowników w firmie. Podać ich nazwiska i pensje.
SELECT ename, sal
FROM emp e
WHERE 3 >
(SELECT count (*)
FROM emp
WHERE e.sal < sal);
-- Wskazać trzech najlepiej zarabiających pracowników w każdym dziale (deptno). Podać dział, ich nazwiska i pensje.
--TODO
-- 9. Podać ENAME, SALERY i DEPTNO i DEPT_AVG (średnia zarobków  w departamencie) dla pracowników, których zarobki przekraczają średnią ich departamentów.
 Podzapytanie w klauzuli FROM – nieskorelowane:
SELECT ename, sal, emp.deptno, DEPT_AVG
FROM emp,
(SELECT deptno, round(avg(sal),2 ) DEPT_AVG
FROM emp
GROUP BY deptno) Nowa
            WHERE emp.deptno = nowa.deptno and sal> DEPT_AVG;
-- Dla każdego projektu wypisać  PROJNO, PROJ_AVG (średnia zarobków pracowników biorących udział w projekcie) oraz wszystkich pracowników -  ENAME i SALERY których zarobki przekraczają tą średnią PROJ_AVG. 
SELECT P.PROJNO,
       (SELECT AVG(E2.SAL)
        FROM PROJ_EMP PE2, EMP E2
        WHERE PE2.PROJNO = P.PROJNO
          AND E2.EMPNO = PE2.EMPNO
       ) AS PROJ_AVG,
       E.ENAME,
       E.SAL
FROM PROJ P, PROJ_EMP PE, EMP E
WHERE P.PROJNO = PE.PROJNO
  AND E.EMPNO = PE.EMPNO
  AND E.SAL > (
      SELECT AVG(E2.SAL)
      FROM PROJ_EMP PE2, EMP E2
      WHERE PE2.PROJNO = P.PROJNO
        AND E2.EMPNO = PE2.EMPNO
  );

-- 10. Napisać zapytanie generujące listę pracowników i ich dat zatrudnienia, z gwiazdką (*) w wierszu ostatnio zatrudnionego. Kolumnę z  gwiazdką zatytułuj MAXDATE.
Nieskorelowane:
SELECT ename, hiredate, '  *  ' MAXDATE
FROM emp
WHERE hiredate =
(SELECT MAX (hiredate)
FROM emp)
             UNION
SELECT ename, hiredate, '     ' maxdate
FROM emp
WHERE hiredate NOT IN
(SELECT MAX(hiredate)
FROM emp); 
-- Dla każdego stanowiska wypisz osoby najwięcej i najmniej zarabiające. Osoby o maksymalnych zarobkach oznacz gwiazdką w dodatkowej kolumnie.
--TODO
-- 11. Dla każdego dzialu  wypisać stanowisko, ma którym zatrudniono najwięcej osób
     
      SELECT deptno, job, count(*)
      FROM emp e
      GROUP BY e.deptno, e.job
     HAVING count(*)=
                       ( SELECT MAX( count(*))
                         FROM emp  
                         WHERE deptno= e.deptno group by job)

-- Dla każdego projektu wypisać stanowisko, ma którym jest najwyższa srednia pensja
SELECT DISTINCT P.PROJNO, E.JOB
FROM PROJ P, PROJ_EMP PE, EMP E
WHERE P.PROJNO = PE.PROJNO
  AND E.EMPNO = PE.EMPNO
  AND (
    SELECT AVG(E2.SAL)
    FROM PROJ_EMP PE2, EMP E2
    WHERE PE2.PROJNO = P.PROJNO
      AND E2.EMPNO = PE2.EMPNO
      AND E2.JOB = E.JOB
  ) = (
    SELECT MAX(AVG_SAL) FROM (
        SELECT E3.JOB, AVG(E3.SAL) AS AVG_SAL
        FROM PROJ_EMP PE3, EMP E3
        WHERE PE3.PROJNO = P.PROJNO
          AND E3.EMPNO = PE3.EMPNO
        GROUP BY E3.JOB
    )
  );

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CWICZENIA 6
-- COMMIT -> DELETE -> ROLLBACK (ROLLBack cofa do ostatniego commita)

-- usunąć z tabeli Proj_emp  wszystkich pracowników, którzy pacują na  stanowisku CLERK w dziale 10( potem zrobić rollback)
COMMIT

DELETE FROM PROJ_EMP
WHERE EMPNO IN (
    SELECT EMPNO FROM EMP
    WHERE JOB = 'CLERK' AND DEPTNO = 10
);

ROLLBACK

-- Zatrudnić  w projekcie o nazwie PROJECT5 pracownika MILLERa ( jedna ijstrukcja)
INSERT INTO PROJ_EMP VALUES (5,(SELECT EMPNO FROM EMP WHERE EMP.ENAME = 'MILLER'));

-- Utwórz tabelę „miasto” posiadającą klucz główny (np. id_miasto) oraz kolumnę „nazwa”.
CREATE TABLE miasto (
    id_miasto NUMBER(4) PRIMARY KEY,
    nazwa VARCHAR(100) NOT NULL
);
-- Utwórz tabelę „osoba” posiadającą kolumny: id_osoby, nazwisko, data_urodzenia, adres oraz id_miasto, które jest kluczem obcym z tabeli miasto.
CREATE TABLE osoba (
    id_osoby VARCHAR(20) PRIMARY KEY,
    nazwisko VARCHAR(100) NOT NULL,
    data_urodzenia DATE,
    adres VARCHAR(100),
    id_miasto NUMBER(4),
    FOREIGN KEY (id_miasto) REFERENCES miasto(id_miasto)
);
--Dodaj kolumnę „zawod” do tabeli osoba.
ALTER TABLE osoba ADD (zawod VARCHAR(50)); 
-- Wstaw kilka przykładowych miast.
INSERT INTO miasto (id_miasto, nazwa) VALUES (1, 'Warszawa');
INSERT INTO miasto (id_miasto, nazwa) VALUES (2, 'Kraków');
INSERT INTO miasto (id_miasto, nazwa) VALUES (3, 'Gdańsk');
-- Wstaw kilka osób do tabeli „osoba”. Sprawdź czy da się wstawić id_miasta nie istniejące w tabeli „miasto”?
INSERT INTO osoba (id_osoby, nazwisko, data_urodzenia, adres, id_miasto, zawod) VALUES ('1', 'Kowalski',TO_DATE('2016-01-01', 'YYYY-MM-DD'), 'ul. Warszawska 1', 1, 'Lekarz');
INSERT INTO osoba VALUES (2, 'Kowalski',TO_DATE('2016-01-01', 'YYYY-MM-DD'), 'ul. Warszawska 1', 1, 'Lekarz');
-- Wstawi do tabeli osoba wszystkich pracowników z tabeli emp. Dla brakujących pól (data_urodzenia, id_miasta, adres) można przyjąć stałą wartość lub NULL.
INSERT INTO osoba (id_osoby, nazwisko,data_urodzenia, adres, id_miasto, zawod) SELECT empno, ename, NULL, NULL, NULL, NULL FROM emp;
INSERT INTO osoba (id_osoby, nazwisko) SELECT empno, ename FROM emp;
-- Zmień dowolnie datę urodzenia oraz adres wybranej osobie.
UPDATE osoba SET data_urodzenia = TO_DATE('2015-01-01', 'YYYY-MM-DD'), adres = 'Nowy adres 123' WHERE id_osoby = 1;
-- Usuń wszystkie osoby, których nazwisko zaczyna się na literę P.
DELETE FROM osoba WHERE nazwisko LIKE 'P%';
-- Do tabeli „osoba” dodaj kolumnę „PESEL” z opcją UNIQUE. Sprawdź wstawiając kilka rekordów, czy unikalność numerów PESEL będzie rzeczywiście sprawdzana.
ALTER TABLE osoba ADD COLUMN pesel CHAR(11) UNIQUE;
-- Do tabeli „osoba” dodaj więzy typu CHECK, które będą pilnowały, aby data urodzenia była większa niż 1 styczna 1900. Sprawdź czy da się wstawić osobę urodzoną przed 1900 rokiem.
ALTER TABLE osoba ADD CONSTRAINT chk_data_urodzenia CHECK (data_urodzenia > TO_DATE('1900-01-01', 'YYYY-MM-DD'));
-- Usuń utworzone przed siebie tabele.
DROP TABLE osoba;
DROP TABLE miasto;

-----------------------------------------------------------------------------------------
INSERT INTO Emp_new  SELECT * FROM Emp  WHERE Sysdate - Hiredate < 10;

UPDATE Emp  SET Sal = Sal * 1.1 WHERE 
     (SELECT Loc FROM Dept WHERE Emp.Deptno=Dept.Deptno) = 'DALLAS';

DELETE FROM Emp e WHERE  comm >
    (Select avg( comm) FROM emp where  job=e. job)

ALTER TABLE Emp ADD (Pesel CHAR(11)); 
ALTER TABLE Emp MODIFY (Pesel VARCHAR2(11)); 
ALTER TABLE Emp DROP (Pesel);  

-- Usuwanie z wiezami
DROP TABLE nazwa_tabeli CASCADE CONSTRAINTS;

---------------------------------------------------------------------------------------------------------------------
CREATE TABLE Dept (
    Deptno NUMBER(2) PRIMARY KEY,
    Dname VARCHAR2(14) UNIQUE,
    Loc VARCHAR2(13) NOT NULL
);

CREATE TABLE Emp (
    Empno   NUMBER(4), -- Klucz główny (zdefiniowany poza linią)
    Ename   VARCHAR2(10) NOT NULL, -- NOT NULL
    Job     VARCHAR2(9),
    Mgr     NUMBER(4), -- Klucz obcy (do tej samej tabeli)
    Hiredate DATE,
    Sal     NUMBER(7,2) CONSTRAINT chk_sal CHECK (Sal >= 0), -- CHECK w linii
    Comm    NUMBER(7,2),
    Deptno  NUMBER(2) NOT NULL, -- NOT NULL + FK poza linią

    -- Poniżej więzy poza linią
    CONSTRAINT pk_emp PRIMARY KEY (Empno),
    CONSTRAINT fk_mgr FOREIGN KEY (Mgr) REFERENCES Emp(Empno), -- Samoodwołujący FK
    CONSTRAINT fk_dept FOREIGN KEY (Deptno) REFERENCES Dept(Deptno),
    CONSTRAINT chk_comm_less_sal CHECK (Comm < Sal) -- CHECK poza linią
);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. Dla każdego działu (podać numer) wypisać osoby, które pracowały w największej liczbie projektów
SELECT e.deptno, e.empno, e.ename, COUNT(*)
FROM proj_emp pe, emp e
WHERE pe.empno = e.empno
GROUP BY e.ename, e.empno, e.deptno
HAVING COUNT(*) = (
    SELECT MAX(COUNT(*))
    FROM proj_emp pew, emp ew
    WHERE ew.empno = pew.empno AND ew.deptno = e.deptno
    GROUP BY pew.empno
)
ORDER BY e.deptno;

-- 2. Wypisać projekty, w których pracowali pracownicy zatrudnieni w tym samym mieście, co MARTIN
SELECT pname, loc, ename
FROM proj p, proj_emp pe, emp e, dept d
WHERE p.projno = pe.projno
  AND pe.empno = e.empno
  AND e.deptno = d.deptno
  AND e.ename NOT LIKE 'MARTIN'
  AND d.loc = (
    SELECT loc
    FROM dept d2, emp e2
    WHERE e2.deptno = d2.deptno
      AND e2.ename = 'MARTIN'
);

-- 3. Wypisać stanowiska, na których nie pracuje żadna osoba zatrudniona w projekcie 1
SELECT DISTINCT job
FROM emp e2
WHERE NOT EXISTS (
    SELECT e.job
    FROM emp e, proj_emp pe
    WHERE e.empno = pe.empno
      AND pe.projno = 1
      AND e.job = e2.job
);

-- 4. Wypisać osoby, które nie pracowały w żadnym projekcie
SELECT empno, ename
FROM emp e
WHERE NOT EXISTS (
    SELECT empno
    FROM proj_emp pe
    WHERE pe.empno = e.empno
);

-- 5. Policzyć pracowników każdego projektu, Wypisać tylko te projekty, dla których jest więcej niż 3 pracowników
SELECT pname, COUNT(*)
FROM proj p, proj_emp pe
WHERE p.projno = pe.projno
GROUP BY p.projno, pname
HAVING COUNT(*) > 3;

SELECT PROJNO, COUNT(*)
FROM PROJ_EMP PE
GROUP BY PROJNO
HAVING COUNT(*) > 3;

-- 6. Policzyć ile projektów zaczynało się w każdym miesiącu roku 2016
SELECT EXTRACT(YEAR FROM p.start_date) AS Y, EXTRACT(MONTH FROM p.start_date) AS M, COUNT(*)
FROM proj p
WHERE EXTRACT(YEAR FROM p.start_date) = 2016
GROUP BY EXTRACT(YEAR FROM p.start_date), EXTRACT(MONTH FROM p.start_date)
ORDER BY 2;

-- 7. Wypisać nazwy i budżety projektów, w których brali udział pracownicy z trzeciej grupy zarobkowej
SELECT pname, budget
FROM proj p
WHERE p.projno IN (
    SELECT pe.projno
    FROM proj_emp pe, emp e, salgrade s
    WHERE pe.empno = e.empno
      AND e.sal BETWEEN s.losal AND s.hisal
      AND s.grade = 3
);

-- 8. Wypisać nazwiska pracowników, którzy brali udział zarówno w projekcie 2 jak i 4
SELECT ename
FROM emp e, proj_emp pe
WHERE e.empno = pe.empno AND pe.projno = 2
INTERSECT
SELECT ename
FROM emp e, proj_emp pe
WHERE e.empno = pe.empno AND pe.projno = 4;

-- 9. Dla każdego pracownika wypisać jego nazwisko, pensję oraz średnią pensję na jego stanowisku
SELECT e.ename, e.job, e.sal, avg_job.avg_sal
FROM emp e, (
    SELECT job, AVG(sal) AS avg_sal
    FROM emp
    GROUP BY job
) avg_job
WHERE e.job = avg_job.job;

-- 10. Dla każdego kierownika - podać nazwisko oraz nazwisko jego pracownika o najniższej pensji
SELECT m.ename AS kierownik, m.sal AS sal_kier, e.ename AS podwladny, e.sal AS sal_podwladny
FROM emp e, emp m
WHERE e.mgr = m.empno
  AND e.sal = (
    SELECT MIN(sal)
    FROM emp
    WHERE mgr = m.empno
);

-- 3. Dla każdego roku  odnaleźć projekt w którym zatrudniono najwęcej prcowników:

select extract ( year from start_date)   ROK_ST , p.projno, count(*)
From Proj p inner join proj_emp pe on pe.projno=p.projno
group by extract ( year from start_date), p.projno
having count(*)=
    ( select Max( count(*))
    From Proj pp inner join proj_emp pe on pe.projno=pp.projno 
    where extract ( year from pp.start_date)=extract ( year from p.start_date)
    group by  pp.projno );
