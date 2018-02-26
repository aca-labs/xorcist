#include <ruby.h>

VALUE Xorcist = Qnil;

void Init_xorcist();

VALUE xor_in_place(VALUE self, VALUE x, VALUE y);

VALUE xor_in_place(VALUE self, VALUE x, VALUE y) {
    const char *src = 0;
    char *dest = 0;
    size_t len;
    size_t y_len;

    if (TYPE(x) != T_STRING) {
        rb_raise( rb_eTypeError, "first argument must be a String" );
        return Qnil;
    }

    if (TYPE(y) != T_STRING) {
        rb_raise( rb_eTypeError, "second argument must be a String" );
        return Qnil;
    }

    rb_str_modify(x);
    dest = RSTRING_PTR(x);
    len = RSTRING_LEN(x);

    src = RSTRING_PTR(y);
    y_len = RSTRING_LEN(y);

    if (y_len < len) {
        len = y_len;
    }

    for (; len--; ++dest, ++src) {
        *dest ^= *src;
    }

    return x;
}

void Init_xorcist() {
    Xorcist = rb_define_module("Xorcist");
    rb_define_module_function(Xorcist, "xor!", xor_in_place, 2);
}
