clear all; close all; clc
training=[0.3067	6.2677	0.9769	0.9360	7.4308	1.1206
0.3209	6.6436	0.8860	0.9256	6.3333	0.6535
0.4188	10.7313	1.0208	0.9692	15.8299	0.5252
0.0942	4.3125	0.8276	0.8750	3.6207	2.0567
0.0878	5.1800	0.8065	0.8824	3.8710	2.0601
0.0349	7.6589	0.8836	0.9474	9.1233	1.8907
0.0132	6.6055	0.8385	0.9412	8.1231	2.0000
0.1125	3.0652	0.8214	0.8688	3.4286	2.0000
0.1320	9.3680	0.8224	0.9485	9.3355	0.4334
0.0267	6.9674	0.8214	0.9322	7.0000	0.7749
0.5342	8.3212	0.8333	0.9487	9.3434	1.7461
0.5798	8.2727	0.8578	0.9502	9.6330	0.9847
0.3547	5.8481	0.8061	0.9135	5.3878	1.2209
0.5999	6.8947	0.9223	0.9465	8.9320	0.8882
0.4940	6.2576	0.9167	0.9344	7.2222	0.9743
0.4315	7.0426	0.8598	0.9437	8.4878	1.0824
0.4350	5.2755	0.8750	0.9182	5.7143	0.4003
0.4178	10.1989	0.8378	0.9583	11.5946	0.3737
0.1665	4.0833	0.9375	0.8842	3.9375	1.5867
0.4994	5.0952	0.8630	0.9327	7.0274	0.4679
0.0253	6.2909	0.9167	0.9365	7.5000	2.0000
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
%NGC 4449,UGC 7408,UGC 7577,UGC 7639,UGC 7690
%NGC 4278,NGC 4283,NGC 4308,NGC 5813,NGC 5831
%NGC 4346,NGC 4460,NGC 4251,NGC 4220,NGC 4346
%NGC 4324,NGC 5854,NGC 5838,NGC 5839,NGC 5864
%NGC 4218,NGC 4217,NGC 4100,NGC 4414,UGC 10288
%NGC 4457,NGC 4314,NGC 4274,NGC 4448,NGC 4157
%NGC 5850,NGC 5806,NGC 4232,NGC 4088,NGC 4258
%NGC 4527,NGC 4389,NGC 4496,NGC 4085,NGC 4096

Y=['I'; 'I'; 'I'; 'I'; 'I'; 'R'; 'R'; 'R'; 'R'; 'R';...
    'R'; 'R';'R';'R';'R';'R';'R';'R';'R';'R';...
  'R'; 'R';'R';'R';'R';'R';'R';'R';'R';'R';...
  'R'; 'R';'R';'R';'R';'R';'R';'R';'R';'R'];

coeff=pca(training);
reduced_training=training*coeff(:,1:2);

svmStruct=svmtrain(reduced_training,Y,'showplot',true);

test=[0.0918	8.9569	1.6384	0.9777	22.0395	1.5674
0.0517	11.0573	0.8263	0.9591	11.8421	1.7629
0.1082	12.0424	0.7973	0.9477	9.1892	1.8442
0.1234	6.3919	0.8043	0.9178	5.7065	0.8899
0.0320	3.8718	0.8125	0.8521	3.0000	0.6971
0.2468	4.1000	0.9783	0.9147	5.4783	2.0000
0.3939	11.5909	0.9237	0.9650	13.8931	0.8041
0.7360	4.5357	0.8750	0.8926	4.2188	2.0523
0.2841	9.1261	0.8041	0.9442	8.5743	0.5917
0.1891	7.4770	1.2194	0.9600	12.1224	0.8220
0.3239	9.0684	1.0833	0.9611	12.4583	0.8333
0.1427	13.4592	1.2010	0.9793	23.8144	0.8542
0.2962	4.8000	1.3176	0.9462	8.9189	1.6155
0.2284	8.4693	0.9521	0.9583	11.6170	1.5081
0.1851	3.3448	0.8529	0.7955	2.0588	2.1445];
%test set is first row irregular, remaining regular.
%NGC 4496B,NGC 5846,NGC 5846A,NGC 5865,NGC 5868,NGC 4310
%NGC 6070,UGC 07617,NGC 4480,UGC 10133,NGC 4559,NGC 4242
%NGC 4393,NGC 4288,NGC 3985
coeff2=pca(test);
reduced_test=test*coeff2(:,1:2);
GROUP = svmclassify(svmStruct,reduced_test,'showplot',true);
