CREATE VIEW ExpensiveDishesView AS
SELECT * FROM priceDishesView WHERE priceDishesView.price > (SELECT AVG(priceDishesView.price) FROM priceDishesView)