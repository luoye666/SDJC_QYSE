/*
 *  StringUtils.java
 *  
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *  
 *  Author: Winter Lau (javayou@gmail.com)
 *  http://dlog4j.sourceforge.net
 */
package com.stone.support.utils;




/**
 * 字符串获取汉字首字母
 * 
 * @author Winter Lau
 */
public class  QuickSort {

		/**
		 * 快速排序
		 * 
		 * @param strDate
		 * @param left
		 * @param right
		 */
		public static void quickSort(Integer[] strDate,int left,int right){
			Integer middle,tempDate;
		int i,j;
		i=left;
		j=right;
		middle=strDate[(i+j)/2];
		do{
		while((strDate[i]<middle)&& i<right)
		i++; // 找出左边比中间值大的数
		while((strDate[j]>middle)&& j>left)
		j--; // 找出右边比中间值小的数
		if(i<=j){ // 将左边大的数和右边小的数进行替换
			tempDate=strDate[i];
			strDate[i]=strDate[j];
			strDate[j]=tempDate;
		i++;
		j--;
		}
		}while(i<=j); // 当两者交错时停止

		if(i<right){
			quickSort(strDate,i,right);// 从
		}
		if(j>left){
		quickSort(strDate,left,j);
		}

		}

}