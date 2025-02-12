Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FC91FFC59
	for <soc@lists.linux.dev>; Wed, 12 Feb 2025 22:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739399482; cv=none; b=r+zz0Cw0e5ZOoEMA8GmyVh9LVV0zWwQn3XSY9iGFVhb6igA7M2jFagaGJCgCmIPtEDOK9nbxOTyWYaHEYlSjoQ7M/q6l8LKjY8RMR872QNteH59juHPv56KT6xZfm6V+1GIEO0fk6Wd0OhC2h24gq21eZqGQTImVQHzlAfKfYuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739399482; c=relaxed/simple;
	bh=C5rKNCAp3ajPxfDFPBZWmHQnxa8j05xpYEE4gyHY0Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4ODgHj+pmLkygZRJdB21HeKESM+MQHPwrKDu/w60g2vaxLk1p1IsPUB2Ftco97BcSfBFkRNbso+LSM4x+0uwOGJe/afYopHjvHei8F4HILgDY5Ao+RDhVJMbACUWmnmsZr5kchLKvoIoSyVI/9X8+YwIrOg461CKGzTRCf/xz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7NBJYM/; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7NBJYM/"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7be8f281714so21219085a.1
        for <soc@lists.linux.dev>; Wed, 12 Feb 2025 14:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739399479; x=1740004279; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=adA61KlZ7NgJ00d9AP44x5Drt9hRKTZfXpJfv6UN5KI=;
        b=Z7NBJYM/Pi17M+6+Xu38ngpNvsJk5i5nuf43EghCMEugt8JM68szhn9PzJBwhTv/bC
         +TS4vvmSL8HL5Lncqr8CrWq6q509Kci4bsf7QpGq7ajRs8wvOXnsJ4YTyWTLASkDZrey
         nO3cG8IBvLcqsmYNUt5445oEpVupZutCtUtcrr957q2Mr6JBXQireeisi3cvkQYCb7FH
         JPQPOPffRSdusMK1HuAcjZOG5L/K4VBBXskK0M0+R16bM3Nl2WdAMcylZvAu9oc1u02G
         KpifbPjNaRHn42Wirt60HI008gZzD+49G6HoE7tXH/AOk4v47U4gOZTVN42dM9UWSpOk
         qGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739399479; x=1740004279;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adA61KlZ7NgJ00d9AP44x5Drt9hRKTZfXpJfv6UN5KI=;
        b=ckgghoCSHTCktCcWrqrKC6MtHLXCKlbeIoNVpaxXcjH6PmnfO9PtwxtyP5qLrmxJtg
         xcwHK6F+dv90zNEC83ANS0gYFRlnBl1K/w6/Wq9pTFsdwNK1/Sf1AAN3kxg7geYAZW1F
         ToxebPPnP816CB6aQKNMqHAMuJrFTDsVpEakYDnLfZGwqVGjEQ+896hPZ1EJJ/tHG1Sv
         6Dx4Ykfb4NMta+3pNNkyKHrbKoWMOHBC971UTGgLAspeBvUW8aFQdK2TN9VcorQvBhcT
         M7FmEv+AJEMoXlk5Xkjk29BkJX4yeFVJVxFwB79zkGOLWnOgrOa/btwnSkM6m/FOa7vR
         Caag==
X-Forwarded-Encrypted: i=1; AJvYcCVlmU/RJWL1yQ8UXlYtSGjoLdGdo9wtDxOHdKhrmO/TdRPjM5HQueOl3VRk26gkzoJ1ndY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2xGiL4IxiqKbGRh/8NQdhluwCoNW/Yg2fO6iQvTHmd8vBG+Kn
	SZTm2PbkGSD8j5KxhvaKg2z4a1ftKG8qr5rtG8ANJ8q6tIFYiy39
X-Gm-Gg: ASbGncsGbOI9hZnMwJQucWw3EwpYesWwwiRicEhintvUzpFA2MweRtMoa/XCLtFGC8l
	qOvRv+q+MIVnd4+F+SGTm5ToMxCeMABAMgRa2rKA3/yahfOM28kpoMukmNF+QEWMhkHSxFz2CF/
	GZtaC3GWTJz24rrPk479/6CU3saJ1AZ/TVSunrceNOT5olNRz6uXWH7tjfffLv4Xa7wKwREQalK
	ivM8+WIJTbY/IKwRUMOrO2ykOeey8oIVRlyx3ndKMJpsZpjbKXhmkhciTOfGC3MxX4=
X-Google-Smtp-Source: AGHT+IG/jqO7Gs3aNEJD2jlxWGUNxNPhJfXHJaQNAvosjjzRMKiNe50EuVFrHjd49yXn9DToPQh2SQ==
X-Received: by 2002:a05:620a:269c:b0:7c0:6c5b:d6e5 with SMTP id af79cd13be357-7c07a1ead00mr229402985a.54.1739399479479;
        Wed, 12 Feb 2025 14:31:19 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07518e80fsm127058185a.26.2025.02.12.14.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:31:19 -0800 (PST)
Date: Thu, 13 Feb 2025 06:31:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>
Subject: Re: [PATCH v2 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
Message-ID: <p5aolstlrxnhb7wk45eukthlwiui337fssbum4lrpflvui773i@beif6axz66jx>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
 <20250210220951.1248533-2-alexander.sverdlin@gmail.com>
 <uvy62iqzul6kajzsmiaovdzogftcsc5b53cswkv4cbxh4w6som@32libbd7kffq>
 <708cdc497b8474609989395dbf8a0898037a22de.camel@gmail.com>
 <33654180-5488-4601-9103-8e4218c4a198@kernel.org>
 <26ddcdaadd777f170dbab51ab840c899f0edde24.camel@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26ddcdaadd777f170dbab51ab840c899f0edde24.camel@gmail.com>

On Wed, Feb 12, 2025 at 06:44:15PM +0100, Alexander Sverdlin wrote:
> Hi 
> 
> On Wed, 2025-02-12 at 17:46 +0100, Krzysztof Kozlowski wrote:
> > > > > Make the peripheral device tree re-usable on ARM64 platform by moving CPU
> > > > > core and interrupt controllers' parts into the respective per-SoC .dtsi
> > > > > files.
> > > > > 
> > > > > Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nubering
> > > > > into "plic" interrupt-controller numbering.
> > > > > 
> > > > > Have a nice refactoring side-effect that "plic" and "clint" "compatible"
> > > > > property is not specified outside of the corresponding device itself.
> > > > > 
> > > > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > > > > ---
> > > > > Changelog:
> > > > > v2:
> > > > > - instead of carving out peripherals' part, carve out ARCH-specifics (CPU
> > > > > core, interrupt controllers) and spread them among 3 SoC .dtsi files which
> > > > > included cv18xx.dtsi;
> > > > > - define a label for the "soc" node and use it in the newly introduced DTs;
> > > > > 
> > > > >  arch/riscv/boot/dts/sophgo/cv1800b.dtsi    | 64 ++++++++++++---
> > > > >  arch/riscv/boot/dts/sophgo/cv1812h.dtsi    | 64 ++++++++++++---
> > > > >  arch/riscv/boot/dts/sophgo/cv181x.dtsi     |  2 +-
> > > > >  arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi | 57 ++++++++++++++
> > > > >  arch/riscv/boot/dts/sophgo/cv18xx.dtsi     | 91 ++++++----------------
> > > > >  arch/riscv/boot/dts/sophgo/sg2002.dtsi     | 64 ++++++++++++---
> > > > >  6 files changed, 240 insertions(+), 102 deletions(-)
> > > > >  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
> > > > > 
> > > > > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > > > index aa1f5df100f0..eef2884b36f9 100644
> > > > > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > > > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > > > @@ -3,6 +3,8 @@
> > > > >   * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > > > >   */
> > > > >  
> > > > > +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > > > > +
> > > > >  #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
> > > > >  #include "cv18xx.dtsi"
> > > > >  
> > > > > @@ -14,22 +16,62 @@ memory@80000000 {
> > > > >  		reg = <0x80000000 0x4000000>;
> > > > >  	};
> > > > >  
> > > > 
> > > > > -	soc {
> > > > > -		pinctrl: pinctrl@3001000 {
> > > > > -			compatible = "sophgo,cv1800b-pinctrl";
> > > > > -			reg = <0x03001000 0x1000>,
> > > > > -			      <0x05027000 0x1000>;
> > > > > -			reg-names = "sys", "rtc";
> > > > 
> > > > 
> > > > > +	cpus: cpus {
> > > > > +		#address-cells = <1>;
> > > > > +		#size-cells = <0>;
> > > > > +		timebase-frequency = <25000000>;
> > > > > +
> > > > > +		cpu0: cpu@0 {
> > > > > +			compatible = "thead,c906", "riscv";
> > > > > +			device_type = "cpu";
> > > > > +			reg = <0>;
> > > > > +			d-cache-block-size = <64>;
> > > > > +			d-cache-sets = <512>;
> > > > > +			d-cache-size = <65536>;
> > > > > +			i-cache-block-size = <64>;
> > > > > +			i-cache-sets = <128>;
> > > > > +			i-cache-size = <32768>;
> > > > > +			mmu-type = "riscv,sv39";
> > > > > +			riscv,isa = "rv64imafdc";
> > > > > +			riscv,isa-base = "rv64i";
> > > > > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> > > > > +					       "zifencei", "zihpm";
> > > > > +
> > > > > +			cpu0_intc: interrupt-controller {
> > > > > +				compatible = "riscv,cpu-intc";
> > > > > +				interrupt-controller;
> > > > > +				#interrupt-cells = <1>;
> > > > > +			};
> > > > >  		};
> > > > >  	};
> > > > >  };
> > > > 
> > > > Make all soc definition include the common cpu file. 
> > > > Not just copy it.
> > > 
> > > I was acting according to Krzysztof's suggestion:
> > > https://lore.kernel.org/soc/d3ba0ea5-0491-42d5-a18e-64cf21df696c@kernel.org/
> > > 
> > > Krzysztof, I can name the file cv18xx-cpu-intc.dtsi and pack CPU core + interrupt
> > > controllers into it. Would it make sense?
> > 
> > 
> > I don't understand the original suggestion.
> 
> This is the snippet in question:
> 
> ---[ cut ]---
> #define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> 
> / {
> 	cpus: cpus {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 		timebase-frequency = <25000000>;
> 
> 		cpu0: cpu@0 {
> 			compatible = "thead,c906", "riscv";
> 			device_type = "cpu";
> 			reg = <0>;
> 			d-cache-block-size = <64>;
> 			d-cache-sets = <512>;
> 			d-cache-size = <65536>;
> 			i-cache-block-size = <64>;
> 			i-cache-sets = <128>;
> 			i-cache-size = <32768>;
> 			mmu-type = "riscv,sv39";
> 			riscv,isa = "rv64imafdc";
> 			riscv,isa-base = "rv64i";
> 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> 					       "zifencei", "zihpm";
> 
> 			cpu0_intc: interrupt-controller {
> 				compatible = "riscv,cpu-intc";
> 				interrupt-controller;
> 				#interrupt-cells = <1>;
> 			};
> 		};
> 	};
> };
> 
> &soc {
> 	interrupt-parent = <&plic>;
> 	dma-noncoherent;
> 
> 	plic: interrupt-controller@70000000 {
> 		reg = <0x70000000 0x4000000>;
> 		interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> 		interrupt-controller;
> 		#address-cells = <0>;
> 		#interrupt-cells = <2>;
> 		riscv,ndev = <101>;
> 	};
> 
> 	clint: timer@74000000 {
> 		reg = <0x74000000 0x10000>;
> 		interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> 	};
> };
> ---[ cut ]---
> 
> Inochi's proposal is to put it into separate cv18xx-cpu-intc.dtsi and
> include the latter in 3 other SoC-specific .dtsis. 

Yes, this is what I want to say. Since I can confirm all cv18xx
series have the same riscv core (IIRC they share the same hw
design). There is no reason to duplicate them.

> In v2 I've just
> duplicated the above snippet 3 times (refer to diffstat above).
> 
> What are your thoughts? In Renesas everything is duplicated, I believe.
> Sophgo outsources much smaller snippets into .dtsi (refer to cv181x.dtsi). 
> 
> > Inochi, please trim unnecessary context from replies.
> 
> -- 
> Alexander Sverdlin.
> 
