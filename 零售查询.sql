/*�ι���д
2017��11��14��11:30:33*/
DECLARE @rq VARCHAR(1000);
SET @rq = '2017-11-13 00:00:00.000'; 
SELECT  a.DM1 ���̴���,
        MAX(b.ckmc) ��������,
        max (CONVERT(VARCHAR(10),rq,23)) ��������,
        SUM(a.JE) ���۽��,
        ROW_NUMBER() OVER (ORDER BY je desc) AS ��������
FROM    LSXHD a
        INNER JOIN CangKu b ON a.DM1 = b.CKDM
WHERE   a.RQ = @rq
GROUP BY a.DM1,a.JE
 