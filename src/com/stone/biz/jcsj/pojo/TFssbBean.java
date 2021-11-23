package com.stone.biz.jcsj.pojo;

import java.io.Serializable;

/**为方便填写检验项目，特增加此辅助类
 * @author Administrator
 *
 */
public class TFssbBean{
	/**
	 * 名称
	 */
	private String[] mingcheng;
	/**
	 * 型号
	 */
	private String[] xinghao;
	/**
	 * 规格
	 */
	private String[] guige;
	/**
	 * 数量
	 */
	private String[] shuliang;
	/**
	 * 制造厂家
	 */
	private String[] zhizaochangjia;
	
	
	public String[] getMingcheng() {
		return mingcheng;
	}
	public void setMingcheng(String[] mingcheng) {
		this.mingcheng = mingcheng;
	}
	public String[] getXinghao() {
		return xinghao;
	}
	public void setXinghao(String[] xinghao) {
		this.xinghao = xinghao;
	}
	public String[] getGuige() {
		return guige;
	}
	public void setGuige(String[] guige) {
		this.guige = guige;
	}
	public String[] getShuliang() {
		return shuliang;
	}
	public void setShuliang(String[] shuliang) {
		this.shuliang = shuliang;
	}
	public String[] getZhizaochangjia() {
		return zhizaochangjia;
	}
	public void setZhizaochangjia(String[] zhizaochangjia) {
		this.zhizaochangjia = zhizaochangjia;
	}
	
}
