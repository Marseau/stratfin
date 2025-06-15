import requests

url = "http://demo.ckan.org/api/3/action/package_list"
response = requests.get(url)

if response.status_code == 200:
    datasets = response.json()
    print(datasets)
else:
    print("Erro ao acessar a API")
