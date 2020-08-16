* Description: remove the spaces in the parentheses when there is only one word in the parentheses
* Author: Meiting Wang, doctor, Institute for Economic and Social Research, Jinan University
* Email: wangmeiting92@gmail.com
* Created on Aug 1, 2020

program define space_rm, rclass
version 16
syntax anything(id="string containing parentheses")
/*
*-实例
space_rm n mean(   price   ) sd(   mpg   ) min(price  ) max(  trunk)
space_rm (   price   ) sd(   mpg   ) min(price  ) max(  trunk)
space_rm (   price   )(   mpg   ) min(price  ) max(  trunk)
ret list

*-注意事项
0. 程序的目的在于：在括号里只有一个“单词”时，去除括号里的空格
1. 括号内仅能有且仅有一个“单词”
2. 括号一定要配对出现，否则会出错——如"mean(price)"是正确的，而"mean(price("是错误的
3. 输入的字符只能包括空格、字母、数字、下划线、圆括号
4. 该程序会去除括号内的空格，同时也会将括号外的长空格(连续的多个空格)压缩为单个空格
*/

*程序不合规时的报错
if ~ustrregexm(`"`anything'"',"^(\s|\w|\(|\))+$") {
	di "{error:wrong strings}"
	exit
}

*主程序
local anything = ustrregexra("`anything'","\s+","+") //将空格转换为单一加号

tokenize `anything', p("()")
local out_str "" //最后要输出的字符串
local i = 1
while "``i''" != "" {
	if "``=`i'-1''" == "(" {
		local `i' = ustrregexra("``i''","\+","")
	}
	local out_str "`out_str'``i++''"
}
local out_str = ustrregexra("`out_str'","\+"," ")

*结果输出
di "{result:`out_str'}"

*返回值
return local out_str "`out_str'"
end