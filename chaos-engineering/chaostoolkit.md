# Chaostoolkit
`chaostoolkit-toxiproxy`

## Let's install Chaostoolkit
As a Python program, it is best install it in its own virtual environment.
Let's create it as follows:

```mkdir ~/.venvs && python3 -m venv ~/.venvs/chaostk```{{execute}}

Once the virtual environment installed, you need to activate it in your
current terminal session:

`source ~/.venvs/chaostk/bin/activate`{{execute}}

We're going to use `pip` to manage the dependencies and install the Chaos 
Toolkit. Let's first make sure we have the latest and greatest `pip` installed:

`pip install -U pip`{{execute}}

Then we can install the Chaos Toolkit itself by running the following:

`pip install -U chaostoolkit`{{execute}}

*Note* that `pip` may complain while installing some dependencies, these
warnings are nothing to worry about and will not prevent those dependencies
from being installed.

Now, the `chaos` comand should be available:

`chaos --help`{{execute}}