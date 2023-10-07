import pandas
@custom
def transform_custom(data, *args, **kwargs):
    null_cols = data.columns[data.isnull().any()]
    null_data = data[null_cols]
    print(null_data.isnull().sum())
    #print(null_data.dtypes)
    return data
