package com.che.config.db;

import java.util.Properties;

import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.github.pagehelper.PageHelper;

/**
 * @author karlhell
 *
 */
@Configuration
@EnableTransactionManagement
@MapperScan(basePackages="com.che.**.mapper",sqlSessionFactoryRef="sqlSessionFactory")
public class MybatisConfig {
	
	@Autowired
	private DataSourceConfig dsConfig;

	@Bean(name="sqlSessionFactory")
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
	    //sessionFactory.setDataSource(dsConfig.masterDataSource());
		sessionFactory.setDataSource(dsConfig.masterDataSource());
	    //增加分页插件
	    PageHelper pageHelper = new PageHelper();
        Properties properties = new Properties();
        properties.put("dialect", "mysql");
        properties.put("reasonable", true);
        properties.put("rowBoundsWithCount", false);
        properties.put("offsetAsPageNum", false);
        properties.put("rowBoundsWithCount", true);
        properties.put("pageSizeZero", true);
        properties.put("reasonable",false);
        pageHelper.setProperties(properties);
        sessionFactory.setPlugins(new Interceptor[]{pageHelper});
	    return sessionFactory.getObject();
	}
 
	@Bean
	public PlatformTransactionManager transactionManager() {
	    return new DataSourceTransactionManager(dsConfig.dynamicDataSource());//masterDataSource
	}
	
}
