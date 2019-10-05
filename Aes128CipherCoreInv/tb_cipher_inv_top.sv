//-----------------------------------------------------------
// Simple testbench
// Website: http://nguyenquanicd.blogspot.com/
//-----------------------------------------------------------
module tb_cipher_inv_top;
  //input
  reg clk_sys;
  reg rst_n;
  reg	[127:0]	cipher_text;
  reg	[127:0]	round_key_10;
  reg decipher_en;
  //output
  wire [127:0] plain_text;
  wire         decipher_ready;
  //
  aes128_cipher_inv_top aes128_cipher_inv_top (
  //input
  clk_sys,
  rst_n,
  cipher_text,
  round_key_10,
  decipher_en,
  //output
  plain_text,
  decipher_ready
  );
  
  initial begin
    clk_sys = 0;
    rst_n = 0;
    round_key_10 = 0;
    cipher_text = 0;
    decipher_en = 0;
  end
  initial begin
    forever #5 clk_sys = ~clk_sys;
  end
  initial begin
    #16
    rst_n = 1;
    #10
    decipher_en = 1;
    cipher_text = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;
    round_key_10 = 128'h13111d7fe3944a17f307a78b4d2b30c5;
    #10
    decipher_en = 0;
    #120
    $display ("---- plain_text: %32h - READY: %1b\n", plain_text[127:0], decipher_ready);
    #10
    decipher_en = 1;
    cipher_text = 128'hdaba0685a6b6ef1d096f7980accf3ac5;
    round_key_10 = 128'ha5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5;
    //key = 128'h645b0a4609957a7ab17d69a166ee07dc
    #10
    decipher_en = 0;
    #120
    $display ("---- plain_text: %32h - READY: %1b\n", plain_text[127:0], decipher_ready);
    $stop;
  end

endmodule
