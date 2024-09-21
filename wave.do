onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /tb_pe/dut/clk
add wave -noupdate -radix decimal /tb_pe/dut/rst
add wave -noupdate -radix decimal /tb_pe/dut/a
add wave -noupdate -radix decimal /tb_pe/dut/b
add wave -noupdate -radix decimal /tb_pe/dut/a_out
add wave -noupdate -radix decimal /tb_pe/dut/b_out
add wave -noupdate -radix decimal /tb_pe/dut/acc_sum
add wave -noupdate -radix decimal /tb_pe/dut/final_result
add wave -noupdate -divider {New Divider}
add wave -noupdate -radix decimal /tb_pe/dut/mult/a
add wave -noupdate -radix decimal /tb_pe/dut/mult/b
add wave -noupdate -radix decimal /tb_pe/dut/mult/product_ab
add wave -noupdate -divider {New Divider}
add wave -noupdate -radix decimal /tb_pe/dut/adder/a
add wave -noupdate -radix decimal /tb_pe/dut/adder/b
add wave -noupdate -radix decimal /tb_pe/dut/adder/sum_ab
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 222
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {61 ns}
