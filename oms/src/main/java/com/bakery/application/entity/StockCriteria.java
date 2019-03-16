package com.bakery.application.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class StockCriteria {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public StockCriteria() {
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

        public Criteria andStockIdIsNull() {
            addCriterion("STOCK_ID is null");
            return (Criteria) this;
        }

        public Criteria andStockIdIsNotNull() {
            addCriterion("STOCK_ID is not null");
            return (Criteria) this;
        }

        public Criteria andStockIdEqualTo(String value) {
            addCriterion("STOCK_ID =", value, "stockId");
            return (Criteria) this;
        }

        public Criteria andStockIdNotEqualTo(String value) {
            addCriterion("STOCK_ID <>", value, "stockId");
            return (Criteria) this;
        }

        public Criteria andStockIdGreaterThan(String value) {
            addCriterion("STOCK_ID >", value, "stockId");
            return (Criteria) this;
        }

        public Criteria andStockIdGreaterThanOrEqualTo(String value) {
            addCriterion("STOCK_ID >=", value, "stockId");
            return (Criteria) this;
        }

        public Criteria andStockIdLessThan(String value) {
            addCriterion("STOCK_ID <", value, "stockId");
            return (Criteria) this;
        }

        public Criteria andStockIdLessThanOrEqualTo(String value) {
            addCriterion("STOCK_ID <=", value, "stockId");
            return (Criteria) this;
        }

        public Criteria andStockIdLike(String value) {
            addCriterion("STOCK_ID like", value, "stockId");
            return (Criteria) this;
        }

        public Criteria andStockIdNotLike(String value) {
            addCriterion("STOCK_ID not like", value, "stockId");
            return (Criteria) this;
        }

        public Criteria andStockIdIn(List<String> values) {
            addCriterion("STOCK_ID in", values, "stockId");
            return (Criteria) this;
        }

        public Criteria andStockIdNotIn(List<String> values) {
            addCriterion("STOCK_ID not in", values, "stockId");
            return (Criteria) this;
        }

        public Criteria andStockIdBetween(String value1, String value2) {
            addCriterion("STOCK_ID between", value1, value2, "stockId");
            return (Criteria) this;
        }

        public Criteria andStockIdNotBetween(String value1, String value2) {
            addCriterion("STOCK_ID not between", value1, value2, "stockId");
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

        public Criteria andStoreIdIsNull() {
            addCriterion("STORE_ID is null");
            return (Criteria) this;
        }

        public Criteria andStoreIdIsNotNull() {
            addCriterion("STORE_ID is not null");
            return (Criteria) this;
        }

        public Criteria andStoreIdEqualTo(String value) {
            addCriterion("STORE_ID =", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdNotEqualTo(String value) {
            addCriterion("STORE_ID <>", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdGreaterThan(String value) {
            addCriterion("STORE_ID >", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdGreaterThanOrEqualTo(String value) {
            addCriterion("STORE_ID >=", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdLessThan(String value) {
            addCriterion("STORE_ID <", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdLessThanOrEqualTo(String value) {
            addCriterion("STORE_ID <=", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdLike(String value) {
            addCriterion("STORE_ID like", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdNotLike(String value) {
            addCriterion("STORE_ID not like", value, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdIn(List<String> values) {
            addCriterion("STORE_ID in", values, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdNotIn(List<String> values) {
            addCriterion("STORE_ID not in", values, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdBetween(String value1, String value2) {
            addCriterion("STORE_ID between", value1, value2, "storeId");
            return (Criteria) this;
        }

        public Criteria andStoreIdNotBetween(String value1, String value2) {
            addCriterion("STORE_ID not between", value1, value2, "storeId");
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

        public Criteria andPdtCodeIsNull() {
            addCriterion("PDT_CODE is null");
            return (Criteria) this;
        }

        public Criteria andPdtCodeIsNotNull() {
            addCriterion("PDT_CODE is not null");
            return (Criteria) this;
        }

        public Criteria andPdtCodeEqualTo(String value) {
            addCriterion("PDT_CODE =", value, "pdtCode");
            return (Criteria) this;
        }

        public Criteria andPdtCodeNotEqualTo(String value) {
            addCriterion("PDT_CODE <>", value, "pdtCode");
            return (Criteria) this;
        }

        public Criteria andPdtCodeGreaterThan(String value) {
            addCriterion("PDT_CODE >", value, "pdtCode");
            return (Criteria) this;
        }

        public Criteria andPdtCodeGreaterThanOrEqualTo(String value) {
            addCriterion("PDT_CODE >=", value, "pdtCode");
            return (Criteria) this;
        }

        public Criteria andPdtCodeLessThan(String value) {
            addCriterion("PDT_CODE <", value, "pdtCode");
            return (Criteria) this;
        }

        public Criteria andPdtCodeLessThanOrEqualTo(String value) {
            addCriterion("PDT_CODE <=", value, "pdtCode");
            return (Criteria) this;
        }

        public Criteria andPdtCodeLike(String value) {
            addCriterion("PDT_CODE like", value, "pdtCode");
            return (Criteria) this;
        }

        public Criteria andPdtCodeNotLike(String value) {
            addCriterion("PDT_CODE not like", value, "pdtCode");
            return (Criteria) this;
        }

        public Criteria andPdtCodeIn(List<String> values) {
            addCriterion("PDT_CODE in", values, "pdtCode");
            return (Criteria) this;
        }

        public Criteria andPdtCodeNotIn(List<String> values) {
            addCriterion("PDT_CODE not in", values, "pdtCode");
            return (Criteria) this;
        }

        public Criteria andPdtCodeBetween(String value1, String value2) {
            addCriterion("PDT_CODE between", value1, value2, "pdtCode");
            return (Criteria) this;
        }

        public Criteria andPdtCodeNotBetween(String value1, String value2) {
            addCriterion("PDT_CODE not between", value1, value2, "pdtCode");
            return (Criteria) this;
        }

        public Criteria andInTimeIsNull() {
            addCriterion("IN_TIME is null");
            return (Criteria) this;
        }

        public Criteria andInTimeIsNotNull() {
            addCriterion("IN_TIME is not null");
            return (Criteria) this;
        }

        public Criteria andInTimeEqualTo(Date value) {
            addCriterionForJDBCDate("IN_TIME =", value, "inTime");
            return (Criteria) this;
        }

        public Criteria andInTimeNotEqualTo(Date value) {
            addCriterionForJDBCDate("IN_TIME <>", value, "inTime");
            return (Criteria) this;
        }

        public Criteria andInTimeGreaterThan(Date value) {
            addCriterionForJDBCDate("IN_TIME >", value, "inTime");
            return (Criteria) this;
        }

        public Criteria andInTimeGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("IN_TIME >=", value, "inTime");
            return (Criteria) this;
        }

        public Criteria andInTimeLessThan(Date value) {
            addCriterionForJDBCDate("IN_TIME <", value, "inTime");
            return (Criteria) this;
        }

        public Criteria andInTimeLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("IN_TIME <=", value, "inTime");
            return (Criteria) this;
        }

        public Criteria andInTimeIn(List<Date> values) {
            addCriterionForJDBCDate("IN_TIME in", values, "inTime");
            return (Criteria) this;
        }

        public Criteria andInTimeNotIn(List<Date> values) {
            addCriterionForJDBCDate("IN_TIME not in", values, "inTime");
            return (Criteria) this;
        }

        public Criteria andInTimeBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("IN_TIME between", value1, value2, "inTime");
            return (Criteria) this;
        }

        public Criteria andInTimeNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("IN_TIME not between", value1, value2, "inTime");
            return (Criteria) this;
        }

        public Criteria andOutTimeIsNull() {
            addCriterion("OUT_TIME is null");
            return (Criteria) this;
        }

        public Criteria andOutTimeIsNotNull() {
            addCriterion("OUT_TIME is not null");
            return (Criteria) this;
        }

        public Criteria andOutTimeEqualTo(Date value) {
            addCriterionForJDBCDate("OUT_TIME =", value, "outTime");
            return (Criteria) this;
        }

        public Criteria andOutTimeNotEqualTo(Date value) {
            addCriterionForJDBCDate("OUT_TIME <>", value, "outTime");
            return (Criteria) this;
        }

        public Criteria andOutTimeGreaterThan(Date value) {
            addCriterionForJDBCDate("OUT_TIME >", value, "outTime");
            return (Criteria) this;
        }

        public Criteria andOutTimeGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("OUT_TIME >=", value, "outTime");
            return (Criteria) this;
        }

        public Criteria andOutTimeLessThan(Date value) {
            addCriterionForJDBCDate("OUT_TIME <", value, "outTime");
            return (Criteria) this;
        }

        public Criteria andOutTimeLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("OUT_TIME <=", value, "outTime");
            return (Criteria) this;
        }

        public Criteria andOutTimeIn(List<Date> values) {
            addCriterionForJDBCDate("OUT_TIME in", values, "outTime");
            return (Criteria) this;
        }

        public Criteria andOutTimeNotIn(List<Date> values) {
            addCriterionForJDBCDate("OUT_TIME not in", values, "outTime");
            return (Criteria) this;
        }

        public Criteria andOutTimeBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("OUT_TIME between", value1, value2, "outTime");
            return (Criteria) this;
        }

        public Criteria andOutTimeNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("OUT_TIME not between", value1, value2, "outTime");
            return (Criteria) this;
        }

        public Criteria andInNumIsNull() {
            addCriterion("IN_NUM is null");
            return (Criteria) this;
        }

        public Criteria andInNumIsNotNull() {
            addCriterion("IN_NUM is not null");
            return (Criteria) this;
        }

        public Criteria andInNumEqualTo(String value) {
            addCriterion("IN_NUM =", value, "inNum");
            return (Criteria) this;
        }

        public Criteria andInNumNotEqualTo(String value) {
            addCriterion("IN_NUM <>", value, "inNum");
            return (Criteria) this;
        }

        public Criteria andInNumGreaterThan(String value) {
            addCriterion("IN_NUM >", value, "inNum");
            return (Criteria) this;
        }

        public Criteria andInNumGreaterThanOrEqualTo(String value) {
            addCriterion("IN_NUM >=", value, "inNum");
            return (Criteria) this;
        }

        public Criteria andInNumLessThan(String value) {
            addCriterion("IN_NUM <", value, "inNum");
            return (Criteria) this;
        }

        public Criteria andInNumLessThanOrEqualTo(String value) {
            addCriterion("IN_NUM <=", value, "inNum");
            return (Criteria) this;
        }

        public Criteria andInNumLike(String value) {
            addCriterion("IN_NUM like", value, "inNum");
            return (Criteria) this;
        }

        public Criteria andInNumNotLike(String value) {
            addCriterion("IN_NUM not like", value, "inNum");
            return (Criteria) this;
        }

        public Criteria andInNumIn(List<String> values) {
            addCriterion("IN_NUM in", values, "inNum");
            return (Criteria) this;
        }

        public Criteria andInNumNotIn(List<String> values) {
            addCriterion("IN_NUM not in", values, "inNum");
            return (Criteria) this;
        }

        public Criteria andInNumBetween(String value1, String value2) {
            addCriterion("IN_NUM between", value1, value2, "inNum");
            return (Criteria) this;
        }

        public Criteria andInNumNotBetween(String value1, String value2) {
            addCriterion("IN_NUM not between", value1, value2, "inNum");
            return (Criteria) this;
        }

        public Criteria andOutUnmIsNull() {
            addCriterion("OUT_UNM is null");
            return (Criteria) this;
        }

        public Criteria andOutUnmIsNotNull() {
            addCriterion("OUT_UNM is not null");
            return (Criteria) this;
        }

        public Criteria andOutUnmEqualTo(String value) {
            addCriterion("OUT_UNM =", value, "outUnm");
            return (Criteria) this;
        }

        public Criteria andOutUnmNotEqualTo(String value) {
            addCriterion("OUT_UNM <>", value, "outUnm");
            return (Criteria) this;
        }

        public Criteria andOutUnmGreaterThan(String value) {
            addCriterion("OUT_UNM >", value, "outUnm");
            return (Criteria) this;
        }

        public Criteria andOutUnmGreaterThanOrEqualTo(String value) {
            addCriterion("OUT_UNM >=", value, "outUnm");
            return (Criteria) this;
        }

        public Criteria andOutUnmLessThan(String value) {
            addCriterion("OUT_UNM <", value, "outUnm");
            return (Criteria) this;
        }

        public Criteria andOutUnmLessThanOrEqualTo(String value) {
            addCriterion("OUT_UNM <=", value, "outUnm");
            return (Criteria) this;
        }

        public Criteria andOutUnmLike(String value) {
            addCriterion("OUT_UNM like", value, "outUnm");
            return (Criteria) this;
        }

        public Criteria andOutUnmNotLike(String value) {
            addCriterion("OUT_UNM not like", value, "outUnm");
            return (Criteria) this;
        }

        public Criteria andOutUnmIn(List<String> values) {
            addCriterion("OUT_UNM in", values, "outUnm");
            return (Criteria) this;
        }

        public Criteria andOutUnmNotIn(List<String> values) {
            addCriterion("OUT_UNM not in", values, "outUnm");
            return (Criteria) this;
        }

        public Criteria andOutUnmBetween(String value1, String value2) {
            addCriterion("OUT_UNM between", value1, value2, "outUnm");
            return (Criteria) this;
        }

        public Criteria andOutUnmNotBetween(String value1, String value2) {
            addCriterion("OUT_UNM not between", value1, value2, "outUnm");
            return (Criteria) this;
        }

        public Criteria andFlagIsNull() {
            addCriterion("FLAG is null");
            return (Criteria) this;
        }

        public Criteria andFlagIsNotNull() {
            addCriterion("FLAG is not null");
            return (Criteria) this;
        }

        public Criteria andFlagEqualTo(String value) {
            addCriterion("FLAG =", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagNotEqualTo(String value) {
            addCriterion("FLAG <>", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagGreaterThan(String value) {
            addCriterion("FLAG >", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagGreaterThanOrEqualTo(String value) {
            addCriterion("FLAG >=", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagLessThan(String value) {
            addCriterion("FLAG <", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagLessThanOrEqualTo(String value) {
            addCriterion("FLAG <=", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagLike(String value) {
            addCriterion("FLAG like", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagNotLike(String value) {
            addCriterion("FLAG not like", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagIn(List<String> values) {
            addCriterion("FLAG in", values, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagNotIn(List<String> values) {
            addCriterion("FLAG not in", values, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagBetween(String value1, String value2) {
            addCriterion("FLAG between", value1, value2, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagNotBetween(String value1, String value2) {
            addCriterion("FLAG not between", value1, value2, "flag");
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