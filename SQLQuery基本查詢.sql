USE �аȨt�� 
GO
--///////////////////////////////////////////////
--////////////////// SELECT �l�y ///////////////
--//////////////////////////////////////////////
--�d�߾ǥ͸�ƪ�A�u���3�����
SELECT �Ǹ�, �m�W, �ͤ� FROM �ǥ�
--�d�߽ҵ{��ƪ�A��ܩҦ����
SELECT * FROM �ҵ{
--�d�߾ǥ͸�ƪ�A�ϥ�AS����r���w���O�W
SELECT �Ǹ� AS �ǥ;Ǹ�, �m�W AS �ǥͩm�W,�ͤ� AS �ǥͥͤ�
FROM �ǥ�
--�d�߭��u��ƪ�(�ϥ�AS����r���w�p�����쪺�O�W
SELECT �����Ҧr��, �m�W, �~��-���| AS �~���b�B
FROM ���u
--�d�߭��u��ƪ�(�ϥΦr��s���B�⦡����ܦa�}���
SELECT �����Ҧr��, �m�W, ����+'�]'+��D AS �a�}
FROM ���u
--�ϥ�T-SQL��ƨӭp��ǥͪ��~��
SELECT �Ǹ�, �m�W, GETDATE() AS ����,DATEDIFF(year, �ͤ�, GETDATE()) AS �~��
FROM �ǥ�
--�d�߽ҵ{���X�ؤ��P�Ǥ���(�ϥ�DISTINCT����r�簣��������
SELECT DISTINCT �Ǥ� FROM �ҵ{
--��ܫe3���ǥ͸��(�ϥ�TOP �l�y
SELECT TOP 3 * FROM �ǥ�
--��ܫe25%���ǥ͸��(�ϥ�PERCENT����r
SELECT TOP 25 PERCENT * FROM �ǥ�
--��ܫe3���ҵ{���,�Y���ۦP�Ǥ��ƫh�@�����(�ϥ�WITH TIES�PORDER BY �l�y
SELECT TOP 3 WITH TIES * FROM �ҵ{
ORDER BY �Ǥ�

--///////////////////////////////////////////////
--////////////////// FROM �l�y //////////////////
--///////////////////////////////////////////////
--�إ߼Ȧs��ƪ� ##�ҵ{
CREATE TABLE ##�ҵ{ (
   �ҵ{�s��  char(5) ,
   �W��      varchar(30) ,
   �Ǥ�      int
)
GO
INSERT INTO ##�ҵ{ 
VALUES ('CS101','�p�ⷧ����',4)
GO
INSERT INTO ##�ҵ{ 
VALUES ('CS121','�����ƾ�',4)
GO
--�d�߼Ȧs��ƪ�##�ҵ{���Ҧ��ҵ{�O��
SELECT * FROM ##�ҵ{

--///////////////////////////////////////////////
--//////////////// WHERE �l�y ///////////////////
--///////////////////////////////////////////////
--�d�߾Ǹ���S002���ǥ͸ԲӸ��
SELECT * FROM �ǥ� WHERE �Ǹ�='S002'
--�d���~�����p��50000�������u���
SELECT * FROM ���u WHERE �~�� < 50000
--�d�߾ǥͥͤ鬰1998-02-02���ǥͰO��
SELECT * FROM �ǥ� WHERE �ͤ�='1998-02-02'
--�d�߬�t��CS�MCIS���б¸��
SELECT * FROM �б� WHERE ��t LIKE '%S%'
--�d�߱ЫǦb�G�Ӫ��ҵ{���
SELECT DISTINCT �ҵ{�s��, �W�Үɶ�, �Ы�
FROM �Z�� 
WHERE �Ы� LIKE '%2_-%'
--�d�ߨ����Ҧr���OA-D�r���}�Y�����u���
SELECT * FROM ���u 
WHERE �����Ҧr�� LIKE '[A-D]%'
--�d�ߥͤ�d��b1995-01-01��1995-12-31�X�ͪ��ǥͰO��
SELECT * FROM �ǥ�
WHERE �ͤ� BETWEEN '1995-1-1' AND '1995-12-31'
--�d�߾Ǥ��ƬO2�M3���ҵ{���
SELECT * FROM �ҵ{
WHERE �Ǥ� BETWEEN 2 AND 3
--�d�߽ҵ{�s����CS101,CS222,CS100,CS213���ҵ{�ԲӸ��
SELECT * FROM �ҵ{
WHERE �ҵ{�s�� IN ('CS101', 'CS222', 'CS100', 'CS213')
--�d�߾Ǥ��ƬO2��4���ҵ{���
SELECT * FROM �ҵ{
WHERE �Ǥ� IN (2, 4)
--�d�߽ҵ{�s������CS101,CS222,CS100,CS213���ҵ{�ԲӸ��
SELECT * FROM �ҵ{
WHERE �ҵ{�s�� NOT IN ('CS101', 'CS222', 'CS100', 'CS213')
--�d�߽ҵ{�s���t'1'�ӥB�ҵ{�W�٦�'�{��'���ҵ{�ԲӸ��
SELECT * FROM �ҵ{
WHERE �ҵ{�s�� LIKE '%1%' AND �W�� LIKE '%�{��%'
--�d�߽ҵ{�s���t'1'�Ϊ̽ҵ{�W�٦�'�{��'���ҵ{�ԲӸ��
SELECT * FROM �ҵ{
WHERE �ҵ{�s�� LIKE '%1%' OR �W�� LIKE '%�{��%'
--�d�߽ҵ{�s���t'2',�M�ҵ{�W�٦�'�{��'�ξǤ��Ƥj�󵥩�4���ҵ{�ԲӸ��
SELECT * FROM �ҵ{
WHERE �ҵ{�s�� LIKE '%2%' AND �W�� LIKE '%�{��%' OR  �Ǥ�>=4
--�d�߽ҵ{�s���t'2',�M�ҵ{�W�٦�'�{��'�ξǤ��Ƥj�󵥩�4,��2�ӱ���ϥάA���A�_���ҵ{�ԲӸ��
SELECT * FROM �ҵ{
WHERE �ҵ{�s�� LIKE '%2%' AND (�W�� LIKE '%�{��%' OR  �Ǥ�>=4)
--�d���~���b���|�M�O�I���B�᪺�~���b�B�p��40000�����u���
SELECT �����Ҧr��, �m�W, �q�� FROM ���u
WHERE (�~��-���|-�O�I) < 40000

--///////////////////////////////////////////////
--////////////////// �E�X��� //////////////////
--///////////////////////////////////////////////
--�d�߾ǥ͸�ƪ��ǥ��`��(�t�ŭ�NULL����Ƥ]�|�Q�έp)
SELECT COUNT(*) AS �ǥͼ� FROM �ǥ�
--�d�߾ǥ͸�ƪ���J�ͤ��ƪ��ǥ��`��(�ͤ����t�ŭ�NULL����Ƥ��|�Q�έp)
SELECT COUNT(�ͤ�) AS �ǥͼ� FROM �ǥ�
--�d���~���j��40000�������u�`��
SELECT COUNT(*) AS ���u�� FROM ���u
WHERE �~�� > 40000
--�d�߭��u�~����������
SELECT AVG(�~��) AS �����~�� FROM ���u
--�d�߽ҵ{�s���t'1'���ҵ{�`�ƩM�Ǥ���������
SELECT COUNT(*) AS �ҵ{�`��, AVG(�Ǥ�) AS �Ǥ������� 
FROM �ҵ{ 
WHERE �ҵ{�s�� LIKE '%1%'
--�d�߫O�I���B�̰����u�����B
SELECT MAX(�O�I) AS �O�I���B FROM ���u
--�d�߽ҵ{�s���t'1'���̤j�Ǥ���
SELECT MAX(�Ǥ�) AS �̤j�Ǥ��� FROM �ҵ{ 
WHERE �ҵ{�s�� LIKE '%1%'
--�d�߫O�I���B�̧C���u�����B
SELECT MIN(�O�I) AS �O�I���B FROM ���u
--�d�߽ҵ{�s���t'1'���̤־Ǥ���
SELECT MIN(�Ǥ�) AS �̤־Ǥ��� FROM �ҵ{ 
WHERE �ҵ{�s�� LIKE '%1%'
--�d�߭��u���~���`�M�M������
SELECT SUM(�~��) AS �~���`�B, SUM(�~��)/COUNT(*) AS �~������ 
FROM ���u
--�d�߽ҵ{�s���t'1'���Ǥ����`�M
SELECT SUM(�Ǥ�) AS �Ǥ��`�M FROM �ҵ{ 
WHERE �ҵ{�s�� LIKE '%1%'

--////////////////////////////////////////////////////////////
--////////////////// �s�լd�� GROUP BY �l�y //////////////////
--////////////////////////////////////////////////////////////
--�d�߽ҵ{�s���M�p��C�@���ҵ{���h�֦�ǥͤW��
SELECT �ҵ{�s��, COUNT(*) AS �ǥͼ� FROM �Z�� 
GROUP BY �ҵ{�s��
--�έp�k��,�k�ͦU�ۦ��h�־ǥͼ�
SELECT �ʧO, COUNT(*) AS �ǥͼ� FROM �ǥ� 
GROUP BY �ʧO
--��X�ǥ�S002�W�Ҫ��ҵ{�M��
SELECT �Ǹ�, �ҵ{�s�� FROM �Z�� 
GROUP BY �ҵ{�s��, �Ǹ�
HAVING �Ǹ� = 'S002'
--��X�б½s��I003���б½ҵ{���W�L2��ǥͤW�Ҫ��ҵ{�M��
SELECT �ҵ{�s��, COUNT(*) AS �ǥͼ� FROM �Z�� 
WHERE �б½s�� = 'I003'
GROUP BY �ҵ{�s��
HAVING COUNT(*) >= 2
--��X�б½s��I001�MI003�б½ҵ{���ǥͼƤp�p�M�[�`,�H�ΦU�ҵ{���ǥ��`��
SELECT �б½s��, �ҵ{�s��, COUNT(�Ǹ�) AS �`�� FROM �Z�� 
WHERE �б½s�� IN ('I001', 'I003')
GROUP BY �б½s��, �ҵ{�s�� WITH CUBE
--��X�б½s��I001�MI003�б½ҵ{���ǥͼƤp�p�M�[�`
SELECT �б½s��, �ҵ{�s��, COUNT(�Ǹ�) AS �`�� FROM �Z�� 
WHERE �б½s�� IN ('I001', 'I003')
GROUP BY �б½s��, �ҵ{�s�� WITH ROLLUP
--��X�б½s��I001�MI003�б½ҵ{���ǥͼƤp�p�M�[�`(�ϥ�GROUPING SETS�l�y
SELECT �б½s��, �ҵ{�s��, COUNT(�Ǹ�) AS �`�� FROM �Z�� 
WHERE �б½s�� IN ('I001', 'I003')
GROUP BY GROUPING SETS
(
  (�б½s��, �ҵ{�s��), 
  (�б½s��),
  ()
)

--////////////////////////////////////////////////////////
--////////////////// �Ƨ� ORDER BY �l�y //////////////////
--////////////////////////////////////////////////////////
--�d���~���j��35000�������u�O��(�~���Ѥj��p�Ƨ�)
SELECT �m�W, �~��, �q�� FROM ���u 
WHERE �~�� > 35000
ORDER BY �~�� DESC
--�d���~���j��35000�������u�O��(�~���Ѥp��j�Ƨ�)
SELECT �m�W, �~��, �q�� FROM ���u 
WHERE �~�� > 35000
ORDER BY �~�� ASC