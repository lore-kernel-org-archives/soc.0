Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E1D25B694
	for <soc@lists.linux.dev>; Wed, 12 Feb 2025 17:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739382263; cv=none; b=suO1jrkmJfzOieRhEowMGY/ThZy7jkxfjuuY7v3GnAO54RnkHCrjQKBSOrkHXYptIH8dnqleHt0Z1JZpX4+HuopdRStMOWKH94LyzOvDiP+kfAwlnJmH8qHjcNZ7b8etrvHmVa5TXNChNeq4EeKrukyhwSGotHnKYpS8OBeIS10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739382263; c=relaxed/simple;
	bh=sQ8352+ncwIvqlIopOzx+k7DzW3sWlwBNLQeAy0mqHc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HOznqZ4IcXhLtSjCkpSf1xGRR+r1qSukbNu7718yUPIERF/9wG8sIKTLELiheu645ZfYHn+yJiEQYTbVW9z0Jr1Ccc//nI6PxNmm3taYjeLVUFegii+FO4TPMvjgpAMeRX2JAwbYeKETGxfEE2OuRWYxn3t5GGgQQpaOATTBqYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V76hGpGs; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V76hGpGs"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab7e80c4b55so11545366b.0
        for <soc@lists.linux.dev>; Wed, 12 Feb 2025 09:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739382259; x=1739987059; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HrtreOGrFy6HHZfLsMe2zUZL1+PbB03myiiB0TLgJeY=;
        b=V76hGpGsUTbuXJMe93JM6QyiR0mGuJmqRlAKFvrwxM8OVZ7B5fBiQzJBweeurHqFbN
         6rnX+JEcRW2UCs8q105IUKL+RDOLfbg+tfy/8KU/sYJgjW54gn2dlZTrtZgEJseuYIAf
         VIrvTUx3IuH4Qv7Xr9Zmf4RoPYJ6iFnSqefx56iSa4M/wGka9Lbd4JMufyS1uO3AtN6k
         pcdGfv+Gw7YL7eQ+UCq0Zq7zEkn8f3typKJE5iCMtLxLfptLxp3/Sv6KYFxlVhUVoaye
         aMNqmyeUn/hvWqo7B2YSSgB3wd8R0wBwKlGikUSw1XRQ6tBE+ioyNMAQBaW5y6OrvxUk
         j4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739382259; x=1739987059;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HrtreOGrFy6HHZfLsMe2zUZL1+PbB03myiiB0TLgJeY=;
        b=TnsGDbk7pESaIblPXxMOmhj5/HhAsCcUEfvDOvEEDwR5oADQ/adws0NsFGg+vbrZCK
         A/5FTC34lLfioXN6Jzx14FrFXhBPw6f4Q/2/hAau8l4eR91vjLJpOaPzndZPizBKu5pl
         cElLy63sD1tn69y4f2a18bS+rNXGFHNDpPFdTM4nsdzl/9uSfL5Ir0BGRkrQPDaiHpBa
         rIaV0UDSeBO/C4E8lVIe4sYrhfes5Iw4ID0eGW81MEs3ZmBbl2O3mSRnJWMkhiKjM+2R
         xW0XBDNJivqCxbOAHWn9VMUIyzHaGBfb72uekwZDGgQca0ZydOKclbqnZVvP0EkdjHCz
         KFOA==
X-Forwarded-Encrypted: i=1; AJvYcCUE0oKeVMj9f6L4l5Zht99AOP2kde0sSak1jJn/Y10fqarc59u/LG3T6qmD04L+JfPy6n0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6jeY/VH0spyjDW6ODqbXQFluC/pr0m2lDdPBABGBGHRFVyUNb
	dj4hnuAaSSIa6Pr7cjuuG6qOzzWhmVVkLiJThhc3KEgnO40eND8p
X-Gm-Gg: ASbGncu9xPtX1TtgCx1auiYKjS5gprD3pSysttOg54mHwlv6R97nKh9kGSaBCKycCs8
	fRz39sF5p3Ujckobt9RvwY6/VXCODooeRbD7vZ6LHf3RxLYP8neC+AuoXX3qccXBKbxzD+FSaVl
	rxUV4b5hhh2UHkCnknrSyTX3mSx3IsdrrPfjKy4ggSgGNZG8P6tcE9MR6qXxwKekkpOkiW+Pu60
	wtSlb0vp3MgNSRwfHNeLxP/642QQRYxRKt3Jq+dcCiBIHhUfrV1r4Lu9mbRLbjWlCAhJomI1NmB
	CnJy69iqOW9B4mGXHgvITpp7BuLTvRKk
X-Google-Smtp-Source: AGHT+IGXiN90fqBBtXBKAJxfVWN6FjbS5WH82cFrumS6AyosF6uuHB+mpyekgQzZiYjWjwTT1PPBcw==
X-Received: by 2002:a17:907:da3:b0:ab7:cc43:c52a with SMTP id a640c23a62f3a-aba501ab6aemr1428966b.52.1739382258565;
        Wed, 12 Feb 2025 09:44:18 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ba97704dsm719671166b.107.2025.02.12.09.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:44:18 -0800 (PST)
Message-ID: <26ddcdaadd777f170dbab51ab840c899f0edde24.camel@gmail.com>
Subject: Re: [PATCH v2 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Inochi Amaoto
 <inochiama@gmail.com>, 	soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu	 <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Paul Walmsley	
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Chao Wei	
 <chao.wei@sophgo.com>
Date: Wed, 12 Feb 2025 18:44:15 +0100
In-Reply-To: <33654180-5488-4601-9103-8e4218c4a198@kernel.org>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
	 <20250210220951.1248533-2-alexander.sverdlin@gmail.com>
	 <uvy62iqzul6kajzsmiaovdzogftcsc5b53cswkv4cbxh4w6som@32libbd7kffq>
	 <708cdc497b8474609989395dbf8a0898037a22de.camel@gmail.com>
	 <33654180-5488-4601-9103-8e4218c4a198@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi=20

On Wed, 2025-02-12 at 17:46 +0100, Krzysztof Kozlowski wrote:
> > > > Make the peripheral device tree re-usable on ARM64 platform by movi=
ng CPU
> > > > core and interrupt controllers' parts into the respective per-SoC .=
dtsi
> > > > files.
> > > >=20
> > > > Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nub=
ering
> > > > into "plic" interrupt-controller numbering.
> > > >=20
> > > > Have a nice refactoring side-effect that "plic" and "clint" "compat=
ible"
> > > > property is not specified outside of the corresponding device itsel=
f.
> > > >=20
> > > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > > > ---
> > > > Changelog:
> > > > v2:
> > > > - instead of carving out peripherals' part, carve out ARCH-specific=
s (CPU
> > > > core, interrupt controllers) and spread them among 3 SoC .dtsi file=
s which
> > > > included cv18xx.dtsi;
> > > > - define a label for the "soc" node and use it in the newly introdu=
ced DTs;
> > > >=20
> > > > =C2=A0arch/riscv/boot/dts/sophgo/cv1800b.dtsi=C2=A0=C2=A0=C2=A0 | 6=
4 ++++++++++++---
> > > > =C2=A0arch/riscv/boot/dts/sophgo/cv1812h.dtsi=C2=A0=C2=A0=C2=A0 | 6=
4 ++++++++++++---
> > > > =C2=A0arch/riscv/boot/dts/sophgo/cv181x.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> > > > =C2=A0arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi | 57 +++++++++++++=
+
> > > > =C2=A0arch/riscv/boot/dts/sophgo/cv18xx.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 | 91 ++++++----------------
> > > > =C2=A0arch/riscv/boot/dts/sophgo/sg2002.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 | 64 ++++++++++++---
> > > > =C2=A06 files changed, 240 insertions(+), 102 deletions(-)
> > > > =C2=A0create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
> > > >=20
> > > > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/b=
oot/dts/sophgo/cv1800b.dtsi
> > > > index aa1f5df100f0..eef2884b36f9 100644
> > > > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > > @@ -3,6 +3,8 @@
> > > > =C2=A0 * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > > > =C2=A0 */
> > > > =C2=A0
> > > > +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > > > +
> > > > =C2=A0#include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
> > > > =C2=A0#include "cv18xx.dtsi"
> > > > =C2=A0
> > > > @@ -14,22 +16,62 @@ memory@80000000 {
> > > > =C2=A0		reg =3D <0x80000000 0x4000000>;
> > > > =C2=A0	};
> > > > =C2=A0
> > >=20
> > > > -	soc {
> > > > -		pinctrl: pinctrl@3001000 {
> > > > -			compatible =3D "sophgo,cv1800b-pinctrl";
> > > > -			reg =3D <0x03001000 0x1000>,
> > > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > > > -			reg-names =3D "sys", "rtc";
> > >=20
> > >=20
> > > > +	cpus: cpus {
> > > > +		#address-cells =3D <1>;
> > > > +		#size-cells =3D <0>;
> > > > +		timebase-frequency =3D <25000000>;
> > > > +
> > > > +		cpu0: cpu@0 {
> > > > +			compatible =3D "thead,c906", "riscv";
> > > > +			device_type =3D "cpu";
> > > > +			reg =3D <0>;
> > > > +			d-cache-block-size =3D <64>;
> > > > +			d-cache-sets =3D <512>;
> > > > +			d-cache-size =3D <65536>;
> > > > +			i-cache-block-size =3D <64>;
> > > > +			i-cache-sets =3D <128>;
> > > > +			i-cache-size =3D <32768>;
> > > > +			mmu-type =3D "riscv,sv39";
> > > > +			riscv,isa =3D "rv64imafdc";
> > > > +			riscv,isa-base =3D "rv64i";
> > > > +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr"=
, "zicsr",
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "zifencei", "zihpm";
> > > > +
> > > > +			cpu0_intc: interrupt-controller {
> > > > +				compatible =3D "riscv,cpu-intc";
> > > > +				interrupt-controller;
> > > > +				#interrupt-cells =3D <1>;
> > > > +			};
> > > > =C2=A0		};
> > > > =C2=A0	};
> > > > =C2=A0};
> > >=20
> > > Make all soc definition include the common cpu file.=20
> > > Not just copy it.
> >=20
> > I was acting according to Krzysztof's suggestion:
> > https://lore.kernel.org/soc/d3ba0ea5-0491-42d5-a18e-64cf21df696c@kernel=
.org/
> >=20
> > Krzysztof, I can name the file cv18xx-cpu-intc.dtsi and pack CPU core +=
 interrupt
> > controllers into it. Would it make sense?
>=20
>=20
> I don't understand the original suggestion.

This is the snippet in question:

---[ cut ]---
#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)

/ {
	cpus: cpus {
		#address-cells =3D <1>;
		#size-cells =3D <0>;
		timebase-frequency =3D <25000000>;

		cpu0: cpu@0 {
			compatible =3D "thead,c906", "riscv";
			device_type =3D "cpu";
			reg =3D <0>;
			d-cache-block-size =3D <64>;
			d-cache-sets =3D <512>;
			d-cache-size =3D <65536>;
			i-cache-block-size =3D <64>;
			i-cache-sets =3D <128>;
			i-cache-size =3D <32768>;
			mmu-type =3D "riscv,sv39";
			riscv,isa =3D "rv64imafdc";
			riscv,isa-base =3D "rv64i";
			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zicsr"=
,
					       "zifencei", "zihpm";

			cpu0_intc: interrupt-controller {
				compatible =3D "riscv,cpu-intc";
				interrupt-controller;
				#interrupt-cells =3D <1>;
			};
		};
	};
};

&soc {
	interrupt-parent =3D <&plic>;
	dma-noncoherent;

	plic: interrupt-controller@70000000 {
		reg =3D <0x70000000 0x4000000>;
		interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
		interrupt-controller;
		#address-cells =3D <0>;
		#interrupt-cells =3D <2>;
		riscv,ndev =3D <101>;
	};

	clint: timer@74000000 {
		reg =3D <0x74000000 0x10000>;
		interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>;
	};
};
---[ cut ]---

Inochi's proposal is to put it into separate cv18xx-cpu-intc.dtsi and
include the latter in 3 other SoC-specific .dtsis. In v2 I've just
duplicated the above snippet 3 times (refer to diffstat above).

What are your thoughts? In Renesas everything is duplicated, I believe.
Sophgo outsources much smaller snippets into .dtsi (refer to cv181x.dtsi).=
=20

> Inochi, please trim unnecessary context from replies.

--=20
Alexander Sverdlin.

