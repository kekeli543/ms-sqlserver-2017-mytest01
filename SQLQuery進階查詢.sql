USE 教務系統 
GO
--////////////////////////////////////////////////////////
--////////////////// 合併查詢 ////////////////////////////
--////////////////////////////////////////////////////////
--使用INNER JOIN
--查詢學生的學號和姓名以及班級的課程編號和教授編號
SELECT 學生.學號, 學生.姓名, 班級.課程編號, 班級.教授編號
FROM 學生 INNER JOIN 班級 ON 學生.學號 = 班級.學號
--擴充上述查詢來取得課程的詳細資料
SELECT 學生.學號, 學生.姓名, 課程.*, 班級.教授編號
FROM 課程 INNER JOIN (
學生 INNER JOIN 班級 ON 學生.學號 = 班級.學號
) ON 課程.課程編號 = 班級.課程編號
--再擴充上述查詢來取得教授的詳細資料
SELECT 學生.學號, 學生.姓名, 課程.*, 教授.*
FROM 教授 INNER JOIN 
(課程 INNER JOIN 
(學生 INNER JOIN 班級 ON 學生.學號 = 班級.學號)
ON 課程.課程編號 = 班級.課程編號)
ON 教授.教授編號 = 班級.教授編號
--再擴充上述查詢來取得員工的詳細資料
SELECT 學生.學號, 學生.姓名, 課程.*, 教授.*, 員工.*
FROM 員工 INNER JOIN
(教授 INNER JOIN 
(課程 INNER JOIN 
(學生 INNER JOIN 班級 ON 學生.學號 = 班級.學號)
ON 課程.課程編號 = 班級.課程編號)
ON 教授.教授編號 = 班級.教授編號)
ON 員工.身份證字號 = 教授.身份證字號
--查詢學生的學號和姓名以及班級的課程編號和教授編號
SELECT 學生.學號, 學生.姓名, 班級.課程編號, 班級.教授編號
FROM 學生,班級
WHERE 學生.學號 = 班級.學號
--查詢學生的學號和姓名以及班級的課程編號和教授編號
SELECT 學生.學號, 學生.姓名, 上課.課程編號, 上課.教授編號
FROM 學生,班級 AS 上課
WHERE 學生.學號 = 上課.學號

--使用SELF JOIN
--找出同一個城市有其他員工存在的清單
SELECT DISTINCT 員工.姓名, 員工.城市, 員工.街道
FROM 員工 INNER JOIN 員工 AS 員工1
ON (員工.城市 = 員工1.城市 AND 員工.身份證字號 <> 員工1.身份證字號)
ORDER BY 員工.城市

--使用LEFT OUTER JOIN
--查詢教授和員工資料表且顯示教授的所有資料
SELECT * FROM 教授
SELECT 教授.教授編號, 員工.姓名, 教授.職稱, 員工.薪水 
FROM 教授 LEFT JOIN 員工 
ON 教授.身份證字號 = 員工.身份證字號

--使用RIGHT OUTER JOIN
--查詢教授和員工資料表且顯示員工的所有資料
SELECT * FROM 員工
SELECT 教授.教授編號, 員工.姓名, 教授.職稱, 員工.薪水 
FROM 教授 RIGHT JOIN 員工 
ON 教授.身份證字號 = 員工.身份證字號

--使用多種JOIN來合併學生,課程,班級資料表
SELECT * FROM 學生
SELECT * FROM 課程
SELECT * FROM 班級
SELECT 學生.學號, 學生.姓名, 課程.*, 班級.教授編號
FROM 課程 RIGHT JOIN
(學生 INNER JOIN 班級 ON 學生.學號 = 班級.學號) 
ON 課程.課程編號 = 班級.課程編號

--使用FULL JOIN
SELECT * FROM 教授
SELECT * FROM 員工
SELECT 教授.教授編號, 員工.姓名, 教授.職稱, 員工.薪水 
FROM 教授 FULL JOIN 員工 
ON 教授.身份證字號 = 員工.身份證字號

--使用CROSS JOIN
--查詢學生的學號與姓名和班級的課程編號與教授編號
SELECT 學生.學號, 學生.姓名, 班級.課程編號, 班級.教授編號
FROM 學生 CROSS JOIN 班級
--找出學生和班級資料表各位學生的上課記錄
SELECT 學生.學號, 學生.姓名, 班級.課程編號, 班級.教授編號
FROM 學生 CROSS JOIN 班級 
WHERE 學生.學號 = 班級.學號


--////////////////////////////////////////////////////////
--////////////////// 集合運算查詢 ////////////////////////
--////////////////////////////////////////////////////////
--UNION聯集查詢(將所有記錄都顯示,但相同資料只顯示其中一筆
--取出所有學生和員工姓名
SELECT 姓名 FROM 學生
UNION
SELECT 姓名 FROM 員工

--INTERSECT交集查詢(取出同時存在的記錄
--取出存在兩個資料表的學生和員工姓名
SELECT 姓名 FROM 學生
INTERSECT
SELECT 姓名 FROM 員工

--EXCEPT差集查詢(取出存在其中一個資料表,但不存在另一個資料表的記錄
--取出是學生但不是員工的姓名資料
SELECT 姓名 FROM 學生
EXCEPT
SELECT 姓名 FROM 員工


--////////////////////////////////////////////////////////
--////////////////// 子查詢(巢狀查詢) ////////////////////
--////////////////////////////////////////////////////////
--FROM子句的子查詢
--顯示高薪員工的記錄資料
SELECT 高薪員工.姓名, 高薪員工.電話, 高薪員工.薪水
FROM (SELECT 身份證字號, 姓名, 電話, 薪水
FROM 員工 WHERE 薪水 > 50000) AS 高薪員工

--WHERE和HAVING子句的子查詢
--查詢學生陳會安共上幾門課
SELECT COUNT(*) AS 上課數 FROM 班級
WHERE 學號 = (SELECT 學號 FROM 學生 WHERE 姓名='陳會安')
--找出員工薪水高於平均薪資的員工資料
SELECT 身份證字號, 姓名, 電話, 薪水 FROM 員工 
WHERE 薪水 > (SELECT AVG(薪水) FROM 員工)
--顯示課程編號CS222的學生資料(使用EXISTS
SELECT * FROM 學生 
WHERE EXISTS (
SELECT * FROM 班級 WHERE 課程編號 = 'CS222' AND 學生.學號 = 班級.學號
)
--找出所有在教室221-S和100-M上課的課程資料
SELECT * FROM 課程
WHERE EXISTS (
SELECT * FROM 班級 WHERE (教室 = '221-S' OR 教室 = '100-M') AND 課程.課程編號 = 班級.課程編號)
--找出所有在教室221-S和100-M上課的課程資料(使用合併查詢
SELECT DISTINCT 課程.* FROM 課程, 班級
WHERE (教室 = '221-S' OR 教室 = '100-M') AND 課程.課程編號 = 班級.課程編號
--取出學號S004沒有上的課程清單
SELECT * FROM 課程 
WHERE 課程編號 NOT IN (SELECT 課程編號 FROM 班級 WHERE 學號 = 'S004')
--找出學生江小魚上哪些教授的哪些課程(使用巢狀查詢
SELECT * FROM 教授 
WHERE 教授編號 IN (SELECT 教授編號 FROM 班級 
WHERE 學號 = (SELECT 學號 FROM 學生 WHERE 姓名 = '江小魚'))
--使用ALL運算子(父查詢條件需要滿足子查詢的所有結果
--查詢薪水大於等於住台北的員工薪水的員工資料
SELECT 姓名, 薪水 FROM 員工
WHERE 薪水 >= ALL (SELECT 薪水 FROM 員工 WHERE 城市 = '台北')
--使用ANY和SOME運算子(父查詢條件需要滿足子查詢的任一結果
SELECT 姓名, 薪水 FROM 員工
WHERE 薪水 >= ANY (SELECT 薪水 FROM 員工 WHERE 城市 = '台北')


--////////////////////////////////////////////////////////
--////////////////// T-SQL進階查詢 ///////////////////////
--////////////////////////////////////////////////////////
--OFFSET子句(位移幾筆記錄來開始傳回查詢結果
--位移3筆,傳回第4筆之後的員工資料
SELECT * FROM 員工 ORDER BY 身份證字號
SELECT 身份證字號, 姓名, 薪水 FROM 員工 
ORDER BY 身份證字號 OFFSET 3 ROWS

--FETCH NEXT子句
--位移3筆後,傳回第4筆開始的5筆的員工資料
SELECT 身份證字號, 姓名, 薪水 FROM 員工 
ORDER BY 身份證字號 
OFFSET 3 ROWS
FETCH NEXT 5 ROWS ONLY

--IS NULL 運算子
--查詢沒有生日資料的學生記錄
SELECT * FROM 學生
SELECT * FROM 學生 WHERE 生日 IS NULL

--ISNULL()函數
--查詢員工資料表,如果電話為空值則顯示'無電話'
SELECT * FROM 員工
SELECT 身份證字號, 姓名, ISNULL(電話,'無電話') AS 電話 FROM 員工

--使用CTE執行查詢
--建立教授_員工的暫存資料表後,再執行INNER JOIN查詢,顯示學生上課資料
SELECT * FROM 教授
WITH 教授_員工
AS ( 
SELECT 教授.*, 員工.姓名, 員工.薪水 
FROM 教授 INNER JOIN 員工 ON 教授.身份證字號 = 員工.身份證字號
)
SELECT 學生.學號, 學生.姓名, 課程.*, 教授_員工.*
FROM 教授_員工 INNER JOIN
(課程 INNER JOIN 
(學生 INNER JOIN 班級 ON 學生.學號 = 班級.學號) 
ON 班級.課程編號 = 課程.課程編號)
ON 班級.教授編號 = 教授_員工.教授編號

--使用CTE執行遞迴查詢
--先建立主管資料表並建立資料
CREATE TABLE 主管 (
  員工字號 char(10) NOT NULL,
  姓名 varchar(12) NULL,
  主管字號 char(10) NULL,
  PRIMARY KEY (員工字號)
) 
GO
INSERT INTO 主管 
VALUES ('A123456789','陳慶新',NULL)
GO
INSERT INTO 主管 
VALUES ('A222222222','楊金欉','A123456789')
GO
INSERT INTO 主管 
VALUES ('H098765432','李鴻章','A222222222')
GO
INSERT INTO 主管 
VALUES ('F213456780','陳小安','E444006666')
GO
INSERT INTO 主管 
VALUES ('A221304680','郭富城','F213456780')
GO
INSERT INTO 主管 
VALUES ('F332213046','張無忌','D444403333')
GO
INSERT INTO 主管 
VALUES ('D333300333','王心零','A222222222')
GO
INSERT INTO 主管 
VALUES ('D444403333','劉得華','E444006666')
GO
INSERT INTO 主管 
VALUES ('E444006666','小龍女','A123456789')
GO
--SELECT * FROM 主管
--建立主管資料表的遞迴查詢,顯示每位員工其上層主管的階層數
WITH 主管_遞迴
AS (
SELECT 員工字號, 姓名, 1 AS 階層 FROM 主管 WHERE 主管字號 IS NULL
UNION ALL
SELECT 主管.員工字號, 主管.姓名, 階層+1 FROM 主管 JOIN 主管_遞迴
ON 主管.主管字號 = 主管_遞迴.員工字號)
SELECT * FROM 主管_遞迴 ORDER BY 階層, 員工字號
