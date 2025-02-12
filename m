Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9474120AF66
	for <soc@lists.linux.dev>; Wed, 12 Feb 2025 23:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739402945; cv=none; b=tOY68/wTiPzOMdWQ6Yhe5cNKgXLN983HdOJsNgKpukTVyxLvY/OBnL1Yddl/j/tn3ly+GyEk0wVn6VkCH0pX6IahHp4VU+AqZGmr9RauQum81gkMr3tR+Q4Qk+BlLzPOKx2wtSk0oiJEvDaDwQUW1NNiNaCcFLys3/S+rUH2yYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739402945; c=relaxed/simple;
	bh=SbvllPME6RIfIRZ0dZ9A0sCS42m7c2rpURnrOiCFEVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNrJ2E8VpkkzQgDszw5jhlRIp51b/Fg8Sq95oaZwdyFJ0dXA5SfX1vS5zRY6rc/g/jZ7Iw52ipELKFfuL92b0BNPL1cIEFLQPXwcz8l8cAPvLIA95CXpn/pqGTTBhrsyrXyyStk1yzGN2Q8Y8eVMfYCTS/xJVAR81Z+BAY9Y0kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxykS9aj; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxykS9aj"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-46fcbb96ba9so2445321cf.0
        for <soc@lists.linux.dev>; Wed, 12 Feb 2025 15:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739402942; x=1740007742; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xf6FEOPlsQCKDeS8/VmOQ+ZlZJhwCDMgN7NaCKS7CYU=;
        b=UxykS9ajGx3HjhReJw4E7qu60jDB5lWn34CPsdkvQZBsQUzEGBfBA1WQaaeEc2vpc2
         Txk2zYh9Em0SXw6r+x3856Wp6KzCXbsK4rF8O7Mbq1JI4vhDSExTmLXnegIPy+DbWgp0
         /wDNp2w9shhEclSU5entPhjUeVlTeMgwpcG/n12sqyidKbfgcliWvkcKpMknt5ByrqFD
         DSGX5jZcEOIvNQj4mdSCZPyFIqTrkkIyIHlAjptgGlgigjnMnSLEJ5gDNq+2UVpw9+OT
         NVFxX1conE+v+A/i65CuT7yyEYvSBti8U4s0c/Zmlc4rxNXPjC3TV4av3ohqAewdV9Z3
         Rp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739402942; x=1740007742;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xf6FEOPlsQCKDeS8/VmOQ+ZlZJhwCDMgN7NaCKS7CYU=;
        b=J80v+Ly+29hujk+9jD2aGP9Zr9naHVfIkpjqgjexhX4dJEsI8bM7yLWDRit/PJRL9y
         VfyuRpqBhxOfbBMMNlWSO9d+DrJRk+iqwHRpi/SmB41OPQ5qKQCqRJVa5LqLXWw0LzJh
         Axu6FRG3Qlw7D1ipmQvzJoBfs2x5kUguDVLrvw9zl/VtZ5mkI3iSKJWBgK4RbxlM5Tem
         mDuFWvuWN5Gt5TwvT67X7soFBGChykKtwOS9fKUofKun1ZXxcR2GHv2JpSe26TEBcY+F
         04dYjjmJLFTyiDWuY3QbOE38r6ESU6gXMB/wdwQIYXaDncsEPGCKyiiFIr/d/i1lwxvY
         jUhA==
X-Forwarded-Encrypted: i=1; AJvYcCWil+QjD9y28efSzZVmqFMTSMtQDJJSld/YELVohV+ilc9S7peN/vZYhCL7D3tatDm5tQ4=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywaumi4JtkZUix/iqAqoJu/w1AfOsqzIw7lmIKWLL3JnHGrcGlc
	GVhcH5N1+SIW65McPHBQ4P4SdxOkACQ0QrZL+dKZ1wCpRSGmj/Fs
X-Gm-Gg: ASbGncuHnEgtwGE13LLi0ytHPJBeuwXIgZsipivw1baEKMjQylT9/qByfGVBbY6qvGg
	xYOiWIEqyRwegtYODExBooMBQUkr817PBc0jhp2+A3e1xot0rtiNjod7ypbc96pbbp++R4/0xoy
	v4dvVU+xk+D04kMsKBplfONKsIbMDzV816Aiue/v1G5uHUPRiDsBSlacDA0/M/2qnn5qpZNjBHk
	kCGsE3GgO1bzYhpSXDXMM5ZKmPHr0D3OpHrW9xoxv18QSHlKbV0BKynA8NyKGEuO1w=
X-Google-Smtp-Source: AGHT+IGYzAubSVFkMrhIoFfMHJkYJiaTIPTRSix5tqjfLli9V0CYVWf7rD0PEDyVMCJ7C/TQE8oE9A==
X-Received: by 2002:a05:622a:8f1b:b0:467:8630:584f with SMTP id d75a77b69052e-471bee131b3mr18469391cf.36.1739402942343;
        Wed, 12 Feb 2025 15:29:02 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471c2a11e77sm605131cf.29.2025.02.12.15.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 15:29:01 -0800 (PST)
Date: Thu, 13 Feb 2025 07:28:54 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>
Subject: Re: [PATCH v3 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
Message-ID: <e7veoogv7qlmjelxiu34a2yvbtb6umgqscwo44ti7k562n7ow5@7uadzl4oubzb>
References: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
 <20250212224347.1767819-2-alexander.sverdlin@gmail.com>
 <x4zncooa3lmyf2bikowjw7oabz66dhhbxl44cmujzzkwaslcl5@tj3l2u7e4akx>
 <de4d99bf89f78a0a6e0a81dc6062af5e85d762aa.camel@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de4d99bf89f78a0a6e0a81dc6062af5e85d762aa.camel@gmail.com>

On Thu, Feb 13, 2025 at 12:04:39AM +0100, Alexander Sverdlin wrote:
> Hi Inochi!
> 
> On Thu, 2025-02-13 at 06:54 +0800, Inochi Amaoto wrote:
> > On Wed, Feb 12, 2025 at 11:43:33PM +0100, Alexander Sverdlin wrote:
> > > Make the peripheral device tree re-usable on ARM64 platform by moving CPU
> > > core and interrupt controllers' parts into new cv18xx-cpu.dtsi and
> > > cv18xx-intc.dtsi.
> > > 
> > > Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nubering
> > > into "plic" interrupt-controller numbering.
> > > 
> > > On RiscV side this patch has been dtc-compile-tested only. IRQ numbers
> > > substitution with SOC_PERIPHERAL_IRQ() has been scripted in vim.
> > > 
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > > ---
> > > Changelog:
> > > v3:
> > > - &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
> > > were moved into cv18xx-intc.dtsi to reduce code duplication;
> > > v2:
> > > - instead of carving out peripherals' part, carve out ARCH-specifics (CPU
> > > core, interrupt controllers) and spread them among 3 SoC .dtsi files which
> > > included cv18xx.dtsi;
> > > - define a label for the "soc" node and use it in the newly introduced DTs;
> > > 
> > >   arch/riscv/boot/dts/sophgo/cv1800b.dtsi     | 28 ++++---
> > >   arch/riscv/boot/dts/sophgo/cv1812h.dtsi     | 28 ++++---
> > >   arch/riscv/boot/dts/sophgo/cv181x.dtsi      |  2 +-
> > >   arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi  | 36 ++++++++
> > >   arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi | 23 ++++++
> > >   arch/riscv/boot/dts/sophgo/cv18xx.dtsi      | 91 ++++++---------------
> > >   arch/riscv/boot/dts/sophgo/sg2002.dtsi      | 34 ++++----
> > >   7 files changed, 137 insertions(+), 105 deletions(-)
> > >   create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
> > >   create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi
> > > 
> > > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > index aa1f5df100f0..9fb7dd2dab18 100644
> > > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > @@ -3,8 +3,12 @@
> > >    * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > >    */
> > >   
> > > +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > > +
> > >   #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
> > > +#include "cv18xx-cpu.dtsi"
> > >   #include "cv18xx.dtsi"
> > > +#include "cv18xx-intc.dtsi"
> > >   
> > >   / {
> > >   	compatible = "sophgo,cv1800b";
> > > @@ -13,17 +17,23 @@ memory@80000000 {
> > >   		device_type = "memory";
> > >   		reg = <0x80000000 0x4000000>;
> > >   	};
> > > +};
> > > +
> > 
> > > +&soc {
> > > +	dma-noncoherent;
> > >   
> > > -	soc {
> > > -		pinctrl: pinctrl@3001000 {
> > > -			compatible = "sophgo,cv1800b-pinctrl";
> > > -			reg = <0x03001000 0x1000>,
> > > -			      <0x05027000 0x1000>;
> > > -			reg-names = "sys", "rtc";
> > > -		};
> > > +	pinctrl: pinctrl@3001000 {
> > > +		compatible = "sophgo,cv1800b-pinctrl";
> > > +		reg = <0x03001000 0x1000>,
> > > +		      <0x05027000 0x1000>;
> > > +		reg-names = "sys", "rtc";
> > >   	};
> > >   };
> > >   
> > 
> > The origianl /soc path can be used to override things, 
> > why change it to the reference archor? I see no change
> > for it.
> 
> https://lore.kernel.org/soc/d3ba0ea5-0491-42d5-a18e-64cf21df696c@kernel.org/
> The corresponding label is being introduced in cv18xx.dtsi.
> 

Yes I know, but I wonder why you change it here, the url you provide
told nothing about change existing structure.

The origianl struct:

/ {
	soc {
		...
	};
};

it can also be used to add things in /soc, renesa uses this in that
form is not the reason for this change. I prefer to keep original
structure so less change is introducted.

> > > +&clk {
> > > +	compatible = "sophgo,cv1800-clk";
> > > +};
> > > +
> > >   &plic {
> > >   	compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
> > >   };
> > > @@ -31,7 +41,3 @@ &plic {
> > >   &clint {
> > >   	compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
> > >   };
> > > -
> > > -&clk {
> > > -	compatible = "sophgo,cv1800-clk";
> > > -};
> > > diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> > > index 8a1b95c5116b..f23c4dd6687d 100644
> > > --- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> > > +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> > > @@ -3,10 +3,14 @@
> > >    * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> > >    */
> > >   
> > > +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > > +
> > >   #include <dt-bindings/interrupt-controller/irq.h>
> > >   #include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
> > > +#include "cv18xx-cpu.dtsi"
> > >   #include "cv18xx.dtsi"
> > >   #include "cv181x.dtsi"
> > > +#include "cv18xx-intc.dtsi"
> > >   
> > >   / {
> > >   	compatible = "sophgo,cv1812h";
> > > @@ -15,17 +19,23 @@ memory@80000000 {
> > >   		device_type = "memory";
> > >   		reg = <0x80000000 0x10000000>;
> > >   	};
> > > +};
> > > +
> > > +&soc {
> > 
> > > +	dma-noncoherent;
> > 
> > I think this can be moved into cv18xx-cpu.dtsi file, and let
> > all SoCs share it.
> 
> https://lore.kernel.org/soc/d3ba0ea5-0491-42d5-a18e-64cf21df696c@kernel.org/
> 
> If SOC_PERIPHERAL_IRQ() doesn't belong to -cpu.dtsi, then "dma-noncoherent;"
> probably neither...
> 

This is OK for me.

> > > -	soc {
> > > -		pinctrl: pinctrl@3001000 {
> > > -			compatible = "sophgo,cv1812h-pinctrl";
> > > -			reg = <0x03001000 0x1000>,
> > > -			      <0x05027000 0x1000>;
> > > -			reg-names = "sys", "rtc";
> > > -		};
> > > +	pinctrl: pinctrl@3001000 {
> > > +		compatible = "sophgo,cv1812h-pinctrl";
> > > +		reg = <0x03001000 0x1000>,
> > > +		      <0x05027000 0x1000>;
> > > +		reg-names = "sys", "rtc";
> > >   	};
> > >   };
> > >   
> > > +&clk {
> > > +	compatible = "sophgo,cv1810-clk";
> > > +};
> > > +
> > >   &plic {
> > >   	compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
> > >   };
> > > @@ -33,7 +43,3 @@ &plic {
> > >   &clint {
> > >   	compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
> > >   };
> > > -
> > > -&clk {
> > > -	compatible = "sophgo,cv1810-clk";
> > > -};
> > > 
> > > [...]
> > > 
> > 
> > > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi
> > > new file mode 100644
> > > index 000000000000..90817993a326
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi
> > > @@ -0,0 +1,23 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +/*
> > > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > > + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> > > + */
> > > +
> > > +&soc {
> > > +	interrupt-parent = <&plic>;
> > > +
> > > +	plic: interrupt-controller@70000000 {
> > > +		reg = <0x70000000 0x4000000>;
> > > +		interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> > > +		interrupt-controller;
> > > +		#address-cells = <0>;
> > > +		#interrupt-cells = <2>;
> > > +		riscv,ndev = <101>;
> > > +	};
> > > +
> > > +	clint: timer@74000000 {
> > > +		reg = <0x74000000 0x10000>;
> > > +		interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> > > +	};
> > > +};
> > 
> > 
> > I think this file can be merged in to cv18xx-cpu.dtsi.
> > clint and plic is more like a core specific device.
> 
> Yes, this can be done now, as long as SOC_PERIPHERAL_IRQ() remains
> outside of the -cpu-intc.dtsi...
> 
> -- 
> Alexander Sverdlin.
> 
