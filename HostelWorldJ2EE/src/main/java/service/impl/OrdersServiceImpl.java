package service.impl;

import dao.OrdersDao;
import dao.VipDao;
import model.Orders;
import model.Vip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.CurrentSpareRoomService;
import service.OrdersService;
import service.VipBalanceService;
import util.OrderConditionEnum;

import java.util.List;

/**
 * Created by Seven on 2017/2/25.
 */
@Service
public class OrdersServiceImpl implements OrdersService {
    @Autowired
    private OrdersDao ordersDao;
    @Autowired
    private VipDao vipDao;
    @Autowired
    VipBalanceService vipBalanceService;
    @Autowired
    CurrentSpareRoomService currentSpareRoomService;

    @Override
    public void saveOrders(Orders orders) {
        ordersDao.save(orders);
    }

    @Override
    public String getOrderNum(String hostelNum) {
        return ordersDao.getOrderNum(hostelNum);
    }

    @Override
    public void updateOrders(Orders orders) {
        ordersDao.update(orders);
    }

    @Override
    public boolean pay(String orderNum, double money) {
        Orders orders=ordersDao.find(orderNum);
        if(null!=orders){
            double requiredMoney=orders.getRequiredMoney();
            if(money==requiredMoney){
                Vip vip=vipDao.find(orders.getVipNum());
                double curmoney=vip.getMoney();
                if(vipBalanceService.withdraw(vip.getVipNum(),money)>=0){
                    orders.setPaidMoney(money);
                    orders.setOrderCondition(OrderConditionEnum.VALID.toString());
                    ordersDao.update(orders);
                    return true;
                }else{
                    return false;
                }
            }
        }
        return false;
    }

    @Override
    public boolean cancel(String orderNum) {
        Orders orders=ordersDao.find(orderNum);
        if(null!=orders&&(orders.getOrderCondition().equals(OrderConditionEnum.VALID.toString())||(orders.getOrderCondition().equals(OrderConditionEnum.BOOK.toString())))){
            double requiredMoney=orders.getRequiredMoney();
            double paidMoney=orders.getPaidMoney();
            if(paidMoney==requiredMoney){
                //收取30%的手续费，其他费用退还
                orders.setPaidMoney(paidMoney-requiredMoney*0.7);
                orders.setOrderCondition(OrderConditionEnum.CANCEL.toString());
                ordersDao.update(orders);
                Vip vip=vipDao.find(orders.getVipNum());
                if(null!=vip){
                    double currentMoney=vip.getMoney();
                    vip.setMoney(currentMoney+requiredMoney*0.7);
                    vipDao.update(vip);
                    return true;
                }
            }else{
                orders.setOrderCondition(OrderConditionEnum.CANCEL.toString());
                ordersDao.update(orders);
            }
            return true;
        }
        return false;
    }

    @Override
    public Orders find(String orderNum) {
        return ordersDao.find(orderNum);
    }

    @Override
    public List<Orders> queryByHostel(String hostelNum) {
        return ordersDao.queryByHostel(hostelNum);
    }

    @Override
    public List<Orders> queryByVip(String vipNum) {
        return ordersDao.queryByVip(vipNum);
    }

    @Override
    public List<Orders> queryByHostelAndCheckin(String hostelNum, String checkinDate) {
        return ordersDao.queryByHostelAndCheckin(hostelNum,checkinDate);
    }

    @Override
    public List<Orders> queryByHostelAndCheckout(String hostelNum, String checkoutDate) {
        return ordersDao.queryByHostelAndCheckout(hostelNum, checkoutDate);
    }

    @Override
    public List<Orders> queryByState(String state) {
        return ordersDao.queryByCondition(state);
    }
}
