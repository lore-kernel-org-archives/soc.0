Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1253B205E2D
	for <soc@lists.linux.dev>; Wed, 12 Feb 2025 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739352397; cv=none; b=QYeEAgzFNtkZmiVW02yjZTk1JsmadsPYGYVt9ZcW/TYCLYCFn3l7bhLCe/2exe3ZYMrBjA8JIWblfXIvzi4tBuRenGxGPp1yRRSdkRMhf+xgggKmgi83czO5cYPyV+Azt7aExCaxvYnKZVU+3O33EV65H+69oFToJpONprJ0c3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739352397; c=relaxed/simple;
	bh=hNNGA7MckC7OqZHAZ1b/uK0ou3f6jZgOrXWDf+vvX7U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EMPCO4HizuKKWp8AixUflcL8ACTK6BgFCn+AuxMaRNYeE5hIhoZzZwYOW70Kza468E25lTYUmhzbt35eDK4oSA/5pi2ZZFl0qtU9vyFf7QVsXd4HRUPuA8YuDICNM0PBF8k/GmJcyjTLKpQCUclebKFARE1Eq2wrXEC6VENjYK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DswhL17w; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DswhL17w"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5de4d3bbc76so8802814a12.3
        for <soc@lists.linux.dev>; Wed, 12 Feb 2025 01:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739352393; x=1739957193; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OJaReYYMX6Z/fw7iyoJ5zZPhqhh6orEXbX4cQL6QIEE=;
        b=DswhL17wC6t0wJofT5/o9E1Q0AO+cIXovPMxzVBZFykXPcyWMSHuhHi13tV/3KAxe/
         UG3w1JB/NjN3TGy4Jp2v52GNzfXJ7PD7w1yf0xyKARSEsKQ4ElCixST65x1I+cg5/KT3
         G537cUDCuPb49bOGOde8AlMoyaLroXHDoSTDoJyc3iuH3604L5JsorMBPLiXNO4pQ9YI
         ifTYK5w3S5xSwEeg/P6qJN6lsuu8XEhjsub3CWGlMvpB89OlajQxyV4CKcUy9iRxSlUx
         p1OJtzgL7zW51YNqP4+Ajax1D8BHREtzW13B3X2nHa6DspiTrkArewKqSgLFZmCThJRH
         Rh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739352393; x=1739957193;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OJaReYYMX6Z/fw7iyoJ5zZPhqhh6orEXbX4cQL6QIEE=;
        b=X9ZgK6vSHXFq6Gu6gKJpzbY1BZVByY+i/cLkIKyTXYuV2DBcxj6zqf2ExhpI6aMLwQ
         RbEylGWc2UAjPjRucqMq3eyfl9qrFtnNQFZ2vr5gI+bW2pbIFcXN+MGDzmeHKHTk+TWJ
         0FfCwU7JurCUJeSiTylxgHBZBtu9UWjMRKft6WnaXFw6rjoIdFytDKxzGj5oMTbmDAt6
         Nu8ISuteK7hQwp94CD6nh4Tz4A9Ji2m8QSbLEvB01MXW9alwrt9pCRRg1XrtMexbYp+w
         +ErnSfcKYoLxU9EiJSrKxB0wGBHe0v7yv/v4py+dTjgv7UrfJPHLpHBp5YWmq/e13pxS
         EgRw==
X-Forwarded-Encrypted: i=1; AJvYcCUN9pvQYukJMnS8AQKv4F/3KipNStdtfylyf8N94NXS50Tsf5QRef9Folg/yqR/y3QXfQ0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5DNRUZSZtWb+RMiItLU2lPwMDr11rdWicfeR/TNK/+wRJWqyt
	qBUWn041XUSe0ogsXYxEfPSS3Z4p8Sqvkpu6YSyXkkBAtVtecaOt
X-Gm-Gg: ASbGncu9xKYhQjJ9aAD3jpniw3pTBrjbV9+6DbffMHMNhp9ZVffRDXdZkomscz9KiEg
	x9byHS88rxmJsRYrOGp1yBPR/WvZWSxKVupKN/wjKHrdj7nwmbsvMWlKG1bVFY5ZcDOX5f+ZAfM
	/DqOfY4vX536FpGFc5e6dTwNvKWNr3FLjOu5cRzYL6QTN7NsDh8/IUDhFFC2tTL/kDlt3fJzF/P
	AnTIbEe5NQ6CUIfWC3/Jn7VFogNsBwjZV/GuUyG6GhsQoM4RYj2AaoZ4ACy7zFDugnP74ihK255
	gMHUJgazJ4pcP1lQi4/sUSvvXzbG5SYz
X-Google-Smtp-Source: AGHT+IFeXBiL3Zpdh5C/ESK7Pr9cqXP5N91PGCl1qu9DFXAuI/rtK19Ymuac2ywApZmo7T5zwgjyQw==
X-Received: by 2002:a05:6402:40d6:b0:5dc:8f03:bb25 with SMTP id 4fb4d7f45d1cf-5deadd7802amr2427430a12.6.1739352392821;
        Wed, 12 Feb 2025 01:26:32 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de5ced9758sm8064096a12.76.2025.02.12.01.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:26:32 -0800 (PST)
Message-ID: <708cdc497b8474609989395dbf8a0898037a22de.camel@gmail.com>
Subject: Re: [PATCH v2 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu	 <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Paul Walmsley	
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Chao Wei	
 <chao.wei@sophgo.com>
Date: Wed, 12 Feb 2025 10:26:28 +0100
In-Reply-To: <uvy62iqzul6kajzsmiaovdzogftcsc5b53cswkv4cbxh4w6som@32libbd7kffq>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
	 <20250210220951.1248533-2-alexander.sverdlin@gmail.com>
	 <uvy62iqzul6kajzsmiaovdzogftcsc5b53cswkv4cbxh4w6som@32libbd7kffq>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Inochi, Krzysztof,

On Wed, 2025-02-12 at 08:31 +0800, Inochi Amaoto wrote:
> On Mon, Feb 10, 2025 at 11:09:41PM +0100, Alexander Sverdlin wrote:
> > Make the peripheral device tree re-usable on ARM64 platform by moving C=
PU
> > core and interrupt controllers' parts into the respective per-SoC .dtsi
> > files.
> >=20
> > Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nuberin=
g
> > into "plic" interrupt-controller numbering.
> >=20
> > Have a nice refactoring side-effect that "plic" and "clint" "compatible=
"
> > property is not specified outside of the corresponding device itself.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> > Changelog:
> > v2:
> > - instead of carving out peripherals' part, carve out ARCH-specifics (C=
PU
> > core, interrupt controllers) and spread them among 3 SoC .dtsi files wh=
ich
> > included cv18xx.dtsi;
> > - define a label for the "soc" node and use it in the newly introduced =
DTs;
> >=20
> > =C2=A0arch/riscv/boot/dts/sophgo/cv1800b.dtsi=C2=A0=C2=A0=C2=A0 | 64 ++=
++++++++++---
> > =C2=A0arch/riscv/boot/dts/sophgo/cv1812h.dtsi=C2=A0=C2=A0=C2=A0 | 64 ++=
++++++++++---
> > =C2=A0arch/riscv/boot/dts/sophgo/cv181x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> > =C2=A0arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi | 57 ++++++++++++++
> > =C2=A0arch/riscv/boot/dts/sophgo/cv18xx.dtsi=C2=A0=C2=A0=C2=A0=C2=A0 | =
91 ++++++----------------
> > =C2=A0arch/riscv/boot/dts/sophgo/sg2002.dtsi=C2=A0=C2=A0=C2=A0=C2=A0 | =
64 ++++++++++++---
> > =C2=A06 files changed, 240 insertions(+), 102 deletions(-)
> > =C2=A0create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
> >=20
> > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/=
dts/sophgo/cv1800b.dtsi
> > index aa1f5df100f0..eef2884b36f9 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > @@ -3,6 +3,8 @@
> > =C2=A0 * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > =C2=A0 */
> > =C2=A0
> > +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > +
> > =C2=A0#include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
> > =C2=A0#include "cv18xx.dtsi"
> > =C2=A0
> > @@ -14,22 +16,62 @@ memory@80000000 {
> > =C2=A0		reg =3D <0x80000000 0x4000000>;
> > =C2=A0	};
> > =C2=A0
>=20
> > -	soc {
> > -		pinctrl: pinctrl@3001000 {
> > -			compatible =3D "sophgo,cv1800b-pinctrl";
> > -			reg =3D <0x03001000 0x1000>,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > -			reg-names =3D "sys", "rtc";
>=20
>=20
> > +	cpus: cpus {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		timebase-frequency =3D <25000000>;
> > +
> > +		cpu0: cpu@0 {
> > +			compatible =3D "thead,c906", "riscv";
> > +			device_type =3D "cpu";
> > +			reg =3D <0>;
> > +			d-cache-block-size =3D <64>;
> > +			d-cache-sets =3D <512>;
> > +			d-cache-size =3D <65536>;
> > +			i-cache-block-size =3D <64>;
> > +			i-cache-sets =3D <128>;
> > +			i-cache-size =3D <32768>;
> > +			mmu-type =3D "riscv,sv39";
> > +			riscv,isa =3D "rv64imafdc";
> > +			riscv,isa-base =3D "rv64i";
> > +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "z=
icsr",
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "zifencei", "zihpm";
> > +
> > +			cpu0_intc: interrupt-controller {
> > +				compatible =3D "riscv,cpu-intc";
> > +				interrupt-controller;
> > +				#interrupt-cells =3D <1>;
> > +			};
> > =C2=A0		};
> > =C2=A0	};
> > =C2=A0};
>=20
> Make all soc definition include the common cpu file.=20
> Not just copy it.

I was acting according to Krzysztof's suggestion:
https://lore.kernel.org/soc/d3ba0ea5-0491-42d5-a18e-64cf21df696c@kernel.org=
/

Krzysztof, I can name the file cv18xx-cpu-intc.dtsi and pack CPU core + int=
errupt
controllers into it. Would it make sense?

> > =C2=A0
> > -&plic {
> > -	compatible =3D "sophgo,cv1800b-plic", "thead,c900-plic";
> > -};
> > +&soc {
> > +	interrupt-parent =3D <&plic>;
> > +	dma-noncoherent;
> > =C2=A0
> > -&clint {
> > -	compatible =3D "sophgo,cv1800b-clint", "thead,c900-clint";
> > +	pinctrl: pinctrl@3001000 {
> > +		compatible =3D "sophgo,cv1800b-pinctrl";
> > +		reg =3D <0x03001000 0x1000>,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > +		reg-names =3D "sys", "rtc";
> > +	};
> > +
> > +	plic: interrupt-controller@70000000 {
> > +		compatible =3D "sophgo,cv1800b-plic", "thead,c900-plic";
> > +		reg =3D <0x70000000 0x4000000>;
> > +		interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
> > +		interrupt-controller;
> > +		#address-cells =3D <0>;
> > +		#interrupt-cells =3D <2>;
> > +		riscv,ndev =3D <101>;
> > +	};
> > +
> > +	clint: timer@74000000 {
> > +		compatible =3D "sophgo,cv1800b-clint", "thead,c900-clint";
> > +		reg =3D <0x74000000 0x10000>;
> > +		interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>;
> > +	};
> > =C2=A0};
> > =C2=A0
> > =C2=A0&clk {
> > diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/=
dts/sophgo/cv1812h.dtsi
> > index 8a1b95c5116b..54f7e229bcd8 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> > @@ -3,6 +3,8 @@
> > =C2=A0 * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> > =C2=A0 */
> > =C2=A0
> > +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > +
> > =C2=A0#include <dt-bindings/interrupt-controller/irq.h>
> > =C2=A0#include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
> > =C2=A0#include "cv18xx.dtsi"
> > @@ -16,22 +18,62 @@ memory@80000000 {
> > =C2=A0		reg =3D <0x80000000 0x10000000>;
> > =C2=A0	};
> > =C2=A0
> > -	soc {
> > -		pinctrl: pinctrl@3001000 {
> > -			compatible =3D "sophgo,cv1812h-pinctrl";
> > -			reg =3D <0x03001000 0x1000>,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > -			reg-names =3D "sys", "rtc";
> > +	cpus: cpus {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		timebase-frequency =3D <25000000>;
> > +
> > +		cpu0: cpu@0 {
> > +			compatible =3D "thead,c906", "riscv";
> > +			device_type =3D "cpu";
> > +			reg =3D <0>;
> > +			d-cache-block-size =3D <64>;
> > +			d-cache-sets =3D <512>;
> > +			d-cache-size =3D <65536>;
> > +			i-cache-block-size =3D <64>;
> > +			i-cache-sets =3D <128>;
> > +			i-cache-size =3D <32768>;
> > +			mmu-type =3D "riscv,sv39";
> > +			riscv,isa =3D "rv64imafdc";
> > +			riscv,isa-base =3D "rv64i";
> > +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "z=
icsr",
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "zifencei", "zihpm";
> > +
> > +			cpu0_intc: interrupt-controller {
> > +				compatible =3D "riscv,cpu-intc";
> > +				interrupt-controller;
> > +				#interrupt-cells =3D <1>;
> > +			};
> > =C2=A0		};
> > =C2=A0	};
> > =C2=A0};
> > =C2=A0
> > -&plic {
> > -	compatible =3D "sophgo,cv1812h-plic", "thead,c900-plic";
> > -};
> > +&soc {
> > +	interrupt-parent =3D <&plic>;
> > +	dma-noncoherent;
> > =C2=A0
> > -&clint {
> > -	compatible =3D "sophgo,cv1812h-clint", "thead,c900-clint";
> > +	pinctrl: pinctrl@3001000 {
> > +		compatible =3D "sophgo,cv1812h-pinctrl";
> > +		reg =3D <0x03001000 0x1000>,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > +		reg-names =3D "sys", "rtc";
> > +	};
> > +
> > +	plic: interrupt-controller@70000000 {
> > +		compatible =3D "sophgo,cv1812h-plic", "thead,c900-plic";
> > +		reg =3D <0x70000000 0x4000000>;
> > +		interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
> > +		interrupt-controller;
> > +		#address-cells =3D <0>;
> > +		#interrupt-cells =3D <2>;
> > +		riscv,ndev =3D <101>;
> > +	};
> > +
> > +	clint: timer@74000000 {
> > +		compatible =3D "sophgo,cv1812h-clint", "thead,c900-clint";
> > +		reg =3D <0x74000000 0x10000>;
> > +		interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>;
> > +	};
> > =C2=A0};
> > =C2=A0
> > =C2=A0&clk {
> > diff --git a/arch/riscv/boot/dts/sophgo/cv181x.dtsi b/arch/riscv/boot/d=
ts/sophgo/cv181x.dtsi
> > index 5fd14dd1b14f..bbdb30653e9a 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv181x.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv181x.dtsi
> > @@ -11,7 +11,7 @@ soc {
> > =C2=A0		emmc: mmc@4300000 {
> > =C2=A0			compatible =3D "sophgo,cv1800b-dwcmshc";
> > =C2=A0			reg =3D <0x4300000 0x1000>;
> > -			interrupts =3D <34 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(18) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			clocks =3D <&clk CLK_AXI4_EMMC>,
> > =C2=A0				 <&clk CLK_EMMC>;
> > =C2=A0			clock-names =3D "core", "bus";
> > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi b/arch/riscv/bo=
ot/dts/sophgo/cv18xx-cpu.dtsi
> > new file mode 100644
> > index 000000000000..a68d61131efb
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
> > @@ -0,0 +1,57 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> > + */
> > +
> > +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > +
> > +/ {
> > +	cpus: cpus {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		timebase-frequency =3D <25000000>;
> > +
> > +		cpu0: cpu@0 {
> > +			compatible =3D "thead,c906", "riscv";
> > +			device_type =3D "cpu";
> > +			reg =3D <0>;
> > +			d-cache-block-size =3D <64>;
> > +			d-cache-sets =3D <512>;
> > +			d-cache-size =3D <65536>;
> > +			i-cache-block-size =3D <64>;
> > +			i-cache-sets =3D <128>;
> > +			i-cache-size =3D <32768>;
> > +			mmu-type =3D "riscv,sv39";
> > +			riscv,isa =3D "rv64imafdc";
> > +			riscv,isa-base =3D "rv64i";
> > +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "z=
icsr",
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "zifencei", "zihpm";
> > +
> > +			cpu0_intc: interrupt-controller {
> > +				compatible =3D "riscv,cpu-intc";
> > +				interrupt-controller;
> > +				#interrupt-cells =3D <1>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&soc {
> > +	interrupt-parent =3D <&plic>;
> > +	dma-noncoherent;
> > +
> > +	plic: interrupt-controller@70000000 {
> > +		reg =3D <0x70000000 0x4000000>;
> > +		interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
> > +		interrupt-controller;
> > +		#address-cells =3D <0>;
> > +		#interrupt-cells =3D <2>;
> > +		riscv,ndev =3D <101>;
> > +	};
> > +
> > +	clint: timer@74000000 {
> > +		reg =3D <0x74000000 0x10000>;
> > +		interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>;
> > +	};
> > +};
> > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/d=
ts/sophgo/cv18xx.dtsi
> > index c18822ec849f..62c1464a0490 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > @@ -12,47 +12,16 @@ / {
> > =C2=A0	#address-cells =3D <1>;
> > =C2=A0	#size-cells =3D <1>;
> > =C2=A0
> > -	cpus: cpus {
> > -		#address-cells =3D <1>;
> > -		#size-cells =3D <0>;
> > -		timebase-frequency =3D <25000000>;
> > -
> > -		cpu0: cpu@0 {
> > -			compatible =3D "thead,c906", "riscv";
> > -			device_type =3D "cpu";
> > -			reg =3D <0>;
> > -			d-cache-block-size =3D <64>;
> > -			d-cache-sets =3D <512>;
> > -			d-cache-size =3D <65536>;
> > -			i-cache-block-size =3D <64>;
> > -			i-cache-sets =3D <128>;
> > -			i-cache-size =3D <32768>;
> > -			mmu-type =3D "riscv,sv39";
> > -			riscv,isa =3D "rv64imafdc";
> > -			riscv,isa-base =3D "rv64i";
> > -			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "z=
icsr",
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "zifencei", "zihpm";
> > -
> > -			cpu0_intc: interrupt-controller {
> > -				compatible =3D "riscv,cpu-intc";
> > -				interrupt-controller;
> > -				#interrupt-cells =3D <1>;
> > -			};
> > -		};
> > -	};
> > -
> > =C2=A0	osc: oscillator {
> > =C2=A0		compatible =3D "fixed-clock";
> > =C2=A0		clock-output-names =3D "osc_25m";
> > =C2=A0		#clock-cells =3D <0>;
> > =C2=A0	};
> > =C2=A0
> > -	soc {
> > +	soc: soc {
> > =C2=A0		compatible =3D "simple-bus";
> > -		interrupt-parent =3D <&plic>;
> > =C2=A0		#address-cells =3D <1>;
> > =C2=A0		#size-cells =3D <1>;
> > -		dma-noncoherent;
> > =C2=A0		ranges;
> > =C2=A0
> > =C2=A0		clk: clock-controller@3002000 {
> > @@ -75,7 +44,7 @@ porta: gpio-controller@0 {
> > =C2=A0				reg =3D <0>;
> > =C2=A0				interrupt-controller;
> > =C2=A0				#interrupt-cells =3D <2>;
> > -				interrupts =3D <60 IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupts =3D <SOC_PERIPHERAL_IRQ(44) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			};
> > =C2=A0		};
> > =C2=A0
> > @@ -93,7 +62,7 @@ portb: gpio-controller@0 {
> > =C2=A0				reg =3D <0>;
> > =C2=A0				interrupt-controller;
> > =C2=A0				#interrupt-cells =3D <2>;
> > -				interrupts =3D <61 IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupts =3D <SOC_PERIPHERAL_IRQ(45) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			};
> > =C2=A0		};
> > =C2=A0
> > @@ -111,7 +80,7 @@ portc: gpio-controller@0 {
> > =C2=A0				reg =3D <0>;
> > =C2=A0				interrupt-controller;
> > =C2=A0				#interrupt-cells =3D <2>;
> > -				interrupts =3D <62 IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupts =3D <SOC_PERIPHERAL_IRQ(46) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			};
> > =C2=A0		};
> > =C2=A0
> > @@ -129,7 +98,7 @@ portd: gpio-controller@0 {
> > =C2=A0				reg =3D <0>;
> > =C2=A0				interrupt-controller;
> > =C2=A0				#interrupt-cells =3D <2>;
> > -				interrupts =3D <63 IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupts =3D <SOC_PERIPHERAL_IRQ(47) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			};
> > =C2=A0		};
> > =C2=A0
> > @@ -137,7 +106,7 @@ saradc: adc@30f0000 {
> > =C2=A0			compatible =3D "sophgo,cv1800b-saradc";
> > =C2=A0			reg =3D <0x030f0000 0x1000>;
> > =C2=A0			clocks =3D <&clk CLK_SARADC>;
> > -			interrupts =3D <100 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(84) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			#address-cells =3D <1>;
> > =C2=A0			#size-cells =3D <0>;
> > =C2=A0			status =3D "disabled";
> > @@ -162,7 +131,7 @@ i2c0: i2c@4000000 {
> > =C2=A0			#size-cells =3D <0>;
> > =C2=A0			clocks =3D <&clk CLK_I2C>, <&clk CLK_APB_I2C0>;
> > =C2=A0			clock-names =3D "ref", "pclk";
> > -			interrupts =3D <49 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(33) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			status =3D "disabled";
> > =C2=A0		};
> > =C2=A0
> > @@ -173,7 +142,7 @@ i2c1: i2c@4010000 {
> > =C2=A0			#size-cells =3D <0>;
> > =C2=A0			clocks =3D <&clk CLK_I2C>, <&clk CLK_APB_I2C1>;
> > =C2=A0			clock-names =3D "ref", "pclk";
> > -			interrupts =3D <50 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(34) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			status =3D "disabled";
> > =C2=A0		};
> > =C2=A0
> > @@ -184,7 +153,7 @@ i2c2: i2c@4020000 {
> > =C2=A0			#size-cells =3D <0>;
> > =C2=A0			clocks =3D <&clk CLK_I2C>, <&clk CLK_APB_I2C2>;
> > =C2=A0			clock-names =3D "ref", "pclk";
> > -			interrupts =3D <51 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(35) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			status =3D "disabled";
> > =C2=A0		};
> > =C2=A0
> > @@ -195,7 +164,7 @@ i2c3: i2c@4030000 {
> > =C2=A0			#size-cells =3D <0>;
> > =C2=A0			clocks =3D <&clk CLK_I2C>, <&clk CLK_APB_I2C3>;
> > =C2=A0			clock-names =3D "ref", "pclk";
> > -			interrupts =3D <52 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(36) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			status =3D "disabled";
> > =C2=A0		};
> > =C2=A0
> > @@ -206,14 +175,14 @@ i2c4: i2c@4040000 {
> > =C2=A0			#size-cells =3D <0>;
> > =C2=A0			clocks =3D <&clk CLK_I2C>, <&clk CLK_APB_I2C4>;
> > =C2=A0			clock-names =3D "ref", "pclk";
> > -			interrupts =3D <53 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(37) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			status =3D "disabled";
> > =C2=A0		};
> > =C2=A0
> > =C2=A0		uart0: serial@4140000 {
> > =C2=A0			compatible =3D "snps,dw-apb-uart";
> > =C2=A0			reg =3D <0x04140000 0x100>;
> > -			interrupts =3D <44 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(28) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			clocks =3D <&clk CLK_UART0>, <&clk CLK_APB_UART0>;
> > =C2=A0			clock-names =3D "baudclk", "apb_pclk";
> > =C2=A0			reg-shift =3D <2>;
> > @@ -224,7 +193,7 @@ uart0: serial@4140000 {
> > =C2=A0		uart1: serial@4150000 {
> > =C2=A0			compatible =3D "snps,dw-apb-uart";
> > =C2=A0			reg =3D <0x04150000 0x100>;
> > -			interrupts =3D <45 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(29) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			clocks =3D <&clk CLK_UART1>, <&clk CLK_APB_UART1>;
> > =C2=A0			clock-names =3D "baudclk", "apb_pclk";
> > =C2=A0			reg-shift =3D <2>;
> > @@ -235,7 +204,7 @@ uart1: serial@4150000 {
> > =C2=A0		uart2: serial@4160000 {
> > =C2=A0			compatible =3D "snps,dw-apb-uart";
> > =C2=A0			reg =3D <0x04160000 0x100>;
> > -			interrupts =3D <46 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(30) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			clocks =3D <&clk CLK_UART2>, <&clk CLK_APB_UART2>;
> > =C2=A0			clock-names =3D "baudclk", "apb_pclk";
> > =C2=A0			reg-shift =3D <2>;
> > @@ -246,7 +215,7 @@ uart2: serial@4160000 {
> > =C2=A0		uart3: serial@4170000 {
> > =C2=A0			compatible =3D "snps,dw-apb-uart";
> > =C2=A0			reg =3D <0x04170000 0x100>;
> > -			interrupts =3D <47 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(31) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			clocks =3D <&clk CLK_UART3>, <&clk CLK_APB_UART3>;
> > =C2=A0			clock-names =3D "baudclk", "apb_pclk";
> > =C2=A0			reg-shift =3D <2>;
> > @@ -261,7 +230,7 @@ spi0: spi@4180000 {
> > =C2=A0			#size-cells =3D <0>;
> > =C2=A0			clocks =3D <&clk CLK_SPI>, <&clk CLK_APB_SPI0>;
> > =C2=A0			clock-names =3D "ssi_clk", "pclk";
> > -			interrupts =3D <54 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(38) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			status =3D "disabled";
> > =C2=A0		};
> > =C2=A0
> > @@ -272,7 +241,7 @@ spi1: spi@4190000 {
> > =C2=A0			#size-cells =3D <0>;
> > =C2=A0			clocks =3D <&clk CLK_SPI>, <&clk CLK_APB_SPI1>;
> > =C2=A0			clock-names =3D "ssi_clk", "pclk";
> > -			interrupts =3D <55 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(39) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			status =3D "disabled";
> > =C2=A0		};
> > =C2=A0
> > @@ -283,7 +252,7 @@ spi2: spi@41a0000 {
> > =C2=A0			#size-cells =3D <0>;
> > =C2=A0			clocks =3D <&clk CLK_SPI>, <&clk CLK_APB_SPI2>;
> > =C2=A0			clock-names =3D "ssi_clk", "pclk";
> > -			interrupts =3D <56 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(40) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			status =3D "disabled";
> > =C2=A0		};
> > =C2=A0
> > @@ -294,14 +263,14 @@ spi3: spi@41b0000 {
> > =C2=A0			#size-cells =3D <0>;
> > =C2=A0			clocks =3D <&clk CLK_SPI>, <&clk CLK_APB_SPI3>;
> > =C2=A0			clock-names =3D "ssi_clk", "pclk";
> > -			interrupts =3D <57 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(41) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			status =3D "disabled";
> > =C2=A0		};
> > =C2=A0
> > =C2=A0		uart4: serial@41c0000 {
> > =C2=A0			compatible =3D "snps,dw-apb-uart";
> > =C2=A0			reg =3D <0x041c0000 0x100>;
> > -			interrupts =3D <48 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(32) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			clocks =3D <&clk CLK_UART4>, <&clk CLK_APB_UART4>;
> > =C2=A0			clock-names =3D "baudclk", "apb_pclk";
> > =C2=A0			reg-shift =3D <2>;
> > @@ -312,7 +281,7 @@ uart4: serial@41c0000 {
> > =C2=A0		sdhci0: mmc@4310000 {
> > =C2=A0			compatible =3D "sophgo,cv1800b-dwcmshc";
> > =C2=A0			reg =3D <0x4310000 0x1000>;
> > -			interrupts =3D <36 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(20) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			clocks =3D <&clk CLK_AXI4_SD0>,
> > =C2=A0				 <&clk CLK_SD0>;
> > =C2=A0			clock-names =3D "core", "bus";
> > @@ -322,7 +291,7 @@ sdhci0: mmc@4310000 {
> > =C2=A0		sdhci1: mmc@4320000 {
> > =C2=A0			compatible =3D "sophgo,cv1800b-dwcmshc";
> > =C2=A0			reg =3D <0x4320000 0x1000>;
> > -			interrupts =3D <38 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(22) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			clocks =3D <&clk CLK_AXI4_SD1>,
> > =C2=A0				 <&clk CLK_SD1>;
> > =C2=A0			clock-names =3D "core", "bus";
> > @@ -332,7 +301,7 @@ sdhci1: mmc@4320000 {
> > =C2=A0		dmac: dma-controller@4330000 {
> > =C2=A0			compatible =3D "snps,axi-dma-1.01a";
> > =C2=A0			reg =3D <0x04330000 0x1000>;
> > -			interrupts =3D <29 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupts =3D <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
> > =C2=A0			clocks =3D <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
> > =C2=A0			clock-names =3D "core-clk", "cfgr-clk";
> > =C2=A0			#dma-cells =3D <1>;
> > @@ -344,19 +313,5 @@ dmac: dma-controller@4330000 {
> > =C2=A0			snps,data-width =3D <4>;
> > =C2=A0			status =3D "disabled";
> > =C2=A0		};
> > -
> > -		plic: interrupt-controller@70000000 {
> > -			reg =3D <0x70000000 0x4000000>;
> > -			interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
> > -			interrupt-controller;
> > -			#address-cells =3D <0>;
> > -			#interrupt-cells =3D <2>;
> > -			riscv,ndev =3D <101>;
> > -		};
> > -
> > -		clint: timer@74000000 {
> > -			reg =3D <0x74000000 0x10000>;
> > -			interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>;
> > -		};
> > =C2=A0	};
> > =C2=A0};
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/d=
ts/sophgo/sg2002.dtsi
> > index 7f79de33163c..732d0e72cf13 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> > @@ -3,6 +3,8 @@
> > =C2=A0 * Copyright (C) 2024 Thomas Bonnefille <thomas.bonnefille@bootli=
n.com>
> > =C2=A0 */
> > =C2=A0
> > +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > +
> > =C2=A0#include <dt-bindings/interrupt-controller/irq.h>
> > =C2=A0#include <dt-bindings/pinctrl/pinctrl-sg2002.h>
> > =C2=A0#include "cv18xx.dtsi"
> > @@ -16,22 +18,62 @@ memory@80000000 {
> > =C2=A0		reg =3D <0x80000000 0x10000000>;
> > =C2=A0	};
> > =C2=A0
> > -	soc {
> > -		pinctrl: pinctrl@3001000 {
> > -			compatible =3D "sophgo,sg2002-pinctrl";
> > -			reg =3D <0x03001000 0x1000>,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > -			reg-names =3D "sys", "rtc";
> > +	cpus: cpus {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		timebase-frequency =3D <25000000>;
> > +
> > +		cpu0: cpu@0 {
> > +			compatible =3D "thead,c906", "riscv";
> > +			device_type =3D "cpu";
> > +			reg =3D <0>;
> > +			d-cache-block-size =3D <64>;
> > +			d-cache-sets =3D <512>;
> > +			d-cache-size =3D <65536>;
> > +			i-cache-block-size =3D <64>;
> > +			i-cache-sets =3D <128>;
> > +			i-cache-size =3D <32768>;
> > +			mmu-type =3D "riscv,sv39";
> > +			riscv,isa =3D "rv64imafdc";
> > +			riscv,isa-base =3D "rv64i";
> > +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "z=
icsr",
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "zifencei", "zihpm";
> > +
> > +			cpu0_intc: interrupt-controller {
> > +				compatible =3D "riscv,cpu-intc";
> > +				interrupt-controller;
> > +				#interrupt-cells =3D <1>;
> > +			};
> > =C2=A0		};
> > =C2=A0	};
> > =C2=A0};
> > =C2=A0
> > -&plic {
> > -	compatible =3D "sophgo,sg2002-plic", "thead,c900-plic";
> > -};
> > +&soc {
> > +	interrupt-parent =3D <&plic>;
> > +	dma-noncoherent;
> > =C2=A0
> > -&clint {
> > -	compatible =3D "sophgo,sg2002-clint", "thead,c900-clint";
> > +	pinctrl: pinctrl@3001000 {
> > +		compatible =3D "sophgo,sg2002-pinctrl";
> > +		reg =3D <0x03001000 0x1000>,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > +		reg-names =3D "sys", "rtc";
> > +	};
> > +
> > +	plic: interrupt-controller@70000000 {
> > +		compatible =3D "sophgo,sg2002-plic", "thead,c900-plic";
> > +		reg =3D <0x70000000 0x4000000>;
> > +		interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
> > +		interrupt-controller;
> > +		#address-cells =3D <0>;
> > +		#interrupt-cells =3D <2>;
> > +		riscv,ndev =3D <101>;
> > +	};
> > +
> > +	clint: timer@74000000 {
> > +		compatible =3D "sophgo,sg2002-clint", "thead,c900-clint";
> > +		reg =3D <0x74000000 0x10000>;
> > +		interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>;
> > +	};
> > =C2=A0};
> > =C2=A0
> > =C2=A0&clk {
> > --=20
> > 2.48.1
> >=20

--=20
Alexander Sverdlin.

