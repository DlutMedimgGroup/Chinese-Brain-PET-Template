function ary_range = aver_in_percentile_range(ary, percent_low, percent_high)
% �Ҷȹ�һ�� matlab ��
% 2020/12/04 ����

ary(ary==0)=[];
low_value=prctile(ary, percent_low);
high_value=prctile(ary, percent_high);
ary_range=ary(find(ary > low_value & ary < high_value));
% ary_range = ary;
end