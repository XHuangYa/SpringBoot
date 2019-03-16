package com.bakery.application.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class ProductCriteria {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ProductCriteria() {
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

        public Criteria andPdtNameIsNull() {
            addCriterion("PDT_NAME is null");
            return (Criteria) this;
        }

        public Criteria andPdtNameIsNotNull() {
            addCriterion("PDT_NAME is not null");
            return (Criteria) this;
        }

        public Criteria andPdtNameEqualTo(String value) {
            addCriterion("PDT_NAME =", value, "pdtName");
            return (Criteria) this;
        }

        public Criteria andPdtNameNotEqualTo(String value) {
            addCriterion("PDT_NAME <>", value, "pdtName");
            return (Criteria) this;
        }

        public Criteria andPdtNameGreaterThan(String value) {
            addCriterion("PDT_NAME >", value, "pdtName");
            return (Criteria) this;
        }

        public Criteria andPdtNameGreaterThanOrEqualTo(String value) {
            addCriterion("PDT_NAME >=", value, "pdtName");
            return (Criteria) this;
        }

        public Criteria andPdtNameLessThan(String value) {
            addCriterion("PDT_NAME <", value, "pdtName");
            return (Criteria) this;
        }

        public Criteria andPdtNameLessThanOrEqualTo(String value) {
            addCriterion("PDT_NAME <=", value, "pdtName");
            return (Criteria) this;
        }

        public Criteria andPdtNameLike(String value) {
            addCriterion("PDT_NAME like", value, "pdtName");
            return (Criteria) this;
        }

        public Criteria andPdtNameNotLike(String value) {
            addCriterion("PDT_NAME not like", value, "pdtName");
            return (Criteria) this;
        }

        public Criteria andPdtNameIn(List<String> values) {
            addCriterion("PDT_NAME in", values, "pdtName");
            return (Criteria) this;
        }

        public Criteria andPdtNameNotIn(List<String> values) {
            addCriterion("PDT_NAME not in", values, "pdtName");
            return (Criteria) this;
        }

        public Criteria andPdtNameBetween(String value1, String value2) {
            addCriterion("PDT_NAME between", value1, value2, "pdtName");
            return (Criteria) this;
        }

        public Criteria andPdtNameNotBetween(String value1, String value2) {
            addCriterion("PDT_NAME not between", value1, value2, "pdtName");
            return (Criteria) this;
        }

        public Criteria andPdtTypeIsNull() {
            addCriterion("PDT_TYPE is null");
            return (Criteria) this;
        }

        public Criteria andPdtTypeIsNotNull() {
            addCriterion("PDT_TYPE is not null");
            return (Criteria) this;
        }

        public Criteria andPdtTypeEqualTo(Integer value) {
            addCriterion("PDT_TYPE =", value, "pdtType");
            return (Criteria) this;
        }

        public Criteria andPdtTypeNotEqualTo(Integer value) {
            addCriterion("PDT_TYPE <>", value, "pdtType");
            return (Criteria) this;
        }

        public Criteria andPdtTypeGreaterThan(Integer value) {
            addCriterion("PDT_TYPE >", value, "pdtType");
            return (Criteria) this;
        }

        public Criteria andPdtTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("PDT_TYPE >=", value, "pdtType");
            return (Criteria) this;
        }

        public Criteria andPdtTypeLessThan(Integer value) {
            addCriterion("PDT_TYPE <", value, "pdtType");
            return (Criteria) this;
        }

        public Criteria andPdtTypeLessThanOrEqualTo(Integer value) {
            addCriterion("PDT_TYPE <=", value, "pdtType");
            return (Criteria) this;
        }

        public Criteria andPdtTypeIn(List<Integer> values) {
            addCriterion("PDT_TYPE in", values, "pdtType");
            return (Criteria) this;
        }

        public Criteria andPdtTypeNotIn(List<Integer> values) {
            addCriterion("PDT_TYPE not in", values, "pdtType");
            return (Criteria) this;
        }

        public Criteria andPdtTypeBetween(Integer value1, Integer value2) {
            addCriterion("PDT_TYPE between", value1, value2, "pdtType");
            return (Criteria) this;
        }

        public Criteria andPdtTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("PDT_TYPE not between", value1, value2, "pdtType");
            return (Criteria) this;
        }

        public Criteria andUnitPriceIsNull() {
            addCriterion("UNIT_PRICE is null");
            return (Criteria) this;
        }

        public Criteria andUnitPriceIsNotNull() {
            addCriterion("UNIT_PRICE is not null");
            return (Criteria) this;
        }

        public Criteria andUnitPriceEqualTo(String value) {
            addCriterion("UNIT_PRICE =", value, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceNotEqualTo(String value) {
            addCriterion("UNIT_PRICE <>", value, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceGreaterThan(String value) {
            addCriterion("UNIT_PRICE >", value, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceGreaterThanOrEqualTo(String value) {
            addCriterion("UNIT_PRICE >=", value, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceLessThan(String value) {
            addCriterion("UNIT_PRICE <", value, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceLessThanOrEqualTo(String value) {
            addCriterion("UNIT_PRICE <=", value, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceLike(String value) {
            addCriterion("UNIT_PRICE like", value, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceNotLike(String value) {
            addCriterion("UNIT_PRICE not like", value, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceIn(List<String> values) {
            addCriterion("UNIT_PRICE in", values, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceNotIn(List<String> values) {
            addCriterion("UNIT_PRICE not in", values, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceBetween(String value1, String value2) {
            addCriterion("UNIT_PRICE between", value1, value2, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceNotBetween(String value1, String value2) {
            addCriterion("UNIT_PRICE not between", value1, value2, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andMeaserIsNull() {
            addCriterion("MEASER is null");
            return (Criteria) this;
        }

        public Criteria andMeaserIsNotNull() {
            addCriterion("MEASER is not null");
            return (Criteria) this;
        }

        public Criteria andMeaserEqualTo(String value) {
            addCriterion("MEASER =", value, "measer");
            return (Criteria) this;
        }

        public Criteria andMeaserNotEqualTo(String value) {
            addCriterion("MEASER <>", value, "measer");
            return (Criteria) this;
        }

        public Criteria andMeaserGreaterThan(String value) {
            addCriterion("MEASER >", value, "measer");
            return (Criteria) this;
        }

        public Criteria andMeaserGreaterThanOrEqualTo(String value) {
            addCriterion("MEASER >=", value, "measer");
            return (Criteria) this;
        }

        public Criteria andMeaserLessThan(String value) {
            addCriterion("MEASER <", value, "measer");
            return (Criteria) this;
        }

        public Criteria andMeaserLessThanOrEqualTo(String value) {
            addCriterion("MEASER <=", value, "measer");
            return (Criteria) this;
        }

        public Criteria andMeaserLike(String value) {
            addCriterion("MEASER like", value, "measer");
            return (Criteria) this;
        }

        public Criteria andMeaserNotLike(String value) {
            addCriterion("MEASER not like", value, "measer");
            return (Criteria) this;
        }

        public Criteria andMeaserIn(List<String> values) {
            addCriterion("MEASER in", values, "measer");
            return (Criteria) this;
        }

        public Criteria andMeaserNotIn(List<String> values) {
            addCriterion("MEASER not in", values, "measer");
            return (Criteria) this;
        }

        public Criteria andMeaserBetween(String value1, String value2) {
            addCriterion("MEASER between", value1, value2, "measer");
            return (Criteria) this;
        }

        public Criteria andMeaserNotBetween(String value1, String value2) {
            addCriterion("MEASER not between", value1, value2, "measer");
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