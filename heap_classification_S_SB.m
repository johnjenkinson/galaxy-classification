%simple spiral versus barred spiral
clear all; close all; clc
training=[0.0253	6.2909	0.9167	0.9365	7.5000	2.0000
0.6213	10.0485	0.8171	0.9654	14.0488	0.7715
0.5885	10.4035	0.8636	0.9563	11.0303	0.7466
0.2190	5.8828	0.9846	0.9389	7.8000	1.1660
0.7091	7.3071	0.9129	0.9526	10.1326	0.5133
0.1362	8.0774	0.8807	0.9553	10.7955	0.1470
0.3060	6.2361	1.0000	0.9433	8.4375	1.5857
0.4873	10.1069	0.8281	0.9505	9.7031	1.1822
0.4926	6.2821	0.8603	0.9288	6.6176	1.6331
0.7551	6.9866	0.9106	0.9325	6.9593	0.6298
0.4467	7.1545	1.3398	0.9655	14.1094	0.5718
0.4462	8.1295	0.8580	0.9421	8.2346	0.5673
0.3834	5.0962	0.9630	0.9265	6.4167	0.7675
0.5949	10.7585	0.8963	0.9654	14.0488	0.9897
0.3804	6.1336	1.2609	0.9531	10.2772	1.8196
0.4734	5.9252	0.9068	0.9225	6.0508	0.5579
0.4246	8.1341	0.9011	0.9495	9.4945	0.8142
0.2529	4.6912	2.7338	0.9727	17.9513	1.1387
0.6079	7.3958	0.8972	0.9454	8.7383	1.0395
0.6177	10.5250	0.8824	0.9567	11.1176	0.7012];
%NGC 4218,NGC 4217,NGC 4100,NGC 4414,UGC 10288,NGC 4457
%NGC 4314,NGC 4274,NGC 4448,NGC 4157,NGC 5850,NGC 5806
%NGC 4232,NGC 4088,NGC 4258 (Messier 106),NGC 4527
%NGC 4389,NGC 4496,NGC 4085,NGC 4096

% 1 for Spiral 0 for Barred Spiral
Y=[1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
Y=Y';

coeff=pca(training);
reduced_training=training*coeff(:,1:2);

svmStruct=svmtrain(training,Y,'showplot',true);

test=[0.3939	11.5909	0.9237	0.9650	13.8931	0.8041
0.7360	4.5357	0.8750	0.8926	4.2188	2.0523
0.2841	9.1261	0.8041	0.9442	8.5743	0.5917
0.1891	7.4770	1.2194	0.9600	12.1224	0.8220
0.3239	9.0684	1.0833	0.9611	12.4583	0.8333
0.1427	13.4592	1.2010	0.9793	23.8144	0.8542
0.2962	4.8000	1.3176	0.9462	8.9189	1.6155
0.2284	8.4693	0.9521	0.9583	11.6170	1.5081
0.1851	3.3448	0.8529	0.7955	2.0588	2.1445];
%NGC 6070,UGC 7617,NGC 4480,UGC 10133,NGC 4559,NGC 4242
%NGC 4393,NGC 4288,NGC 3985

coeff2=pca(test);
reduced_test=test*coeff2(:,1:2);
GROUP = svmclassify(svmStruct,test,'showplot',true);