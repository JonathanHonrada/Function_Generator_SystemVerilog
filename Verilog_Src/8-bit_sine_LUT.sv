`timescale 1ns / 1ps

module eight_bit_cos_LUT(
    input clk,
    input [3:0] freq_mul,
    output logic [7:0] cos_out,
    output logic [7:0] sin_data
    );
logic [7:0] cos[255:0];
logic [7:0] sin[255:0];
reg [7:0] counter = 8'd0;
initial
    begin
sin[0]=	128	;
sin[1]=	131	;
sin[2]=	134	;
sin[3]=	137	;
sin[4]=	140	;
sin[5]=	143	;
sin[6]=	146	;
sin[7]=	149	;
sin[8]=	152	;
sin[9]=	155	;
sin[10]=	158	;
sin[11]=	162	;
sin[12]=	165	;
sin[13]=	167	;
sin[14]=	170	;
sin[15]=	173	;
sin[16]=	176	;
sin[17]=	179	;
sin[18]=	182	;
sin[19]=	185	;
sin[20]=	188	;
sin[21]=	190	;
sin[22]=	193	;
sin[23]=	196	;
sin[24]=	198	;
sin[25]=	201	;
sin[26]=	203	;
sin[27]=	206	;
sin[28]=	208	;
sin[29]=	211	;
sin[30]=	213	;
sin[31]=	215	;
sin[32]=	218	;
sin[33]=	220	;
sin[34]=	222	;
sin[35]=	224	;
sin[36]=	226	;
sin[37]=	228	;
sin[38]=	230	;
sin[39]=	232	;
sin[40]=	234	;
sin[41]=	235	;
sin[42]=	237	;
sin[43]=	238	;
sin[44]=	240	;
sin[45]=	241	;
sin[46]=	243	;
sin[47]=	244	;
sin[48]=	245	;
sin[49]=	246	;
sin[50]=	248	;
sin[51]=	249	;
sin[52]=	250	;
sin[53]=	250	;
sin[54]=	251	;
sin[55]=	252	;
sin[56]=	253	;
sin[57]=	253	;
sin[58]=	254	;
sin[59]=	254	;
sin[60]=	254	;
sin[61]=	255	;
sin[62]=	255	;
sin[63]=	255	;
sin[64]=	255	;
sin[65]=	255	;
sin[66]=	255	;
sin[67]=	255	;
sin[68]=	254	;
sin[69]=	254	;
sin[70]=	254	;
sin[71]=	253	;
sin[72]=	253	;
sin[73]=	252	;
sin[74]=	251	;
sin[75]=	250	;
sin[76]=	250	;
sin[77]=	249	;
sin[78]=	248	;
sin[79]=	246	;
sin[80]=	245	;
sin[81]=	244	;
sin[82]=	243	;
sin[83]=	241	;
sin[84]=	240	;
sin[85]=	238	;
sin[86]=	237	;
sin[87]=	235	;
sin[88]=	234	;
sin[89]=	232	;
sin[90]=	230	;
sin[91]=	228	;
sin[92]=	226	;
sin[93]=	224	;
sin[94]=	222	;
sin[95]=	220	;
sin[96]=	218	;
sin[97]=	215	;
sin[98]=	213	;
sin[99]=	211	;
sin[100]=	208	;
sin[101]=	206	;
sin[102]=	203	;
sin[103]=	201	;
sin[104]=	198	;
sin[105]=	196	;
sin[106]=	193	;
sin[107]=	190	;
sin[108]=	188	;
sin[109]=	185	;
sin[110]=	182	;
sin[111]=	179	;
sin[112]=	176	;
sin[113]=	173	;
sin[114]=	170	;
sin[115]=	167	;
sin[116]=	165	;
sin[117]=	162	;
sin[118]=	158	;
sin[119]=	155	;
sin[120]=	152	;
sin[121]=	149	;
sin[122]=	146	;
sin[123]=	143	;
sin[124]=	140	;
sin[125]=	137	;
sin[126]=	134	;
sin[127]=	131	;
sin[128]=	128	;
sin[129]=	124	;
sin[130]=	121	;
sin[131]=	118	;
sin[132]=	115	;
sin[133]=	112	;
sin[134]=	109	;
sin[135]=	106	;
sin[136]=	103	;
sin[137]=	100	;
sin[138]=	97	;
sin[139]=	93	;
sin[140]=	90	;
sin[141]=	88	;
sin[142]=	85	;
sin[143]=	82	;
sin[144]=	79	;
sin[145]=	76	;
sin[146]=	73	;
sin[147]=	70	;
sin[148]=	67	;
sin[149]=	65	;
sin[150]=	62	;
sin[151]=	59	;
sin[152]=	57	;
sin[153]=	54	;
sin[154]=	52	;
sin[155]=	49	;
sin[156]=	47	;
sin[157]=	44	;
sin[158]=	42	;
sin[159]=	40	;
sin[160]=	37	;
sin[161]=	35	;
sin[162]=	33	;
sin[163]=	31	;
sin[164]=	29	;
sin[165]=	27	;
sin[166]=	25	;
sin[167]=	23	;
sin[168]=	21	;
sin[169]=	20	;
sin[170]=	18	;
sin[171]=	17	;
sin[172]=	15	;
sin[173]=	14	;
sin[174]=	12	;
sin[175]=	11	;
sin[176]=	10	;
sin[177]=	9	;
sin[178]=	7	;
sin[179]=	6	;
sin[180]=	5	;
sin[181]=	5	;
sin[182]=	4	;
sin[183]=	3	;
sin[184]=	2	;
sin[185]=	2	;
sin[186]=	1	;
sin[187]=	1	;
sin[188]=	1	;
sin[189]=	0	;
sin[190]=	0	;
sin[191]=	0	;
sin[192]=	0	;
sin[193]=	0	;
sin[194]=	0	;
sin[195]=	0	;
sin[196]=	1	;
sin[197]=	1	;
sin[198]=	1	;
sin[199]=	2	;
sin[200]=	2	;
sin[201]=	3	;
sin[202]=	4	;
sin[203]=	5	;
sin[204]=	5	;
sin[205]=	6	;
sin[206]=	7	;
sin[207]=	9	;
sin[208]=	10	;
sin[209]=	11	;
sin[210]=	12	;
sin[211]=	14	;
sin[212]=	15	;
sin[213]=	17	;
sin[214]=	18	;
sin[215]=	20	;
sin[216]=	21	;
sin[217]=	23	;
sin[218]=	25	;
sin[219]=	27	;
sin[220]=	29	;
sin[221]=	31	;
sin[222]=	33	;
sin[223]=	35	;
sin[224]=	37	;
sin[225]=	40	;
sin[226]=	42	;
sin[227]=	44	;
sin[228]=	47	;
sin[229]=	49	;
sin[230]=	52	;
sin[231]=	54	;
sin[232]=	57	;
sin[233]=	59	;
sin[234]=	62	;
sin[235]=	65	;
sin[236]=	67	;
sin[237]=	70	;
sin[238]=	73	;
sin[239]=	76	;
sin[240]=	79	;
sin[241]=	82	;
sin[242]=	85	;
sin[243]=	88	;
sin[244]=	90	;
sin[245]=	93	;
sin[246]=	97	;
sin[247]=	100	;
sin[248]=	103	;
sin[249]=	106	;
sin[250]=	109	;
sin[251]=	112	;
sin[252]=	115	;
sin[253]=	118	;
sin[254]=	121	;
sin[255]=	124	;

cos[0]=	0	;
cos[1]=	0	;
cos[2]=	0	;
cos[3]=	0	;
cos[4]=	1	;
cos[5]=	1	;
cos[6]=	1	;
cos[7]=	2	;
cos[8]=	2	;
cos[9]=	3	;
cos[10]=	4	;
cos[11]=	5	;
cos[12]=	5	;
cos[13]=	6	;
cos[14]=	7	;
cos[15]=	9	;
cos[16]=	10	;
cos[17]=	11	;
cos[18]=	12	;
cos[19]=	14	;
cos[20]=	15	;
cos[21]=	17	;
cos[22]=	18	;
cos[23]=	20	;
cos[24]=	21	;
cos[25]=	23	;
cos[26]=	25	;
cos[27]=	27	;
cos[28]=	29	;
cos[29]=	31	;
cos[30]=	33	;
cos[31]=	35	;
cos[32]=	37	;
cos[33]=	40	;
cos[34]=	42	;
cos[35]=	44	;
cos[36]=	47	;
cos[37]=	49	;
cos[38]=	52	;
cos[39]=	54	;
cos[40]=	57	;
cos[41]=	59	;
cos[42]=	62	;
cos[43]=	65	;
cos[44]=	67	;
cos[45]=	70	;
cos[46]=	73	;
cos[47]=	76	;
cos[48]=	79	;
cos[49]=	82	;
cos[50]=	85	;
cos[51]=	88	;
cos[52]=	90	;
cos[53]=	93	;
cos[54]=	97	;
cos[55]=	100	;
cos[56]=	103	;
cos[57]=	106	;
cos[58]=	109	;
cos[59]=	112	;
cos[60]=	115	;
cos[61]=	118	;
cos[62]=	121	;
cos[63]=	124	;
cos[64]=	128	;
cos[65]=	131	;
cos[66]=	134	;
cos[67]=	137	;
cos[68]=	140	;
cos[69]=	143	;
cos[70]=	146	;
cos[71]=	149	;
cos[72]=	152	;
cos[73]=	155	;
cos[74]=	158	;
cos[75]=	162	;
cos[76]=	165	;
cos[77]=	167	;
cos[78]=	170	;
cos[79]=	173	;
cos[80]=	176	;
cos[81]=	179	;
cos[82]=	182	;
cos[83]=	185	;
cos[84]=	188	;
cos[85]=	190	;
cos[86]=	193	;
cos[87]=	196	;
cos[88]=	198	;
cos[89]=	201	;
cos[90]=	203	;
cos[91]=	206	;
cos[92]=	208	;
cos[93]=	211	;
cos[94]=	213	;
cos[95]=	215	;
cos[96]=	218	;
cos[97]=	220	;
cos[98]=	222	;
cos[99]=	224	;
cos[100]=	226	;
cos[101]=	228	;
cos[102]=	230	;
cos[103]=	232	;
cos[104]=	234	;
cos[105]=	235	;
cos[106]=	237	;
cos[107]=	238	;
cos[108]=	240	;
cos[109]=	241	;
cos[110]=	243	;
cos[111]=	244	;
cos[112]=	245	;
cos[113]=	246	;
cos[114]=	248	;
cos[115]=	249	;
cos[116]=	250	;
cos[117]=	250	;
cos[118]=	251	;
cos[119]=	252	;
cos[120]=	253	;
cos[121]=	253	;
cos[122]=	254	;
cos[123]=	254	;
cos[124]=	254	;
cos[125]=	255	;
cos[126]=	255	;
cos[127]=	255	;
cos[128]=	255	;
cos[129]=	255	;
cos[130]=	255	;
cos[131]=	255	;
cos[132]=	254	;
cos[133]=	254	;
cos[134]=	254	;
cos[135]=	253	;
cos[136]=	253	;
cos[137]=	252	;
cos[138]=	251	;
cos[139]=	250	;
cos[140]=	250	;
cos[141]=	249	;
cos[142]=	248	;
cos[143]=	246	;
cos[144]=	245	;
cos[145]=	244	;
cos[146]=	243	;
cos[147]=	241	;
cos[148]=	240	;
cos[149]=	238	;
cos[150]=	237	;
cos[151]=	235	;
cos[152]=	234	;
cos[153]=	232	;
cos[154]=	230	;
cos[155]=	228	;
cos[156]=	226	;
cos[157]=	224	;
cos[158]=	222	;
cos[159]=	220	;
cos[160]=	218	;
cos[161]=	215	;
cos[162]=	213	;
cos[163]=	211	;
cos[164]=	208	;
cos[165]=	206	;
cos[166]=	203	;
cos[167]=	201	;
cos[168]=	198	;
cos[169]=	196	;
cos[170]=	193	;
cos[171]=	190	;
cos[172]=	188	;
cos[173]=	185	;
cos[174]=	182	;
cos[175]=	179	;
cos[176]=	176	;
cos[177]=	173	;
cos[178]=	170	;
cos[179]=	167	;
cos[180]=	165	;
cos[181]=	162	;
cos[182]=	158	;
cos[183]=	155	;
cos[184]=	152	;
cos[185]=	149	;
cos[186]=	146	;
cos[187]=	143	;
cos[188]=	140	;
cos[189]=	137	;
cos[190]=	134	;
cos[191]=	131	;
cos[192]=	128	;
cos[193]=	124	;
cos[194]=	121	;
cos[195]=	118	;
cos[196]=	115	;
cos[197]=	112	;
cos[198]=	109	;
cos[199]=	106	;
cos[200]=	103	;
cos[201]=	100	;
cos[202]=	97	;
cos[203]=	93	;
cos[204]=	90	;
cos[205]=	88	;
cos[206]=	85	;
cos[207]=	82	;
cos[208]=	79	;
cos[209]=	76	;
cos[210]=	73	;
cos[211]=	70	;
cos[212]=	67	;
cos[213]=	65	;
cos[214]=	62	;
cos[215]=	59	;
cos[216]=	57	;
cos[217]=	54	;
cos[218]=	52	;
cos[219]=	49	;
cos[220]=	47	;
cos[221]=	44	;
cos[222]=	42	;
cos[223]=	40	;
cos[224]=	37	;
cos[225]=	35	;
cos[226]=	33	;
cos[227]=	31	;
cos[228]=	29	;
cos[229]=	27	;
cos[230]=	25	;
cos[231]=	23	;
cos[232]=	21	;
cos[233]=	20	;
cos[234]=	18	;
cos[235]=	17	;
cos[236]=	15	;
cos[237]=	14	;
cos[238]=	12	;
cos[239]=	11	;
cos[240]=	10	;
cos[241]=	9	;
cos[242]=	7	;
cos[243]=	6	;
cos[244]=	5	;
cos[245]=	5	;
cos[246]=	4	;
cos[247]=	3	;
cos[248]=	2	;
cos[249]=	2	;
cos[250]=	1	;
cos[251]=	1	;
cos[252]=	1	;
cos[253]=	0	;
cos[254]=	0	;
cos[255]=	0	;
    end
always_ff@(posedge clk)
begin
counter = counter + freq_mul;
cos_out = cos[counter];
sin_data = sin[counter];
end   

endmodule
