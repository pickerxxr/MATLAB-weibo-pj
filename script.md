# MATLAB 微博数据分析论文

## 摘要





## 读取数据文件

> 以导入广州的数据文件为例

```matlab
%% Guangzhou
filename = '.\Guangzhou.csv';
delimiter = ',';
startRow = 2;
formatSpec = '%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
Guangzhou = table(dataArray{1:end-1}, 'VariableNames', {'author','source','forward_num','comment_num','likes_num','month','day','hour','is_original','forward_link_length','original_word_num','content_word_num','forward_word_num','sentiment','emoji_num','tag_num','mention_num','is_located','link_num','topic_num'});
clearvars filename delimiter startRow formatSpec fileID dataArray ans;
```

> 运行结果如下

```matlab
%%
>> who

您的变量为:

Guangzhou  Hangzhou   Kunming  

%%
>> class(Guangzhou)

ans =

    'table'
```

- 这里一个实现过程中发现的问题是用户的id是一个六位的序列号，而不是数值型的元素，所以不能直接用`csvread(filename);`命令（只能读入数据类型一致的csv文件），如果序列号出现开头为0的项，会出现格式改变的问题，所以尝试了采用`textscan(fileID);`的命令，而把第一项当成`%s`来看。



## 一些基本统计量的分析

### 用户发送微博条数

1、首先是对于第一个用户名ID`author`变量的统计，通过对于三个城市发送微博数量的统计，找出post的数目分布情况。其中以30条微博为分界线，通过简单的`histogram()`命令画出两个统计量的分布。这里取到30为分解的首要原因是，数据采样采取的是一个月($\approx30$)内的用户数据，而可以依据经验认为30以上的可以看作非常活跃的用户(平均每天发一条以上)，而30以下的相对没那么活跃；另外，通过所有数据的分布图可以看出，数据太过于集中于0~2附近，使得在高数量区域的分布无法显示，所以对于30以上的数据另作处理。

|           | Distribution of all post data ($\times10^3$)                 | Distribution of more than 30                                 | Distribution of less than 30                                 |
| --------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Guangzhou | ![all_distribution_gz](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\all_distribution_gz.jpg) | ![distribution_gz](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\distribution_gz.jpg) | ![distribution_gz_2](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\distribution_gz_2.jpg) |
| Hangzhou  | ![all_distribution_hz](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\all_distribution_hz.jpg) | ![distribution_hz](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\distribution_hz.jpg) | ![distribution_hz2](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\distribution_hz2.jpg) |
| Kunming   | ![all_distribution_km](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\all_distribution_km.jpg) | ![distribution_km](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\distribution_km.jpg) | ![distribution_km_2](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\distribution_km_2.jpg) |

- 从图表中可以很明显看到大多数用户这一个月内大多数集中在1, 2条微博的区间，而在200条以上的就接近于0了。



2. 另外，对每个城市发表次数最多的用户ID挑出，因为观察到发表最大的次数高达四位数，且收集数据都是整点附近收集，平均一天（整点）的发帖数甚至上百，让我对这种用户的行为产生了好奇，初步**猜测可能是新闻的官方号或者是僵尸流量粉**，所以将其用户ID挑出，在后续进行进一步账号分析，如果必要可能再尝试挑选发表的前几位进行分析。

   ```matlab
   %% Guangzhou
   >> {gz_post_max_id; gz_post_max}
   
   ans =
   
     2×1 cell 数组
   
       {'523187'}
       {[  4423]}
       
   %% Hangzhou
   >> {hz_post_max_id; hz_post_max}
   
   ans =
   
     2×1 cell 数组
   
       {'428875'}
       {[  9685]}
   %% Kunming
   >> {km_post_max_id; km_post_max}
   
   ans =
   
     2×1 cell 数组
   
       {'024326'}
       {[  1904]}
   ```




### 用户发表微博的平台分布

- 针对平台的第二项统计量，进行对于发布来源的统计分析。

- 首先统计0-200出现的次数，再进行饼图的绘制。这里需要处理的问题是，200个平台来绘制份额的饼图对于数据的查看便捷性和对比度都不会太好，因为200个切片对于数据标注来说太密集了，而且很大一部分都是很小的值，观测十分不方便，所以我将所有来源分为十个，其中九个为来源最多的平台，外加一个”其他“变量。而我采取将代码耦合性尽量降低的方式，使得三个地区的实现代码几乎相同。

> 广州地区的一个例子
>
> ```matlab
> %% Import the data and select the device column
> 
> % Select the rows whose id is NOT NULL
> rows_gz = Guangzhou.author ~= "NULL";
> rows_hz = Hangzhou.author ~= "NULL";
> rows_km = Kunming.author ~= "NULL";
> 
> % Put the device(source) column into a string vec
> user_source_guangzhou = Guangzhou{rows_gz, "source"};
> user_source_hangzhou= Hangzhou{rows_hz, "source"};
> user_source_kunming = Kunming{rows_km, "source"};
> 
> device_times = zeros(201, 1);
> for i = 1: length(user_source_guangzhou)
>     tmp = user_source_guangzhou(i);
>    device_times(tmp + 1) = device_times(tmp + 1) + 1;
> end
> 
> [B_gz, I_gz] = maxk(device_times, 10);
> 
> other_device_gz = sum(device_times) - sum(B_gz);
> B_gz(2) = B_gz(2) + other_device_gz;
> 
> % Impoert source.csv by the function in the path.
> % The imported array name is device_name
> device_name = import_device_name();
> 
> % give the diffenrent part a legend
> device_name_array = table2array(device_name);
> legend_name_tmp = strings(1, 10);
> for i = 1: 10
>     name_tmp = I_gz(i);
>     legend_name_tmp(i) = device_name_array(name_tmp);
> end
> 
> % draw the graph to show devices parts
> figure
> explode = [0 1 0 0 0 0 0 0 0 0];
> pie3(B_gz, explode);
> p = pie3(B_gz, explode);
> legend(legend_name_tmp, 'Location','southoutside','Orientation','horizontal')
> title("post devices")
> % Set the property of the pie graph
> for i = 1: 10
>     t = p(i);
>     t.FontSize = 8;
> end
> ```



| City      | Source Pie Graph                                             |
| --------- | ------------------------------------------------------------ |
| Guangzhou | ![device_gz](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\device_gz.jpg) |
| Hangzhou  | ![device_hz](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\device_hz.jpg) |
| Kunming   | ![device_km](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\device_km.jpg) |

### 是否原创和是否有位置的比例分布

> 实现方法：分别统计两个数组中0和1的个数，加和之后直接用饼图绘制

<img src="C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\locate_and_original.jpg" alt="locate_and_original" style="zoom:150%;" />

- 画法很简单，是否原创基本是持平的，非原创的更多一些。值得注意的是广州的标注位置的微博很少，考虑到数据抽取的时间大概在春节放假期间，而且正是疫情爆发的关键时期，广州基本只有本地人，而这一部分群体相对不会倾向于标注自己的位置。

  >  **对比于杭州/ 昆明**

![located_hz](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\located_hz.jpg)

​		![located_km](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\located_km.jpg)

- 其中广州是外来人口的大市，务工人员回乡的较多，杭州次之，昆明最次。可以看出是否标注地点于此可能且很可能有相关的关系。



### 情感指数的分布

> 实现方法：将情感指数用histogram直接绘制，再将每一个柱体的中心点连接成为曲线图
>
> ```matlab
> %% sentiment
> 
> % Put the device(source) column into a string vec
> user_source_guangzhou = Guangzhou{rows_gz, "sentiment"};
> figure;
> h = histogram(user_source_guangzhou);
> hold on;
> h_x = h.BinEdges(1 : end - 1) + 0.5 * h.BinWidth;
> h_y = h.Values;
> plot(h_x, h_y, 'LineWidth', 1.7);
> xlabel('Sentiment');
> ylabel('Count');
> title('the Distribution sentiment of users', 'Fontsize', 10);
> 
> hold off;
> ```
>
> 

![sentiment_distribution](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\sentiment_distribution.jpg)

总结有以下规律：

1. 接近零和1以及中位数0.5的分布最多。
2. 绝大多数趋近于1
3. 其他分布较为均匀

- 个人推测以上原因大概率是情感分析的ML模型不够完善（不然情感曲线不应该分布太过于陡峭）。在后面我将会使用sentiment这个指标来进行时间序列的分析，由分布图考虑应该去掉0， 1， 0.5三个值的变量。



## 点赞数、评论数和转发数三大要素

- 首先是三个量的分布图

> 实现方法：这里首先尝试了将所有的变量和对应的值画成分布图，但是明显太过于集中，收集到的数据大多数都集中在0，而且还有一部分很大的数，考虑到分布图的直观性，采用`rows_gz_l = Guangzhou.likes_num > 1000 & Guangzhou.likes_num < 5000;`的代码来选取中间区域的数值对。

![3distribution](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\3distribution.jpg)

- 另外，对三个量绘制三维图（火柴图），从而更直观的观察转发量和点赞数、评论数是否呈现正相关关系。

> 实现方法：对三个变量进行统计，直接用`stem3();`命令绘制。

![gz_like_comment_forward_stem3](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\gz_like_comment_forward_stem3.jpg)

- 由于包含所有数据的图像存在一部分和其他数据差别较大的，从图中可以看到以一个转发数量过大的，有两个点赞和评论数量很大的，与大部分差距很大，猜测可能是点赞评论/转发抽奖互动或者是明星又出现了绯闻...于是对这几个变量进行处理，暂时删除几个偏差较大的值，代码如下：

> ```matlab
> [like_most, like_most_pos] = maxk(user_guangzhou_like, 2);
> [forw_most, for_most_pos] = maxk(user_guangzhou_forward, 1);
> user_guangzhou_comment(for_most_pos) = [];
> user_guangzhou_like(for_most_pos) = [];
> user_guangzhou_forward(for_most_pos) = [];
> for i = 1: 2
>     user_guangzhou_comment(i) = [];
>     user_guangzhou_like(i) = [];
>     user_guangzhou_forward(i) = [];
> end
> 
> stem3([user_guangzhou_like, user_guangzhou_comment, user_guangzhou_forward]);
> ```

![like_com_for2](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\like_com_for2.jpg)

- 从上面的三维图中可以看出，在大区域内是明显存在相关关系的，但是在小区域内，却没有明显的相关关系，这样比较容易理解，比如在点赞数和评论数很小的微博发表，大部分是一些小博主或者普通用户，点赞和评论也有很大的随机性，转发一般都是朋友之间或者多层转发的情况，所以与内容质量无关，也就不会和点赞数、评论数呈现同一规律；而点赞数和评论数较大的情况一般是官方账号的发布或者明星的新闻，也就会呈现点赞、评论以及转发数很高的情况。



