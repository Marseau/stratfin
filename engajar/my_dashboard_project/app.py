from flask import Flask, render_template
import pandas as pd
import plotly.express as px
import json
import plotly

app = Flask(__name__)

# Exemplo de dados estáticos
data = {
    "indicador": ["IPCA", "SELIC", "PIB"],
    "valor": [5.2, 2.75, 1.5]
}

@app.route('/')
def dashboard():
    df = pd.DataFrame(data)
    colors = ['#5E9746', '#2F4C63', '#000080']  # Paleta de cores
    fig = px.bar(df, x='indicador', y='valor', title='Indicadores Econômicos',
                 color_discrete_sequence=colors)
    
    graphJSON = json.dumps(fig, cls=plotly.utils.PlotlyJSONEncoder)
    return render_template('dashboard.html', graphJSON=graphJSON)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8080)

