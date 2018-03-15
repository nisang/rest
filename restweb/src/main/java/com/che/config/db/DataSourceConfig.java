/**
 * 
 */
package com.che.config.db;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.alibaba.druid.pool.DruidDataSource;
import com.che.rw.datasource.DynamicDataSource;

/**
 * @author karlhell
 *
 */
@Configuration
public class DataSourceConfig {
	@Value("${ds1.jdbc.driverClassName}")
	private String driverClass;
	@Value("${ds1.jdbc.url}")
	private String jdbcUrl;
	@Value("${ds1.jdbc.username}")
	private String username;
	@Value("${ds1.jdbc.password}")
	private String password;
	@Value("${druid.pool.initialSize}")
	private Integer initialSize;
	@Value("${druid.pool.minIdle}")
	private int minIdle;
	@Value("${druid.pool.maxActive}")
	private int maxActive;
	@Value("${druid.pool.maxWait}")
	private long maxWaitMillis;
	@Value("${druid.pool.timeBetweenEvictionRunsMillis}")
	private long timeBetweenEvictionRunsMillis;
	@Value("${druid.pool.minEvictableIdleTimeMillis}")
	private long minEvictableIdleTimeMillis;
	@Value("${druid.pool.validationQuery}")
	private String validationQuery;
	@Value("${druid.pool.testWhileIdle}")
	private boolean testWhileIdle;
	@Value("${druid.pool.testOnBorrow}")
	private boolean testOnBorrow;
	@Value("${druid.pool.testOnReturn}")
	private boolean testOnReturn;
	@Value("${druid.pool.poolPreparedStatements}")
	private boolean poolPreparedStatements;
	@Value("${druid.pool.maxPoolPreparedStatementPerConnectionSize}")
	private int maxPoolPreparedStatementPerConnectionSize;
	
	
	@Value("${ds2.jdbc.driverClassName}")
	private String driverClass2;
	@Value("${ds2.jdbc.url}")
	private String jdbcUrl2;
	@Value("${ds2.jdbc.username}")
	private String username2;
	@Value("${ds2.jdbc.password}")
	private String password2;
	
//	@Bean
//	@InitBinder
	public DruidDataSource masterDataSource(){
		DruidDataSource druidDs = new DruidDataSource();
		druidDs.setDriverClassName(driverClass);
		druidDs.setUrl(jdbcUrl);
		druidDs.setUsername(username);
		druidDs.setPassword(password);
		druidDs.setInitialSize(initialSize);
		druidDs.setMinIdle(minIdle);
		druidDs.setMaxActive(maxActive);
		druidDs.setMaxWait(maxWaitMillis);
		druidDs.setTimeBetweenEvictionRunsMillis(timeBetweenEvictionRunsMillis);
		druidDs.setMinEvictableIdleTimeMillis(minEvictableIdleTimeMillis);
		druidDs.setValidationQuery(validationQuery);
		druidDs.setTestWhileIdle(testWhileIdle);
		druidDs.setTestOnBorrow(testOnBorrow);
		druidDs.setTestOnReturn(testOnReturn);
		druidDs.setPoolPreparedStatements(poolPreparedStatements);
		druidDs.setMaxPoolPreparedStatementPerConnectionSize(maxPoolPreparedStatementPerConnectionSize);
		return druidDs;
	}
//	@Bean
//	@InitBinder
	public DruidDataSource slaveDataSource(){
		DruidDataSource druidDs = new DruidDataSource();
		druidDs.setDriverClassName(driverClass2);
		druidDs.setUrl(jdbcUrl2);
		druidDs.setUsername(username2);
		druidDs.setPassword(password2);
		druidDs.setInitialSize(initialSize);
		druidDs.setMinIdle(minIdle);
		druidDs.setMaxActive(maxActive);
		druidDs.setMaxWait(maxWaitMillis);
		druidDs.setTimeBetweenEvictionRunsMillis(timeBetweenEvictionRunsMillis);
		druidDs.setMinEvictableIdleTimeMillis(minEvictableIdleTimeMillis);
		druidDs.setValidationQuery(validationQuery);
		druidDs.setTestWhileIdle(testWhileIdle);
		druidDs.setTestOnBorrow(testOnBorrow);
		druidDs.setTestOnReturn(testOnReturn);
		druidDs.setPoolPreparedStatements(poolPreparedStatements);
		druidDs.setMaxPoolPreparedStatementPerConnectionSize(maxPoolPreparedStatementPerConnectionSize);
		return druidDs;
	}
	@Bean
	public DynamicDataSource dynamicDataSource(){
		DynamicDataSource dynamicDataSource = new DynamicDataSource();
		dynamicDataSource.setDefaultTargetDataSource(masterDataSource());
		Map<Object,Object> dsMap = new HashMap<Object,Object>();
		dsMap.put("master", masterDataSource());
		dsMap.put("slave", slaveDataSource());
		dynamicDataSource.setTargetDataSources(dsMap);
		return dynamicDataSource;
	}
	
	@PostConstruct
	private void init() throws SQLException{
		masterDataSource().init();
		slaveDataSource().init();
	}
	
	@PreDestroy
	private void destroy(){
		masterDataSource().close();
		slaveDataSource().close();
	}
	
}
