# Remove assemblies

Exclude assemblies that were listed for removal for some reason.

## Usage

``` r
removeAssemblies(x, file = NULL)
```

## Arguments

- x:

  A data frame or a matrix.

- file:

  A tab-separated file (pattern, reason) listing assemblies to remove.

## Value

The `x` object where genomes matching the patterns in `file` have been
removed. For convenience, `x` is returned unmodified if `file` is
`NULL`.

## Author

Charles Plessy

## Examples

``` r
removeAssemblies(Halo_PercentDiff, textConnection("Halobacterium_\ttest"))
#>                        Haloferax_mediterranei Haloferax_volcanii
#> Haloferax_mediterranei                0.00000           19.77441
#> Haloferax_volcanii                   19.60559            0.00000
#> Salarchaeum_japonicum                31.34071           30.17554
#>                        Salarchaeum_japonicum
#> Haloferax_mediterranei              31.58067
#> Haloferax_volcanii                  30.20358
#> Salarchaeum_japonicum                0.00000
removeAssemblies(Halo_DF,          textConnection("Halobacterium_\ttest"))
#>                                                aligned_length_Min
#> Haloferax_mediterranei___Haloferax_volcanii                    74
#> Haloferax_mediterranei___Salarchaeum_japonicum                 73
#> Haloferax_volcanii___Haloferax_mediterranei                    74
#> Haloferax_volcanii___Salarchaeum_japonicum                     76
#> Salarchaeum_japonicum___Haloferax_mediterranei                 73
#> Salarchaeum_japonicum___Haloferax_volcanii                     76
#>                                                aligned_length_Q1
#> Haloferax_mediterranei___Haloferax_volcanii               746.00
#> Haloferax_mediterranei___Salarchaeum_japonicum            576.50
#> Haloferax_volcanii___Haloferax_mediterranei               719.75
#> Haloferax_volcanii___Salarchaeum_japonicum                623.00
#> Salarchaeum_japonicum___Haloferax_mediterranei            556.00
#> Salarchaeum_japonicum___Haloferax_volcanii                621.75
#>                                                aligned_length_Median
#> Haloferax_mediterranei___Haloferax_volcanii                   1610.0
#> Haloferax_mediterranei___Salarchaeum_japonicum                 955.0
#> Haloferax_volcanii___Haloferax_mediterranei                   1550.5
#> Haloferax_volcanii___Salarchaeum_japonicum                    1007.0
#> Salarchaeum_japonicum___Haloferax_mediterranei                 928.0
#> Salarchaeum_japonicum___Haloferax_volcanii                    1000.0
#>                                                aligned_length_Mean
#> Haloferax_mediterranei___Haloferax_volcanii               2682.168
#> Haloferax_mediterranei___Salarchaeum_japonicum            1208.715
#> Haloferax_volcanii___Haloferax_mediterranei               2524.517
#> Haloferax_volcanii___Salarchaeum_japonicum                1326.828
#> Salarchaeum_japonicum___Haloferax_mediterranei            1172.509
#> Salarchaeum_japonicum___Haloferax_volcanii                1322.423
#>                                                aligned_length_Q3
#> Haloferax_mediterranei___Haloferax_volcanii              3720.00
#> Haloferax_mediterranei___Salarchaeum_japonicum           1501.00
#> Haloferax_volcanii___Haloferax_mediterranei              3465.75
#> Haloferax_volcanii___Salarchaeum_japonicum               1670.00
#> Salarchaeum_japonicum___Haloferax_mediterranei           1462.50
#> Salarchaeum_japonicum___Haloferax_volcanii               1664.00
#>                                                aligned_length_Max
#> Haloferax_mediterranei___Haloferax_volcanii                 25160
#> Haloferax_mediterranei___Salarchaeum_japonicum              14833
#> Haloferax_volcanii___Haloferax_mediterranei                 25163
#> Haloferax_volcanii___Salarchaeum_japonicum                  14293
#> Salarchaeum_japonicum___Haloferax_mediterranei              14463
#> Salarchaeum_japonicum___Haloferax_volcanii                  14293
#>                                                aligned_length_L50
#> Haloferax_mediterranei___Haloferax_volcanii              5958.171
#> Haloferax_mediterranei___Salarchaeum_japonicum           2116.245
#> Haloferax_volcanii___Haloferax_mediterranei              5510.471
#> Haloferax_volcanii___Salarchaeum_japonicum               2327.514
#> Salarchaeum_japonicum___Haloferax_mediterranei           2054.035
#> Salarchaeum_japonicum___Haloferax_volcanii               2327.443
#>                                                aligned_length_Total
#> Haloferax_mediterranei___Haloferax_volcanii                 2556106
#> Haloferax_mediterranei___Salarchaeum_japonicum              1365848
#> Haloferax_volcanii___Haloferax_mediterranei                 2544713
#> Haloferax_volcanii___Salarchaeum_japonicum                  1456857
#> Salarchaeum_japonicum___Haloferax_mediterranei              1349558
#> Salarchaeum_japonicum___Haloferax_volcanii                  1454665
#>                                                aligned_length_N
#> Haloferax_mediterranei___Haloferax_volcanii                 953
#> Haloferax_mediterranei___Salarchaeum_japonicum             1130
#> Haloferax_volcanii___Haloferax_mediterranei                1008
#> Haloferax_volcanii___Salarchaeum_japonicum                 1098
#> Salarchaeum_japonicum___Haloferax_mediterranei             1151
#> Salarchaeum_japonicum___Haloferax_volcanii                 1100
#>                                                aligned_score_Min
#> Haloferax_mediterranei___Haloferax_volcanii                  240
#> Haloferax_mediterranei___Salarchaeum_japonicum               215
#> Haloferax_volcanii___Haloferax_mediterranei                  230
#> Haloferax_volcanii___Salarchaeum_japonicum                   228
#> Salarchaeum_japonicum___Haloferax_mediterranei               206
#> Salarchaeum_japonicum___Haloferax_volcanii                   228
#>                                                aligned_score_Q1
#> Haloferax_mediterranei___Haloferax_volcanii             1650.00
#> Haloferax_mediterranei___Salarchaeum_japonicum           704.25
#> Haloferax_volcanii___Haloferax_mediterranei             1577.50
#> Haloferax_volcanii___Salarchaeum_japonicum               853.25
#> Salarchaeum_japonicum___Haloferax_mediterranei           676.00
#> Salarchaeum_japonicum___Haloferax_volcanii               872.00
#>                                                aligned_score_Median
#> Haloferax_mediterranei___Haloferax_volcanii                  4723.0
#> Haloferax_mediterranei___Salarchaeum_japonicum               1388.5
#> Haloferax_volcanii___Haloferax_mediterranei                  4587.0
#> Haloferax_volcanii___Salarchaeum_japonicum                   1732.5
#> Salarchaeum_japonicum___Haloferax_mediterranei               1316.0
#> Salarchaeum_japonicum___Haloferax_volcanii                   1722.0
#>                                                aligned_score_Mean
#> Haloferax_mediterranei___Haloferax_volcanii              7899.460
#> Haloferax_mediterranei___Salarchaeum_japonicum           1857.402
#> Haloferax_volcanii___Haloferax_mediterranei              7333.497
#> Haloferax_volcanii___Salarchaeum_japonicum               2346.982
#> Salarchaeum_japonicum___Haloferax_mediterranei           1783.493
#> Salarchaeum_japonicum___Haloferax_volcanii               2340.934
#>                                                aligned_score_Q3
#> Haloferax_mediterranei___Haloferax_volcanii            10415.00
#> Haloferax_mediterranei___Salarchaeum_japonicum          2364.75
#> Haloferax_volcanii___Haloferax_mediterranei             9797.50
#> Haloferax_volcanii___Salarchaeum_japonicum              2994.75
#> Salarchaeum_japonicum___Haloferax_mediterranei          2271.00
#> Salarchaeum_japonicum___Haloferax_volcanii              2992.50
#>                                                aligned_score_Max
#> Haloferax_mediterranei___Haloferax_volcanii                75210
#> Haloferax_mediterranei___Salarchaeum_japonicum             27372
#> Haloferax_volcanii___Haloferax_mediterranei                73801
#> Haloferax_volcanii___Salarchaeum_japonicum                 29447
#> Salarchaeum_japonicum___Haloferax_mediterranei             26708
#> Salarchaeum_japonicum___Haloferax_volcanii                 29447
#>                                                aligned_score_L50
#> Haloferax_mediterranei___Haloferax_volcanii            19083.180
#> Haloferax_mediterranei___Salarchaeum_japonicum          3741.876
#> Haloferax_volcanii___Haloferax_mediterranei            17502.790
#> Haloferax_volcanii___Salarchaeum_japonicum              4697.379
#> Salarchaeum_japonicum___Haloferax_mediterranei          3631.220
#> Salarchaeum_japonicum___Haloferax_volcanii              4695.553
#>                                                aligned_score_Total
#> Haloferax_mediterranei___Haloferax_volcanii                7528185
#> Haloferax_mediterranei___Salarchaeum_japonicum             2098864
#> Haloferax_volcanii___Haloferax_mediterranei                7392165
#> Haloferax_volcanii___Salarchaeum_japonicum                 2576986
#> Salarchaeum_japonicum___Haloferax_mediterranei             2052800
#> Salarchaeum_japonicum___Haloferax_volcanii                 2575027
#>                                                aligned_score_N
#> Haloferax_mediterranei___Haloferax_volcanii                953
#> Haloferax_mediterranei___Salarchaeum_japonicum            1130
#> Haloferax_volcanii___Haloferax_mediterranei               1008
#> Haloferax_volcanii___Salarchaeum_japonicum                1098
#> Salarchaeum_japonicum___Haloferax_mediterranei            1151
#> Salarchaeum_japonicum___Haloferax_volcanii                1100
#>                                                aligned_matches_Min
#> Haloferax_mediterranei___Haloferax_volcanii                     63
#> Haloferax_mediterranei___Salarchaeum_japonicum                  67
#> Haloferax_volcanii___Haloferax_mediterranei                     63
#> Haloferax_volcanii___Salarchaeum_japonicum                      68
#> Salarchaeum_japonicum___Haloferax_mediterranei                  66
#> Salarchaeum_japonicum___Haloferax_volcanii                      68
#>                                                aligned_matches_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                569.00
#> Haloferax_mediterranei___Salarchaeum_japonicum             374.25
#> Haloferax_volcanii___Haloferax_mediterranei                555.50
#> Haloferax_volcanii___Salarchaeum_japonicum                 415.00
#> Salarchaeum_japonicum___Haloferax_mediterranei             365.00
#> Salarchaeum_japonicum___Haloferax_volcanii                 412.75
#>                                                aligned_matches_Median
#> Haloferax_mediterranei___Haloferax_volcanii                    1294.0
#> Haloferax_mediterranei___Salarchaeum_japonicum                  644.5
#> Haloferax_volcanii___Haloferax_mediterranei                    1244.5
#> Haloferax_volcanii___Salarchaeum_japonicum                      716.0
#> Salarchaeum_japonicum___Haloferax_mediterranei                  632.0
#> Salarchaeum_japonicum___Haloferax_volcanii                      711.5
#>                                                aligned_matches_Mean
#> Haloferax_mediterranei___Haloferax_volcanii               2151.7849
#> Haloferax_mediterranei___Salarchaeum_japonicum             826.9947
#> Haloferax_volcanii___Haloferax_mediterranei               2029.5704
#> Haloferax_volcanii___Salarchaeum_japonicum                 926.0783
#> Salarchaeum_japonicum___Haloferax_mediterranei             805.0365
#> Salarchaeum_japonicum___Haloferax_volcanii                 923.3745
#>                                                aligned_matches_Q3
#> Haloferax_mediterranei___Haloferax_volcanii               2962.00
#> Haloferax_mediterranei___Salarchaeum_japonicum            1032.75
#> Haloferax_volcanii___Haloferax_mediterranei               2748.50
#> Haloferax_volcanii___Salarchaeum_japonicum                1154.00
#> Salarchaeum_japonicum___Haloferax_mediterranei             993.50
#> Salarchaeum_japonicum___Haloferax_volcanii                1149.50
#>                                                aligned_matches_Max
#> Haloferax_mediterranei___Haloferax_volcanii                  20232
#> Haloferax_mediterranei___Salarchaeum_japonicum               10754
#> Haloferax_volcanii___Haloferax_mediterranei                  20237
#> Haloferax_volcanii___Salarchaeum_japonicum                   10466
#> Salarchaeum_japonicum___Haloferax_mediterranei               10566
#> Salarchaeum_japonicum___Haloferax_volcanii                   10466
#>                                                aligned_matches_L50
#> Haloferax_mediterranei___Haloferax_volcanii               4890.974
#> Haloferax_mediterranei___Salarchaeum_japonicum            1479.060
#> Haloferax_volcanii___Haloferax_mediterranei               4535.163
#> Haloferax_volcanii___Salarchaeum_japonicum                1653.034
#> Salarchaeum_japonicum___Haloferax_mediterranei            1443.765
#> Salarchaeum_japonicum___Haloferax_volcanii                1653.060
#>                                                aligned_matches_Total
#> Haloferax_mediterranei___Haloferax_volcanii                  2050651
#> Haloferax_mediterranei___Salarchaeum_japonicum                934504
#> Haloferax_volcanii___Haloferax_mediterranei                  2045807
#> Haloferax_volcanii___Salarchaeum_japonicum                   1016834
#> Salarchaeum_japonicum___Haloferax_mediterranei                926597
#> Salarchaeum_japonicum___Haloferax_volcanii                   1015712
#>                                                aligned_matches_N
#> Haloferax_mediterranei___Haloferax_volcanii                  953
#> Haloferax_mediterranei___Salarchaeum_japonicum              1130
#> Haloferax_volcanii___Haloferax_mediterranei                 1008
#> Haloferax_volcanii___Salarchaeum_japonicum                  1098
#> Salarchaeum_japonicum___Haloferax_mediterranei              1151
#> Salarchaeum_japonicum___Haloferax_volcanii                  1100
#>                                                aligned_mismatches_Min
#> Haloferax_mediterranei___Haloferax_volcanii                         5
#> Haloferax_mediterranei___Salarchaeum_japonicum                      4
#> Haloferax_volcanii___Haloferax_mediterranei                         5
#> Haloferax_volcanii___Salarchaeum_japonicum                          2
#> Salarchaeum_japonicum___Haloferax_mediterranei                      2
#> Salarchaeum_japonicum___Haloferax_volcanii                          2
#>                                                aligned_mismatches_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                   134.00
#> Haloferax_mediterranei___Salarchaeum_japonicum                173.25
#> Haloferax_volcanii___Haloferax_mediterranei                   131.00
#> Haloferax_volcanii___Salarchaeum_japonicum                    171.00
#> Salarchaeum_japonicum___Haloferax_mediterranei                168.50
#> Salarchaeum_japonicum___Haloferax_volcanii                    170.75
#>                                                aligned_mismatches_Median
#> Haloferax_mediterranei___Haloferax_volcanii                        282.0
#> Haloferax_mediterranei___Salarchaeum_japonicum                     277.0
#> Haloferax_volcanii___Haloferax_mediterranei                        273.5
#> Haloferax_volcanii___Salarchaeum_japonicum                         272.5
#> Salarchaeum_japonicum___Haloferax_mediterranei                     271.0
#> Salarchaeum_japonicum___Haloferax_volcanii                         271.5
#>                                                aligned_mismatches_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                   442.9014
#> Haloferax_mediterranei___Salarchaeum_japonicum                345.5982
#> Haloferax_volcanii___Haloferax_mediterranei                   414.0972
#> Haloferax_volcanii___Salarchaeum_japonicum                    351.1466
#> Salarchaeum_japonicum___Haloferax_mediterranei                333.7072
#> Salarchaeum_japonicum___Haloferax_volcanii                    350.0455
#>                                                aligned_mismatches_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                   607.00
#> Haloferax_mediterranei___Salarchaeum_japonicum                425.00
#> Haloferax_volcanii___Haloferax_mediterranei                   560.25
#> Haloferax_volcanii___Salarchaeum_japonicum                    441.00
#> Salarchaeum_japonicum___Haloferax_mediterranei                417.00
#> Salarchaeum_japonicum___Haloferax_volcanii                    437.00
#>                                                aligned_mismatches_Max
#> Haloferax_mediterranei___Haloferax_volcanii                      3943
#> Haloferax_mediterranei___Salarchaeum_japonicum                   3521
#> Haloferax_volcanii___Haloferax_mediterranei                      3935
#> Haloferax_volcanii___Salarchaeum_japonicum                       3202
#> Salarchaeum_japonicum___Haloferax_mediterranei                   3434
#> Salarchaeum_japonicum___Haloferax_volcanii                       3202
#>                                                aligned_mismatches_L50
#> Haloferax_mediterranei___Haloferax_volcanii                  925.8603
#> Haloferax_mediterranei___Salarchaeum_japonicum               575.4526
#> Haloferax_volcanii___Haloferax_mediterranei                  852.2381
#> Haloferax_volcanii___Salarchaeum_japonicum                   592.0136
#> Salarchaeum_japonicum___Haloferax_mediterranei               553.8452
#> Salarchaeum_japonicum___Haloferax_volcanii                   592.4919
#>                                                aligned_mismatches_Total
#> Haloferax_mediterranei___Haloferax_volcanii                      422085
#> Haloferax_mediterranei___Salarchaeum_japonicum                   390526
#> Haloferax_volcanii___Haloferax_mediterranei                      417410
#> Haloferax_volcanii___Salarchaeum_japonicum                       385559
#> Salarchaeum_japonicum___Haloferax_mediterranei                   384097
#> Salarchaeum_japonicum___Haloferax_volcanii                       385050
#>                                                aligned_mismatches_N
#> Haloferax_mediterranei___Haloferax_volcanii                     953
#> Haloferax_mediterranei___Salarchaeum_japonicum                 1130
#> Haloferax_volcanii___Haloferax_mediterranei                    1008
#> Haloferax_volcanii___Salarchaeum_japonicum                     1098
#> Salarchaeum_japonicum___Haloferax_mediterranei                 1151
#> Salarchaeum_japonicum___Haloferax_volcanii                     1100
#>                                                aligned_gaps_target_Min
#> Haloferax_mediterranei___Haloferax_volcanii                          0
#> Haloferax_mediterranei___Salarchaeum_japonicum                       0
#> Haloferax_volcanii___Haloferax_mediterranei                          0
#> Haloferax_volcanii___Salarchaeum_japonicum                           0
#> Salarchaeum_japonicum___Haloferax_mediterranei                       0
#> Salarchaeum_japonicum___Haloferax_volcanii                           0
#>                                                aligned_gaps_target_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                         0
#> Haloferax_mediterranei___Salarchaeum_japonicum                      0
#> Haloferax_volcanii___Haloferax_mediterranei                         0
#> Haloferax_volcanii___Salarchaeum_japonicum                          0
#> Salarchaeum_japonicum___Haloferax_mediterranei                      0
#> Salarchaeum_japonicum___Haloferax_volcanii                          0
#>                                                aligned_gaps_target_Median
#> Haloferax_mediterranei___Haloferax_volcanii                            18
#> Haloferax_mediterranei___Salarchaeum_japonicum                          3
#> Haloferax_volcanii___Haloferax_mediterranei                            12
#> Haloferax_volcanii___Salarchaeum_japonicum                              3
#> Salarchaeum_japonicum___Haloferax_mediterranei                          6
#> Salarchaeum_japonicum___Haloferax_volcanii                              9
#>                                                aligned_gaps_target_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                   45.846800
#> Haloferax_mediterranei___Salarchaeum_japonicum                 9.142478
#> Haloferax_volcanii___Haloferax_mediterranei                   38.404762
#> Haloferax_volcanii___Salarchaeum_japonicum                    12.385246
#> Salarchaeum_japonicum___Haloferax_mediterranei                24.985230
#> Salarchaeum_japonicum___Haloferax_volcanii                    36.651818
#>                                                aligned_gaps_target_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                     68.00
#> Haloferax_mediterranei___Salarchaeum_japonicum                   9.00
#> Haloferax_volcanii___Haloferax_mediterranei                     54.25
#> Haloferax_volcanii___Salarchaeum_japonicum                      15.00
#> Salarchaeum_japonicum___Haloferax_mediterranei                  30.00
#> Salarchaeum_japonicum___Haloferax_volcanii                      43.00
#>                                                aligned_gaps_target_Max
#> Haloferax_mediterranei___Haloferax_volcanii                        659
#> Haloferax_mediterranei___Salarchaeum_japonicum                     228
#> Haloferax_volcanii___Haloferax_mediterranei                        524
#> Haloferax_volcanii___Salarchaeum_japonicum                         172
#> Salarchaeum_japonicum___Haloferax_mediterranei                     389
#> Salarchaeum_japonicum___Haloferax_volcanii                         607
#>                                                aligned_gaps_target_L50
#> Haloferax_mediterranei___Haloferax_volcanii                  143.48732
#> Haloferax_mediterranei___Salarchaeum_japonicum                45.83187
#> Haloferax_volcanii___Haloferax_mediterranei                  134.50589
#> Haloferax_volcanii___Salarchaeum_japonicum                    53.00059
#> Salarchaeum_japonicum___Haloferax_mediterranei               104.50734
#> Salarchaeum_japonicum___Haloferax_volcanii                   143.50475
#>                                                aligned_gaps_target_Total
#> Haloferax_mediterranei___Haloferax_volcanii                        43692
#> Haloferax_mediterranei___Salarchaeum_japonicum                     10331
#> Haloferax_volcanii___Haloferax_mediterranei                        38712
#> Haloferax_volcanii___Salarchaeum_japonicum                         13599
#> Salarchaeum_japonicum___Haloferax_mediterranei                     28758
#> Salarchaeum_japonicum___Haloferax_volcanii                         40317
#>                                                aligned_gaps_target_N
#> Haloferax_mediterranei___Haloferax_volcanii                      953
#> Haloferax_mediterranei___Salarchaeum_japonicum                  1130
#> Haloferax_volcanii___Haloferax_mediterranei                     1008
#> Haloferax_volcanii___Salarchaeum_japonicum                      1098
#> Salarchaeum_japonicum___Haloferax_mediterranei                  1151
#> Salarchaeum_japonicum___Haloferax_volcanii                      1100
#>                                                aligned_gaps_query_Min
#> Haloferax_mediterranei___Haloferax_volcanii                         0
#> Haloferax_mediterranei___Salarchaeum_japonicum                      0
#> Haloferax_volcanii___Haloferax_mediterranei                         0
#> Haloferax_volcanii___Salarchaeum_japonicum                          0
#> Salarchaeum_japonicum___Haloferax_mediterranei                      0
#> Salarchaeum_japonicum___Haloferax_volcanii                          0
#>                                                aligned_gaps_query_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                        0
#> Haloferax_mediterranei___Salarchaeum_japonicum                     0
#> Haloferax_volcanii___Haloferax_mediterranei                        0
#> Haloferax_volcanii___Salarchaeum_japonicum                         0
#> Salarchaeum_japonicum___Haloferax_mediterranei                     0
#> Salarchaeum_japonicum___Haloferax_volcanii                         0
#>                                                aligned_gaps_query_Median
#> Haloferax_mediterranei___Haloferax_volcanii                           14
#> Haloferax_mediterranei___Salarchaeum_japonicum                         6
#> Haloferax_volcanii___Haloferax_mediterranei                           17
#> Haloferax_volcanii___Salarchaeum_japonicum                             9
#> Salarchaeum_japonicum___Haloferax_mediterranei                         3
#> Salarchaeum_japonicum___Haloferax_volcanii                             3
#>                                                aligned_gaps_query_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                  41.634837
#> Haloferax_mediterranei___Salarchaeum_japonicum               26.979646
#> Haloferax_volcanii___Haloferax_mediterranei                  42.444444
#> Haloferax_volcanii___Salarchaeum_japonicum                   37.217669
#> Salarchaeum_japonicum___Haloferax_mediterranei                8.780191
#> Salarchaeum_japonicum___Haloferax_volcanii                   12.350909
#>                                                aligned_gaps_query_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                       61
#> Haloferax_mediterranei___Salarchaeum_japonicum                    33
#> Haloferax_volcanii___Haloferax_mediterranei                       66
#> Haloferax_volcanii___Salarchaeum_japonicum                        45
#> Salarchaeum_japonicum___Haloferax_mediterranei                     9
#> Salarchaeum_japonicum___Haloferax_volcanii                        15
#>                                                aligned_gaps_query_Max
#> Haloferax_mediterranei___Haloferax_volcanii                       583
#> Haloferax_mediterranei___Salarchaeum_japonicum                    389
#> Haloferax_volcanii___Haloferax_mediterranei                       500
#> Haloferax_volcanii___Salarchaeum_japonicum                        607
#> Salarchaeum_japonicum___Haloferax_mediterranei                    219
#> Salarchaeum_japonicum___Haloferax_volcanii                        172
#>                                                aligned_gaps_query_L50
#> Haloferax_mediterranei___Haloferax_volcanii                 145.08635
#> Haloferax_mediterranei___Salarchaeum_japonicum              109.16997
#> Haloferax_volcanii___Haloferax_mediterranei                 131.01538
#> Haloferax_volcanii___Salarchaeum_japonicum                  145.26130
#> Salarchaeum_japonicum___Haloferax_mediterranei               43.67346
#> Salarchaeum_japonicum___Haloferax_volcanii                   52.73841
#>                                                aligned_gaps_query_Total
#> Haloferax_mediterranei___Haloferax_volcanii                       39678
#> Haloferax_mediterranei___Salarchaeum_japonicum                    30487
#> Haloferax_volcanii___Haloferax_mediterranei                       42784
#> Haloferax_volcanii___Salarchaeum_japonicum                        40865
#> Salarchaeum_japonicum___Haloferax_mediterranei                    10106
#> Salarchaeum_japonicum___Haloferax_volcanii                        13586
#>                                                aligned_gaps_query_N
#> Haloferax_mediterranei___Haloferax_volcanii                     953
#> Haloferax_mediterranei___Salarchaeum_japonicum                 1130
#> Haloferax_volcanii___Haloferax_mediterranei                    1008
#> Haloferax_volcanii___Salarchaeum_japonicum                     1098
#> Salarchaeum_japonicum___Haloferax_mediterranei                 1151
#> Salarchaeum_japonicum___Haloferax_volcanii                     1100
#>                                                matching_aligned_Min
#> Haloferax_mediterranei___Haloferax_volcanii                52.90023
#> Haloferax_mediterranei___Salarchaeum_japonicum             52.41546
#> Haloferax_volcanii___Haloferax_mediterranei                53.13225
#> Haloferax_volcanii___Salarchaeum_japonicum                 51.78947
#> Salarchaeum_japonicum___Haloferax_mediterranei             53.66064
#> Salarchaeum_japonicum___Haloferax_volcanii                 51.78947
#>                                                matching_aligned_Q1
#> Haloferax_mediterranei___Haloferax_volcanii               74.78782
#> Haloferax_mediterranei___Salarchaeum_japonicum            64.08138
#> Haloferax_volcanii___Haloferax_mediterranei               75.07866
#> Haloferax_volcanii___Salarchaeum_japonicum                65.19404
#> Salarchaeum_japonicum___Haloferax_mediterranei            64.15717
#> Salarchaeum_japonicum___Haloferax_volcanii                65.22348
#>                                                matching_aligned_Median
#> Haloferax_mediterranei___Haloferax_volcanii                   79.68406
#> Haloferax_mediterranei___Salarchaeum_japonicum                68.10844
#> Haloferax_volcanii___Haloferax_mediterranei                   79.88252
#> Haloferax_volcanii___Salarchaeum_japonicum                    69.96189
#> Salarchaeum_japonicum___Haloferax_mediterranei                68.15642
#> Salarchaeum_japonicum___Haloferax_volcanii                    69.95580
#>                                                matching_aligned_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                 78.71297
#> Haloferax_mediterranei___Salarchaeum_japonicum              68.39704
#> Haloferax_volcanii___Haloferax_mediterranei                 78.90081
#> Haloferax_volcanii___Salarchaeum_japonicum                  69.84104
#> Salarchaeum_japonicum___Haloferax_mediterranei              68.64037
#> Salarchaeum_japonicum___Haloferax_volcanii                  69.89502
#>                                                matching_aligned_Q3
#> Haloferax_mediterranei___Haloferax_volcanii               83.15878
#> Haloferax_mediterranei___Salarchaeum_japonicum            72.62597
#> Haloferax_volcanii___Haloferax_mediterranei               83.31480
#> Haloferax_volcanii___Salarchaeum_japonicum                74.65226
#> Salarchaeum_japonicum___Haloferax_mediterranei            72.96992
#> Salarchaeum_japonicum___Haloferax_volcanii                74.80632
#>                                                matching_aligned_Max
#> Haloferax_mediterranei___Haloferax_volcanii                95.67901
#> Haloferax_mediterranei___Salarchaeum_japonicum             95.18072
#> Haloferax_volcanii___Haloferax_mediterranei                95.67901
#> Haloferax_volcanii___Salarchaeum_japonicum                 93.50649
#> Salarchaeum_japonicum___Haloferax_mediterranei             97.56098
#> Salarchaeum_japonicum___Haloferax_volcanii                 93.50649
#>                                                matching_aligned_L50
#> Haloferax_mediterranei___Haloferax_volcanii                79.32679
#> Haloferax_mediterranei___Salarchaeum_japonicum             68.94639
#> Haloferax_volcanii___Haloferax_mediterranei                79.50551
#> Haloferax_volcanii___Salarchaeum_japonicum                 70.44902
#> Salarchaeum_japonicum___Haloferax_mediterranei             69.19829
#> Salarchaeum_japonicum___Haloferax_volcanii                 70.50668
#>                                                matching_aligned_Total
#> Haloferax_mediterranei___Haloferax_volcanii                  75013.47
#> Haloferax_mediterranei___Salarchaeum_japonicum               77288.65
#> Haloferax_volcanii___Haloferax_mediterranei                  79532.01
#> Haloferax_volcanii___Salarchaeum_japonicum                   76685.47
#> Salarchaeum_japonicum___Haloferax_mediterranei               79005.06
#> Salarchaeum_japonicum___Haloferax_volcanii                   76884.52
#>                                                matching_aligned_N
#> Haloferax_mediterranei___Haloferax_volcanii                   953
#> Haloferax_mediterranei___Salarchaeum_japonicum               1130
#> Haloferax_volcanii___Haloferax_mediterranei                  1008
#> Haloferax_volcanii___Salarchaeum_japonicum                   1098
#> Salarchaeum_japonicum___Haloferax_mediterranei               1151
#> Salarchaeum_japonicum___Haloferax_volcanii                   1100
#>                                                matching_target_Min
#> Haloferax_mediterranei___Haloferax_volcanii               52.90023
#> Haloferax_mediterranei___Salarchaeum_japonicum            52.41546
#> Haloferax_volcanii___Haloferax_mediterranei               56.52174
#> Haloferax_volcanii___Salarchaeum_japonicum                52.38095
#> Salarchaeum_japonicum___Haloferax_mediterranei            55.13699
#> Salarchaeum_japonicum___Haloferax_volcanii                54.42478
#>                                                matching_target_Q1
#> Haloferax_mediterranei___Haloferax_volcanii              76.05156
#> Haloferax_mediterranei___Salarchaeum_japonicum           64.61507
#> Haloferax_volcanii___Haloferax_mediterranei              76.22829
#> Haloferax_volcanii___Salarchaeum_japonicum               65.90759
#> Salarchaeum_japonicum___Haloferax_mediterranei           65.74891
#> Salarchaeum_japonicum___Haloferax_volcanii               67.43133
#>                                                matching_target_Median
#> Haloferax_mediterranei___Haloferax_volcanii                  80.91865
#> Haloferax_mediterranei___Salarchaeum_japonicum               68.59919
#> Haloferax_volcanii___Haloferax_mediterranei                  80.94685
#> Haloferax_volcanii___Salarchaeum_japonicum                   70.35019
#> Salarchaeum_japonicum___Haloferax_mediterranei               69.59911
#> Salarchaeum_japonicum___Haloferax_volcanii                   71.41293
#>                                                matching_target_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                79.85758
#> Haloferax_mediterranei___Salarchaeum_japonicum             68.83815
#> Haloferax_volcanii___Haloferax_mediterranei                79.99481
#> Haloferax_volcanii___Salarchaeum_japonicum                 70.41026
#> Salarchaeum_japonicum___Haloferax_mediterranei             69.78450
#> Salarchaeum_japonicum___Haloferax_volcanii                 71.41538
#>                                                matching_target_Q3
#> Haloferax_mediterranei___Haloferax_volcanii              84.26966
#> Haloferax_mediterranei___Salarchaeum_japonicum           72.99229
#> Haloferax_volcanii___Haloferax_mediterranei              84.40447
#> Haloferax_volcanii___Salarchaeum_japonicum               75.09786
#> Salarchaeum_japonicum___Haloferax_mediterranei           73.62416
#> Salarchaeum_japonicum___Haloferax_volcanii               75.37736
#>                                                matching_target_Max
#> Haloferax_mediterranei___Haloferax_volcanii               96.67897
#> Haloferax_mediterranei___Salarchaeum_japonicum            95.18072
#> Haloferax_volcanii___Haloferax_mediterranei               95.67901
#> Haloferax_volcanii___Salarchaeum_japonicum                93.50649
#> Salarchaeum_japonicum___Haloferax_mediterranei            97.56098
#> Salarchaeum_japonicum___Haloferax_volcanii                97.33333
#>                                                matching_target_L50
#> Haloferax_mediterranei___Haloferax_volcanii               80.41330
#> Haloferax_mediterranei___Salarchaeum_japonicum            69.35864
#> Haloferax_volcanii___Haloferax_mediterranei               80.52351
#> Haloferax_volcanii___Salarchaeum_japonicum                70.96192
#> Salarchaeum_japonicum___Haloferax_mediterranei            70.27146
#> Salarchaeum_japonicum___Haloferax_volcanii                71.91560
#>                                                matching_target_Total
#> Haloferax_mediterranei___Haloferax_volcanii                 76104.28
#> Haloferax_mediterranei___Salarchaeum_japonicum              77787.11
#> Haloferax_volcanii___Haloferax_mediterranei                 80634.77
#> Haloferax_volcanii___Salarchaeum_japonicum                  77310.47
#> Salarchaeum_japonicum___Haloferax_mediterranei              80321.96
#> Salarchaeum_japonicum___Haloferax_volcanii                  78556.91
#>                                                matching_target_N
#> Haloferax_mediterranei___Haloferax_volcanii                  953
#> Haloferax_mediterranei___Salarchaeum_japonicum              1130
#> Haloferax_volcanii___Haloferax_mediterranei                 1008
#> Haloferax_volcanii___Salarchaeum_japonicum                  1098
#> Salarchaeum_japonicum___Haloferax_mediterranei              1151
#> Salarchaeum_japonicum___Haloferax_volcanii                  1100
#>                                                matching_query_Min
#> Haloferax_mediterranei___Haloferax_volcanii              56.43225
#> Haloferax_mediterranei___Salarchaeum_japonicum           56.20525
#> Haloferax_volcanii___Haloferax_mediterranei              53.13225
#> Haloferax_volcanii___Salarchaeum_japonicum               54.42478
#> Salarchaeum_japonicum___Haloferax_mediterranei           53.75626
#> Salarchaeum_japonicum___Haloferax_volcanii               52.38095
#>                                                matching_query_Q1
#> Haloferax_mediterranei___Haloferax_volcanii             76.02502
#> Haloferax_mediterranei___Salarchaeum_japonicum          65.68204
#> Haloferax_volcanii___Haloferax_mediterranei             76.15459
#> Haloferax_volcanii___Salarchaeum_japonicum              67.33386
#> Salarchaeum_japonicum___Haloferax_mediterranei          64.69877
#> Salarchaeum_japonicum___Haloferax_volcanii              65.89164
#>                                                matching_query_Median
#> Haloferax_mediterranei___Haloferax_volcanii                 80.79242
#> Haloferax_mediterranei___Salarchaeum_japonicum              69.48515
#> Haloferax_volcanii___Haloferax_mediterranei                 80.98610
#> Haloferax_volcanii___Salarchaeum_japonicum                  71.41293
#> Salarchaeum_japonicum___Haloferax_mediterranei              68.73385
#> Salarchaeum_japonicum___Haloferax_volcanii                  70.35019
#>                                                matching_query_Mean
#> Haloferax_mediterranei___Haloferax_volcanii               79.82877
#> Haloferax_mediterranei___Salarchaeum_japonicum            69.60561
#> Haloferax_volcanii___Haloferax_mediterranei               80.04517
#> Haloferax_volcanii___Salarchaeum_japonicum                71.37900
#> Salarchaeum_japonicum___Haloferax_mediterranei            69.08725
#> Salarchaeum_japonicum___Haloferax_volcanii                70.46631
#>                                                matching_query_Q3
#> Haloferax_mediterranei___Haloferax_volcanii             84.12789
#> Haloferax_mediterranei___Salarchaeum_japonicum          73.43798
#> Haloferax_volcanii___Haloferax_mediterranei             84.40956
#> Haloferax_volcanii___Salarchaeum_japonicum              75.34778
#> Salarchaeum_japonicum___Haloferax_mediterranei          73.15417
#> Salarchaeum_japonicum___Haloferax_volcanii              75.16252
#>                                                matching_query_Max
#> Haloferax_mediterranei___Haloferax_volcanii              95.67901
#> Haloferax_mediterranei___Salarchaeum_japonicum           95.18072
#> Haloferax_volcanii___Haloferax_mediterranei              96.79012
#> Haloferax_volcanii___Salarchaeum_japonicum               97.33333
#> Salarchaeum_japonicum___Haloferax_mediterranei           97.56098
#> Salarchaeum_japonicum___Haloferax_volcanii               93.50649
#>                                                matching_query_L50
#> Haloferax_mediterranei___Haloferax_volcanii              80.37374
#> Haloferax_mediterranei___Salarchaeum_japonicum           70.08205
#> Haloferax_volcanii___Haloferax_mediterranei              80.58373
#> Haloferax_volcanii___Salarchaeum_japonicum               71.87340
#> Salarchaeum_japonicum___Haloferax_mediterranei           69.61349
#> Salarchaeum_japonicum___Haloferax_volcanii               71.02093
#>                                                matching_query_Total
#> Haloferax_mediterranei___Haloferax_volcanii                76076.82
#> Haloferax_mediterranei___Salarchaeum_japonicum             78654.34
#> Haloferax_volcanii___Haloferax_mediterranei                80685.54
#> Haloferax_volcanii___Salarchaeum_japonicum                 78374.14
#> Salarchaeum_japonicum___Haloferax_mediterranei             79519.42
#> Salarchaeum_japonicum___Haloferax_volcanii                 77512.94
#>                                                matching_query_N
#> Haloferax_mediterranei___Haloferax_volcanii                 953
#> Haloferax_mediterranei___Salarchaeum_japonicum             1130
#> Haloferax_volcanii___Haloferax_mediterranei                1008
#> Haloferax_volcanii___Salarchaeum_japonicum                 1098
#> Salarchaeum_japonicum___Haloferax_mediterranei             1151
#> Salarchaeum_japonicum___Haloferax_volcanii                 1100
#>                                                mismatching_aligned_Min
#> Haloferax_mediterranei___Haloferax_volcanii                   2.751323
#> Haloferax_mediterranei___Salarchaeum_japonicum                4.819277
#> Haloferax_volcanii___Haloferax_mediterranei                   2.653928
#> Haloferax_volcanii___Salarchaeum_japonicum                    1.886793
#> Salarchaeum_japonicum___Haloferax_mediterranei                2.439024
#> Salarchaeum_japonicum___Haloferax_volcanii                    1.886793
#>                                                mismatching_aligned_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                  14.14309
#> Haloferax_mediterranei___Salarchaeum_japonicum               25.81230
#> Haloferax_volcanii___Haloferax_mediterranei                  14.10280
#> Haloferax_volcanii___Salarchaeum_japonicum                   23.65107
#> Salarchaeum_japonicum___Haloferax_mediterranei               25.66374
#> Salarchaeum_japonicum___Haloferax_volcanii                   23.64900
#>                                                mismatching_aligned_Median
#> Haloferax_mediterranei___Haloferax_volcanii                      17.09457
#> Haloferax_mediterranei___Salarchaeum_japonicum                   29.20050
#> Haloferax_volcanii___Haloferax_mediterranei                      17.00347
#> Haloferax_volcanii___Salarchaeum_japonicum                       27.02454
#> Salarchaeum_japonicum___Haloferax_mediterranei                   29.08574
#> Salarchaeum_japonicum___Haloferax_volcanii                       26.97642
#>                                                mismatching_aligned_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                    18.41975
#> Haloferax_mediterranei___Salarchaeum_japonicum                 29.18578
#> Haloferax_volcanii___Haloferax_mediterranei                    18.25513
#> Haloferax_volcanii___Salarchaeum_japonicum                     27.12189
#> Salarchaeum_japonicum___Haloferax_mediterranei                 29.03155
#> Salarchaeum_japonicum___Haloferax_volcanii                     27.09219
#>                                                mismatching_aligned_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                  22.08835
#> Haloferax_mediterranei___Salarchaeum_japonicum               32.68647
#> Haloferax_volcanii___Haloferax_mediterranei                  21.72222
#> Haloferax_volcanii___Salarchaeum_japonicum                   30.56465
#> Salarchaeum_japonicum___Haloferax_mediterranei               32.67269
#> Salarchaeum_japonicum___Haloferax_volcanii                   30.52172
#>                                                mismatching_aligned_Max
#> Haloferax_mediterranei___Haloferax_volcanii                   38.06147
#> Haloferax_mediterranei___Salarchaeum_japonicum                43.02521
#> Haloferax_volcanii___Haloferax_mediterranei                   36.30363
#> Haloferax_volcanii___Salarchaeum_japonicum                    42.26519
#> Salarchaeum_japonicum___Haloferax_mediterranei                43.73957
#> Salarchaeum_japonicum___Haloferax_volcanii                    44.33735
#>                                                mismatching_aligned_L50
#> Haloferax_mediterranei___Haloferax_volcanii                   20.49908
#> Haloferax_mediterranei___Salarchaeum_japonicum                30.19180
#> Haloferax_volcanii___Haloferax_mediterranei                   20.25763
#> Haloferax_volcanii___Salarchaeum_japonicum                    28.16744
#> Salarchaeum_japonicum___Haloferax_mediterranei                30.06690
#> Salarchaeum_japonicum___Haloferax_volcanii                    28.15517
#>                                                mismatching_aligned_Total
#> Haloferax_mediterranei___Haloferax_volcanii                     17554.02
#> Haloferax_mediterranei___Salarchaeum_japonicum                  32979.93
#> Haloferax_volcanii___Haloferax_mediterranei                     18401.17
#> Haloferax_volcanii___Salarchaeum_japonicum                      29779.84
#> Salarchaeum_japonicum___Haloferax_mediterranei                  33415.31
#> Salarchaeum_japonicum___Haloferax_volcanii                      29801.41
#>                                                mismatching_aligned_N
#> Haloferax_mediterranei___Haloferax_volcanii                      953
#> Haloferax_mediterranei___Salarchaeum_japonicum                  1130
#> Haloferax_volcanii___Haloferax_mediterranei                     1008
#> Haloferax_volcanii___Salarchaeum_japonicum                      1098
#> Salarchaeum_japonicum___Haloferax_mediterranei                  1151
#> Salarchaeum_japonicum___Haloferax_volcanii                      1100
#>                                                mismatching_target_Min
#> Haloferax_mediterranei___Haloferax_volcanii                  3.198032
#> Haloferax_mediterranei___Salarchaeum_japonicum               4.819277
#> Haloferax_volcanii___Haloferax_mediterranei                  2.656748
#> Haloferax_volcanii___Salarchaeum_japonicum                   1.886793
#> Salarchaeum_japonicum___Haloferax_mediterranei               2.439024
#> Salarchaeum_japonicum___Haloferax_volcanii                   2.666667
#>                                                mismatching_target_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                 14.39040
#> Haloferax_mediterranei___Salarchaeum_japonicum              25.94564
#> Haloferax_volcanii___Haloferax_mediterranei                 14.23126
#> Haloferax_volcanii___Salarchaeum_japonicum                  23.82663
#> Salarchaeum_japonicum___Haloferax_mediterranei              25.98895
#> Salarchaeum_japonicum___Haloferax_volcanii                  24.06458
#>                                                mismatching_target_Median
#> Haloferax_mediterranei___Haloferax_volcanii                     17.39290
#> Haloferax_mediterranei___Salarchaeum_japonicum                  29.47632
#> Haloferax_volcanii___Haloferax_mediterranei                     17.30190
#> Haloferax_volcanii___Salarchaeum_japonicum                      27.19208
#> Salarchaeum_japonicum___Haloferax_mediterranei                  29.79323
#> Salarchaeum_japonicum___Haloferax_volcanii                      27.75060
#>                                                mismatching_target_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                   18.69824
#> Haloferax_mediterranei___Salarchaeum_japonicum                29.38789
#> Haloferax_volcanii___Haloferax_mediterranei                   18.51315
#> Haloferax_volcanii___Salarchaeum_japonicum                    27.37020
#> Salarchaeum_japonicum___Haloferax_mediterranei                29.53663
#> Salarchaeum_japonicum___Haloferax_volcanii                    27.71564
#>                                                mismatching_target_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                 22.53521
#> Haloferax_mediterranei___Salarchaeum_japonicum              33.00406
#> Haloferax_volcanii___Haloferax_mediterranei                 22.02030
#> Haloferax_volcanii___Salarchaeum_japonicum                  30.85907
#> Salarchaeum_japonicum___Haloferax_mediterranei              33.50436
#> Salarchaeum_japonicum___Haloferax_volcanii                  31.45826
#>                                                mismatching_target_Max
#> Haloferax_mediterranei___Haloferax_volcanii                  38.88889
#> Haloferax_mediterranei___Salarchaeum_japonicum               43.05136
#> Haloferax_volcanii___Haloferax_mediterranei                  36.30363
#> Haloferax_volcanii___Salarchaeum_japonicum                   42.26519
#> Salarchaeum_japonicum___Haloferax_mediterranei               44.86301
#> Salarchaeum_japonicum___Haloferax_volcanii                   44.33735
#>                                                mismatching_target_L50
#> Haloferax_mediterranei___Haloferax_volcanii                  20.80722
#> Haloferax_mediterranei___Salarchaeum_japonicum               30.41317
#> Haloferax_volcanii___Haloferax_mediterranei                  20.53047
#> Haloferax_volcanii___Salarchaeum_japonicum                   28.45336
#> Salarchaeum_japonicum___Haloferax_mediterranei               30.59334
#> Salarchaeum_japonicum___Haloferax_volcanii                   28.82060
#>                                                mismatching_target_Total
#> Haloferax_mediterranei___Haloferax_volcanii                    17819.42
#> Haloferax_mediterranei___Salarchaeum_japonicum                 33208.31
#> Haloferax_volcanii___Haloferax_mediterranei                    18661.25
#> Haloferax_volcanii___Salarchaeum_japonicum                     30052.48
#> Salarchaeum_japonicum___Haloferax_mediterranei                 33996.66
#> Salarchaeum_japonicum___Haloferax_volcanii                     30487.20
#>                                                mismatching_target_N
#> Haloferax_mediterranei___Haloferax_volcanii                     953
#> Haloferax_mediterranei___Salarchaeum_japonicum                 1130
#> Haloferax_volcanii___Haloferax_mediterranei                    1008
#> Haloferax_volcanii___Salarchaeum_japonicum                     1098
#> Salarchaeum_japonicum___Haloferax_mediterranei                 1151
#> Salarchaeum_japonicum___Haloferax_volcanii                     1100
#>                                                mismatching_query_Min
#> Haloferax_mediterranei___Haloferax_volcanii                 2.754237
#> Haloferax_mediterranei___Salarchaeum_japonicum              4.819277
#> Haloferax_volcanii___Haloferax_mediterranei                 3.086420
#> Haloferax_volcanii___Salarchaeum_japonicum                  2.666667
#> Salarchaeum_japonicum___Haloferax_mediterranei              2.439024
#> Salarchaeum_japonicum___Haloferax_volcanii                  1.886793
#>                                                mismatching_query_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                14.27908
#> Haloferax_mediterranei___Salarchaeum_japonicum             26.07885
#> Haloferax_volcanii___Haloferax_mediterranei                14.33766
#> Haloferax_volcanii___Salarchaeum_japonicum                 24.11825
#> Salarchaeum_japonicum___Haloferax_mediterranei             25.90856
#> Salarchaeum_japonicum___Haloferax_volcanii                 23.81305
#>                                                mismatching_query_Median
#> Haloferax_mediterranei___Haloferax_volcanii                    17.42101
#> Haloferax_mediterranei___Salarchaeum_japonicum                 29.87798
#> Haloferax_volcanii___Haloferax_mediterranei                    17.21565
#> Haloferax_volcanii___Salarchaeum_japonicum                     27.76514
#> Salarchaeum_japonicum___Haloferax_mediterranei                 29.35780
#> Salarchaeum_japonicum___Haloferax_volcanii                     27.15090
#>                                                mismatching_query_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                  18.68376
#> Haloferax_mediterranei___Salarchaeum_japonicum               29.72322
#> Haloferax_volcanii___Haloferax_mediterranei                  18.53263
#> Haloferax_volcanii___Salarchaeum_japonicum                   27.75442
#> Salarchaeum_japonicum___Haloferax_mediterranei               29.23555
#> Salarchaeum_japonicum___Haloferax_volcanii                   27.34125
#>                                                mismatching_query_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                22.25705
#> Haloferax_mediterranei___Salarchaeum_japonicum             33.55049
#> Haloferax_volcanii___Haloferax_mediterranei                21.97991
#> Haloferax_volcanii___Salarchaeum_japonicum                 31.55881
#> Salarchaeum_japonicum___Haloferax_mediterranei             32.92805
#> Salarchaeum_japonicum___Haloferax_volcanii                 30.81705
#>                                                mismatching_query_Max
#> Haloferax_mediterranei___Haloferax_volcanii                 38.88889
#> Haloferax_mediterranei___Salarchaeum_japonicum              43.24324
#> Haloferax_volcanii___Haloferax_mediterranei                 36.30363
#> Haloferax_volcanii___Salarchaeum_japonicum                  42.60090
#> Salarchaeum_japonicum___Haloferax_mediterranei              43.73957
#> Salarchaeum_japonicum___Haloferax_volcanii                  44.33735
#>                                                mismatching_query_L50
#> Haloferax_mediterranei___Haloferax_volcanii                 20.77580
#> Haloferax_mediterranei___Salarchaeum_japonicum              30.75157
#> Haloferax_volcanii___Haloferax_mediterranei                 20.56654
#> Haloferax_volcanii___Salarchaeum_japonicum                  28.84444
#> Salarchaeum_japonicum___Haloferax_mediterranei              30.29074
#> Salarchaeum_japonicum___Haloferax_volcanii                  28.44225
#>                                                mismatching_query_Total
#> Haloferax_mediterranei___Haloferax_volcanii                   17805.63
#> Haloferax_mediterranei___Salarchaeum_japonicum                33587.24
#> Haloferax_volcanii___Haloferax_mediterranei                   18680.90
#> Haloferax_volcanii___Salarchaeum_japonicum                    30474.35
#> Salarchaeum_japonicum___Haloferax_mediterranei                33650.12
#> Salarchaeum_japonicum___Haloferax_volcanii                    30075.38
#>                                                mismatching_query_N
#> Haloferax_mediterranei___Haloferax_volcanii                    953
#> Haloferax_mediterranei___Salarchaeum_japonicum                1130
#> Haloferax_volcanii___Haloferax_mediterranei                   1008
#> Haloferax_volcanii___Salarchaeum_japonicum                    1098
#> Salarchaeum_japonicum___Haloferax_mediterranei                1151
#> Salarchaeum_japonicum___Haloferax_volcanii                    1100
#>                                                aligned_width_target_Min
#> Haloferax_mediterranei___Haloferax_volcanii                          74
#> Haloferax_mediterranei___Salarchaeum_japonicum                       73
#> Haloferax_volcanii___Haloferax_mediterranei                          74
#> Haloferax_volcanii___Salarchaeum_japonicum                           76
#> Salarchaeum_japonicum___Haloferax_mediterranei                       73
#> Salarchaeum_japonicum___Haloferax_volcanii                           75
#>                                                aligned_width_target_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                     739.00
#> Haloferax_mediterranei___Salarchaeum_japonicum                  572.25
#> Haloferax_volcanii___Haloferax_mediterranei                     713.00
#> Haloferax_volcanii___Salarchaeum_japonicum                      618.00
#> Salarchaeum_japonicum___Haloferax_mediterranei                  547.00
#> Salarchaeum_japonicum___Haloferax_volcanii                      606.75
#>                                                aligned_width_target_Median
#> Haloferax_mediterranei___Haloferax_volcanii                         1583.0
#> Haloferax_mediterranei___Salarchaeum_japonicum                       949.5
#> Haloferax_volcanii___Haloferax_mediterranei                         1519.0
#> Haloferax_volcanii___Salarchaeum_japonicum                           997.0
#> Salarchaeum_japonicum___Haloferax_mediterranei                       925.0
#> Salarchaeum_japonicum___Haloferax_volcanii                           982.0
#>                                                aligned_width_target_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                     2636.321
#> Haloferax_mediterranei___Salarchaeum_japonicum                  1199.573
#> Haloferax_volcanii___Haloferax_mediterranei                     2486.112
#> Haloferax_volcanii___Salarchaeum_japonicum                      1314.443
#> Salarchaeum_japonicum___Haloferax_mediterranei                  1147.524
#> Salarchaeum_japonicum___Haloferax_volcanii                      1285.771
#>                                                aligned_width_target_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                    3661.00
#> Haloferax_mediterranei___Salarchaeum_japonicum                 1493.50
#> Haloferax_volcanii___Haloferax_mediterranei                    3406.75
#> Haloferax_volcanii___Salarchaeum_japonicum                     1645.00
#> Salarchaeum_japonicum___Haloferax_mediterranei                 1447.50
#> Salarchaeum_japonicum___Haloferax_volcanii                     1618.50
#>                                                aligned_width_target_Max
#> Haloferax_mediterranei___Haloferax_volcanii                       24678
#> Haloferax_mediterranei___Salarchaeum_japonicum                    14605
#> Haloferax_volcanii___Haloferax_mediterranei                       24657
#> Haloferax_volcanii___Salarchaeum_japonicum                        14121
#> Salarchaeum_japonicum___Haloferax_mediterranei                    14219
#> Salarchaeum_japonicum___Haloferax_volcanii                        13840
#>                                                aligned_width_target_L50
#> Haloferax_mediterranei___Haloferax_volcanii                    5855.103
#> Haloferax_mediterranei___Salarchaeum_japonicum                 2094.926
#> Haloferax_volcanii___Haloferax_mediterranei                    5424.008
#> Haloferax_volcanii___Salarchaeum_japonicum                     2303.184
#> Salarchaeum_japonicum___Haloferax_mediterranei                 1996.224
#> Salarchaeum_japonicum___Haloferax_volcanii                     2243.422
#>                                                aligned_width_target_Total
#> Haloferax_mediterranei___Haloferax_volcanii                       2512414
#> Haloferax_mediterranei___Salarchaeum_japonicum                    1355517
#> Haloferax_volcanii___Haloferax_mediterranei                       2506001
#> Haloferax_volcanii___Salarchaeum_japonicum                        1443258
#> Salarchaeum_japonicum___Haloferax_mediterranei                    1320800
#> Salarchaeum_japonicum___Haloferax_volcanii                        1414348
#>                                                aligned_width_target_N
#> Haloferax_mediterranei___Haloferax_volcanii                       953
#> Haloferax_mediterranei___Salarchaeum_japonicum                   1130
#> Haloferax_volcanii___Haloferax_mediterranei                      1008
#> Haloferax_volcanii___Salarchaeum_japonicum                       1098
#> Salarchaeum_japonicum___Haloferax_mediterranei                   1151
#> Salarchaeum_japonicum___Haloferax_volcanii                       1100
#>                                                aligned_width_query_Min
#> Haloferax_mediterranei___Haloferax_volcanii                         74
#> Haloferax_mediterranei___Salarchaeum_japonicum                      73
#> Haloferax_volcanii___Haloferax_mediterranei                         74
#> Haloferax_volcanii___Salarchaeum_japonicum                          75
#> Salarchaeum_japonicum___Haloferax_mediterranei                      73
#> Salarchaeum_japonicum___Haloferax_volcanii                          76
#>                                                aligned_width_query_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                    740.00
#> Haloferax_mediterranei___Salarchaeum_japonicum                 567.25
#> Haloferax_volcanii___Haloferax_mediterranei                    710.00
#> Haloferax_volcanii___Salarchaeum_japonicum                     607.50
#> Salarchaeum_japonicum___Haloferax_mediterranei                 546.50
#> Salarchaeum_japonicum___Haloferax_volcanii                     617.00
#>                                                aligned_width_query_Median
#> Haloferax_mediterranei___Haloferax_volcanii                        1585.0
#> Haloferax_mediterranei___Salarchaeum_japonicum                      940.5
#> Haloferax_volcanii___Haloferax_mediterranei                        1529.5
#> Haloferax_volcanii___Salarchaeum_japonicum                          984.0
#> Salarchaeum_japonicum___Haloferax_mediterranei                      925.0
#> Salarchaeum_japonicum___Haloferax_volcanii                          994.5
#>                                                aligned_width_query_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                    2640.533
#> Haloferax_mediterranei___Salarchaeum_japonicum                 1181.735
#> Haloferax_volcanii___Haloferax_mediterranei                    2482.072
#> Haloferax_volcanii___Salarchaeum_japonicum                     1289.610
#> Salarchaeum_japonicum___Haloferax_mediterranei                 1163.729
#> Salarchaeum_japonicum___Haloferax_volcanii                     1310.072
#>                                                aligned_width_query_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                   3674.00
#> Haloferax_mediterranei___Salarchaeum_japonicum                1472.00
#> Haloferax_volcanii___Haloferax_mediterranei                   3403.00
#> Haloferax_volcanii___Salarchaeum_japonicum                    1621.50
#> Salarchaeum_japonicum___Haloferax_mediterranei                1453.50
#> Salarchaeum_japonicum___Haloferax_volcanii                    1644.25
#>                                                aligned_width_query_Max
#> Haloferax_mediterranei___Haloferax_volcanii                      24657
#> Haloferax_mediterranei___Salarchaeum_japonicum                   14503
#> Haloferax_volcanii___Haloferax_mediterranei                      24678
#> Haloferax_volcanii___Salarchaeum_japonicum                       13840
#> Salarchaeum_japonicum___Haloferax_mediterranei                   14244
#> Salarchaeum_japonicum___Haloferax_volcanii                       14121
#>                                                aligned_width_query_L50
#> Haloferax_mediterranei___Haloferax_volcanii                   5862.763
#> Haloferax_mediterranei___Salarchaeum_japonicum                2053.436
#> Haloferax_volcanii___Haloferax_mediterranei                   5418.920
#> Haloferax_volcanii___Salarchaeum_japonicum                    2242.932
#> Salarchaeum_japonicum___Haloferax_mediterranei                2033.865
#> Salarchaeum_japonicum___Haloferax_volcanii                    2303.140
#>                                                aligned_width_query_Total
#> Haloferax_mediterranei___Haloferax_volcanii                      2516428
#> Haloferax_mediterranei___Salarchaeum_japonicum                   1335361
#> Haloferax_volcanii___Haloferax_mediterranei                      2501929
#> Haloferax_volcanii___Salarchaeum_japonicum                       1415992
#> Salarchaeum_japonicum___Haloferax_mediterranei                   1339452
#> Salarchaeum_japonicum___Haloferax_volcanii                       1441079
#>                                                aligned_width_query_N
#> Haloferax_mediterranei___Haloferax_volcanii                      953
#> Haloferax_mediterranei___Salarchaeum_japonicum                  1130
#> Haloferax_volcanii___Haloferax_mediterranei                     1008
#> Haloferax_volcanii___Salarchaeum_japonicum                      1098
#> Salarchaeum_japonicum___Haloferax_mediterranei                  1151
#> Salarchaeum_japonicum___Haloferax_volcanii                      1100
#>                                                chain_width_target_Min
#> Haloferax_mediterranei___Haloferax_volcanii                       102
#> Haloferax_mediterranei___Salarchaeum_japonicum                     76
#> Haloferax_volcanii___Haloferax_mediterranei                       102
#> Haloferax_volcanii___Salarchaeum_japonicum                         76
#> Salarchaeum_japonicum___Haloferax_mediterranei                     76
#> Salarchaeum_japonicum___Haloferax_volcanii                         76
#>                                                chain_width_target_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                   664.75
#> Haloferax_mediterranei___Salarchaeum_japonicum                656.50
#> Haloferax_volcanii___Haloferax_mediterranei                   688.00
#> Haloferax_volcanii___Salarchaeum_japonicum                    664.50
#> Salarchaeum_japonicum___Haloferax_mediterranei                642.25
#> Salarchaeum_japonicum___Haloferax_volcanii                    665.00
#>                                                chain_width_target_Median
#> Haloferax_mediterranei___Haloferax_volcanii                       1460.0
#> Haloferax_mediterranei___Salarchaeum_japonicum                    1272.5
#> Haloferax_volcanii___Haloferax_mediterranei                       1584.0
#> Haloferax_volcanii___Salarchaeum_japonicum                        1185.0
#> Salarchaeum_japonicum___Haloferax_mediterranei                    1227.5
#> Salarchaeum_japonicum___Haloferax_volcanii                        1161.0
#>                                                chain_width_target_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                  12025.552
#> Haloferax_mediterranei___Salarchaeum_japonicum                2962.319
#> Haloferax_volcanii___Haloferax_mediterranei                  11835.645
#> Haloferax_volcanii___Salarchaeum_japonicum                    2770.793
#> Salarchaeum_japonicum___Haloferax_mediterranei                2524.070
#> Salarchaeum_japonicum___Haloferax_volcanii                    2485.457
#>                                                chain_width_target_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                  8954.75
#> Haloferax_mediterranei___Salarchaeum_japonicum               3465.25
#> Haloferax_volcanii___Haloferax_mediterranei                  9155.50
#> Haloferax_volcanii___Salarchaeum_japonicum                   3301.00
#> Salarchaeum_japonicum___Haloferax_mediterranei               2980.00
#> Salarchaeum_japonicum___Haloferax_volcanii                   2899.00
#>                                                chain_width_target_Max
#> Haloferax_mediterranei___Haloferax_volcanii                    157290
#> Haloferax_mediterranei___Salarchaeum_japonicum                  30070
#> Haloferax_volcanii___Haloferax_mediterranei                    168677
#> Haloferax_volcanii___Salarchaeum_japonicum                      75091
#> Salarchaeum_japonicum___Haloferax_mediterranei                  22286
#> Salarchaeum_japonicum___Haloferax_volcanii                      58986
#>                                                chain_width_target_L50
#> Haloferax_mediterranei___Haloferax_volcanii                 63618.880
#> Haloferax_mediterranei___Salarchaeum_japonicum               9179.978
#> Haloferax_volcanii___Haloferax_mediterranei                 63224.080
#> Haloferax_volcanii___Salarchaeum_japonicum                  10356.492
#> Salarchaeum_japonicum___Haloferax_mediterranei               6943.589
#> Salarchaeum_japonicum___Haloferax_volcanii                   8600.512
#>                                                chain_width_target_Total
#> Haloferax_mediterranei___Haloferax_volcanii                     3006388
#> Haloferax_mediterranei___Salarchaeum_japonicum                  1854412
#> Haloferax_volcanii___Haloferax_mediterranei                     2970747
#> Haloferax_volcanii___Salarchaeum_japonicum                      1870285
#> Salarchaeum_japonicum___Haloferax_mediterranei                  1585116
#> Salarchaeum_japonicum___Haloferax_volcanii                      1675198
#>                                                chain_width_target_N
#> Haloferax_mediterranei___Haloferax_volcanii                     250
#> Haloferax_mediterranei___Salarchaeum_japonicum                  626
#> Haloferax_volcanii___Haloferax_mediterranei                     251
#> Haloferax_volcanii___Salarchaeum_japonicum                      675
#> Salarchaeum_japonicum___Haloferax_mediterranei                  628
#> Salarchaeum_japonicum___Haloferax_volcanii                      674
#>                                                chain_width_query_Min
#> Haloferax_mediterranei___Haloferax_volcanii                      102
#> Haloferax_mediterranei___Salarchaeum_japonicum                    76
#> Haloferax_volcanii___Haloferax_mediterranei                      102
#> Haloferax_volcanii___Salarchaeum_japonicum                        76
#> Salarchaeum_japonicum___Haloferax_mediterranei                    76
#> Salarchaeum_japonicum___Haloferax_volcanii                        76
#>                                                chain_width_query_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                  685.75
#> Haloferax_mediterranei___Salarchaeum_japonicum               652.50
#> Haloferax_volcanii___Haloferax_mediterranei                  686.50
#> Haloferax_volcanii___Salarchaeum_japonicum                   664.00
#> Salarchaeum_japonicum___Haloferax_mediterranei               640.00
#> Salarchaeum_japonicum___Haloferax_volcanii                   664.25
#>                                                chain_width_query_Median
#> Haloferax_mediterranei___Haloferax_volcanii                      1575.0
#> Haloferax_mediterranei___Salarchaeum_japonicum                   1243.5
#> Haloferax_volcanii___Haloferax_mediterranei                      1487.0
#> Haloferax_volcanii___Salarchaeum_japonicum                       1162.0
#> Salarchaeum_japonicum___Haloferax_mediterranei                   1258.5
#> Salarchaeum_japonicum___Haloferax_volcanii                       1164.0
#>                                                chain_width_query_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                 11888.996
#> Haloferax_mediterranei___Salarchaeum_japonicum               2538.845
#> Haloferax_volcanii___Haloferax_mediterranei                 11951.837
#> Haloferax_volcanii___Salarchaeum_japonicum                   2466.474
#> Salarchaeum_japonicum___Haloferax_mediterranei               2948.822
#> Salarchaeum_japonicum___Haloferax_volcanii                   2775.111
#>                                                chain_width_query_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                 9232.75
#> Haloferax_mediterranei___Salarchaeum_japonicum              3055.00
#> Haloferax_volcanii___Haloferax_mediterranei                 8792.00
#> Haloferax_volcanii___Salarchaeum_japonicum                  2875.50
#> Salarchaeum_japonicum___Haloferax_mediterranei              3407.50
#> Salarchaeum_japonicum___Haloferax_volcanii                  3461.75
#>                                                chain_width_query_Max
#> Haloferax_mediterranei___Haloferax_volcanii                   168677
#> Haloferax_mediterranei___Salarchaeum_japonicum                 22286
#> Haloferax_volcanii___Haloferax_mediterranei                   157290
#> Haloferax_volcanii___Salarchaeum_japonicum                     58986
#> Salarchaeum_japonicum___Haloferax_mediterranei                 31812
#> Salarchaeum_japonicum___Haloferax_volcanii                     75091
#>                                                chain_width_query_L50
#> Haloferax_mediterranei___Haloferax_volcanii                64429.128
#> Haloferax_mediterranei___Salarchaeum_japonicum              6795.269
#> Haloferax_volcanii___Haloferax_mediterranei                62774.271
#> Haloferax_volcanii___Salarchaeum_japonicum                  8298.316
#> Salarchaeum_japonicum___Haloferax_mediterranei              9516.304
#> Salarchaeum_japonicum___Haloferax_volcanii                 10630.056
#>                                                chain_width_query_Total
#> Haloferax_mediterranei___Haloferax_volcanii                    2972249
#> Haloferax_mediterranei___Salarchaeum_japonicum                 1589317
#> Haloferax_volcanii___Haloferax_mediterranei                    2999911
#> Haloferax_volcanii___Salarchaeum_japonicum                     1664870
#> Salarchaeum_japonicum___Haloferax_mediterranei                 1851860
#> Salarchaeum_japonicum___Haloferax_volcanii                     1870425
#>                                                chain_width_query_N
#> Haloferax_mediterranei___Haloferax_volcanii                    250
#> Haloferax_mediterranei___Salarchaeum_japonicum                 626
#> Haloferax_volcanii___Haloferax_mediterranei                    251
#> Haloferax_volcanii___Salarchaeum_japonicum                     675
#> Salarchaeum_japonicum___Haloferax_mediterranei                 628
#> Salarchaeum_japonicum___Haloferax_volcanii                     674
#>                                                collinear_width_target_Min
#> Haloferax_mediterranei___Haloferax_volcanii                            74
#> Haloferax_mediterranei___Salarchaeum_japonicum                         73
#> Haloferax_volcanii___Haloferax_mediterranei                            74
#> Haloferax_volcanii___Salarchaeum_japonicum                             77
#> Salarchaeum_japonicum___Haloferax_mediterranei                         73
#> Salarchaeum_japonicum___Haloferax_volcanii                             75
#>                                                collinear_width_target_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                       870.00
#> Haloferax_mediterranei___Salarchaeum_japonicum                    633.75
#> Haloferax_volcanii___Haloferax_mediterranei                       836.50
#> Haloferax_volcanii___Salarchaeum_japonicum                        711.00
#> Salarchaeum_japonicum___Haloferax_mediterranei                    606.00
#> Salarchaeum_japonicum___Haloferax_volcanii                        712.50
#>                                                collinear_width_target_Median
#> Haloferax_mediterranei___Haloferax_volcanii                           1905.0
#> Haloferax_mediterranei___Salarchaeum_japonicum                        1034.0
#> Haloferax_volcanii___Haloferax_mediterranei                           1832.5
#> Haloferax_volcanii___Salarchaeum_japonicum                            1156.0
#> Salarchaeum_japonicum___Haloferax_mediterranei                        1005.0
#> Salarchaeum_japonicum___Haloferax_volcanii                            1151.0
#>                                                collinear_width_target_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                       2907.272
#> Haloferax_mediterranei___Salarchaeum_japonicum                    1316.394
#> Haloferax_volcanii___Haloferax_mediterranei                       2710.034
#> Haloferax_volcanii___Salarchaeum_japonicum                        1491.551
#> Salarchaeum_japonicum___Haloferax_mediterranei                    1251.471
#> Salarchaeum_japonicum___Haloferax_volcanii                        1443.375
#>                                                collinear_width_target_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                      3987.00
#> Haloferax_mediterranei___Salarchaeum_japonicum                   1603.50
#> Haloferax_volcanii___Haloferax_mediterranei                      3815.75
#> Haloferax_volcanii___Salarchaeum_japonicum                       1926.00
#> Salarchaeum_japonicum___Haloferax_mediterranei                   1516.00
#> Salarchaeum_japonicum___Haloferax_volcanii                       1868.75
#>                                                collinear_width_target_Max
#> Haloferax_mediterranei___Haloferax_volcanii                         24678
#> Haloferax_mediterranei___Salarchaeum_japonicum                      14605
#> Haloferax_volcanii___Haloferax_mediterranei                         24657
#> Haloferax_volcanii___Salarchaeum_japonicum                          14121
#> Salarchaeum_japonicum___Haloferax_mediterranei                      14219
#> Salarchaeum_japonicum___Haloferax_volcanii                          13840
#>                                                collinear_width_target_L50
#> Haloferax_mediterranei___Haloferax_volcanii                      6043.839
#> Haloferax_mediterranei___Salarchaeum_japonicum                   2335.696
#> Haloferax_volcanii___Haloferax_mediterranei                      5583.845
#> Haloferax_volcanii___Salarchaeum_japonicum                       2570.590
#> Salarchaeum_japonicum___Haloferax_mediterranei                   2209.750
#> Salarchaeum_japonicum___Haloferax_volcanii                       2443.543
#>                                                collinear_width_target_Total
#> Haloferax_mediterranei___Haloferax_volcanii                         2363612
#> Haloferax_mediterranei___Salarchaeum_japonicum                       947804
#> Haloferax_volcanii___Haloferax_mediterranei                         2357730
#> Haloferax_volcanii___Salarchaeum_japonicum                           926253
#> Salarchaeum_japonicum___Haloferax_mediterranei                       927340
#> Salarchaeum_japonicum___Haloferax_volcanii                           900666
#>                                                collinear_width_target_N
#> Haloferax_mediterranei___Haloferax_volcanii                         813
#> Haloferax_mediterranei___Salarchaeum_japonicum                      720
#> Haloferax_volcanii___Haloferax_mediterranei                         870
#> Haloferax_volcanii___Salarchaeum_japonicum                          621
#> Salarchaeum_japonicum___Haloferax_mediterranei                      741
#> Salarchaeum_japonicum___Haloferax_volcanii                          624
#>                                                isolated_width_target_Min
#> Haloferax_mediterranei___Haloferax_volcanii                          102
#> Haloferax_mediterranei___Salarchaeum_japonicum                        76
#> Haloferax_volcanii___Haloferax_mediterranei                          102
#> Haloferax_volcanii___Salarchaeum_japonicum                            76
#> Salarchaeum_japonicum___Haloferax_mediterranei                        76
#> Salarchaeum_japonicum___Haloferax_volcanii                            76
#>                                                isolated_width_target_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                      331.75
#> Haloferax_mediterranei___Salarchaeum_japonicum                   479.00
#> Haloferax_volcanii___Haloferax_mediterranei                      334.50
#> Haloferax_volcanii___Salarchaeum_japonicum                       531.00
#> Salarchaeum_japonicum___Haloferax_mediterranei                   447.25
#> Salarchaeum_japonicum___Haloferax_volcanii                       534.50
#>                                                isolated_width_target_Median
#> Haloferax_mediterranei___Haloferax_volcanii                           748.5
#> Haloferax_mediterranei___Salarchaeum_japonicum                        809.5
#> Haloferax_volcanii___Haloferax_mediterranei                           775.5
#> Haloferax_volcanii___Salarchaeum_japonicum                            861.0
#> Salarchaeum_japonicum___Haloferax_mediterranei                        794.0
#> Salarchaeum_japonicum___Haloferax_volcanii                            847.5
#>                                                isolated_width_target_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                     1062.8714
#> Haloferax_mediterranei___Salarchaeum_japonicum                   994.4220
#> Haloferax_volcanii___Haloferax_mediterranei                     1074.4275
#> Haloferax_volcanii___Salarchaeum_japonicum                      1083.8679
#> Salarchaeum_japonicum___Haloferax_mediterranei                   959.6585
#> Salarchaeum_japonicum___Haloferax_volcanii                      1079.1639
#>                                                isolated_width_target_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                     1214.75
#> Haloferax_mediterranei___Salarchaeum_japonicum                  1286.25
#> Haloferax_volcanii___Haloferax_mediterranei                     1220.75
#> Haloferax_volcanii___Salarchaeum_japonicum                      1293.00
#> Salarchaeum_japonicum___Haloferax_mediterranei                  1223.00
#> Salarchaeum_japonicum___Haloferax_volcanii                      1257.50
#>                                                isolated_width_target_Max
#> Haloferax_mediterranei___Haloferax_volcanii                        11539
#> Haloferax_mediterranei___Salarchaeum_japonicum                      6209
#> Haloferax_volcanii___Haloferax_mediterranei                        11522
#> Haloferax_volcanii___Salarchaeum_japonicum                          6207
#> Salarchaeum_japonicum___Haloferax_mediterranei                      6135
#> Salarchaeum_japonicum___Haloferax_volcanii                          8407
#>                                                isolated_width_target_L50
#> Haloferax_mediterranei___Haloferax_volcanii                     2857.160
#> Haloferax_mediterranei___Salarchaeum_japonicum                  1535.210
#> Haloferax_volcanii___Haloferax_mediterranei                     2882.358
#> Haloferax_volcanii___Salarchaeum_japonicum                      1824.105
#> Salarchaeum_japonicum___Haloferax_mediterranei                  1492.970
#> Salarchaeum_japonicum___Haloferax_volcanii                      1892.540
#>                                                isolated_width_target_Total
#> Haloferax_mediterranei___Haloferax_volcanii                         148802
#> Haloferax_mediterranei___Salarchaeum_japonicum                      407713
#> Haloferax_volcanii___Haloferax_mediterranei                         148271
#> Haloferax_volcanii___Salarchaeum_japonicum                          517005
#> Salarchaeum_japonicum___Haloferax_mediterranei                      393460
#> Salarchaeum_japonicum___Haloferax_volcanii                          513682
#>                                                isolated_width_target_N
#> Haloferax_mediterranei___Haloferax_volcanii                        140
#> Haloferax_mediterranei___Salarchaeum_japonicum                     410
#> Haloferax_volcanii___Haloferax_mediterranei                        138
#> Haloferax_volcanii___Salarchaeum_japonicum                         477
#> Salarchaeum_japonicum___Haloferax_mediterranei                     410
#> Salarchaeum_japonicum___Haloferax_volcanii                         476
#>                                                bridge_width_target_Min
#> Haloferax_mediterranei___Haloferax_volcanii                          1
#> Haloferax_mediterranei___Salarchaeum_japonicum                      14
#> Haloferax_volcanii___Haloferax_mediterranei                          1
#> Haloferax_volcanii___Salarchaeum_japonicum                           8
#> Salarchaeum_japonicum___Haloferax_mediterranei                       1
#> Salarchaeum_japonicum___Haloferax_volcanii                           1
#>                                                bridge_width_target_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                    132.25
#> Haloferax_mediterranei___Salarchaeum_japonicum                 205.75
#> Haloferax_volcanii___Haloferax_mediterranei                     92.00
#> Haloferax_volcanii___Salarchaeum_japonicum                     212.50
#> Salarchaeum_japonicum___Haloferax_mediterranei                  90.00
#> Salarchaeum_japonicum___Haloferax_volcanii                      82.00
#>                                                bridge_width_target_Median
#> Haloferax_mediterranei___Haloferax_volcanii                         229.5
#> Haloferax_mediterranei___Salarchaeum_japonicum                      410.0
#> Haloferax_volcanii___Haloferax_mediterranei                         165.0
#> Haloferax_volcanii___Salarchaeum_japonicum                          445.0
#> Salarchaeum_japonicum___Haloferax_mediterranei                      209.0
#> Salarchaeum_japonicum___Haloferax_volcanii                          217.5
#>                                                bridge_width_target_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                    707.5602
#> Haloferax_mediterranei___Salarchaeum_japonicum                 989.8710
#> Haloferax_volcanii___Haloferax_mediterranei                    622.1499
#> Haloferax_volcanii___Salarchaeum_japonicum                    1009.5201
#> Salarchaeum_japonicum___Haloferax_mediterranei                 511.2495
#> Salarchaeum_japonicum___Haloferax_volcanii                     621.0714
#>                                                bridge_width_target_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                     655.5
#> Haloferax_mediterranei___Salarchaeum_japonicum                 1058.5
#> Haloferax_volcanii___Haloferax_mediterranei                     465.0
#> Haloferax_volcanii___Salarchaeum_japonicum                     1177.0
#> Salarchaeum_japonicum___Haloferax_mediterranei                  572.0
#> Salarchaeum_japonicum___Haloferax_volcanii                      606.5
#>                                                bridge_width_target_Max
#> Haloferax_mediterranei___Haloferax_volcanii                      24097
#> Haloferax_mediterranei___Salarchaeum_japonicum                   24174
#> Haloferax_volcanii___Haloferax_mediterranei                      55565
#> Haloferax_volcanii___Salarchaeum_japonicum                       47532
#> Salarchaeum_japonicum___Haloferax_mediterranei                   10772
#> Salarchaeum_japonicum___Haloferax_volcanii                       31759
#>                                                bridge_width_target_L50
#> Haloferax_mediterranei___Haloferax_volcanii                   4429.566
#> Haloferax_mediterranei___Salarchaeum_japonicum                4057.568
#> Haloferax_volcanii___Haloferax_mediterranei                   9966.593
#> Haloferax_volcanii___Salarchaeum_japonicum                    7423.215
#> Salarchaeum_japonicum___Haloferax_mediterranei                2098.948
#> Salarchaeum_japonicum___Haloferax_volcanii                    5588.236
#>                                                bridge_width_target_Total
#> Haloferax_mediterranei___Haloferax_volcanii                       493877
#> Haloferax_mediterranei___Salarchaeum_japonicum                    498895
#> Haloferax_volcanii___Haloferax_mediterranei                       464746
#> Haloferax_volcanii___Salarchaeum_japonicum                        427027
#> Salarchaeum_japonicum___Haloferax_mediterranei                    264316
#> Salarchaeum_japonicum___Haloferax_volcanii                        260850
#>                                                bridge_width_target_N
#> Haloferax_mediterranei___Haloferax_volcanii                      698
#> Haloferax_mediterranei___Salarchaeum_japonicum                   504
#> Haloferax_volcanii___Haloferax_mediterranei                      747
#> Haloferax_volcanii___Salarchaeum_japonicum                       423
#> Salarchaeum_japonicum___Haloferax_mediterranei                   517
#> Salarchaeum_japonicum___Haloferax_volcanii                       420
#>                                                breakpoint_width_target_Min
#> Haloferax_mediterranei___Haloferax_volcanii                              4
#> Haloferax_mediterranei___Salarchaeum_japonicum                          23
#> Haloferax_volcanii___Haloferax_mediterranei                              1
#> Haloferax_volcanii___Salarchaeum_japonicum                              13
#> Salarchaeum_japonicum___Haloferax_mediterranei                           1
#> Salarchaeum_japonicum___Haloferax_volcanii                               1
#>                                                breakpoint_width_target_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                        188.50
#> Haloferax_mediterranei___Salarchaeum_japonicum                     211.25
#> Haloferax_volcanii___Haloferax_mediterranei                        170.00
#> Haloferax_volcanii___Salarchaeum_japonicum                         192.00
#> Salarchaeum_japonicum___Haloferax_mediterranei                      97.00
#> Salarchaeum_japonicum___Haloferax_volcanii                          74.25
#>                                                breakpoint_width_target_Median
#> Haloferax_mediterranei___Haloferax_volcanii                             941.5
#> Haloferax_mediterranei___Salarchaeum_japonicum                          801.5
#> Haloferax_volcanii___Haloferax_mediterranei                             714.0
#> Haloferax_volcanii___Salarchaeum_japonicum                              789.5
#> Salarchaeum_japonicum___Haloferax_mediterranei                          359.0
#> Salarchaeum_japonicum___Haloferax_volcanii                              269.5
#>                                                breakpoint_width_target_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                        3587.335
#> Haloferax_mediterranei___Salarchaeum_japonicum                     3170.754
#> Haloferax_volcanii___Haloferax_mediterranei                        4086.273
#> Haloferax_volcanii___Salarchaeum_japonicum                         2989.345
#> Salarchaeum_japonicum___Haloferax_mediterranei                     1180.571
#> Salarchaeum_japonicum___Haloferax_volcanii                          991.991
#>                                                breakpoint_width_target_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                       4430.50
#> Haloferax_mediterranei___Salarchaeum_japonicum                    2700.25
#> Haloferax_volcanii___Haloferax_mediterranei                       3684.00
#> Haloferax_volcanii___Salarchaeum_japonicum                        2298.00
#> Salarchaeum_japonicum___Haloferax_mediterranei                    1289.00
#> Salarchaeum_japonicum___Haloferax_volcanii                        1098.50
#>                                                breakpoint_width_target_Max
#> Haloferax_mediterranei___Haloferax_volcanii                          49823
#> Haloferax_mediterranei___Salarchaeum_japonicum                       73976
#> Haloferax_volcanii___Haloferax_mediterranei                          62332
#> Haloferax_volcanii___Salarchaeum_japonicum                           70437
#> Salarchaeum_japonicum___Haloferax_mediterranei                       41890
#> Salarchaeum_japonicum___Haloferax_volcanii                           32528
#>                                                breakpoint_width_target_L50
#> Haloferax_mediterranei___Haloferax_volcanii                      17238.476
#> Haloferax_mediterranei___Salarchaeum_japonicum                   20663.367
#> Haloferax_volcanii___Haloferax_mediterranei                      21309.248
#> Haloferax_volcanii___Salarchaeum_japonicum                       20294.340
#> Salarchaeum_japonicum___Haloferax_mediterranei                    7333.855
#> Salarchaeum_japonicum___Haloferax_volcanii                        5529.435
#>                                                breakpoint_width_target_Total
#> Haloferax_mediterranei___Haloferax_volcanii                           868135
#> Haloferax_mediterranei___Salarchaeum_japonicum                       1972209
#> Haloferax_volcanii___Haloferax_mediterranei                          1001137
#> Haloferax_volcanii___Salarchaeum_japonicum                           2008840
#> Salarchaeum_japonicum___Haloferax_mediterranei                        735496
#> Salarchaeum_japonicum___Haloferax_volcanii                            660666
#>                                                breakpoint_width_target_N
#> Haloferax_mediterranei___Haloferax_volcanii                          242
#> Haloferax_mediterranei___Salarchaeum_japonicum                       622
#> Haloferax_volcanii___Haloferax_mediterranei                          245
#> Haloferax_volcanii___Salarchaeum_japonicum                           672
#> Salarchaeum_japonicum___Haloferax_mediterranei                       623
#> Salarchaeum_japonicum___Haloferax_volcanii                           666
#>                                                inverted_width_target_Min
#> Haloferax_mediterranei___Haloferax_volcanii                        57065
#> Haloferax_mediterranei___Salarchaeum_japonicum                      1057
#> Haloferax_volcanii___Haloferax_mediterranei                        19645
#> Haloferax_volcanii___Salarchaeum_japonicum                           596
#> Salarchaeum_japonicum___Haloferax_mediterranei                       956
#> Salarchaeum_japonicum___Haloferax_volcanii                           957
#>                                                inverted_width_target_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                     57065.0
#> Haloferax_mediterranei___Salarchaeum_japonicum                   1213.0
#> Haloferax_volcanii___Haloferax_mediterranei                     19645.0
#> Haloferax_volcanii___Salarchaeum_japonicum                        997.0
#> Salarchaeum_japonicum___Haloferax_mediterranei                   1139.0
#> Salarchaeum_japonicum___Haloferax_volcanii                       1140.5
#>                                                inverted_width_target_Median
#> Haloferax_mediterranei___Haloferax_volcanii                           57065
#> Haloferax_mediterranei___Salarchaeum_japonicum                         1369
#> Haloferax_volcanii___Haloferax_mediterranei                           19645
#> Haloferax_volcanii___Salarchaeum_japonicum                             1398
#> Salarchaeum_japonicum___Haloferax_mediterranei                         1322
#> Salarchaeum_japonicum___Haloferax_volcanii                             1324
#>                                                inverted_width_target_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                     57065.000
#> Haloferax_mediterranei___Salarchaeum_japonicum                   7989.000
#> Haloferax_volcanii___Haloferax_mediterranei                     19645.000
#> Haloferax_volcanii___Salarchaeum_japonicum                       2725.000
#> Salarchaeum_japonicum___Haloferax_mediterranei                   3177.333
#> Salarchaeum_japonicum___Haloferax_volcanii                       1498.333
#>                                                inverted_width_target_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                     57065.0
#> Haloferax_mediterranei___Salarchaeum_japonicum                  11455.0
#> Haloferax_volcanii___Haloferax_mediterranei                     19645.0
#> Haloferax_volcanii___Salarchaeum_japonicum                       3789.5
#> Salarchaeum_japonicum___Haloferax_mediterranei                   4288.0
#> Salarchaeum_japonicum___Haloferax_volcanii                       1769.0
#>                                                inverted_width_target_Max
#> Haloferax_mediterranei___Haloferax_volcanii                        57065
#> Haloferax_mediterranei___Salarchaeum_japonicum                     21541
#> Haloferax_volcanii___Haloferax_mediterranei                        19645
#> Haloferax_volcanii___Salarchaeum_japonicum                          6181
#> Salarchaeum_japonicum___Haloferax_mediterranei                      7254
#> Salarchaeum_japonicum___Haloferax_volcanii                          2214
#>                                                inverted_width_target_L50
#> Haloferax_mediterranei___Haloferax_volcanii                    57065.000
#> Haloferax_mediterranei___Salarchaeum_japonicum                 19485.380
#> Haloferax_volcanii___Haloferax_mediterranei                    19645.000
#> Haloferax_volcanii___Salarchaeum_japonicum                      4955.888
#> Salarchaeum_japonicum___Haloferax_mediterranei                  5799.637
#> Salarchaeum_japonicum___Haloferax_volcanii                      1684.232
#>                                                inverted_width_target_Total
#> Haloferax_mediterranei___Haloferax_volcanii                          57065
#> Haloferax_mediterranei___Salarchaeum_japonicum                       23967
#> Haloferax_volcanii___Haloferax_mediterranei                          19645
#> Haloferax_volcanii___Salarchaeum_japonicum                            8175
#> Salarchaeum_japonicum___Haloferax_mediterranei                        9532
#> Salarchaeum_japonicum___Haloferax_volcanii                            4495
#>                                                inverted_width_target_N
#> Haloferax_mediterranei___Haloferax_volcanii                          1
#> Haloferax_mediterranei___Salarchaeum_japonicum                       3
#> Haloferax_volcanii___Haloferax_mediterranei                          1
#> Haloferax_volcanii___Salarchaeum_japonicum                           3
#> Salarchaeum_japonicum___Haloferax_mediterranei                       3
#> Salarchaeum_japonicum___Haloferax_volcanii                           3
#>                                                translocated_width_target_Min
#> Haloferax_mediterranei___Haloferax_volcanii                              138
#> Haloferax_mediterranei___Salarchaeum_japonicum                            79
#> Haloferax_volcanii___Haloferax_mediterranei                              145
#> Haloferax_volcanii___Salarchaeum_japonicum                               306
#> Salarchaeum_japonicum___Haloferax_mediterranei                           114
#> Salarchaeum_japonicum___Haloferax_volcanii                               180
#>                                                translocated_width_target_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                         2603.00
#> Haloferax_mediterranei___Salarchaeum_japonicum                       946.50
#> Haloferax_volcanii___Haloferax_mediterranei                         5103.25
#> Haloferax_volcanii___Salarchaeum_japonicum                          1266.00
#> Salarchaeum_japonicum___Haloferax_mediterranei                      1154.25
#> Salarchaeum_japonicum___Haloferax_volcanii                           828.50
#>                                                translocated_width_target_Median
#> Haloferax_mediterranei___Haloferax_volcanii                              8382.0
#> Haloferax_mediterranei___Salarchaeum_japonicum                           2157.5
#> Haloferax_volcanii___Haloferax_mediterranei                             26578.0
#> Haloferax_volcanii___Salarchaeum_japonicum                               3096.0
#> Salarchaeum_japonicum___Haloferax_mediterranei                           2408.5
#> Salarchaeum_japonicum___Haloferax_volcanii                               2314.0
#>                                                translocated_width_target_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                         21093.457
#> Haloferax_mediterranei___Salarchaeum_japonicum                       3722.810
#> Haloferax_volcanii___Haloferax_mediterranei                         37144.467
#> Haloferax_volcanii___Salarchaeum_japonicum                           5522.333
#> Salarchaeum_japonicum___Haloferax_mediterranei                       4427.120
#> Salarchaeum_japonicum___Haloferax_volcanii                           3326.326
#>                                                translocated_width_target_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                        28703.00
#> Haloferax_mediterranei___Salarchaeum_japonicum                      5175.25
#> Haloferax_volcanii___Haloferax_mediterranei                        50138.50
#> Haloferax_volcanii___Salarchaeum_japonicum                          5494.00
#> Salarchaeum_japonicum___Haloferax_mediterranei                      6228.00
#> Salarchaeum_japonicum___Haloferax_volcanii                          4839.75
#>                                                translocated_width_target_Max
#> Haloferax_mediterranei___Haloferax_volcanii                           124710
#> Haloferax_mediterranei___Salarchaeum_japonicum                         16846
#> Haloferax_volcanii___Haloferax_mediterranei                           168677
#> Haloferax_volcanii___Salarchaeum_japonicum                             75091
#> Salarchaeum_japonicum___Haloferax_mediterranei                         17177
#> Salarchaeum_japonicum___Haloferax_volcanii                             14780
#>                                                translocated_width_target_L50
#> Haloferax_mediterranei___Haloferax_volcanii                        57697.257
#> Haloferax_mediterranei___Salarchaeum_japonicum                      7715.236
#> Haloferax_volcanii___Haloferax_mediterranei                        77979.208
#> Haloferax_volcanii___Salarchaeum_japonicum                         26000.059
#> Salarchaeum_japonicum___Haloferax_mediterranei                      8710.173
#> Salarchaeum_japonicum___Haloferax_volcanii                          6264.928
#>                                                translocated_width_target_Total
#> Haloferax_mediterranei___Haloferax_volcanii                             738271
#> Haloferax_mediterranei___Salarchaeum_japonicum                          215923
#> Haloferax_volcanii___Haloferax_mediterranei                            1114334
#> Haloferax_volcanii___Salarchaeum_japonicum                              314773
#> Salarchaeum_japonicum___Haloferax_mediterranei                          221356
#> Salarchaeum_japonicum___Haloferax_volcanii                              153011
#>                                                translocated_width_target_N
#> Haloferax_mediterranei___Haloferax_volcanii                             35
#> Haloferax_mediterranei___Salarchaeum_japonicum                          58
#> Haloferax_volcanii___Haloferax_mediterranei                             30
#> Haloferax_volcanii___Salarchaeum_japonicum                              57
#> Salarchaeum_japonicum___Haloferax_mediterranei                          50
#> Salarchaeum_japonicum___Haloferax_volcanii                              46
#>                                                guessed_target_length_Min
#> Haloferax_mediterranei___Haloferax_volcanii                       131976
#> Haloferax_mediterranei___Salarchaeum_japonicum                    131976
#> Haloferax_volcanii___Haloferax_mediterranei                        85093
#> Haloferax_volcanii___Salarchaeum_japonicum                        437907
#> Salarchaeum_japonicum___Haloferax_mediterranei                    135208
#> Salarchaeum_japonicum___Haloferax_volcanii                        135208
#>                                                guessed_target_length_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                    274425.0
#> Haloferax_mediterranei___Salarchaeum_japonicum                 274425.0
#> Haloferax_volcanii___Haloferax_mediterranei                    349703.5
#> Haloferax_volcanii___Salarchaeum_japonicum                     536847.0
#> Salarchaeum_japonicum___Haloferax_mediterranei                 652424.8
#> Salarchaeum_japonicum___Haloferax_volcanii                     652424.8
#>                                                guessed_target_length_Median
#> Haloferax_mediterranei___Haloferax_volcanii                        413306.5
#> Haloferax_mediterranei___Salarchaeum_japonicum                     413306.5
#> Haloferax_volcanii___Haloferax_mediterranei                        536847.0
#> Haloferax_volcanii___Salarchaeum_japonicum                         635787.0
#> Salarchaeum_japonicum___Haloferax_mediterranei                    1169641.5
#> Salarchaeum_japonicum___Haloferax_volcanii                        1169641.5
#>                                                guessed_target_length_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                      976869.2
#> Haloferax_mediterranei___Salarchaeum_japonicum                   976869.2
#> Haloferax_volcanii___Haloferax_mediterranei                     1001636.2
#> Haloferax_volcanii___Salarchaeum_japonicum                      1307150.7
#> Salarchaeum_japonicum___Haloferax_mediterranei                  1169641.5
#> Salarchaeum_japonicum___Haloferax_volcanii                      1169641.5
#>                                                guessed_target_length_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                     1115751
#> Haloferax_mediterranei___Salarchaeum_japonicum                  1115751
#> Haloferax_volcanii___Haloferax_mediterranei                     1188780
#> Haloferax_volcanii___Salarchaeum_japonicum                      1741772
#> Salarchaeum_japonicum___Haloferax_mediterranei                  1686858
#> Salarchaeum_japonicum___Haloferax_volcanii                      1686858
#>                                                guessed_target_length_Max
#> Haloferax_mediterranei___Haloferax_volcanii                      2948888
#> Haloferax_mediterranei___Salarchaeum_japonicum                   2948888
#> Haloferax_volcanii___Haloferax_mediterranei                      2847758
#> Haloferax_volcanii___Salarchaeum_japonicum                       2847758
#> Salarchaeum_japonicum___Haloferax_mediterranei                   2204075
#> Salarchaeum_japonicum___Haloferax_volcanii                       2204075
#>                                                guessed_target_length_L50
#> Haloferax_mediterranei___Haloferax_volcanii                      2321629
#> Haloferax_mediterranei___Salarchaeum_japonicum                   2321629
#> Haloferax_volcanii___Haloferax_mediterranei                      2174680
#> Haloferax_volcanii___Salarchaeum_japonicum                       2220023
#> Salarchaeum_japonicum___Haloferax_mediterranei                   2084497
#> Salarchaeum_japonicum___Haloferax_volcanii                       2084497
#>                                                guessed_target_length_Total
#> Haloferax_mediterranei___Haloferax_volcanii                        3907477
#> Haloferax_mediterranei___Salarchaeum_japonicum                     3907477
#> Haloferax_volcanii___Haloferax_mediterranei                        4006545
#> Haloferax_volcanii___Salarchaeum_japonicum                         3921452
#> Salarchaeum_japonicum___Haloferax_mediterranei                     2339283
#> Salarchaeum_japonicum___Haloferax_volcanii                         2339283
#>                                                guessed_target_length_N
#> Haloferax_mediterranei___Haloferax_volcanii                          4
#> Haloferax_mediterranei___Salarchaeum_japonicum                       4
#> Haloferax_volcanii___Haloferax_mediterranei                          4
#> Haloferax_volcanii___Salarchaeum_japonicum                           3
#> Salarchaeum_japonicum___Haloferax_mediterranei                       2
#> Salarchaeum_japonicum___Haloferax_volcanii                           2
#>                                                guessed_query_length_Min
#> Haloferax_mediterranei___Haloferax_volcanii                       85093
#> Haloferax_mediterranei___Salarchaeum_japonicum                   135208
#> Haloferax_volcanii___Haloferax_mediterranei                      131976
#> Haloferax_volcanii___Salarchaeum_japonicum                       135208
#> Salarchaeum_japonicum___Haloferax_mediterranei                   131976
#> Salarchaeum_japonicum___Haloferax_volcanii                       437907
#>                                                guessed_query_length_Q1
#> Haloferax_mediterranei___Haloferax_volcanii                   349703.5
#> Haloferax_mediterranei___Salarchaeum_japonicum                652424.8
#> Haloferax_volcanii___Haloferax_mediterranei                   274425.0
#> Haloferax_volcanii___Salarchaeum_japonicum                    652424.8
#> Salarchaeum_japonicum___Haloferax_mediterranei                274425.0
#> Salarchaeum_japonicum___Haloferax_volcanii                    536847.0
#>                                                guessed_query_length_Median
#> Haloferax_mediterranei___Haloferax_volcanii                       536847.0
#> Haloferax_mediterranei___Salarchaeum_japonicum                   1169641.5
#> Haloferax_volcanii___Haloferax_mediterranei                       413306.5
#> Haloferax_volcanii___Salarchaeum_japonicum                       1169641.5
#> Salarchaeum_japonicum___Haloferax_mediterranei                    413306.5
#> Salarchaeum_japonicum___Haloferax_volcanii                        635787.0
#>                                                guessed_query_length_Mean
#> Haloferax_mediterranei___Haloferax_volcanii                    1001636.2
#> Haloferax_mediterranei___Salarchaeum_japonicum                 1169641.5
#> Haloferax_volcanii___Haloferax_mediterranei                     976869.2
#> Haloferax_volcanii___Salarchaeum_japonicum                     1169641.5
#> Salarchaeum_japonicum___Haloferax_mediterranei                  976869.2
#> Salarchaeum_japonicum___Haloferax_volcanii                     1307150.7
#>                                                guessed_query_length_Q3
#> Haloferax_mediterranei___Haloferax_volcanii                    1188780
#> Haloferax_mediterranei___Salarchaeum_japonicum                 1686858
#> Haloferax_volcanii___Haloferax_mediterranei                    1115751
#> Haloferax_volcanii___Salarchaeum_japonicum                     1686858
#> Salarchaeum_japonicum___Haloferax_mediterranei                 1115751
#> Salarchaeum_japonicum___Haloferax_volcanii                     1741772
#>                                                guessed_query_length_Max
#> Haloferax_mediterranei___Haloferax_volcanii                     2847758
#> Haloferax_mediterranei___Salarchaeum_japonicum                  2204075
#> Haloferax_volcanii___Haloferax_mediterranei                     2948888
#> Haloferax_volcanii___Salarchaeum_japonicum                      2204075
#> Salarchaeum_japonicum___Haloferax_mediterranei                  2948888
#> Salarchaeum_japonicum___Haloferax_volcanii                      2847758
#>                                                guessed_query_length_L50
#> Haloferax_mediterranei___Haloferax_volcanii                     2174680
#> Haloferax_mediterranei___Salarchaeum_japonicum                  2084497
#> Haloferax_volcanii___Haloferax_mediterranei                     2321629
#> Haloferax_volcanii___Salarchaeum_japonicum                      2084497
#> Salarchaeum_japonicum___Haloferax_mediterranei                  2321629
#> Salarchaeum_japonicum___Haloferax_volcanii                      2220023
#>                                                guessed_query_length_Total
#> Haloferax_mediterranei___Haloferax_volcanii                       4006545
#> Haloferax_mediterranei___Salarchaeum_japonicum                    2339283
#> Haloferax_volcanii___Haloferax_mediterranei                       3907477
#> Haloferax_volcanii___Salarchaeum_japonicum                        2339283
#> Salarchaeum_japonicum___Haloferax_mediterranei                    3907477
#> Salarchaeum_japonicum___Haloferax_volcanii                        3921452
#>                                                guessed_query_length_N
#> Haloferax_mediterranei___Haloferax_volcanii                         4
#> Haloferax_mediterranei___Salarchaeum_japonicum                      2
#> Haloferax_volcanii___Haloferax_mediterranei                         4
#> Haloferax_volcanii___Salarchaeum_japonicum                          2
#> Salarchaeum_japonicum___Haloferax_mediterranei                      4
#> Salarchaeum_japonicum___Haloferax_volcanii                          3
#>                                                index_synteny_target
#> Haloferax_mediterranei___Haloferax_volcanii               0.9566903
#> Haloferax_mediterranei___Salarchaeum_japonicum            0.9794079
#> Haloferax_volcanii___Haloferax_mediterranei               0.9493667
#> Haloferax_volcanii___Salarchaeum_japonicum                0.9802551
#> Salarchaeum_japonicum___Haloferax_mediterranei            0.9416036
#> Salarchaeum_japonicum___Haloferax_volcanii                0.9388453
#>                                                index_synteny_query
#> Haloferax_mediterranei___Haloferax_volcanii              0.9495392
#> Haloferax_mediterranei___Salarchaeum_japonicum           0.9381620
#> Haloferax_volcanii___Haloferax_mediterranei              0.9565299
#> Haloferax_volcanii___Salarchaeum_japonicum               0.9395300
#> Salarchaeum_japonicum___Haloferax_mediterranei           0.9824354
#> Salarchaeum_japonicum___Haloferax_volcanii               0.9809490
#>                                                index_correlation_target
#> Haloferax_mediterranei___Haloferax_volcanii                   0.2802520
#> Haloferax_mediterranei___Salarchaeum_japonicum                0.0483147
#> Haloferax_volcanii___Haloferax_mediterranei                   0.2720500
#> Haloferax_volcanii___Salarchaeum_japonicum                   -0.0631292
#> Salarchaeum_japonicum___Haloferax_mediterranei                0.0568141
#> Salarchaeum_japonicum___Haloferax_volcanii                   -0.0661695
#>                                                index_correlation_query
#> Haloferax_mediterranei___Haloferax_volcanii                  0.2716429
#> Haloferax_mediterranei___Salarchaeum_japonicum               0.0617428
#> Haloferax_volcanii___Haloferax_mediterranei                  0.2813536
#> Haloferax_volcanii___Salarchaeum_japonicum                  -0.0620077
#> Salarchaeum_japonicum___Haloferax_mediterranei               0.0434089
#> Salarchaeum_japonicum___Haloferax_volcanii                  -0.0687453
#>                                                index_GOCvicinity4_target
#> Haloferax_mediterranei___Haloferax_volcanii                    0.7957672
#> Haloferax_mediterranei___Salarchaeum_japonicum                 0.5383244
#> Haloferax_volcanii___Haloferax_mediterranei                    0.8060000
#> Haloferax_volcanii___Salarchaeum_japonicum                     0.4844322
#> Salarchaeum_japonicum___Haloferax_mediterranei                 0.5387969
#> Salarchaeum_japonicum___Haloferax_volcanii                     0.4799270
#>                                                index_GOCvicinity4_query
#> Haloferax_mediterranei___Haloferax_volcanii                   0.7925926
#> Haloferax_mediterranei___Salarchaeum_japonicum                0.5373002
#> Haloferax_volcanii___Haloferax_mediterranei                   0.8100000
#> Haloferax_volcanii___Salarchaeum_japonicum                    0.4826325
#> Salarchaeum_japonicum___Haloferax_mediterranei                0.5415573
#> Salarchaeum_japonicum___Haloferax_volcanii                    0.4872029
#>                                                index_strandRand_target
#> Haloferax_mediterranei___Haloferax_volcanii                  0.3237587
#> Haloferax_mediterranei___Salarchaeum_japonicum               0.1153693
#> Haloferax_volcanii___Haloferax_mediterranei                  0.3113347
#> Haloferax_volcanii___Salarchaeum_japonicum                   0.0063010
#> Salarchaeum_japonicum___Haloferax_mediterranei               0.0991838
#> Salarchaeum_japonicum___Haloferax_volcanii                   0.0097741
#>                                                index_strandRand_query
#> Haloferax_mediterranei___Haloferax_volcanii                 0.3106642
#> Haloferax_mediterranei___Salarchaeum_japonicum              0.0996966
#> Haloferax_volcanii___Haloferax_mediterranei                 0.3242502
#> Haloferax_volcanii___Salarchaeum_japonicum                  0.0143617
#> Salarchaeum_japonicum___Haloferax_mediterranei              0.1145274
#> Salarchaeum_japonicum___Haloferax_volcanii                  0.0094034
#>                                                              species1
#> Haloferax_mediterranei___Haloferax_volcanii    Haloferax_mediterranei
#> Haloferax_mediterranei___Salarchaeum_japonicum Haloferax_mediterranei
#> Haloferax_volcanii___Haloferax_mediterranei        Haloferax_volcanii
#> Haloferax_volcanii___Salarchaeum_japonicum         Haloferax_volcanii
#> Salarchaeum_japonicum___Haloferax_mediterranei  Salarchaeum_japonicum
#> Salarchaeum_japonicum___Haloferax_volcanii      Salarchaeum_japonicum
#>                                                              species2
#> Haloferax_mediterranei___Haloferax_volcanii        Haloferax_volcanii
#> Haloferax_mediterranei___Salarchaeum_japonicum  Salarchaeum_japonicum
#> Haloferax_volcanii___Haloferax_mediterranei    Haloferax_mediterranei
#> Haloferax_volcanii___Salarchaeum_japonicum      Salarchaeum_japonicum
#> Salarchaeum_japonicum___Haloferax_mediterranei Haloferax_mediterranei
#> Salarchaeum_japonicum___Haloferax_volcanii         Haloferax_volcanii
#>                                                index_avg_strandRand
#> Haloferax_mediterranei___Haloferax_volcanii              0.31721145
#> Haloferax_mediterranei___Salarchaeum_japonicum           0.10753295
#> Haloferax_volcanii___Haloferax_mediterranei              0.31779245
#> Haloferax_volcanii___Salarchaeum_japonicum               0.01033135
#> Salarchaeum_japonicum___Haloferax_mediterranei           0.10685560
#> Salarchaeum_japonicum___Haloferax_volcanii               0.00958875
#>                                                index_avg_synteny avg_chr_num
#> Haloferax_mediterranei___Haloferax_volcanii            0.9531148         4.0
#> Haloferax_mediterranei___Salarchaeum_japonicum         0.9587850         3.0
#> Haloferax_volcanii___Haloferax_mediterranei            0.9529483         4.0
#> Haloferax_volcanii___Salarchaeum_japonicum             0.9598925         2.5
#> Salarchaeum_japonicum___Haloferax_mediterranei         0.9620195         3.0
#> Salarchaeum_japonicum___Haloferax_volcanii             0.9598971         2.5
#>                                                percent_identity_local
#> Haloferax_mediterranei___Haloferax_volcanii                  82.93045
#> Haloferax_mediterranei___Salarchaeum_japonicum               70.52701
#> Haloferax_volcanii___Haloferax_mediterranei                  83.05427
#> Haloferax_volcanii___Salarchaeum_japonicum                   72.50706
#> Salarchaeum_japonicum___Haloferax_mediterranei               70.69514
#> Salarchaeum_japonicum___Haloferax_volcanii                   72.51139
#>                                                percent_identity_global
#> Haloferax_mediterranei___Haloferax_volcanii                   80.22559
#> Haloferax_mediterranei___Salarchaeum_japonicum                68.41933
#> Haloferax_volcanii___Haloferax_mediterranei                   80.39441
#> Haloferax_volcanii___Salarchaeum_japonicum                    69.79642
#> Salarchaeum_japonicum___Haloferax_mediterranei                68.65929
#> Salarchaeum_japonicum___Haloferax_volcanii                    69.82446
#>                                                percent_difference_local
#> Haloferax_mediterranei___Haloferax_volcanii                    17.06955
#> Haloferax_mediterranei___Salarchaeum_japonicum                 29.47299
#> Haloferax_volcanii___Haloferax_mediterranei                    16.94573
#> Haloferax_volcanii___Salarchaeum_japonicum                     27.49294
#> Salarchaeum_japonicum___Haloferax_mediterranei                 29.30486
#> Salarchaeum_japonicum___Haloferax_volcanii                     27.48861
#>                                                percent_difference_global
#> Haloferax_mediterranei___Haloferax_volcanii                     19.77441
#> Haloferax_mediterranei___Salarchaeum_japonicum                  31.58067
#> Haloferax_volcanii___Haloferax_mediterranei                     19.60559
#> Haloferax_volcanii___Salarchaeum_japonicum                      30.20358
#> Salarchaeum_japonicum___Haloferax_mediterranei                  31.34071
#> Salarchaeum_japonicum___Haloferax_volcanii                      30.17554
#>                                                index_avg_strandDiscord
#> Haloferax_mediterranei___Haloferax_volcanii                  0.6827885
#> Haloferax_mediterranei___Salarchaeum_japonicum               0.8924671
#> Haloferax_volcanii___Haloferax_mediterranei                  0.6822075
#> Haloferax_volcanii___Salarchaeum_japonicum                   0.9896687
#> Salarchaeum_japonicum___Haloferax_mediterranei               0.8931444
#> Salarchaeum_japonicum___Haloferax_volcanii                   0.9904112
#>                                                percent_aligned
#> Haloferax_mediterranei___Haloferax_volcanii               64.3
#> Haloferax_mediterranei___Salarchaeum_japonicum            34.7
#> Haloferax_volcanii___Haloferax_mediterranei               62.5
#> Haloferax_volcanii___Salarchaeum_japonicum                36.8
#> Salarchaeum_japonicum___Haloferax_mediterranei            56.5
#> Salarchaeum_japonicum___Haloferax_volcanii                60.5
#>                                                                                          lab
#> Haloferax_mediterranei___Haloferax_volcanii       Haloferax_volcanii\nHaloferax_mediterranei
#> Haloferax_mediterranei___Salarchaeum_japonicum Salarchaeum_japonicum\nHaloferax_mediterranei
#> Haloferax_volcanii___Haloferax_mediterranei       Haloferax_volcanii\nHaloferax_mediterranei
#> Haloferax_volcanii___Salarchaeum_japonicum         Salarchaeum_japonicum\nHaloferax_volcanii
#> Salarchaeum_japonicum___Haloferax_mediterranei Salarchaeum_japonicum\nHaloferax_mediterranei
#> Salarchaeum_japonicum___Haloferax_volcanii         Salarchaeum_japonicum\nHaloferax_volcanii
#>                                                MRCA      focalClade focalColor
#> Haloferax_mediterranei___Haloferax_volcanii       8 Haloferax genus     green3
#> Haloferax_mediterranei___Salarchaeum_japonicum    7            <NA>       <NA>
#> Haloferax_volcanii___Haloferax_mediterranei       8 Haloferax genus     green3
#> Haloferax_volcanii___Salarchaeum_japonicum        7            <NA>       <NA>
#> Salarchaeum_japonicum___Haloferax_mediterranei    7            <NA>       <NA>
#> Salarchaeum_japonicum___Haloferax_volcanii        7            <NA>       <NA>
```
