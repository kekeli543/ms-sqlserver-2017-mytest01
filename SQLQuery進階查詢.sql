USE �аȨt�� 
GO
--////////////////////////////////////////////////////////
--////////////////// �X�֬d�� ////////////////////////////
--////////////////////////////////////////////////////////
--�ϥ�INNER JOIN
--�d�߾ǥͪ��Ǹ��M�m�W�H�ίZ�Ū��ҵ{�s���M�б½s��
SELECT �ǥ�.�Ǹ�, �ǥ�.�m�W, �Z��.�ҵ{�s��, �Z��.�б½s��
FROM �ǥ� INNER JOIN �Z�� ON �ǥ�.�Ǹ� = �Z��.�Ǹ�
--�X�R�W�z�d�ߨӨ��o�ҵ{���ԲӸ��
SELECT �ǥ�.�Ǹ�, �ǥ�.�m�W, �ҵ{.*, �Z��.�б½s��
FROM �ҵ{ INNER JOIN (
�ǥ� INNER JOIN �Z�� ON �ǥ�.�Ǹ� = �Z��.�Ǹ�
) ON �ҵ{.�ҵ{�s�� = �Z��.�ҵ{�s��
--�A�X�R�W�z�d�ߨӨ��o�бª��ԲӸ��
SELECT �ǥ�.�Ǹ�, �ǥ�.�m�W, �ҵ{.*, �б�.*
FROM �б� INNER JOIN 
(�ҵ{ INNER JOIN 
(�ǥ� INNER JOIN �Z�� ON �ǥ�.�Ǹ� = �Z��.�Ǹ�)
ON �ҵ{.�ҵ{�s�� = �Z��.�ҵ{�s��)
ON �б�.�б½s�� = �Z��.�б½s��
--�A�X�R�W�z�d�ߨӨ��o���u���ԲӸ��
SELECT �ǥ�.�Ǹ�, �ǥ�.�m�W, �ҵ{.*, �б�.*, ���u.*
FROM ���u INNER JOIN
(�б� INNER JOIN 
(�ҵ{ INNER JOIN 
(�ǥ� INNER JOIN �Z�� ON �ǥ�.�Ǹ� = �Z��.�Ǹ�)
ON �ҵ{.�ҵ{�s�� = �Z��.�ҵ{�s��)
ON �б�.�б½s�� = �Z��.�б½s��)
ON ���u.�����Ҧr�� = �б�.�����Ҧr��
--�d�߾ǥͪ��Ǹ��M�m�W�H�ίZ�Ū��ҵ{�s���M�б½s��
SELECT �ǥ�.�Ǹ�, �ǥ�.�m�W, �Z��.�ҵ{�s��, �Z��.�б½s��
FROM �ǥ�,�Z��
WHERE �ǥ�.�Ǹ� = �Z��.�Ǹ�
--�d�߾ǥͪ��Ǹ��M�m�W�H�ίZ�Ū��ҵ{�s���M�б½s��
SELECT �ǥ�.�Ǹ�, �ǥ�.�m�W, �W��.�ҵ{�s��, �W��.�б½s��
FROM �ǥ�,�Z�� AS �W��
WHERE �ǥ�.�Ǹ� = �W��.�Ǹ�

--�ϥ�SELF JOIN
--��X�P�@�ӫ�������L���u�s�b���M��
SELECT DISTINCT ���u.�m�W, ���u.����, ���u.��D
FROM ���u INNER JOIN ���u AS ���u1
ON (���u.���� = ���u1.���� AND ���u.�����Ҧr�� <> ���u1.�����Ҧr��)
ORDER BY ���u.����

--�ϥ�LEFT OUTER JOIN
--�d�߱б©M���u��ƪ�B��ܱбª��Ҧ����
SELECT * FROM �б�
SELECT �б�.�б½s��, ���u.�m�W, �б�.¾��, ���u.�~�� 
FROM �б� LEFT JOIN ���u 
ON �б�.�����Ҧr�� = ���u.�����Ҧr��

--�ϥ�RIGHT OUTER JOIN
--�d�߱б©M���u��ƪ�B��ܭ��u���Ҧ����
SELECT * FROM ���u
SELECT �б�.�б½s��, ���u.�m�W, �б�.¾��, ���u.�~�� 
FROM �б� RIGHT JOIN ���u 
ON �б�.�����Ҧr�� = ���u.�����Ҧr��

--�ϥΦh��JOIN�ӦX�־ǥ�,�ҵ{,�Z�Ÿ�ƪ�
SELECT * FROM �ǥ�
SELECT * FROM �ҵ{
SELECT * FROM �Z��
SELECT �ǥ�.�Ǹ�, �ǥ�.�m�W, �ҵ{.*, �Z��.�б½s��
FROM �ҵ{ RIGHT JOIN
(�ǥ� INNER JOIN �Z�� ON �ǥ�.�Ǹ� = �Z��.�Ǹ�) 
ON �ҵ{.�ҵ{�s�� = �Z��.�ҵ{�s��

--�ϥ�FULL JOIN
SELECT * FROM �б�
SELECT * FROM ���u
SELECT �б�.�б½s��, ���u.�m�W, �б�.¾��, ���u.�~�� 
FROM �б� FULL JOIN ���u 
ON �б�.�����Ҧr�� = ���u.�����Ҧr��

--�ϥ�CROSS JOIN
--�d�߾ǥͪ��Ǹ��P�m�W�M�Z�Ū��ҵ{�s���P�б½s��
SELECT �ǥ�.�Ǹ�, �ǥ�.�m�W, �Z��.�ҵ{�s��, �Z��.�б½s��
FROM �ǥ� CROSS JOIN �Z��
--��X�ǥͩM�Z�Ÿ�ƪ�U��ǥͪ��W�ҰO��
SELECT �ǥ�.�Ǹ�, �ǥ�.�m�W, �Z��.�ҵ{�s��, �Z��.�б½s��
FROM �ǥ� CROSS JOIN �Z�� 
WHERE �ǥ�.�Ǹ� = �Z��.�Ǹ�


--////////////////////////////////////////////////////////
--////////////////// ���X�B��d�� ////////////////////////
--////////////////////////////////////////////////////////
--UNION�p���d��(�N�Ҧ��O�������,���ۦP��ƥu��ܨ䤤�@��
--���X�Ҧ��ǥͩM���u�m�W
SELECT �m�W FROM �ǥ�
UNION
SELECT �m�W FROM ���u

--INTERSECT�涰�d��(���X�P�ɦs�b���O��
--���X�s�b��Ӹ�ƪ��ǥͩM���u�m�W
SELECT �m�W FROM �ǥ�
INTERSECT
SELECT �m�W FROM ���u

--EXCEPT�t���d��(���X�s�b�䤤�@�Ӹ�ƪ�,�����s�b�t�@�Ӹ�ƪ��O��
--���X�O�ǥͦ����O���u���m�W���
SELECT �m�W FROM �ǥ�
EXCEPT
SELECT �m�W FROM ���u


--////////////////////////////////////////////////////////
--////////////////// �l�d��(�_���d��) ////////////////////
--////////////////////////////////////////////////////////
--FROM�l�y���l�d��
--��ܰ��~���u���O�����
SELECT ���~���u.�m�W, ���~���u.�q��, ���~���u.�~��
FROM (SELECT �����Ҧr��, �m�W, �q��, �~��
FROM ���u WHERE �~�� > 50000) AS ���~���u

--WHERE�MHAVING�l�y���l�d��
--�d�߾ǥͳ��|�w�@�W�X����
SELECT COUNT(*) AS �W�Ҽ� FROM �Z��
WHERE �Ǹ� = (SELECT �Ǹ� FROM �ǥ� WHERE �m�W='���|�w')
--��X���u�~�����󥭧��~�ꪺ���u���
SELECT �����Ҧr��, �m�W, �q��, �~�� FROM ���u 
WHERE �~�� > (SELECT AVG(�~��) FROM ���u)
--��ܽҵ{�s��CS222���ǥ͸��(�ϥ�EXISTS
SELECT * FROM �ǥ� 
WHERE EXISTS (
SELECT * FROM �Z�� WHERE �ҵ{�s�� = 'CS222' AND �ǥ�.�Ǹ� = �Z��.�Ǹ�
)
--��X�Ҧ��b�Ы�221-S�M100-M�W�Ҫ��ҵ{���
SELECT * FROM �ҵ{
WHERE EXISTS (
SELECT * FROM �Z�� WHERE (�Ы� = '221-S' OR �Ы� = '100-M') AND �ҵ{.�ҵ{�s�� = �Z��.�ҵ{�s��)
--��X�Ҧ��b�Ы�221-S�M100-M�W�Ҫ��ҵ{���(�ϥΦX�֬d��
SELECT DISTINCT �ҵ{.* FROM �ҵ{, �Z��
WHERE (�Ы� = '221-S' OR �Ы� = '100-M') AND �ҵ{.�ҵ{�s�� = �Z��.�ҵ{�s��
--���X�Ǹ�S004�S���W���ҵ{�M��
SELECT * FROM �ҵ{ 
WHERE �ҵ{�s�� NOT IN (SELECT �ҵ{�s�� FROM �Z�� WHERE �Ǹ� = 'S004')
--��X�ǥͦ��p���W���Ǳбª����ǽҵ{(�ϥα_���d��
SELECT * FROM �б� 
WHERE �б½s�� IN (SELECT �б½s�� FROM �Z�� 
WHERE �Ǹ� = (SELECT �Ǹ� FROM �ǥ� WHERE �m�W = '���p��'))
--�ϥ�ALL�B��l(���d�߱���ݭn�����l�d�ߪ��Ҧ����G
--�d���~���j�󵥩��x�_�����u�~�������u���
SELECT �m�W, �~�� FROM ���u
WHERE �~�� >= ALL (SELECT �~�� FROM ���u WHERE ���� = '�x�_')
--�ϥ�ANY�MSOME�B��l(���d�߱���ݭn�����l�d�ߪ����@���G
SELECT �m�W, �~�� FROM ���u
WHERE �~�� >= ANY (SELECT �~�� FROM ���u WHERE ���� = '�x�_')


--////////////////////////////////////////////////////////
--////////////////// T-SQL�i���d�� ///////////////////////
--////////////////////////////////////////////////////////
--OFFSET�l�y(�첾�X���O���Ӷ}�l�Ǧ^�d�ߵ��G
--�첾3��,�Ǧ^��4�����᪺���u���
SELECT * FROM ���u ORDER BY �����Ҧr��
SELECT �����Ҧr��, �m�W, �~�� FROM ���u 
ORDER BY �����Ҧr�� OFFSET 3 ROWS

--FETCH NEXT�l�y
--�첾3����,�Ǧ^��4���}�l��5�������u���
SELECT �����Ҧr��, �m�W, �~�� FROM ���u 
ORDER BY �����Ҧr�� 
OFFSET 3 ROWS
FETCH NEXT 5 ROWS ONLY

--IS NULL �B��l
--�d�ߨS���ͤ��ƪ��ǥͰO��
SELECT * FROM �ǥ�
SELECT * FROM �ǥ� WHERE �ͤ� IS NULL

--ISNULL()���
--�d�߭��u��ƪ�,�p�G�q�ܬ��ŭȫh���'�L�q��'
SELECT * FROM ���u
SELECT �����Ҧr��, �m�W, ISNULL(�q��,'�L�q��') AS �q�� FROM ���u

--�ϥ�CTE����d��
--�إ߱б�_���u���Ȧs��ƪ��,�A����INNER JOIN�d��,��ܾǥͤW�Ҹ��
SELECT * FROM �б�
WITH �б�_���u
AS ( 
SELECT �б�.*, ���u.�m�W, ���u.�~�� 
FROM �б� INNER JOIN ���u ON �б�.�����Ҧr�� = ���u.�����Ҧr��
)
SELECT �ǥ�.�Ǹ�, �ǥ�.�m�W, �ҵ{.*, �б�_���u.*
FROM �б�_���u INNER JOIN
(�ҵ{ INNER JOIN 
(�ǥ� INNER JOIN �Z�� ON �ǥ�.�Ǹ� = �Z��.�Ǹ�) 
ON �Z��.�ҵ{�s�� = �ҵ{.�ҵ{�s��)
ON �Z��.�б½s�� = �б�_���u.�б½s��

--�ϥ�CTE���滼�j�d��
--���إߥD�޸�ƪ�ëإ߸��
CREATE TABLE �D�� (
  ���u�r�� char(10) NOT NULL,
  �m�W varchar(12) NULL,
  �D�ަr�� char(10) NULL,
  PRIMARY KEY (���u�r��)
) 
GO
INSERT INTO �D�� 
VALUES ('A123456789','���y�s',NULL)
GO
INSERT INTO �D�� 
VALUES ('A222222222','������','A123456789')
GO
INSERT INTO �D�� 
VALUES ('H098765432','���E��','A222222222')
GO
INSERT INTO �D�� 
VALUES ('F213456780','���p�w','E444006666')
GO
INSERT INTO �D�� 
VALUES ('A221304680','���I��','F213456780')
GO
INSERT INTO �D�� 
VALUES ('F332213046','�i�L��','D444403333')
GO
INSERT INTO �D�� 
VALUES ('D333300333','���߹s','A222222222')
GO
INSERT INTO �D�� 
VALUES ('D444403333','�B�o��','E444006666')
GO
INSERT INTO �D�� 
VALUES ('E444006666','�p�s�k','A123456789')
GO
--SELECT * FROM �D��
--�إߥD�޸�ƪ����j�d��,��ܨC����u��W�h�D�ު����h��
WITH �D��_���j
AS (
SELECT ���u�r��, �m�W, 1 AS ���h FROM �D�� WHERE �D�ަr�� IS NULL
UNION ALL
SELECT �D��.���u�r��, �D��.�m�W, ���h+1 FROM �D�� JOIN �D��_���j
ON �D��.�D�ަr�� = �D��_���j.���u�r��)
SELECT * FROM �D��_���j ORDER BY ���h, ���u�r��
