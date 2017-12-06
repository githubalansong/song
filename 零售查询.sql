/*宋光金编写
2017年11月14日11:30:33*/
DECLARE @rq VARCHAR(1000);
SET @rq = '2017-11-13 00:00:00.000'; 
SELECT  a.DM1 店铺代码,
        MAX(b.ckmc) 店铺名称,
        max (CONVERT(VARCHAR(10),rq,23)) 销售日期,
        SUM(a.JE) 销售金额,
        ROW_NUMBER() OVER (ORDER BY je desc) AS 销售排名
FROM    LSXHD a
        INNER JOIN CangKu b ON a.DM1 = b.CKDM
WHERE   a.RQ = @rq
GROUP BY a.DM1,a.JE
 