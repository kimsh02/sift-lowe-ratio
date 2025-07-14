# SIFT Feature Matching, Error Metrics, and Lowe Ratio Filtering in MATLAB

This project focuses on keypoint matching using SIFT descriptors, compares different similarity metrics, applies Lowe ratio filtering, and evaluates performance using a confusion matrix.

[View PDF Result](./hw09.pdf)

---

## A1. Visualizing SIFT Keypoints

- Every 10th keypoint from `frame1.sift` was plotted along with its gradient vector using `quiver()`.
- Matching keypoints from `slide1.sift` were found using `knnsearch()` based on Euclidean distance in 128-D descriptor space.
- Collages for slide/frame pairs 1–3 were created:
  - Top: selected keypoints and gradients
  - Bottom: corresponding pairs linked by red lines
- The same code was reused for slide/frame 2 and 3.

## A2. Measuring Error Between Features

- Compared three error measures:
  - Euclidean distance
  - Cosine similarity
  - Chi-square distance
- Used top 5% (`P = 5%`) best matches without skipping keypoints.
- Results:
  - Euclidean and cosine similarity gave identical matches.
  - Chi-square produced worse, likely due to sensitivity to noise or a faulty implementation.
- Chose Euclidean with `P = 5%` as the preferred measure due to performance and visual clarity.

## A3. Pruning Keypoint Matches with Lowe Ratio

- Applied Lowe ratio filtering with a threshold of **92%**:
  - Retained match only if the closest match was sufficiently better than the second-closest.
- Compared results to unfiltered matches from A2.
- Lowe ratio of 80% was too strict; 92% provided a balance between filtering and retaining matches.
- Observed that it successfully removed many-to-one mappings and inconsistent matches.

## A4. Testing Error Metrics and Thresholds via Confusion Matrix

- Evaluated combinations of `P` and Lowe ratio using a nested loop.
- Generated confusion matrices to assess classification accuracy:
  - Best diagonal result: `P = 73%`, Lowe ratio = 0.65
    ```
    15  0   0
     0 13   0
     0  0 161
    ```
  - Best overall match count (without filtering): `P = 44%`, Lowe ratio = 1
    ```
    302 215  36
     52 233  22
     55  13 525
    ```
- Diagonal entries represent correct matches; off-diagonal entries indicate mismatches.
- Confusion matrix is a scalable tool for evaluating keypoint match accuracy and tuning hyperparameters.

---

## Conclusion

This assignment demonstrates robust SIFT feature matching through visualization, error metric comparison, and filtering using the Lowe ratio. The confusion matrix provides a quantitative basis for selecting optimal parameters and highlights the trade-off between strict filtering and total matches.
