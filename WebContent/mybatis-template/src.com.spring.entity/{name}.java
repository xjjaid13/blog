package com.spring.entity;

public class {TableName} extends BaseEntity{
	{for}
	private {type} {columnname};
	{endfor}
	{for}
	public {type} get{Columnname}() {
		return {columnname};
	}
	{endfor}
	{for}
	public void set{Columnname}({type} {columnname}) {
		this.{columnname} = {columnname};
	}
	{endfor}
	public String toString(){
		return "{TableName}";
	}
}
