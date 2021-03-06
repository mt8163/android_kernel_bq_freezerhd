/*
 * Copyright (C) 2016 MediaTek Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See http://www.gnu.org/licenses/gpl-2.0.html for more details.
 */


	.text

	.global __switch_to_smp
	.global __switch_to_amp

.equ ACTLR_SMP_BIT ,0x00000040

__switch_to_smp:
	MRC	p15,0,r0,c1,c0,1
	ORR	r0,r0,#ACTLR_SMP_BIT
	MCR	p15,0,r0,c1,c0,1
	BX	lr

__switch_to_amp:
	MRC	p15,0,r0,c1,c0,1
	BIC	r0,r0,#ACTLR_SMP_BIT
	MCR	p15,0,r0,c1,c0,1
	BX	lr
