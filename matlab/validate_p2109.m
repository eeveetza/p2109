% This script validates the implementation of Recommendation ITU-R
% P.2109-1 against the reference values produced by Clutter and BEL
% workbook made available on the SG3 Software and Dataset web page.

%     Rev   Date        Author                          Description
%     -------------------------------------------------------------------------------
%     v0    03MAY17     Ivica Stevanovic, OFCOM         Initial version

errtol = 0.01;

seamcat = 0;

%%
f = 28;
p = [1.000000E-05
    1.258925E-05
    1.584893E-05
    1.995262E-05
    2.511886E-05
    3.162278E-05
    3.981072E-05
    5.011872E-05
    6.309573E-05
    7.943282E-05
    1.000000E-04
    1.258925E-04
    1.584893E-04
    1.995262E-04
    2.511886E-04
    3.162278E-04
    3.981072E-04
    5.011872E-04
    6.309573E-04
    7.943282E-04
    1.000000E-03
    1.258925E-03
    1.584893E-03
    1.995262E-03
    2.511886E-03
    3.162278E-03
    3.981072E-03
    5.011872E-03
    6.309573E-03
    7.943282E-03
    1.000000E-02
    1.258925E-02
    1.584893E-02
    1.995262E-02
    2.511886E-02
    3.162278E-02
    3.981072E-02
    5.011872E-02
    6.309573E-02
    7.943282E-02
    1.000000E-01
    1.258925E-01
    1.584893E-01
    1.995262E-01
    2.511886E-01
    3.162278E-01
    3.981072E-01
    5.011872E-01
    6.309573E-01
    7.943282E-01
    1.000000E+00
    1.258925E+00
    1.584893E+00
    1.995262E+00
    2.511886E+00
    3.162278E+00
    3.981072E+00
    5.011872E+00
    6.309573E+00
    7.943282E+00
    1.000000E+01
    1.258925E+01
    1.584893E+01
    1.995262E+01
    2.041738E+01
    2.089296E+01
    2.137962E+01
    2.187762E+01
    2.238721E+01
    2.290868E+01
    2.344229E+01
    2.398833E+01
    2.454709E+01
    2.511886E+01
    2.570396E+01
    2.630268E+01
    2.691535E+01
    2.754229E+01
    2.818383E+01
    2.884032E+01
    2.951209E+01
    3.019952E+01
    3.090295E+01
    3.162278E+01
    3.235937E+01
    3.311311E+01
    3.388442E+01
    3.467369E+01
    3.548134E+01
    3.630781E+01
    3.715352E+01
    3.801894E+01
    3.890451E+01
    3.981072E+01
    4.073803E+01
    4.168694E+01
    4.265795E+01
    4.365158E+01
    4.466836E+01
    4.570882E+01
    4.677351E+01
    4.786301E+01
    4.897788E+01
    5.011872E+01
    5.128614E+01
    5.248075E+01
    5.370318E+01
    5.495409E+01
    5.623413E+01
    5.754399E+01
    5.888437E+01
    6.025596E+01
    6.165950E+01
    6.309573E+01
    6.456542E+01
    6.606934E+01
    6.760830E+01
    6.918310E+01
    7.079458E+01
    7.244360E+01
    7.413102E+01
    7.585776E+01
    7.762471E+01
    7.943282E+01
    8.128305E+01
    8.317638E+01
    8.511380E+01
    8.709636E+01
    8.912509E+01
    9.120108E+01
    9.332543E+01
    9.549926E+01
    9.772372E+01
    9.794900E+01
    9.817479E+01
    9.840111E+01
    9.862795E+01
    9.885531E+01
    9.908319E+01
    9.931160E+01
    9.954054E+01
    9.977001E+01
    ];


th = 0;
cl = 1;

L_ref = [-0.275
    -0.242
    -0.209
    -0.176
    -0.142
    -0.108
    -0.072
    -0.037
    0.000
    0.037
    0.074
    0.113
    0.152
    0.191
    0.232
    0.273
    0.315
    0.358
    0.401
    0.446
    0.491
    0.537
    0.585
    0.633
    0.682
    0.733
    0.784
    0.837
    0.891
    0.946
    1.003
    1.061
    1.121
    1.182
    1.245
    1.310
    1.377
    1.447
    1.519
    1.593
    1.671
    1.752
    1.837
    1.927
    2.022
    2.123
    2.231
    2.347
    2.474
    2.614
    2.769
    2.943
    3.142
    3.372
    3.640
    3.958
    4.340
    4.801
    5.364
    6.051
    6.891
    7.915
    9.155
    10.644
    10.808
    10.975
    11.145
    11.318
    11.494
    11.673
    11.856
    12.041
    12.230
    12.423
    12.618
    12.817
    13.020
    13.226
    13.436
    13.650
    13.867
    14.088
    14.314
    14.543
    14.777
    15.015
    15.257
    15.504
    15.756
    16.012
    16.274
    16.540
    16.812
    17.090
    17.373
    17.662
    17.957
    18.258
    18.566
    18.881
    19.204
    19.534
    19.872
    20.218
    20.573
    20.938
    21.312
    21.698
    22.094
    22.502
    22.924
    23.359
    23.809
    24.275
    24.759
    25.263
    25.788
    26.336
    26.910
    27.514
    28.151
    28.827
    29.546
    30.317
    31.149
    32.056
    33.055
    34.173
    35.448
    36.947
    38.785
    41.218
    45.021
    45.565
    46.164
    46.831
    47.587
    48.461
    49.505
    50.811
    52.581
    55.440
    ];


for pi = 1: length(p)
    L(pi) = bel_p2109(f,p(pi),cl,th);
    
end

success = find(abs(L.'-L_ref)<errtol);

fprintf(1, 'traditional building, f = %f GHz, th = %f deg: %d out of %d tests passed.\n', f, th, numel(success), numel(L));

if (seamcat == 1)
    fprintf(1,'@Test\n');
    fprintf(1, 'public void test1() {\n');
    
    fprintf(1,'PBEL calculator = new PBEL();\n');
    
    
    fprintf(1,'double[] p = new double[%d];\n', length(p));
    fprintf(1,'double th = %f;\n', th);
    fprintf(1,'double f = %f;\n', f);
    fprintf(1,'int cl = %d;\n', cl);
    for pi = 1:length(p)
        fprintf(1,'p[%d] = %f;\n', pi-1, p(pi));
    end
    
    
    fprintf(1,'double[] expectedResult = new double[%d];\n', numel(L));
    count = 0;
    
    for pi = 1:length(p)
        
        fprintf(1,'expectedResult[%d] = %f;\n', pi-1, L(pi));
        
    end
    
    
    
    fprintf(1,'for (int pi = 0; pi < %d; pi++) {\n', length(p));
    fprintf(1,'double result = calculator.bel(f,p[pi],cl,th);\n');
    fprintf(1,'util.assertDoubleEquals(expectedResult[pi], result);\n');
    fprintf(1,'}\n');
    fprintf(1,'}\n');
    fprintf(1,'}\n');
end
%%

th = 0;
cl = 2;

L_ref = [-2.117
    -2.065
    -2.011
    -1.953
    -1.891
    -1.826
    -1.757
    -1.684
    -1.606
    -1.524
    -1.437
    -1.345
    -1.247
    -1.144
    -1.036
    -0.921
    -0.799
    -0.671
    -0.536
    -0.394
    -0.244
    -0.086
    0.080
    0.254
    0.437
    0.629
    0.830
    1.041
    1.261
    1.492
    1.733
    1.984
    2.246
    2.520
    2.805
    3.102
    3.410
    3.732
    4.066
    4.413
    4.774
    5.149
    5.539
    5.945
    6.369
    6.810
    7.272
    7.755
    8.263
    8.800
    9.369
    9.976
    10.630
    11.340
    12.119
    12.984
    13.955
    15.059
    16.325
    17.788
    19.484
    21.447
    23.715
    26.325
    26.607
    26.892
    27.182
    27.475
    27.773
    28.075
    28.381
    28.691
    29.006
    29.326
    29.650
    29.979
    30.312
    30.650
    30.994
    31.342
    31.696
    32.055
    32.420
    32.790
    33.166
    33.549
    33.937
    34.332
    34.733
    35.141
    35.556
    35.978
    36.408
    36.845
    37.291
    37.745
    38.208
    38.680
    39.162
    39.654
    40.156
    40.670
    41.195
    41.732
    42.283
    42.847
    43.426
    44.021
    44.632
    45.262
    45.910
    46.579
    47.271
    47.987
    48.729
    49.501
    50.304
    51.143
    52.022
    52.945
    53.918
    54.949
    56.047
    57.223
    58.492
    59.873
    61.396
    63.098
    65.040
    67.320
    70.117
    73.818
    79.602
    80.430
    81.340
    82.355
    83.505
    84.835
    86.423
    88.408
    91.100
    95.448
    ];


for pi = 1: length(p)
    L(pi) = bel_p2109(f,p(pi),cl,th);
    
end

success = find(abs(L.'-L_ref)<errtol);

fprintf(1, 'thermally-efficient building, f = %f GHz, th = %f deg: %d out of %d tests passed.\n', f, th, numel(success), numel(L));

if (seamcat == 1)
    fprintf(1,'@Test\n');
    fprintf(1, 'public void test1() {\n');
    
    fprintf(1,'PBEL calculator = new PBEL();\n');
    
    
    fprintf(1,'double[] p = new double[%d];\n', length(p));
    fprintf(1,'double th = %f;\n', th);
    fprintf(1,'double f = %f;\n', f);
    fprintf(1,'int cl = %d;\n', cl);
    for pi = 1:length(p)
        fprintf(1,'p[%d] = %f;\n', pi-1, p(pi));
    end
    
    
    fprintf(1,'double[] expectedResult = new double[%d];\n', numel(L));
    count = 0;
    
    for pi = 1:length(p)
        
        fprintf(1,'expectedResult[%d] = %f;\n', pi-1, L(pi));
        
    end
    
    
    
    fprintf(1,'for (int pi = 0; pi < %d; pi++) {\n', length(p));
    fprintf(1,'double result = calculator.bel(f,p[pi],cl,th);\n');
    fprintf(1,'util.assertDoubleEquals(expectedResult[pi], result);\n');
    fprintf(1,'}\n');
    fprintf(1,'}\n');
    fprintf(1,'}\n');
end


%%
%%
f = 2;
th = 45;

cl = 1;

L_ref = [-2.484
    -2.465
    -2.444
    -2.423
    -2.400
    -2.377
    -2.352
    -2.326
    -2.299
    -2.271
    -2.241
    -2.209
    -2.176
    -2.142
    -2.105
    -2.067
    -2.026
    -1.984
    -1.939
    -1.891
    -1.841
    -1.787
    -1.731
    -1.671
    -1.608
    -1.540
    -1.469
    -1.392
    -1.311
    -1.224
    -1.131
    -1.032
    -0.926
    -0.811
    -0.689
    -0.557
    -0.414
    -0.260
    -0.094
    0.086
    0.281
    0.493
    0.724
    0.975
    1.248
    1.547
    1.873
    2.229
    2.618
    3.043
    3.508
    4.016
    4.570
    5.176
    5.836
    6.557
    7.341
    8.196
    9.127
    10.142
    11.251
    12.464
    13.798
    15.274
    15.430
    15.589
    15.749
    15.911
    16.074
    16.240
    16.408
    16.577
    16.749
    16.923
    17.099
    17.277
    17.458
    17.641
    17.826
    18.014
    18.204
    18.397
    18.593
    18.792
    18.993
    19.198
    19.406
    19.616
    19.831
    20.048
    20.270
    20.495
    20.724
    20.957
    21.194
    21.436
    21.682
    21.933
    22.189
    22.451
    22.718
    22.991
    23.270
    23.556
    23.848
    24.148
    24.456
    24.773
    25.098
    25.433
    25.778
    26.134
    26.502
    26.883
    27.278
    27.689
    28.117
    28.565
    29.033
    29.525
    30.045
    30.595
    31.181
    31.809
    32.487
    33.226
    34.040
    34.951
    35.991
    37.211
    38.710
    40.694
    43.796
    44.240
    44.728
    45.273
    45.890
    46.603
    47.455
    48.521
    49.966
    52.300
    ];


for pi = 1: length(p)
    L(pi) = bel_p2109(f,p(pi),cl,th);
    
end

success = find(abs(L.'-L_ref)<errtol);

fprintf(1, 'traditional building, f = %f GHz, th = %f deg: %d out of %d tests passed.\n', f, th, numel(success), numel(L));
if (seamcat == 1)
    fprintf(1,'@Test\n');
    fprintf(1, 'public void test1() {\n');
    
    fprintf(1,'PBEL calculator = new PBEL();\n');
    
    
    fprintf(1,'double[] p = new double[%d];\n', length(p));
    fprintf(1,'double th = %f;\n', th);
    fprintf(1,'double f = %f;\n', f);
    fprintf(1,'int cl = %d;\n', cl);
    for pi = 1:length(p)
        fprintf(1,'p[%d] = %f;\n', pi-1, p(pi));
    end
    
    
    fprintf(1,'double[] expectedResult = new double[%d];\n', numel(L));
    count = 0;
    
    for pi = 1:length(p)
        
        fprintf(1,'expectedResult[%d] = %f;\n', pi-1, L(pi));
        
    end
    
    
    
    fprintf(1,'for (int pi = 0; pi < %d; pi++) {\n', length(p));
    fprintf(1,'double result = calculator.bel(f,p[pi],cl,th);\n');
    fprintf(1,'util.assertDoubleEquals(expectedResult[pi], result);\n');
    fprintf(1,'}\n');
    fprintf(1,'}\n');
    fprintf(1,'}\n');
end


%%

cl = 2;

L_ref = [-2.882
    -2.872
    -2.860
    -2.847
    -2.833
    -2.818
    -2.801
    -2.782
    -2.762
    -2.739
    -2.714
    -2.686
    -2.656
    -2.622
    -2.585
    -2.543
    -2.498
    -2.447
    -2.391
    -2.329
    -2.260
    -2.184
    -2.100
    -2.007
    -1.903
    -1.789
    -1.663
    -1.523
    -1.369
    -1.199
    -1.012
    -0.806
    -0.580
    -0.333
    -0.062
    0.233
    0.555
    0.905
    1.284
    1.693
    2.135
    2.609
    3.119
    3.664
    4.247
    4.867
    5.528
    6.231
    6.976
    7.767
    8.605
    9.493
    10.435
    11.435
    12.497
    13.626
    14.829
    16.113
    17.490
    18.969
    20.566
    22.300
    24.195
    26.283
    26.505
    26.728
    26.954
    27.183
    27.414
    27.648
    27.885
    28.125
    28.367
    28.613
    28.861
    29.113
    29.368
    29.626
    29.888
    30.153
    30.422
    30.695
    30.971
    31.252
    31.537
    31.826
    32.119
    32.417
    32.720
    33.028
    33.341
    33.659
    33.983
    34.313
    34.649
    34.991
    35.339
    35.695
    36.058
    36.428
    36.807
    37.194
    37.590
    37.995
    38.410
    38.836
    39.273
    39.723
    40.184
    40.660
    41.151
    41.657
    42.181
    42.723
    43.286
    43.871
    44.481
    45.118
    45.785
    46.487
    47.228
    48.013
    48.850
    49.747
    50.715
    51.771
    52.935
    54.237
    55.724
    57.471
    59.617
    62.459
    66.905
    67.541
    68.242
    69.022
    69.907
    70.930
    72.152
    73.680
    75.753
    79.101
    ];


for pi = 1: length(p)
    L(pi) = bel_p2109(f,p(pi),cl,th);
    
end

success = find(abs(L.'-L_ref)<errtol);

fprintf(1, 'thermally-efficient building, f = %f GHz, th = %f deg: %d out of %d tests passed.\n', f, th, numel(success), numel(L));

if (seamcat == 1)
    fprintf(1,'@Test\n');
    fprintf(1, 'public void test1() {\n');
    
    fprintf(1,'PBEL calculator = new PBEL();\n');
    
    
    fprintf(1,'double[] p = new double[%d];\n', length(p));
    fprintf(1,'double th = %f;\n', th);
    fprintf(1,'double f = %f;\n', f);
    fprintf(1,'int cl = %d;\n', cl);
    for pi = 1:length(p)
        fprintf(1,'p[%d] = %f;\n', pi-1, p(pi));
    end
    
    
    fprintf(1,'double[] expectedResult = new double[%d];\n', numel(L));
    count = 0;
    
    for pi = 1:length(p)
        
        fprintf(1,'expectedResult[%d] = %f;\n', pi-1, L(pi));
        
    end
    
    
    
    fprintf(1,'for (int pi = 0; pi < %d; pi++) {\n', length(p));
    fprintf(1,'double result = calculator.bel(f,p[pi],cl,th);\n');
    fprintf(1,'util.assertDoubleEquals(expectedResult[pi], result);\n');
    fprintf(1,'}\n');
    fprintf(1,'}\n');
    fprintf(1,'}\n');
end

