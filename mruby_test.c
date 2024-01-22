// to compile, make sure you link -lm -lmruby
#include <mruby.h>
#include <mruby/compile.h>
#include <mruby/value.h>
#include <stdio.h>
// const char *ruby_script = "puts myVariable * 2";
// const char *ruby_script = "puts myVariable ";
// const char *ruby_script = "puts AGE*2;p AGE;p AGE.class";
// const char *ruby_script = "puts MyVariable;p MyVariable";
const char *ruby_script = "MyVariable += 3";
int main() {
  mrb_state *mrb = mrb_open();
  if (mrb == NULL) {
    fprintf(stderr, "Unable to initialize MRuby.\n");
    return 1;
  }
  // To load script from file:
  // FILE *fp = fopen("your_script.rb", "r");
  // mrb_load_file(mrb, fp);
  // fclose(fp);

  int MyVariable = 42;

  //      Expose the C variable to mruby using mrb_define_global_variable
  //      or similar functions.
  // mrb_value mrb_c_variable = mrb_fixnum_value(myVariable);
  //
  // this works!
  // mrb_define_const(mrb, mrb->kernel_module, "AGE", mrb_fixnum_value(22));
  // mrb_define_const(mrb, mrb->kernel_module, "AGE",
  //                  mrb_fixnum_value(myVariable));
  // ruby constant must start with capital
  mrb_define_const(mrb, mrb->kernel_module, "MyVariable",
                   mrb_fixnum_value(MyVariable));
  // mrb_define_global_const(mrb, "MyVariable", mrb_c_variable);
  mrb_load_string(mrb, ruby_script);
  //
  // Get the value of the Ruby variable
  // mrb_value ruby_variable = mrb_gv_get(mrb, mrb_intern_cstr(mrb,
  // "MyVariable"));
  mrb_value ruby_variable =
      mrb_obj_new(mrb, mrb_intern_cstr(mrb, "MyVariable"));

  // Convert the Ruby value to a C type
  if (mrb_fixnum_p(ruby_variable)) {
    int my_variable_in_c = mrb_fixnum(ruby_variable);
    printf("C variable from mruby: %d\n", my_variable_in_c);
  } else {
    fprintf(stderr, "Unexpected Ruby variable type\n");
  }
  if (mrb->exc) {
    mrb_p(mrb, mrb_obj_value(mrb->exc));
    mrb_close(mrb);
    return 1;
  }
  mrb_close(mrb);
  return 0;
}
