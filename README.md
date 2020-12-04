# Организация докер-контейнера для запуска litmus-тестов в spike симуляторе.

Цель: собрать докер-контейнер, в котором запускаются litmus-тесты в функциональном симуляторе, например spike

Симулятор: https://github.com/riscv/riscv-isa-sim

Тесты: https://github.com/litmus-tests/litmus-tests-riscv

Важно: не обязательно брать spike в качестве симулятора. Главное, чтобы симулятор мог симулировать исполнение RISC-V кода в многопроцессорной (многоядерной) системе.

-------------------------------------------------------------------------------------------------------------------
Источники:

https://arxiv.org/pdf/2010.10119.pdf

https://riscv.org/wp-content/uploads/2015/02/riscv-software-stack-tutorial-hpca2015.pdf

https://github.com/avidan-efody/riscv-spike

http://diy.inria.fr/tst/doc/litmus.html#cross

https://www.cl.cam.ac.uk/~pes20/weakmemory/tacas11.pdf

https://community.arm.com/developer/ip-products/processors/b/processors-ip-blog/posts/generate-litmus-tests-automatically-diy7-tool

https://prydt.xyz/b/2020/06/16/installing-spike.html
