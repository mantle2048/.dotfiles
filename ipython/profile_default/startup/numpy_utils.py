import subprocess
package = "numpy"

try:
    import numpy as np
except ImportError:
    subprocess.run(["pip", "install", package], check=True)

import numpy as np
# More legible printing from numpy.
np.set_printoptions(precision=3, suppress=True, linewidth=100)
