import requests

dataset_id = "annakarenina"
url = f"http://demo.ckan.org/api/3/action/package_show?id={dataset_id}"
response = requests.get(url)

if response.status_code == 200:
    details = response.json()
    print(details)
else:
    print("Erro ao acessar o dataset")
