import os
from flask import (
    Flask,
    render_template,
)
from flask.ext import assets


app = Flask(__name__)

# Setup Flask Assets
env = assets.Environment(app)

# Define asset locations for search
env.load_path = [
    os.path.join(os.path.dirname(__file__), 'sass'),
    os.path.join(os.path.dirname(__file__), 'coffee'),
    os.path.join(os.path.dirname(__file__), 'bower_components'),
]

# Register javascripts and coffeescript
env.register(
    'js_all',
    assets.Bundle(
        'jquery/dist/jquery.min.js',
        'semantic-ui/build/packaged/javascript/semantic.min.js',
        assets.Bundle(
            'all.coffee',
            filters=['coffeescript']
        ),
        output='js_all.js'
    )
)

# Register SASS and CSS
env.register(
    'css_all',
    assets.Bundle(
        'all.sass',
        filters='sass',
        output='css_all.css'
    ),
    assets.Bundle(
        'semantic-ui/build/packaged/css/semantic.css',
        output='semantic_all.css'
    ),
)


@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
