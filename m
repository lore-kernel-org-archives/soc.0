Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A393B1FFC62
	for <soc@lists.linux.dev>; Wed, 12 Feb 2025 23:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739401484; cv=none; b=Id8STvWT/X5zvrDKP5Guy27LwCxVKN5kMtICS4Uq1skx0AEjtJDIYIsnFbdEVy/5M9VF9DTRPsBHwnHyWQs1cKJbsHtgCW4Zhzs1EykV+Sbiqgekrp1cZHxPPLK7qpJwEsME8NWAtsnBBFcGECwROO27ZJxNwGJUDleexuo1rb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739401484; c=relaxed/simple;
	bh=K5P3yIQJQi3vzhUr8edMNBHn0bPLpcmvOPeuISFlELE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p2NIB7oE1QKzYn5xPWAb5/gy4WnSU4eoDYV5iA1WCKNxR/RdowUCNpa2ln6oOnGSXqxEHcCWyaHbKgiXaOKe3FWdJfPRX/Y0Uck8TxvxGzzABkE3HKS/8SOSjwC4iBvC/+Vpyq5lX6kr7x0D7/8UlcOLcLGDewW32/eS4e24ZGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IA8P2HjF; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IA8P2HjF"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7b80326cdso34811866b.3
        for <soc@lists.linux.dev>; Wed, 12 Feb 2025 15:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739401481; x=1740006281; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WnvvgxUa+KKbKiMSC06fC7YcvSohcjyPqj0goaa/usY=;
        b=IA8P2HjFUvAxquJTLw8uJ6R/TdCBnm6P1EcF7cjqobTQHUQJgWKvfVl3zn3GxfkbQg
         eICNwLeEfPaS5jrIyYP8MpcrpoYCngJBaZdN/w+Dy5/w7/HH4x664wq1pLwqTDgFPKI7
         u7SxPYk/LhuTv0QMAUMIICvGdidSmfQoAMeapUsqiNtnMm8hVg5jySOOPVVgZQ/t1QpX
         eZAXk3AgnRjj+T6pLlyyFr+q3HbxSdPnLqnt53kgJ6jo92Rr5WJK9ZT1I3Fr4+H76AoM
         xEjCJq+6oDSpOvCT6jA35Lj/FA/GxkzTxr2n4Uisps5VZfifxR4eNEBt8wdQRnvmI2N4
         6IMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739401481; x=1740006281;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WnvvgxUa+KKbKiMSC06fC7YcvSohcjyPqj0goaa/usY=;
        b=oJx1r4Mtm+O0hTk9Xp5JyduCl2ouEKxOUHMtjk2D+rqxhHDr7SMUEVLC4EuYX2nYYz
         H2nqg4TL0EXCNG/uDKaxovU7w0D/nJzou4xHXhuuvxXF0EWr+Ww6uXxypIPAEY4Ya4yO
         CTZlXzyFCpx1mUfzwRFzerX5Y3LllJYnztEqe0eiw8tuj1xxnacGz3Kwlyu4Hu8xZbq1
         CVzbRo+fRq+/qmC6/TW8NUXyxdvp12Qh9Zr84QNvEMEuQKTiL+8OxPcsmTewkjbaLZZv
         tJYVXOg35qT6+IVZNjRSjRXx6pvrOtM8mpFH4gu3eO16PK17YwhJFRqJlmduEYyTmGmv
         6GNQ==
X-Forwarded-Encrypted: i=1; AJvYcCViGMYnnQ92uIkaEh5346Fo/byz4jrClJPbPkWMuX+NwNFCdv5lTOAOILevjyV4AGYiz24=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoXo4VO9lycvH+mSAeLMzQi/q67NKX7FxvljdwwlB4naLrXOLv
	MWJwGsHB4HbjV9DTLMbL6PTbFneEnUbW304mcUHhszkGKcXT+uTL
X-Gm-Gg: ASbGncsRV6ZUw9azvRd51sSlijRhPBb+U2zR3MwX+VYaZVUm7xsOEj09zS8zA2phF63
	8JqS650ZATwqS8cBx6zkchX+VcT2DhhvSLi2smd697ELLdx8dX7bJnQh10O40ujKNiRyZqQP1qN
	6FfaFdQNWFOB4uKBg3atsj2sbzxmJWcK9kW+1WIR0qHZd9z0ZauayYaaki+22M+jePau+Bcc4Dr
	jU/PzE0DJ1WaTkauuUTw4ZDmqTse2DTluBDSaTCsysEaJIpEqJtE87zb/DuudbFYEPlo9kYQjo/
	FPA/U3XTyqMdpSA9Ayl7Mzb2ol21p7Tw
X-Google-Smtp-Source: AGHT+IE13NRMWydnWFjBAbDzcuJOpocvAbpPyYkr9ja8EJrYZQxfsWwpOeQrG6UZLNr7eU9mjShGdg==
X-Received: by 2002:a17:907:3f1c:b0:ab7:1816:e8a with SMTP id a640c23a62f3a-aba5018d61dmr111884266b.36.1739401480710;
        Wed, 12 Feb 2025 15:04:40 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53231f4dsm10687266b.23.2025.02.12.15.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 15:04:40 -0800 (PST)
Message-ID: <de4d99bf89f78a0a6e0a81dc6062af5e85d762aa.camel@gmail.com>
Subject: Re: [PATCH v3 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
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
Date: Thu, 13 Feb 2025 00:04:39 +0100
In-Reply-To: <x4zncooa3lmyf2bikowjw7oabz66dhhbxl44cmujzzkwaslcl5@tj3l2u7e4akx>
References: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
	 <20250212224347.1767819-2-alexander.sverdlin@gmail.com>
	 <x4zncooa3lmyf2bikowjw7oabz66dhhbxl44cmujzzkwaslcl5@tj3l2u7e4akx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Inochi!

On Thu, 2025-02-13 at 06:54 +0800, Inochi Amaoto wrote:
> On Wed, Feb 12, 2025 at 11:43:33PM +0100, Alexander Sverdlin wrote:
> > Make the peripheral device tree re-usable on ARM64 platform by moving C=
PU
> > core and interrupt controllers' parts into new cv18xx-cpu.dtsi and
> > cv18xx-intc.dtsi.
> >=20
> > Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nuberin=
g
> > into "plic" interrupt-controller numbering.
> >=20
> > On RiscV side this patch has been dtc-compile-tested only. IRQ numbers
> > substitution with SOC_PERIPHERAL_IRQ() has been scripted in vim.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> > Changelog:
> > v3:
> > - &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint node=
s
> > were moved into cv18xx-intc.dtsi to reduce code duplication;
> > v2:
> > - instead of carving out peripherals' part, carve out ARCH-specifics (C=
PU
> > core, interrupt controllers) and spread them among 3 SoC .dtsi files wh=
ich
> > included cv18xx.dtsi;
> > - define a label for the "soc" node and use it in the newly introduced =
DTs;
> >=20
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv1800b.dtsi=C2=A0=C2=A0=C2=A0=C2=A0 =
| 28 ++++---
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv1812h.dtsi=C2=A0=C2=A0=C2=A0=C2=A0 =
| 28 ++++---
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv181x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +-
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi=C2=A0 | 36 ++++++++
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi | 23 ++++++
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 91 ++++++---------------
> > =C2=A0 arch/riscv/boot/dts/sophgo/sg2002.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 34 ++++----
> > =C2=A0 7 files changed, 137 insertions(+), 105 deletions(-)
> > =C2=A0 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
> > =C2=A0 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi
> >=20
> > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/=
dts/sophgo/cv1800b.dtsi
> > index aa1f5df100f0..9fb7dd2dab18 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > @@ -3,8 +3,12 @@
> > =C2=A0=C2=A0 * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > =C2=A0=C2=A0 */
> > =C2=A0=20
> > +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > +
> > =C2=A0 #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
> > +#include "cv18xx-cpu.dtsi"
> > =C2=A0 #include "cv18xx.dtsi"
> > +#include "cv18xx-intc.dtsi"
> > =C2=A0=20
> > =C2=A0 / {
> > =C2=A0=C2=A0	compatible =3D "sophgo,cv1800b";
> > @@ -13,17 +17,23 @@ memory@80000000 {
> > =C2=A0=C2=A0		device_type =3D "memory";
> > =C2=A0=C2=A0		reg =3D <0x80000000 0x4000000>;
> > =C2=A0=C2=A0	};
> > +};
> > +
>=20
> > +&soc {
> > +	dma-noncoherent;
> > =C2=A0=20
> > -	soc {
> > -		pinctrl: pinctrl@3001000 {
> > -			compatible =3D "sophgo,cv1800b-pinctrl";
> > -			reg =3D <0x03001000 0x1000>,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > -			reg-names =3D "sys", "rtc";
> > -		};
> > +	pinctrl: pinctrl@3001000 {
> > +		compatible =3D "sophgo,cv1800b-pinctrl";
> > +		reg =3D <0x03001000 0x1000>,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > +		reg-names =3D "sys", "rtc";
> > =C2=A0=C2=A0	};
> > =C2=A0 };
> > =C2=A0=20
>=20
> The origianl /soc path can be used to override things,=20
> why change it to the reference archor? I see no change
> for it.

https://lore.kernel.org/soc/d3ba0ea5-0491-42d5-a18e-64cf21df696c@kernel.org=
/
The corresponding label is being introduced in cv18xx.dtsi.

> > +&clk {
> > +	compatible =3D "sophgo,cv1800-clk";
> > +};
> > +
> > =C2=A0 &plic {
> > =C2=A0=C2=A0	compatible =3D "sophgo,cv1800b-plic", "thead,c900-plic";
> > =C2=A0 };
> > @@ -31,7 +41,3 @@ &plic {
> > =C2=A0 &clint {
> > =C2=A0=C2=A0	compatible =3D "sophgo,cv1800b-clint", "thead,c900-clint";
> > =C2=A0 };
> > -
> > -&clk {
> > -	compatible =3D "sophgo,cv1800-clk";
> > -};
> > diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/=
dts/sophgo/cv1812h.dtsi
> > index 8a1b95c5116b..f23c4dd6687d 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> > @@ -3,10 +3,14 @@
> > =C2=A0=C2=A0 * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> > =C2=A0=C2=A0 */
> > =C2=A0=20
> > +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > +
> > =C2=A0 #include <dt-bindings/interrupt-controller/irq.h>
> > =C2=A0 #include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
> > +#include "cv18xx-cpu.dtsi"
> > =C2=A0 #include "cv18xx.dtsi"
> > =C2=A0 #include "cv181x.dtsi"
> > +#include "cv18xx-intc.dtsi"
> > =C2=A0=20
> > =C2=A0 / {
> > =C2=A0=C2=A0	compatible =3D "sophgo,cv1812h";
> > @@ -15,17 +19,23 @@ memory@80000000 {
> > =C2=A0=C2=A0		device_type =3D "memory";
> > =C2=A0=C2=A0		reg =3D <0x80000000 0x10000000>;
> > =C2=A0=C2=A0	};
> > +};
> > +
> > +&soc {
>=20
> > +	dma-noncoherent;
>=20
> I think this can be moved into cv18xx-cpu.dtsi file, and let
> all SoCs share it.

https://lore.kernel.org/soc/d3ba0ea5-0491-42d5-a18e-64cf21df696c@kernel.org=
/

If SOC_PERIPHERAL_IRQ() doesn't belong to -cpu.dtsi, then "dma-noncoherent;=
"
probably neither...

> > -	soc {
> > -		pinctrl: pinctrl@3001000 {
> > -			compatible =3D "sophgo,cv1812h-pinctrl";
> > -			reg =3D <0x03001000 0x1000>,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > -			reg-names =3D "sys", "rtc";
> > -		};
> > +	pinctrl: pinctrl@3001000 {
> > +		compatible =3D "sophgo,cv1812h-pinctrl";
> > +		reg =3D <0x03001000 0x1000>,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > +		reg-names =3D "sys", "rtc";
> > =C2=A0=C2=A0	};
> > =C2=A0 };
> > =C2=A0=20
> > +&clk {
> > +	compatible =3D "sophgo,cv1810-clk";
> > +};
> > +
> > =C2=A0 &plic {
> > =C2=A0=C2=A0	compatible =3D "sophgo,cv1812h-plic", "thead,c900-plic";
> > =C2=A0 };
> > @@ -33,7 +43,3 @@ &plic {
> > =C2=A0 &clint {
> > =C2=A0=C2=A0	compatible =3D "sophgo,cv1812h-clint", "thead,c900-clint";
> > =C2=A0 };
> > -
> > -&clk {
> > -	compatible =3D "sophgo,cv1810-clk";
> > -};
> >=20
> > [...]
> >=20
>=20
> > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi b/arch/riscv/b=
oot/dts/sophgo/cv18xx-intc.dtsi
> > new file mode 100644
> > index 000000000000..90817993a326
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi
> > @@ -0,0 +1,23 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> > + */
> > +
> > +&soc {
> > +	interrupt-parent =3D <&plic>;
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
>=20
>=20
> I think this file can be merged in to cv18xx-cpu.dtsi.
> clint and plic is more like a core specific device.

Yes, this can be done now, as long as SOC_PERIPHERAL_IRQ() remains
outside of the -cpu-intc.dtsi...

--=20
Alexander Sverdlin.

