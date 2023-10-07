import pandas
@custom
def transform_custom(data, *args, **kwargs):
   print(data.dtypes)
   return data