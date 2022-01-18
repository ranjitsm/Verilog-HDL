/********************************************************************************************

Copyright 2018-2019 - Maven Silicon Softech Pvt Ltd. All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.
It is considered a trade secret and is not to be divulged or used by parties who
have not received written authorization from Maven Silicon Softech Pvt Ltd.

Maven Silicon Softech Pvt Ltd
Bangalore - 560076

Webpage: www.maven-silicon.com

Filename:	mux4_1_tb

Description:	Testbench for 4:1 Mux

Date:		01/05/2018

Author:		Maven Silicon

Email:		online@maven-silicon.com


Version:	1.0

*********************************************************************************************/

module mux4_1_tb();

// Declaration of the variables required for testbench
  reg [1:0]sel;
  reg [3:0]a;
  wire y ;

// Declaration of internal variables required for testbench
  integer i,j;

// Step 1. Instantiate the Design
  mux4_1 m1(a,sel,y);


// Step 2. Define body for the initialize task to initialize inputs of DUT to 0
  task initialize;
  begin
		a=0;
        sel=0;// body here
  end
  endtask


// Step 3. Declare tasks with arguments for driving stimulus to DUT.
  task select(input [1:0]s);
  begin
    sel=s;
  end
  endtask

  task inps(input [3:0]data);
  begin
    a=data;
  end
  endtask



// Step 4. Call the tasks from procedural block
  initial
    begin
     initialize;
    #10;
    for(i=0;i<4;i=i+1)
     begin
      select(i);
      for(j=0;j<16;j=j+1)
       begin
        inps(j);
       #10;
       end
      end
     end

// Step 5. Use $monitor task in a parallel initial block  to display inputs and outputs.
   initial
   $monitor("a[3:0]=%b  sel=%b  y=%d",a,sel,y);

// Step 6. Use $finish task to finish the simulation in a parallel initial block with appropriate delay.
   initial
   #800 $finish;

endmodule

