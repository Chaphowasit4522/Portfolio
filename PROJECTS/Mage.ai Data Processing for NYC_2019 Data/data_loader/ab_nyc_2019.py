from mage_ai.io.file import FileIO
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

@data_loader
def load_data_from_file(*args, **kwargs):
    filepath = 'C:/Users/Asus/OneDrive/เดสก์ท็อป/AB_NYC_2019.csv'
    return FileIO().load(filepath)


@test
def test_output(output, *args) -> None:
    assert output is not None, 'The output is undefined'
