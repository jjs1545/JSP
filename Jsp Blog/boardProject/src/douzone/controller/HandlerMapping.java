package douzone.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class HandlerMapping {
	private Map<String, Controller> mappings = null;
	
	public HandlerMapping() {
		this("C:/Users/bit34/workspace/boardProject/bean.properties");
	}
	

	public HandlerMapping(String configName) {
		mappings = new HashMap<String, Controller>();
		
		Properties prop = new Properties();
		
		try {
			InputStream inputStream = new FileInputStream(configName);
			prop.load(inputStream);
			
			Set<Object> keys = prop.keySet();
			
			for(Object key : keys) {
				String className = prop.getProperty(key.toString());	//value
				
				Class<?> clz = Class.forName(className);
				
				mappings.put(key.toString(), (Controller)clz.newInstance());
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Controller getController(String uri) {
		return mappings.get(uri);
	}
}









