USE Catering
SELECT * FROM dishesPreparationTimeView

DELETE FROM dishesPreparationTimeView WHERE dishesPreparationTimeView.preparation_time < 30 
-- no err

SELECT * FROM DishesNameProductName
-- DELETE FROM DishesNameProductName WHERE DishesNameProductName.product_name LIKE '�������'
-- ��������� 4405, ������� 16, ��������� 1, ������ 8
-- ���������� �������� ������������� ��� ������� "DishesNameProductName", ��� ��� ��������� ������ �� ��������� ������� ������.



SELECT * FROM structuresCountView 

DELETE FROM structuresCountView WHERE structuresCountView.count_dishes < 2
-- ���������� �������� ������������� ��� ������� "structuresCountView", ��� ��� ��� �������� �������������� ���������, ����������� DISTINCT ��� GROUP BY ���� �������� PIVOT ��� UNPIVOTt