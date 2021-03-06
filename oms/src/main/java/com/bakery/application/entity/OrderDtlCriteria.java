package com.bakery.application.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class OrderDtlCriteria {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public OrderDtlCriteria() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andOrderDtlIdIsNull() {
            addCriterion("ORDER_DTL_ID is null");
            return (Criteria) this;
        }

        public Criteria andOrderDtlIdIsNotNull() {
            addCriterion("ORDER_DTL_ID is not null");
            return (Criteria) this;
        }

        public Criteria andOrderDtlIdEqualTo(String value) {
            addCriterion("ORDER_DTL_ID =", value, "orderDtlId");
            return (Criteria) this;
        }

        public Criteria andOrderDtlIdNotEqualTo(String value) {
            addCriterion("ORDER_DTL_ID <>", value, "orderDtlId");
            return (Criteria) this;
        }

        public Criteria andOrderDtlIdGreaterThan(String value) {
            addCriterion("ORDER_DTL_ID >", value, "orderDtlId");
            return (Criteria) this;
        }

        public Criteria andOrderDtlIdGreaterThanOrEqualTo(String value) {
            addCriterion("ORDER_DTL_ID >=", value, "orderDtlId");
            return (Criteria) this;
        }

        public Criteria andOrderDtlIdLessThan(String value) {
            addCriterion("ORDER_DTL_ID <", value, "orderDtlId");
            return (Criteria) this;
        }

        public Criteria andOrderDtlIdLessThanOrEqualTo(String value) {
            addCriterion("ORDER_DTL_ID <=", value, "orderDtlId");
            return (Criteria) this;
        }

        public Criteria andOrderDtlIdLike(String value) {
            addCriterion("ORDER_DTL_ID like", value, "orderDtlId");
            return (Criteria) this;
        }

        public Criteria andOrderDtlIdNotLike(String value) {
            addCriterion("ORDER_DTL_ID not like", value, "orderDtlId");
            return (Criteria) this;
        }

        public Criteria andOrderDtlIdIn(List<String> values) {
            addCriterion("ORDER_DTL_ID in", values, "orderDtlId");
            return (Criteria) this;
        }

        public Criteria andOrderDtlIdNotIn(List<String> values) {
            addCriterion("ORDER_DTL_ID not in", values, "orderDtlId");
            return (Criteria) this;
        }

        public Criteria andOrderDtlIdBetween(String value1, String value2) {
            addCriterion("ORDER_DTL_ID between", value1, value2, "orderDtlId");
            return (Criteria) this;
        }

        public Criteria andOrderDtlIdNotBetween(String value1, String value2) {
            addCriterion("ORDER_DTL_ID not between", value1, value2, "orderDtlId");
            return (Criteria) this;
        }

        public Criteria andIdIsNull() {
            addCriterion("ID is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("ID is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("ID =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("ID <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("ID >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("ID >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("ID <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("ID <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("ID in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("ID not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("ID between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("ID not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andOrderIdIsNull() {
            addCriterion("ORDER_ID is null");
            return (Criteria) this;
        }

        public Criteria andOrderIdIsNotNull() {
            addCriterion("ORDER_ID is not null");
            return (Criteria) this;
        }

        public Criteria andOrderIdEqualTo(String value) {
            addCriterion("ORDER_ID =", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdNotEqualTo(String value) {
            addCriterion("ORDER_ID <>", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdGreaterThan(String value) {
            addCriterion("ORDER_ID >", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdGreaterThanOrEqualTo(String value) {
            addCriterion("ORDER_ID >=", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdLessThan(String value) {
            addCriterion("ORDER_ID <", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdLessThanOrEqualTo(String value) {
            addCriterion("ORDER_ID <=", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdLike(String value) {
            addCriterion("ORDER_ID like", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdNotLike(String value) {
            addCriterion("ORDER_ID not like", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdIn(List<String> values) {
            addCriterion("ORDER_ID in", values, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdNotIn(List<String> values) {
            addCriterion("ORDER_ID not in", values, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdBetween(String value1, String value2) {
            addCriterion("ORDER_ID between", value1, value2, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdNotBetween(String value1, String value2) {
            addCriterion("ORDER_ID not between", value1, value2, "orderId");
            return (Criteria) this;
        }

        public Criteria andPdtIdIsNull() {
            addCriterion("PDT_ID is null");
            return (Criteria) this;
        }

        public Criteria andPdtIdIsNotNull() {
            addCriterion("PDT_ID is not null");
            return (Criteria) this;
        }

        public Criteria andPdtIdEqualTo(String value) {
            addCriterion("PDT_ID =", value, "pdtId");
            return (Criteria) this;
        }

        public Criteria andPdtIdNotEqualTo(String value) {
            addCriterion("PDT_ID <>", value, "pdtId");
            return (Criteria) this;
        }

        public Criteria andPdtIdGreaterThan(String value) {
            addCriterion("PDT_ID >", value, "pdtId");
            return (Criteria) this;
        }

        public Criteria andPdtIdGreaterThanOrEqualTo(String value) {
            addCriterion("PDT_ID >=", value, "pdtId");
            return (Criteria) this;
        }

        public Criteria andPdtIdLessThan(String value) {
            addCriterion("PDT_ID <", value, "pdtId");
            return (Criteria) this;
        }

        public Criteria andPdtIdLessThanOrEqualTo(String value) {
            addCriterion("PDT_ID <=", value, "pdtId");
            return (Criteria) this;
        }

        public Criteria andPdtIdLike(String value) {
            addCriterion("PDT_ID like", value, "pdtId");
            return (Criteria) this;
        }

        public Criteria andPdtIdNotLike(String value) {
            addCriterion("PDT_ID not like", value, "pdtId");
            return (Criteria) this;
        }

        public Criteria andPdtIdIn(List<String> values) {
            addCriterion("PDT_ID in", values, "pdtId");
            return (Criteria) this;
        }

        public Criteria andPdtIdNotIn(List<String> values) {
            addCriterion("PDT_ID not in", values, "pdtId");
            return (Criteria) this;
        }

        public Criteria andPdtIdBetween(String value1, String value2) {
            addCriterion("PDT_ID between", value1, value2, "pdtId");
            return (Criteria) this;
        }

        public Criteria andPdtIdNotBetween(String value1, String value2) {
            addCriterion("PDT_ID not between", value1, value2, "pdtId");
            return (Criteria) this;
        }

        public Criteria andPdtNumIsNull() {
            addCriterion("PDT_NUM is null");
            return (Criteria) this;
        }

        public Criteria andPdtNumIsNotNull() {
            addCriterion("PDT_NUM is not null");
            return (Criteria) this;
        }

        public Criteria andPdtNumEqualTo(Integer value) {
            addCriterion("PDT_NUM =", value, "pdtNum");
            return (Criteria) this;
        }

        public Criteria andPdtNumNotEqualTo(Integer value) {
            addCriterion("PDT_NUM <>", value, "pdtNum");
            return (Criteria) this;
        }

        public Criteria andPdtNumGreaterThan(Integer value) {
            addCriterion("PDT_NUM >", value, "pdtNum");
            return (Criteria) this;
        }

        public Criteria andPdtNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("PDT_NUM >=", value, "pdtNum");
            return (Criteria) this;
        }

        public Criteria andPdtNumLessThan(Integer value) {
            addCriterion("PDT_NUM <", value, "pdtNum");
            return (Criteria) this;
        }

        public Criteria andPdtNumLessThanOrEqualTo(Integer value) {
            addCriterion("PDT_NUM <=", value, "pdtNum");
            return (Criteria) this;
        }

        public Criteria andPdtNumIn(List<Integer> values) {
            addCriterion("PDT_NUM in", values, "pdtNum");
            return (Criteria) this;
        }

        public Criteria andPdtNumNotIn(List<Integer> values) {
            addCriterion("PDT_NUM not in", values, "pdtNum");
            return (Criteria) this;
        }

        public Criteria andPdtNumBetween(Integer value1, Integer value2) {
            addCriterion("PDT_NUM between", value1, value2, "pdtNum");
            return (Criteria) this;
        }

        public Criteria andPdtNumNotBetween(Integer value1, Integer value2) {
            addCriterion("PDT_NUM not between", value1, value2, "pdtNum");
            return (Criteria) this;
        }

        public Criteria andDtlTotalPriceIsNull() {
            addCriterion("DTL_TOTAL_PRICE is null");
            return (Criteria) this;
        }

        public Criteria andDtlTotalPriceIsNotNull() {
            addCriterion("DTL_TOTAL_PRICE is not null");
            return (Criteria) this;
        }

        public Criteria andDtlTotalPriceEqualTo(String value) {
            addCriterion("DTL_TOTAL_PRICE =", value, "dtlTotalPrice");
            return (Criteria) this;
        }

        public Criteria andDtlTotalPriceNotEqualTo(String value) {
            addCriterion("DTL_TOTAL_PRICE <>", value, "dtlTotalPrice");
            return (Criteria) this;
        }

        public Criteria andDtlTotalPriceGreaterThan(String value) {
            addCriterion("DTL_TOTAL_PRICE >", value, "dtlTotalPrice");
            return (Criteria) this;
        }

        public Criteria andDtlTotalPriceGreaterThanOrEqualTo(String value) {
            addCriterion("DTL_TOTAL_PRICE >=", value, "dtlTotalPrice");
            return (Criteria) this;
        }

        public Criteria andDtlTotalPriceLessThan(String value) {
            addCriterion("DTL_TOTAL_PRICE <", value, "dtlTotalPrice");
            return (Criteria) this;
        }

        public Criteria andDtlTotalPriceLessThanOrEqualTo(String value) {
            addCriterion("DTL_TOTAL_PRICE <=", value, "dtlTotalPrice");
            return (Criteria) this;
        }

        public Criteria andDtlTotalPriceLike(String value) {
            addCriterion("DTL_TOTAL_PRICE like", value, "dtlTotalPrice");
            return (Criteria) this;
        }

        public Criteria andDtlTotalPriceNotLike(String value) {
            addCriterion("DTL_TOTAL_PRICE not like", value, "dtlTotalPrice");
            return (Criteria) this;
        }

        public Criteria andDtlTotalPriceIn(List<String> values) {
            addCriterion("DTL_TOTAL_PRICE in", values, "dtlTotalPrice");
            return (Criteria) this;
        }

        public Criteria andDtlTotalPriceNotIn(List<String> values) {
            addCriterion("DTL_TOTAL_PRICE not in", values, "dtlTotalPrice");
            return (Criteria) this;
        }

        public Criteria andDtlTotalPriceBetween(String value1, String value2) {
            addCriterion("DTL_TOTAL_PRICE between", value1, value2, "dtlTotalPrice");
            return (Criteria) this;
        }

        public Criteria andDtlTotalPriceNotBetween(String value1, String value2) {
            addCriterion("DTL_TOTAL_PRICE not between", value1, value2, "dtlTotalPrice");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("STATUS is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("STATUS is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Integer value) {
            addCriterion("STATUS =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Integer value) {
            addCriterion("STATUS <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Integer value) {
            addCriterion("STATUS >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("STATUS >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Integer value) {
            addCriterion("STATUS <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Integer value) {
            addCriterion("STATUS <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Integer> values) {
            addCriterion("STATUS in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Integer> values) {
            addCriterion("STATUS not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Integer value1, Integer value2) {
            addCriterion("STATUS between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("STATUS not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("CREATE_TIME is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("CREATE_TIME is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterionForJDBCDate("CREATE_TIME =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterionForJDBCDate("CREATE_TIME <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterionForJDBCDate("CREATE_TIME >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("CREATE_TIME >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterionForJDBCDate("CREATE_TIME <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("CREATE_TIME <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterionForJDBCDate("CREATE_TIME in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterionForJDBCDate("CREATE_TIME not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("CREATE_TIME between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("CREATE_TIME not between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNull() {
            addCriterion("UPDATE_TIME is null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNotNull() {
            addCriterion("UPDATE_TIME is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeEqualTo(Date value) {
            addCriterionForJDBCDate("UPDATE_TIME =", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotEqualTo(Date value) {
            addCriterionForJDBCDate("UPDATE_TIME <>", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThan(Date value) {
            addCriterionForJDBCDate("UPDATE_TIME >", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("UPDATE_TIME >=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThan(Date value) {
            addCriterionForJDBCDate("UPDATE_TIME <", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("UPDATE_TIME <=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIn(List<Date> values) {
            addCriterionForJDBCDate("UPDATE_TIME in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotIn(List<Date> values) {
            addCriterionForJDBCDate("UPDATE_TIME not in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("UPDATE_TIME between", value1, value2, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("UPDATE_TIME not between", value1, value2, "updateTime");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNull() {
            addCriterion("REMARK is null");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNotNull() {
            addCriterion("REMARK is not null");
            return (Criteria) this;
        }

        public Criteria andRemarkEqualTo(String value) {
            addCriterion("REMARK =", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotEqualTo(String value) {
            addCriterion("REMARK <>", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThan(String value) {
            addCriterion("REMARK >", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThanOrEqualTo(String value) {
            addCriterion("REMARK >=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThan(String value) {
            addCriterion("REMARK <", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThanOrEqualTo(String value) {
            addCriterion("REMARK <=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLike(String value) {
            addCriterion("REMARK like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotLike(String value) {
            addCriterion("REMARK not like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkIn(List<String> values) {
            addCriterion("REMARK in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotIn(List<String> values) {
            addCriterion("REMARK not in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkBetween(String value1, String value2) {
            addCriterion("REMARK between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotBetween(String value1, String value2) {
            addCriterion("REMARK not between", value1, value2, "remark");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}