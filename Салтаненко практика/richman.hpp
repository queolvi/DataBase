#include <iostream>
#include <cmath>
#include <random>


namespace richman {

static std::random_device rd;
        static std::mt19937 gen(rd()); // рандомайзер
        static std::uniform_real_distribution<double> udd(-0.1 , 0.1);
 
    class man {
        private:
        double Pmoney; // деньги игрока
        int Pstock; // Создать структуру с массивом акций 
        double Pstockprice; // цена акций игрока 
        int stock; // Акции
        double stockprice; // Цена акции
        public:
         man(double Pmoney = 1000, int Pstock = 0);
         double getPmoney_ () const; // геттеры
         int getPstock_ () const;
         int getstock_ () const;
         double getPstockprice_ ();
         double getstockprice_ () ;
         man operator+=(const man& rhs); 
         man operator-=(const man& rhs);
         bool operator== (const man& rhs) const;
         int turn (const man& rhs) ; // ход
         double pricerandom (const man& rhs); // рандомизатор цены акции        
         bool buy (const man& rhs) ; 
         bool sell  (const man& rhs);
         bool wait  (const man& rhs);
    };
   


}
