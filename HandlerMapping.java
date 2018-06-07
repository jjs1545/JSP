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
		this("C:/Users/BIT/Desktop/JX376/web-workspace/mvc_web_2/bean.properties");
	}
	
	public HandlerMapping(String configName) {
		mappings = new HashMap<String, Controller>();
		
		Properties prop = new Properties();
		
		try {
			InputStream inputStream = new FileInputStream(configName);
			prop.load(inputStream);
			
			Set<Object> keys = prop.keySet();
			
			for(Object key : keys) {
				String className = prop.getProperty(key.toString());
				// key는 Object형이기 때문에 toString()으로 문자열 받도록!
				
				Class<?> clz = Class.forName(className);
				// <?> 제네릭 와일드카드, 모든 것을 받겠다.
				
				mappings.put(key.toString(), (Controller)clz.newInstance());
				// newInstance() 받아온 class를 인스턴스화 해라.
				//douzone.controller.LoginController obj
				//	= new douzone.controller.LoginController();
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Controller getController(String uri) {
		return mappings.get(uri);
	}
}









