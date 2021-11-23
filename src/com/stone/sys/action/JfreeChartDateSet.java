package com.stone.sys.action;

import org.jfree.data.category.DefaultCategoryDataset;

public class JfreeChartDateSet{

	/*//气密性试验图
	public static DefaultCategoryDataset qmxChart(String id,TYlrqQmx qmx,String t1,String t2,String t3,String t4,String p1,String p2,String p3,String p4){
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();

		if("0".equals(id)){
			// 创建线图
			dataset.setValue(Double.parseDouble("0"), "曲线", "0");
			if(!"".equals(p1) && null != p1){
				 dataset.setValue(Double.parseDouble(p1), "曲线", t1);
			}
			if(!"".equals(p2) && null != p2){
				 dataset.setValue(Double.parseDouble(p2), "曲线", t2);
			}
			if(!"".equals(p3) && null != p3){
				 dataset.setValue(Double.parseDouble(p3), "曲线", t3);
			}
			if(!"".equals(p4) && null != p4){
				 dataset.setValue(Double.parseDouble(p4), "曲线", t4);
			}
		}else{
			// 创建线图
			  dataset.setValue(Double.parseDouble("0"), "曲线", "0");
			  if(!"".equals(qmx.getP1()) && null != qmx.getP1()){
				  dataset.setValue(Double.parseDouble(qmx.getP1()), "曲线", qmx.getT1());
			  }
			  if(!"".equals(qmx.getP2()) && null != qmx.getP2()){
				  dataset.setValue(Double.parseDouble(qmx.getP2()), "曲线", qmx.getT2());
			  }
			  if(!"".equals(qmx.getP3()) && null != qmx.getP3()){
				  dataset.setValue(Double.parseDouble(qmx.getP3()), "曲线", qmx.getT3());
			  }
			  if(!"".equals(qmx.getP4()) && null != qmx.getP4()){
				  dataset.setValue(Double.parseDouble(qmx.getP4()), "曲线", qmx.getT4());
			  }
		}
		return dataset;
	}

	//耐压试验图
	public static DefaultCategoryDataset nysyChart(String id,TYlrqNysy nysy,String t1,String t2,String t3,String t4,String t5,String t6,String p1,String p2,String p3,String p4,String p5,String p6){
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();

		if("0".equals(id)){
			// 创建线图
			  dataset.setValue(Double.parseDouble("0"), "曲线", "0");
			  if(!"".equals(p1) && null != p1){
				  dataset.setValue(Double.parseDouble(p1), "曲线", t1);
			  }
			  if(!"".equals(p2) && null != p2){
				  dataset.setValue(Double.parseDouble(p2), "曲线", t2);
			  }
			  if(!"".equals(p3) && null != p3){
				  dataset.setValue(Double.parseDouble(p3), "曲线", t3);
			  }
			  if(!"".equals(p4) && null != p4){
				  dataset.setValue(Double.parseDouble(p4), "曲线", t4);
			  }
			  if(!"".equals(p5) && null != p5){
				  dataset.setValue(Double.parseDouble(p5), "曲线", t5);
			  }
			  if(!"".equals(p6) && null != p6){
				  dataset.setValue(Double.parseDouble(p6), "曲线", t6);
			  }
		}else{
			// 创建线图
			  dataset.setValue(Double.parseDouble("0"), "曲线", "0");
			  if(!"".equals(nysy.getP1()) && null != nysy.getP1()){
				  dataset.setValue(Double.parseDouble(nysy.getP1()), "曲线", nysy.getT1());
			  }
			  if(!"".equals(nysy.getP2()) && null != nysy.getP2()){
				  dataset.setValue(Double.parseDouble(nysy.getP2()), "曲线", nysy.getT2());
			  }
			  if(!"".equals(nysy.getP3()) && null != nysy.getP3()){
				  dataset.setValue(Double.parseDouble(nysy.getP3()), "曲线", nysy.getT3());
			  }
			  if(!"".equals(nysy.getP4()) && null != nysy.getP4()){
				  dataset.setValue(Double.parseDouble(nysy.getP4()), "曲线", nysy.getT4());
			  }
			  if(!"".equals(nysy.getP5()) && null != nysy.getP5()){
				  dataset.setValue(Double.parseDouble(nysy.getP5()), "曲线", nysy.getT5());
			  }
			  if(!"".equals(nysy.getP6()) && null != nysy.getP6()){
				  dataset.setValue(Double.parseDouble(nysy.getP6()), "曲线", nysy.getT6());
			  }
		}
		return dataset;
	}*/
	//气密性试验图
	public static DefaultCategoryDataset qmxChartYsjl(String id,String t1,String t2,String t3,String t4,String p1,String p2,String p3,String p4){
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();

		if("0".equals(id)){
			// 创建线图
			dataset.setValue(Double.parseDouble("0"), "曲线", "0");
			if(!"".equals(p1) && null != p1){
				 dataset.setValue(Double.parseDouble(p1), "曲线", t1);
			}
			if(!"".equals(p2) && null != p2){
				 dataset.setValue(Double.parseDouble(p2), "曲线", t2);
			}
			if(!"".equals(p3) && null != p3){
				 dataset.setValue(Double.parseDouble(p3), "曲线", t3);
			}
			if(!"".equals(p4) && null != p4){
				 dataset.setValue(Double.parseDouble(p4), "曲线", t4);
			}
		}else{
			
		}
		return dataset;
	}

	//耐压试验图
	public static DefaultCategoryDataset nysyChartYsjl(String id,String t1,String t2,String t3,String t4,String t5,String t6,String p1,String p2,String p3,String p4,String p5,String p6){
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();

		if("0".equals(id)){
			// 创建线图
			  dataset.setValue(Double.parseDouble("0"), "曲线", "0");
			  if(!"".equals(p1) && null != p1){
				  dataset.setValue(Double.parseDouble(p1), "曲线", t1);
			  }
			  if(!"".equals(p2) && null != p2){
				  dataset.setValue(Double.parseDouble(p2), "曲线", t2);
			  }
			  if(!"".equals(p3) && null != p3){
				  dataset.setValue(Double.parseDouble(p3), "曲线", t3);
			  }
			  if(!"".equals(p4) && null != p4){
				  dataset.setValue(Double.parseDouble(p4), "曲线", t4);
			  }
			  if(!"".equals(p5) && null != p5){
				  dataset.setValue(Double.parseDouble(p5), "曲线", t5);
			  }
			  if(!"".equals(p6) && null != p6){
				  dataset.setValue(Double.parseDouble(p6), "曲线", t6);
			  }
		}else{
			
		}
		return dataset;
	}
}
