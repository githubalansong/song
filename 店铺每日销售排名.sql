/*CREATE by song  2017-11-14 13:10:55 店铺每日销售排名*/
DECLARE @rq VARCHAR(100);
SET @rq = '2017-11-14 00:00:00.000';
SELECT * FROM 
(SELECT * FROM (
SELECT jsje.DM1 店铺代码,
    cangku.CKMC 店铺名称,
    CONVERT(VARCHAR(100), jsje.RQ, 23) 销售日期,
    cast (jsje.zsxssl as int) 销售数量,
    jsje.zsxsje 结算金额,
    ROW_NUMBER() OVER (ORDER BY jsje.zsxsje DESC) 销售排名
FROM
    (
        SELECT zsxsje.DM1,
            zsxsje.RQ,
            zsxsje.SL-zsxsje.thsl zsxssl,
            zsxsje.xsje - zsxsje.thje zsxsje
        FROM
        (
            SELECT xs.DM1,
                xs.RQ,
                xs.xsje,
                xs.SL,
                ISNULL(th.SL,0) thsl,
                ISNULL(th.thje, 0) thje
            FROM
                (
                    SELECT a.DM1,
                        a.RQ,
                        a.sl,
                        a.JE xsje
                    FROM LSXHD a
                    WHERE RQ = @rq
                ) xs
                LEFT JOIN
                (
                    SELECT b.DM1,
                        b.RQ,
                        b.sl,
                        b.JE thje
                    FROM LSTHD b
                    WHERE RQ = @rq
                ) th
                    ON th.DM1 = xs.DM1
                       AND th.RQ = xs.RQ
        ) zsxsje
    ) jsje
    INNER JOIN CangKu
     ON jsje.DM1 = CangKu.CKDM) jsje) aaa
     UNION ALL
     SELECT  '合计',NULL,CONVERT(VARCHAR(100),a.rq,23 ),CAST(SUM(a.sl)-SUM(b.sl)AS int),CAST(SUM(a.je)-SUM(b.je)AS int),NULL FROM lsxhd a ,lsthd b  WHERE a.rq=@rq AND b.rq=@rq GROUP BY a.rq
     
 
 
/* 
select a.DM1,a.RQ,a.sl,a.JE xsje from lsxhd a where dm1='d038' and rq='2017-11-13 00:00:00.000' 
select b.DM1,b.RQ,b.sl,b.JE xsje from lsthd b where dm1='d038' and rq='2017-11-13 00:00:00.000'  
 */      