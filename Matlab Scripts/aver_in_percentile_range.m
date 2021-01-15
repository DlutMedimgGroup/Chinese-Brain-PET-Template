function ary_range = aver_in_percentile_range(ary, percent_low, percent_high)
% »Ò¶È¹éÒ»»¯ matlab °æ
% 2020/12/04 ÌïÑô

ary(ary==0)=[];
low_value=prctile(ary, percent_low);
high_value=prctile(ary, percent_high);
ary_range=ary(find(ary > low_value & ary < high_value));
% ary_range = ary;
end