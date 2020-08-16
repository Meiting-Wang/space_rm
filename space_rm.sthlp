{smcl}
{right:Updated time: Aug 15, 2020}
{* -----------------------------title------------------------------------ *}{...}
{p 0 18 2}
{bf:[W-8] space_rm} {hline 2} remove the spaces in the parentheses when there is only one word in the parentheses. The source code can be gained in {browse "https://github.com/Meiting-Wang/space_rm":github}.


{* -----------------------------Syntax------------------------------------ *}{...}
{title:Syntax}

{p 8 8 2}
{cmd:space_rm} {it:{help strings}}


{* -----------------------------Contents------------------------------------ *}{...}
{title:Contents}

{p 4 4 2}
{help space_rm##Description:Description}{break}
{help space_rm##Examples:Examples}{break}
{help space_rm##Author:Author}{break}
{help space_rm##Also_see:Also see}{break}


{* -----------------------------Description------------------------------------ *}{...}
{marker Description}{title:Description}

{p 4 4 2}
{bf:space_rm}, a small program for processing strings, can remove the spaces in the parentheses when there is only one word in the parentheses, and the result can also be gained in {bf:r()} for programming later. It is worth noting that this command can only be used in version 16 or later.

{p 4 4 2}
If you want to perform unique, ascending or descending processing on strings, then {help wmtstr} may be what you want.


{* -----------------------------Examples------------------------------------ *}{...}
{marker Examples}{title:Examples}

{p 4 4 2}. {stata space_rm n mean(   price   ) sd(   mpg   ) min(price  ) max(  trunk)}{p_end}

{p 4 4 2}. {stata space_rm (   price   ) sd(   mpg   ) min(price  ) max(  trunk)}{p_end}

{p 4 4 2}. {stata space_rm (   price   )(   mpg   ) min(price  ) max(  trunk)}{p_end}

{p 4 4 2}. {stata space_rm sd(   mpg   ) min(price  ) max(  trunk)}{p_end}

{p 4 4 2}. {stata return list}{p_end}


{* -----------------------------Author------------------------------------ *}{...}
{marker Author}{title:Author}

{p 4 4 2}
Meiting Wang{break}
Institute for Economic and Social Research, Jinan University{break}
Guangzhou, China{break}
wangmeiting92@gmail.com


{* -----------------------------Also see------------------------------------ *}{...}
{marker Also_see}{title:Also see}

{space 4}{help wmtstr}(already installed)  {col 40}{stata github install Meiting-Wang/wmtstr:install wmtstr}(to install)

