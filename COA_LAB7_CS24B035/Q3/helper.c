// handler.c
#include <stdint.h>

struct process_table_struct
{
    uint64_t pid;
    uint64_t state; // 0: not running, 1: running
    uint64_t program_counter;
    uint64_t stack_pointer;
};
extern volatile struct process_table_struct process_table[4];
extern void ucode_checker();
extern void ucode_counter();
extern void ucode_fib();
extern volatile uint64_t _stack_top; // Access &_stack_top to get the address
extern volatile uint32_t current_process;

struct return_values
{
    uint64_t program_counter;
    uint64_t stack_pointer;
};

struct return_values setup_processes()
{

    struct return_values rv;

    uint64_t stack_top = (uint64_t)&_stack_top;

    for (int i = 0; i < 4; i++)
    {
        process_table[i].pid = i + 1;
        process_table[i].state = 0;
        process_table[i].stack_pointer = stack_top - (i * 1024);
    }

    process_table[0].program_counter = (uint64_t)ucode_checker;
    process_table[1].program_counter = (uint64_t)ucode_checker;
    process_table[2].program_counter = (uint64_t)ucode_counter;
    process_table[3].program_counter = (uint64_t)ucode_fib;

    process_table[0].state = 1;
    current_process = 0;

    rv.program_counter = process_table[0].program_counter;
    rv.stack_pointer = process_table[0].stack_pointer;

    return rv;
}

struct return_values switch_processes(uint64_t mepc, uint64_t sp)
{

    struct return_values rv;

    int cur = current_process;

    process_table[cur].program_counter = mepc;
    process_table[cur].stack_pointer = sp;
    process_table[cur].state = 0;

    int next = (cur + 1) % 4;

    process_table[next].state = 1;
    current_process = next;

    rv.program_counter = process_table[next].program_counter;
    rv.stack_pointer = process_table[next].stack_pointer;

    return rv;
}

extern uint32_t fib_array[11];

void fibonacci_helper(int n)
{
    if (n == 0)
    {
        fib_array[0] = 0;
        return;
    }
    if (n == 1)
    {
        fib_array[1] = 1;
        return;
    }
    fibonacci_helper(n - 1);
    fibonacci_helper(n - 2);
    fib_array[n] = fib_array[n - 1] + fib_array[n - 2];
}