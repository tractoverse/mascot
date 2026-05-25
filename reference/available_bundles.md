# List available bundles for a dataset

Returns the full names of all white-matter bundles available in the
specified dataset. The returned names are the values to supply to the
`bundle` argument of
[`import_bundle()`](https://tractoverse.github.io/mascot/reference/import_bundle.md).

## Usage

``` r
available_bundles(dataset)
```

## Arguments

- dataset:

  A string naming the dataset. Must be one of the values returned by
  [`available_datasets()`](https://tractoverse.github.io/mascot/reference/available_datasets.md).

## Value

A character vector of bundle names.

## Examples

``` r
available_bundles("HCP1065")
#>  [1] "Anterior Commissure"                       
#>  [2] "Left Arcuate Fasciculus"                   
#>  [3] "Right Arcuate Fasciculus"                  
#>  [4] "Left Acoustic Radiation"                   
#>  [5] "Right Acoustic Radiation"                  
#>  [6] "Left Frontal Parietal Cingulum"            
#>  [7] "Right Frontal Parietal Cingulum"           
#>  [8] "Left Frontal Parahippocampal Cingulum"     
#>  [9] "Right Frontal Parahippocampal Cingulum"    
#> [10] "Left Parahippocampal Cingulum"             
#> [11] "Right Parahippocampal Cingulum"            
#> [12] "Left Parahippocampal Parietal Cingulum"    
#> [13] "Right Parahippocampal Parietal Cingulum"   
#> [14] "Left Parolfactory Cingulum"                
#> [15] "Right Parolfactory Cingulum"               
#> [16] "Left Cerebellum"                           
#> [17] "Right Cerebellum"                          
#> [18] "Left Corticobulbar Tract"                  
#> [19] "Right Corticobulbar Tract"                 
#> [20] "Corpus Callosum"                           
#> [21] "Left Cranial Nerve II"                     
#> [22] "Right Cranial Nerve II"                    
#> [23] "Left Cranial Nerve III"                    
#> [24] "Right Cranial Nerve III"                   
#> [25] "Left Cranial Nerve V"                      
#> [26] "Right Cranial Nerve V"                     
#> [27] "Left Cranial Nerve VII"                    
#> [28] "Right Cranial Nerve VII"                   
#> [29] "Left Cranial Nerve VIII"                   
#> [30] "Right Cranial Nerve VIII"                  
#> [31] "Left Frontal Corticopontine Tract"         
#> [32] "Right Frontal Corticopontine Tract"        
#> [33] "Left Occipital Corticopontine Tract"       
#> [34] "Right Occipital Corticopontine Tract"      
#> [35] "Left Parietal Corticopontine Tract"        
#> [36] "Right Parietal Corticopontine Tract"       
#> [37] "Left Anterior Corticostriatal Tract"       
#> [38] "Right Anterior Corticostriatal Tract"      
#> [39] "Left Posterior Corticostriatal Tract"      
#> [40] "Right Posterior Corticostriatal Tract"     
#> [41] "Left Superior Corticostriatal Tract"       
#> [42] "Right Superior Corticostriatal Tract"      
#> [43] "Left Corticospinal Tract"                  
#> [44] "Right Corticospinal Tract"                 
#> [45] "Left Dentatorubrothalamic Tract"           
#> [46] "Right Dentatorubrothalamic Tract"          
#> [47] "Left Extreme Capsule"                      
#> [48] "Right Extreme Capsule"                     
#> [49] "Left Fornix"                               
#> [50] "Right Fornix"                              
#> [51] "Left Frontal Aslant Tract"                 
#> [52] "Right Frontal Aslant Tract"                
#> [53] "Left Inferior Cerebellar Peduncle"         
#> [54] "Right Inferior Cerebellar Peduncle"        
#> [55] "Left Inferior Fronto-Occipital Fasciculus" 
#> [56] "Right Inferior Fronto-Occipital Fasciculus"
#> [57] "Left Inferior Longitudinal Fasciculus"     
#> [58] "Right Inferior Longitudinal Fasciculus"    
#> [59] "Middle Cerebellar Peduncle"                
#> [60] "Left Middle Longitudinal Fasciculus"       
#> [61] "Right Middle Longitudinal Fasciculus"      
#> [62] "Left Medial Lemniscus"                     
#> [63] "Right Medial Lemniscus"                    
#> [64] "Left Optic Radiation"                      
#> [65] "Right Optic Radiation"                     
#> [66] "Left Parietal Aslant Tract"                
#> [67] "Right Parietal Aslant Tract"               
#> [68] "Left Reticulospinal Tract"                 
#> [69] "Right Reticulospinal Tract"                
#> [70] "Superior Cerebellar Peduncle"              
#> [71] "Left Superior Longitudinal Fasciculus I"   
#> [72] "Right Superior Longitudinal Fasciculus I"  
#> [73] "Left Superior Longitudinal Fasciculus II"  
#> [74] "Right Superior Longitudinal Fasciculus II" 
#> [75] "Left Superior Longitudinal Fasciculus III" 
#> [76] "Right Superior Longitudinal Fasciculus III"
#> [77] "Left Anterior Thalamic Radiation"          
#> [78] "Right Anterior Thalamic Radiation"         
#> [79] "Left Posterior Thalamic Radiation"         
#> [80] "Right Posterior Thalamic Radiation"        
#> [81] "Left Superior Thalamic Radiation"          
#> [82] "Right Superior Thalamic Radiation"         
#> [83] "Left Uncinate Fasciculus"                  
#> [84] "Right Uncinate Fasciculus"                 
#> [85] "Vermis"                                    
#> [86] "Left Vertical Occipital Fasciculus"        
#> [87] "Right Vertical Occipital Fasciculus"       
```
