from .biorbd import *
from ._version import __version__
from .surface_max_torque_actuator import *
from .rigid_body import *

if biorbd.currentLinearAlgebraBackend() == 1:
    from casadi import Function, MX, horzcat

    def to_casadi_func(name, func, *all_param):
        mx_param = []
        for p in all_param:
            if isinstance(p, MX):
                mx_param.append(p)

        func_evaluated = func(*all_param)
        if isinstance(func_evaluated, (list, tuple)):
            func_evaluated = horzcat(*[val if isinstance(val, MX) else val.to_mx() for val in func_evaluated])
        elif not isinstance(func_evaluated, MX):
            func_evaluated = func_evaluated.to_mx()
        return Function(name, mx_param, [func_evaluated]).expand()
