package com.che.rw.aspect;

import java.lang.reflect.Method;
import java.util.List;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import com.che.rw.annotation.Master;
import com.che.rw.annotation.Slave;
import com.che.rw.datasource.DynamicDataSourceHolder;
/**

 * 
 * @author Administrator
 *
 */
public class DataSourceAspect {

	private List<String> slaveList;

	private boolean logEnable = false;

	public void before(JoinPoint point) {
		try {
			Object target = point.getTarget();
			String method = point.getSignature().getName();
			// Class<?>[] clazz = target.getClass().getInterfaces();
			Class<?> clazz = target.getClass();
			Class<?>[] parameterTypes = ((MethodSignature) point.getSignature()).getMethod().getParameterTypes();
			Method m = clazz.getMethod(method, parameterTypes);
			if (m == null)
				return;
			String dataSourceName = "master";
			// if (!m.isAnnotationPresent(Master.class) &&
			// m.isAnnotationPresent(Select.class)) {
			// dataSourceName = "slave";
			// }
			if (m.isAnnotationPresent(Master.class)) {
				dataSourceName = "master";
			} else if (m.isAnnotationPresent(Slave.class)) {
				dataSourceName = "slave";
			} else {
				if (slaveList != null && !slaveList.isEmpty()) {
					String mName = m.getName();
					for (String start : slaveList) {
						if (mName.startsWith(start)) {
							dataSourceName = "slave";
							break;
						}
					}
				}
			}
			DynamicDataSourceHolder.putDataSource(dataSourceName);
			if (logEnable)
				System.out.println(dataSourceName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setSlaveList(List<String> slaveList) {
		this.slaveList = slaveList;
	}

	public void setLogEnable(boolean logEnable) {
		this.logEnable = logEnable;
	}

}
