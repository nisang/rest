package com.che.user.pojo;

public enum UserLevel {
	LEVEL1("估价师", 0), LEVEL2("进阶估价师", 100), LEVEL3("三星估价师", 200), LEVEL4("五星估价师", 500), LEVEL5("王牌估价师", 1000);
    
    private String name;//等级
    private int assessTimes;//最低估价次数

    private UserLevel(String name, int assessTimes) {
        this.name = name;
        this.assessTimes = assessTimes;
    }

    public static String getName(int assessTimes) {
        for (UserLevel c : UserLevel.values()) {
            if (c.getAssessTimes() == assessTimes) {
                return c.name;
            }
        }
        return null;
    }
    
    /**
     * 根据估计次数获取相应的等级
     * @param assessTimes
     * @return
     */
    public static String getLevel(Integer assessTimes) {
    	
    	if(assessTimes == null){
    		assessTimes = 0;
    	}
    	
    	String level = "";
    	if(assessTimes >= UserLevel.LEVEL5.getAssessTimes()){
    		level = UserLevel.LEVEL5.getName();
    	}else if(assessTimes >= UserLevel.LEVEL4.getAssessTimes()){
    		level = UserLevel.LEVEL4.getName();
    	}else if(assessTimes >= UserLevel.LEVEL3.getAssessTimes()){
    		level = UserLevel.LEVEL3.getName();
    	}else if(assessTimes >= UserLevel.LEVEL2.getAssessTimes()){
    		level = UserLevel.LEVEL2.getName();
    	}else if(assessTimes >= UserLevel.LEVEL1.getAssessTimes()){
    		level = UserLevel.LEVEL1.getName();
    	}
    	
    	return level;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAssessTimes() {
        return assessTimes;
    }

    public void AssessTimes(int assessTimes) {
        this.assessTimes = assessTimes;
    }
    
}
