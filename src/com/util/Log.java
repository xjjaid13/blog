package com.util;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

/** log4j日志类 */
public class Log {
	
	private static Logger logger = Logger.getRootLogger();
	
	public static Logger getLogger(){
		return logger;
	}
	
	/** 设置日志等级 */
	public static void configLevel(Level level){
		Log.getLogger().setLevel(level);
	}
	
	/** 记录错误日志 */
	public static void Error(String errorinfo){
		Log.getLogger().error(TimeHandle.currentTime() + " : " + errorinfo);
	}
	
	public static void Error(String errorinfo,Throwable e){
		Log.getLogger().error(TimeHandle.currentTime() + " : " + errorinfo,e);
	}
	
	public static void Error(Throwable e){
		Log.getLogger().error(TimeHandle.currentTime() ,e);
	}
	
	
	/** 记录debug日志 */
	public static void Debug(String debuginfo){
		Log.getLogger().debug(debuginfo);
	}
	
	/** 记录info日志 */
	public static void Info(String info){
		Log.getLogger().info(info);
	}
	

}
