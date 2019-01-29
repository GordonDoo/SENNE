# Code of **Nearest Neighbor Ensembles---An Effective Method for Difficult Problems in Streaming Classification with Emerging New Classes**

## Files
### Scripts:
* demo: script that you can directly run on synthetic dataset
* getData: script that turn normal dataset into stream data with known classes and new class, and split dataset into training set and test set
* model_SENNE: function of build models
* Predict: function of predicting classes of test dataset
* modelupdate: function of updating models using data in the buffer
* calc_score: function of calculating New Class Score
* hyperSphere: function of building hypersphere clusters
* plot_error: plot results intuitively

### Data:
The `.mat` files contain all datasets used in the paper.
