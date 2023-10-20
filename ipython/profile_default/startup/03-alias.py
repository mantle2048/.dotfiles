from IPython.core.magic import register_line_magic


@register_line_magic
def p(line):
    code = f"print({line})"
    print("-->", code)
    exec(code, globals())


@register_line_magic
def ins(line):
    code = f"inspect({line})"
    print("-->", code)
    exec(code, globals())

del p, ins
