import subprocess
package = "rich"

try:
    import rich
except ImportError:
    subprocess.run(["pip", "install", package], check=True)

import rich
from functools import partial
from rich import pretty
from rich import traceback
from rich.console import Console
from rich import inspect
from rich.progress import track
from rich import print

pretty.install()
traceback.install(show_locals=True)
console = Console()
inspect = partial(inspect, methods=True)
