// Lean compiler output
// Module: minimal_test
// Imports: Init Hax Std.Tactic.Do Std.Do.Triple Std.Tactic.Do.Syntax
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
LEAN_EXPORT lean_object* l_Minimal__test_square(uint8_t);
uint8_t l_BitVec_umulOverflow(lean_object*, lean_object*, lean_object*);
lean_object* lean_uint8_to_nat(uint8_t);
uint8_t lean_uint8_mul(uint8_t, uint8_t);
LEAN_EXPORT lean_object* l_Minimal__test_main(lean_object*);
LEAN_EXPORT lean_object* l_Minimal__test_square___boxed(lean_object*);
static lean_object* l_Minimal__test_main___closed__0;
static lean_object* l_Minimal__test_square___closed__0;
static lean_object* _init_l_Minimal__test_main___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_box(0);
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_Minimal__test_main(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_Minimal__test_main___closed__0;
return x_2;
}
}
static lean_object* _init_l_Minimal__test_square___closed__0() {
_start:
{
uint8_t x_1; lean_object* x_2; 
x_1 = 1;
x_2 = lean_alloc_ctor(1, 0, 1);
lean_ctor_set_uint8(x_2, 0, x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_Minimal__test_square(uint8_t x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; uint8_t x_4; 
x_2 = lean_unsigned_to_nat(8u);
x_3 = lean_uint8_to_nat(x_1);
x_4 = l_BitVec_umulOverflow(x_2, x_3, x_3);
lean_dec(x_3);
if (x_4 == 0)
{
uint8_t x_5; lean_object* x_6; lean_object* x_7; 
x_5 = lean_uint8_mul(x_1, x_1);
x_6 = lean_box(x_5);
x_7 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_7, 0, x_6);
return x_7;
}
else
{
lean_object* x_8; 
x_8 = l_Minimal__test_square___closed__0;
return x_8;
}
}
}
LEAN_EXPORT lean_object* l_Minimal__test_square___boxed(lean_object* x_1) {
_start:
{
uint8_t x_2; lean_object* x_3; 
x_2 = lean_unbox(x_1);
x_3 = l_Minimal__test_square(x_2);
return x_3;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Hax(uint8_t builtin, lean_object*);
lean_object* initialize_Std_Tactic_Do(uint8_t builtin, lean_object*);
lean_object* initialize_Std_Do_Triple(uint8_t builtin, lean_object*);
lean_object* initialize_Std_Tactic_Do_Syntax(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_minimal__test(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Hax(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Std_Tactic_Do(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Std_Do_Triple(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Std_Tactic_Do_Syntax(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_Minimal__test_main___closed__0 = _init_l_Minimal__test_main___closed__0();
lean_mark_persistent(l_Minimal__test_main___closed__0);
l_Minimal__test_square___closed__0 = _init_l_Minimal__test_square___closed__0();
lean_mark_persistent(l_Minimal__test_square___closed__0);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
