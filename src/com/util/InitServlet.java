package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServlet;

import org.springframework.stereotype.Repository;

import com.spring.entity.WebLinktype;

@Repository
public class InitServlet extends HttpServlet implements Servlet{

	private static final long serialVersionUID = 1L;
	
	public static Map<Integer,LinkedList<WebLinktype>> webLinkTypeMap = new HashMap<Integer, LinkedList<WebLinktype>>();
	
	public static Set<Integer> changeList = new HashSet<Integer>();

	public void init(ServletConfig servletConfig){
		String realPath = servletConfig.getServletContext().getRealPath("")+"/";
		Constant.REALPATH = realPath;
		/** 初始化配置文件 */
		new Init().init(realPath);
		try {
			initWebLinkData();
			final String navDBPath = Constant.REALPATH + "/db/nav";
			ScheduledExecutorService schedulePool = Executors.newScheduledThreadPool(1);
			schedulePool.scheduleAtFixedRate(new Runnable() {   
	             @Override   
	             public void run() {
	            	 if(changeList != null && changeList.size() > 0){
	            		 for(Integer id : changeList){
	            			 LinkedList<WebLinktype> linkedListType = webLinkTypeMap.get(id);
	            			 ObjectOutputStream os = null;
	            			 try {
								os = new ObjectOutputStream(new FileOutputStream(new File(navDBPath + "/" + id)));
								os.writeObject(linkedListType);
							} catch (FileNotFoundException e) {
								e.printStackTrace();
							} catch (IOException e) {
								e.printStackTrace();
							} finally{
								try {
									os.close();
								} catch (IOException e) {
									e.printStackTrace();
								}
							}
	            			Log.Info("用户" + id + "导航有改动，变更完毕。");
	            			changeList.remove(id);
	            		 }
	            	 }
	             }
	         }, 1, 1, TimeUnit.MINUTES);  
		} catch (FileNotFoundException e) {
			Log.Error(e);
		} catch (ClassNotFoundException e) {
			Log.Error(e);
		}
	}
	
	public void initWebLinkData() throws FileNotFoundException, ClassNotFoundException{
		String navDBPath = Constant.REALPATH + "/db/nav";
		File dbFile = new File(navDBPath);
		if(dbFile.exists()){
			File[] fileList = dbFile.listFiles();
			if(fileList != null && fileList.length > 0){
				for(File file : fileList){
					ObjectInputStream oi = null;
					try {
						oi = new ObjectInputStream(new FileInputStream(file));
						@SuppressWarnings("unchecked")
						LinkedList<WebLinktype> linkedListType = (LinkedList<WebLinktype>) oi.readObject();
						webLinkTypeMap.put(Integer.parseInt(file.getName()), linkedListType);
					} catch (IOException e) {
						Log.Error(e);
					} finally{
						try {
							oi.close();
						} catch (IOException e) {
							Log.Error(e);
						}
					}
					
				}
			}
		}
		Log.Info("初始化导航完成。");
	}
	
}
