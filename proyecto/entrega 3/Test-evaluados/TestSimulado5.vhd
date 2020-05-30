library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Basys3_tb is
end;

architecture bench of Basys3_tb is

  component Basys3
      Port (
          sw          : in   std_logic_vector (15 downto 0);
          btn         : in   std_logic_vector (4 downto 0);
          led         : out  std_logic_vector (3 downto 0);
          clk         : in   std_logic;
          disA            : out std_logic_vector(3 downto 0);
          disB            :  out std_logic_vector(3 downto 0);
          disC            : out std_logic_vector(3 downto 0);
          disD            : out std_logic_vector(3 downto 0)
            );
  end component;

  signal sw: std_logic_vector (15 downto 0)  := "0000000000000000";
  signal btn: std_logic_vector (4 downto 0)  := "00000";
  signal led: std_logic_vector (3 downto 0);
  signal clk: std_logic := '0';
  signal disA: std_logic_vector(3 downto 0);
  signal disB: std_logic_vector(3 downto 0);
  signal disC: std_logic_vector(3 downto 0);
  signal disD: std_logic_vector(3 downto 0) ;
  signal mled: std_logic_vector(2 downto 0) ;
  signal evaluarA: std_logic_vector(3 downto 0)  := "0000";
  signal evaluarB: std_logic_vector(3 downto 0)  := "0000";
  signal evaluarC: std_logic_vector(3 downto 0)  := "0000";
  signal evaluarD: std_logic_vector(3 downto 0)  := "0000";
  signal evaluarL: std_logic_vector(2 downto 0)  := "000";
  signal evaluar: std_logic_vector(15 downto 0)  := "0000000000000000";
  
  
  constant clk_period : time := 10 ns;

begin

  uut: Basys3 port map ( sw   => sw,
                         btn  => btn,
                         led  => led,
                         clk  => clk,
                         disA => disA,
                         disB => disB,
                         disC => disC,
                         disD => disD );
mled <= led(3 downto 1);
evaluar <= evaluarA & evaluarB & evaluarC & evaluarD;
process
begin



  wait for clk_period/2;
  clk <= not clk;
  wait for clk_period/2;

  if NOW > 3000 ns then
    wait;
  end if;
end process;

  stimulus: process
  begin
  
    -- Put initialisation code here
    -- INCIO
    wait for 20 ns;
    -- MOV A,3  
    evaluarA <= (disA xor "0000");
    evaluarB <= (disB xor "0011");
    evaluarC <= (disC xor "0000");
    evaluarD <= (disD xor "0000");
    wait for 20 ns;
    -- MOV B,2  
    evaluarA <= (disA xor "0000");
    evaluarB <= (disB xor "0011");
    evaluarC <= (disC xor "0000");
    evaluarD <= (disD xor "0010");
    wait for 20 ns;
    -- PUSH A   
    evaluarA <= (disA xor "0000");
    evaluarB <= (disB xor "0011");
    evaluarC <= (disC xor "0000");
    evaluarD <= (disD xor "0010");
    wait for 20 ns;
    -- PUSH B   
    evaluarA <= (disA xor "0000");
    evaluarB <= (disB xor "0011");
    evaluarC <= (disC xor "0000");
    evaluarD <= (disD xor "0010");
    wait for 20 ns;
    -- SP++  
    evaluarA <= (disA xor "0000");
    evaluarB <= (disB xor "0011");
    evaluarC <= (disC xor "0000");
    evaluarD <= (disD xor "0010");
    wait for 20 ns;
    -- POP A    
    evaluarA <= (disA xor "0000");
    evaluarB <= (disB xor "0010");
    evaluarC <= (disC xor "0000");
    evaluarD <= (disD xor "0010");
    wait for 20 ns;
    -- SP++  
    evaluarA <= (disA xor "0000");
    evaluarB <= (disB xor "0010");
    evaluarC <= (disC xor "0000");
    evaluarD <= (disD xor "0010");
    wait for 20 ns;
    -- POP B    
    evaluarA <= (disA xor "0000");
    evaluarB <= (disB xor "0010");
    evaluarC <= (disC xor "0000");
    evaluarD <= (disD xor "0011");
    wait for 20 ns;
    -- CALL 11  
    evaluarA <= (disA xor "0000");
    evaluarB <= (disB xor "0010");
    evaluarC <= (disC xor "0000");
    evaluarD <= (disD xor "0011");
    wait for 20 ns;
    -- ADD A,B  
    evaluarA <= (disA xor "0000");
    evaluarB <= (disB xor "0101");
    evaluarC <= (disC xor "0000");
    evaluarD <= (disD xor "0011");
    wait for 20 ns;
    -- SP++  
    evaluarA <= (disA xor "0000");
    evaluarB <= (disB xor "0101");
    evaluarC <= (disC xor "0000");
    evaluarD <= (disD xor "0011");
    wait for 20 ns;
    -- RET      
    evaluarA <= (disA xor "0000");
    evaluarB <= (disB xor "0101");
    evaluarC <= (disC xor "0000");
    evaluarD <= (disD xor "0011");
    wait for 20 ns;
    -- ADD B,A  
    evaluarA <= (disA xor "0000");
    evaluarB <= (disB xor "0101");
    evaluarC <= (disC xor "0000");
    evaluarD <= (disD xor "1000");
    wait for 20 ns;
    -- JMP 10   
    evaluarA <= (disA xor "0000");
    evaluarB <= (disB xor "0101");
    evaluarC <= (disC xor "0000");
    evaluarD <= (disD xor "1000");
    wait;
end process;

end;