# MATLAB/Octave Implementation of Recommendation ITU-R P.2109

This code repository contains a MATLAB/Octave software implementation of Recommendation [ITU-R P.2109-1](https://www.itu.int/rec/R-REC-P.2109/en) with a prediction procedure for  estimating building entry loss at frequencies between about 80 MHz and 100 GHz.

This version of the code is functionally identical to the reference version approved by ITU-R Working Parties 3K and 3M and published by Study Group 3 on [ITU-R SG 3 Software, Data, and Validation Web Page](https://www.itu.int/en/ITU-R/study-groups/rsg3/Pages/iono-tropo-spheric.aspx). 

The following table describes the structure of the folder `./matlab/` containing the MATLAB/Octave implementation of Recommendation ITU-R P.2108.

| File/Folder               | Description                                                         |
|----------------------------|---------------------------------------------------------------------|
|`bel_p2109.m`                | MATLAB/Octave function implementing Recommendation ITU-R P.2109-1          |
|`validate_p2109.m`          | Validation tests against the reference Excel implementation of this Recommendation for a range of location percentages, frequencies, distances and environment categories.          |

## Function Call

~~~
Lbe = bel_p2109(f, p, cl, th);
~~~

| Variable          | Type   | Units | Limits       | Description  |
|-------------------|--------|-------|--------------|--------------|
| `f`               | scalar double | GHz   | 0.08 ≤ `f` ≤ 100 | Frequency   |
| `p`          | scalar double | %    |  0 < `p` < 100 | Probability for which the loss is not exceeded |
| `cl`           | scalar int    |     | 1  or 2             |  Building class:  </li><li>1: traditional</li><li>2: thermally efficient</li></ul> |
| `th`          | scalar double | deg   | 0 ≤ `th` ≤ 90  | Elevation angle at the building facade (degrees above the horizontal)|


 ## Outputs ##

| Variable   | Type   | Units | Description |
|------------|--------|-------|-------------|
| `Lbe`    | double | dB    | Building entry loss |

## References

* [Recommendation ITU-R P.2109](https://www.itu.int/rec/R-REC-P.2109/en)

* [ITU-R SG 3 Software, Data, and Validation Web Page](https://www.itu.int/en/ITU-R/study-groups/rsg3/Pages/iono-tropo-spheric.aspx)

