package com.stone.support.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jxl.CellType;
import jxl.Sheet;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableCell;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;


/**
 * 
 */
public class ExeclUtil {

	/**
	 * 输入流对象
	 */
	private InputStream is;

	/**
	 * 创建Workbook对象
	 */
	private Workbook rwb;

	private int columns;

	private int rows;

	/**
	 * 读取模版文件形成输入流对象。
	 * 
	 * @param sheetname
	 *            路径及文件名称
	 */
	private void readExcel(String sheetname) {
		try {

			// 创建Workbook对象 只读Workbook对象
			// 直接从本地文件创建Workbook
			// 从输入流创建Workbook
			is = new FileInputStream(sheetname);
			rwb = Workbook.getWorkbook(is);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void closeIs() {
		try {
			this.is.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 读取模版文件加入数据形成报表文件。
	 * 
	 * @param path 路径及文件名称
	 * @param list 数据列表 数据格式 List
	 */
	@SuppressWarnings("unchecked")
	private void createNewExcel(String sheetname, List list) {
		try {

			// 利用已经创建的Excel工作薄创建新的可写入的Excel工作薄
			WritableWorkbook wwb = Workbook.createWorkbook(new File(sheetname), rwb);
			// 读取第一个sheet工作表
			WritableSheet ws = wwb.getSheet(0);

			// 读取取单元格对象
			WritableCell wc;

			// 读取所有单元格的对象引用
			for (int i = 0; i < this.rows; i++) {
				for (int j = 0; j < this.columns; j++) {
					wc = ws.getWritableCell(j, i);
					if (wc.getType() == CellType.LABEL) {
						Label lable = (Label) wc;

						// 替换数据
						if (isContex(lable.getString())) {
							int count = list.size();
							if (count > getIndex(lable.getString())) {
								lable.setString((String) list
										.get(getIndex(lable.getString())));
								// System.out.println("isString");
							} else// wangtao add
							{
								lable.setString("");
							}
						}
					}
				}
			}

			// 写入Excel对象
			wwb.write();
			wwb.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 通过模版创建新Excel。
	 * 
	 * @param sheetnameM 模版路径及文件名称
	 * @param sheetnameO 生成模版的名称包括路径
	 * @param list 数据列表 数据格式 List
	 */
	@SuppressWarnings("unchecked")
	public void createExcel(final String sheetnameM, final String sheetnameO,
			final List list, final HttpServletRequest request) {
		
		try {

			String fileFullPathM = request.getSession().getServletContext().getRealPath("Excels\\Modul")+ "\\" + sheetnameM + ".xls";

			String fileFullPathO = request.getSession().getServletContext().getRealPath("Excels\\Output")+ "\\" + sheetnameO + ".xls";

			// 读取模版文件形成输入流对象。
			if (this.is == null) {
				readExcel(fileFullPathM);
			}

			// Sheet(表单：工作表)就是Excel表格左下角的Sheet1,Sheet2,Sheet3但在程序中
			// Sheet的下标是从0开始的
			// 读取第一个Sheet表
			Sheet rs = rwb.getSheet(0);

			// 读取Sheet表中所包含的总列数
			int rsColumns = rs.getColumns();

			// 读取Sheet表中所包含的总行数
			int rsRows = rs.getRows();

			rows = rsRows;
			columns = rsColumns;

			// 生成新表
			createNewExcel(fileFullPathO, list);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeIs();
		}
	}
	
	/**
	 * 读取模版文件加入数据形成报表文件。
	 * 
	 * @param path 路径及文件名称
	 * @param list 数据列表 数组
	 */
	private void createNewExcel(String sheetname, String[][] list, int startrow, int startcol) {
		try {

			// 利用已经创建的Excel工作薄创建新的可写入的Excel工作薄
			WritableWorkbook wwb = Workbook.createWorkbook(new File(sheetname), rwb);
			// 读取第一个sheet工作表
			WritableSheet ws = wwb.getSheet(0);

			// 读取取单元格对象
			WritableCell wc;

			// 读取所有单元格的对象引用
			for (int i = startrow; i < list.length + startrow; i++) {
				for (int j = startcol; j < 26; j++) {
					wc = ws.getWritableCell(j, i);
					if (wc.getType() == CellType.LABEL) {
						Label lable = (Label) wc;

						lable.setString(list[i][j]);
						
					}
				}
			}

			// 写入Excel对象
			wwb.write();
			wwb.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 通过模版创建新Excel。
	 * 
	 * @param sheetnameM 模版路径及文件名称
	 * @param sheetnameO 生成模版的名称包括路径
	 * @param list 数据列表 数据格式 数组
	 */
	public void createExcel(final String sheetnameM, final String sheetnameO,
			final String[][] list, final HttpServletRequest request, int startrow, int startcol) {
		
		try {

			String fileFullPathM = request.getSession().getServletContext().getRealPath("Excels\\Modul")+ "\\" + sheetnameM + ".xls";

			String fileFullPathO = request.getSession().getServletContext().getRealPath("Excels\\Output")+ "\\" + sheetnameO + ".xls";

			// 读取模版文件形成输入流对象。
			if (this.is == null) {
				readExcel(fileFullPathM);
			}

			// Sheet(表单：工作表)就是Excel表格左下角的Sheet1,Sheet2,Sheet3但在程序中
			// Sheet的下标是从0开始的
			// 读取第一个Sheet表
			Sheet rs = rwb.getSheet(0);

			// 读取Sheet表中所包含的总列数
			int rsColumns = rs.getColumns();

			// 读取Sheet表中所包含的总行数
			int rsRows = rs.getRows();

			rows = rsRows;
			columns = rsColumns;

			// 生成新表
			createNewExcel(fileFullPathO, list, startrow, startcol);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeIs();
		}
	}

	// /////////////////////////////
	@SuppressWarnings("unused")
	private void modiStrCell(WritableSheet dataSheet, int col, int row,
			String str) throws RowsExceededException, WriteException {
		// 获得单元格对象
		WritableCell cell = dataSheet.getWritableCell(col, row);
		// 判断单元格的类型, 做出相应的转化
		if (cell.getType() == CellType.EMPTY) {
			Label lbl = new Label(col, row, str);
			dataSheet.addCell(lbl);
		} else if (cell.getType() == CellType.LABEL) {
			Label lbl = (Label) cell;
			lbl.setString(str);
		} else if (cell.getType() == CellType.NUMBER) {
			// 数字单元格修改
			Number n1 = (Number) cell;
			n1.setValue(42.05);
		}
	}

	/**
	 * 得到需要替换字段的索引
	 * 
	 * @param str
	 * @return
	 */
	private int getIndex(String str) {
		// 初始化返回值
		int index = 0;

		if (isContex(str)) {
			index = Integer.valueOf(str.substring(str.indexOf("<%") + 2, str
					.indexOf("%>")));
		}
		return index;
	}

	/**
	 * 判断是否是需要替换的字段
	 * 
	 * @param str
	 * @return
	 */
	private boolean isContex(String str) {
		boolean bn = false;
		if (str.indexOf("<%") != -1 && str.indexOf("%>") != -1) {
			bn = true;
		}
		return bn;
	}

	@SuppressWarnings("unused")
	private String addData(Double data) {

		if (data == null) {
			return "";
		} else {
			return String.valueOf(data);
		}
	}

	// ////////////////////////////////////////////////////////////////

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// String sheetnameM = "Book1";
		// String sheetnameO = "Book88";
		// List list = new ArrayList();
		//		
		// list.add("Cai!!!!!!!");
		// list.add("758949");
		// list.add("wwwwHahahaha!!!!");
		//		
		// ExeclUtil execlUtil = new ExeclUtil();
		// System.out.println("begin!");
		// execlUtil.createExcel(sheetnameM,sheetnameO,list);
		// System.out.println("end!");
	}

}
