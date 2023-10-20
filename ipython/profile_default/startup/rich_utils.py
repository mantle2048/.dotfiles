import subprocess
package = "rich"

try:
    import rich
except ImportError:
    subprocess.run(["pip", "install", package], check=True)

import rich
import builtins
from functools import partial
from rich import pretty
from rich.console import Console
from rich import inspect
from rich.progress import track

builtins.print = rich.print
console = Console()
inspect = partial(inspect, methods=True)
