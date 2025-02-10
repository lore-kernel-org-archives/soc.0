Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D841CA84
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 15:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199679; cv=none; b=mSRPxOkWSzTjTHZpsVxp7tLkJgnf0wWgbaOLnCQKZnlt4aE3m/XnffJ6znnEKoe69DprQUJNivbvQ5N7ZjH5Zhdp4y5duzdODlIgkXsPGOeXbOEyZopkCyH4slheKPMY4AVTu0CQDM3b9bfCx5meukuHyvSPhRqIHL76p4qMup0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199679; c=relaxed/simple;
	bh=visb9O0lxlMa5DUWC3Bk2Q1mSoeQvsC0v7T9kKbj3yw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CRq8ZihevhEAtNtkSYbjUmeyRu3HXHTdBcMbOXpf0pgKYDYvKM8TtTknSQ6laYiDWq3r2tEkStdF7OkZaSu9NBjbC6kDs51Z+J8jF5UySzLV3Q4q7eswmJdODg3nrcz9Ma5XJ1bQA0u1b5UL53gosrEQqP0H7HAJ3kPxO2wE0xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btPC3Jem; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btPC3Jem"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab744d5e567so871950066b.1
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 07:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739199675; x=1739804475; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3M5idA8N7HpwZKk/3+pcrUsB6D7VU4LeXOhWq3Jgugs=;
        b=btPC3JemQhGCyFK5Apdtj39gy8VJlhhEQ7LRKTEto5oIodG+9LssJKt3NO43bJZtLf
         qmrRc16hf9YXJH16VlITf+pPJ9ZhBPZGmUD0jw8Wd4riGrO31nh0ZOOMbbmKKpeKjGhQ
         jjpSI5dbe7J/9gKEtUR+ifV3ShgQwbkAYVv9Wnu62CczIWK3uH9FpefCPIC5GIOQ5XjK
         DtFUEF1qzt6wwI9HsYgSHTGO2feQuxLWBhQ42fwdYkhO4v7osJ80ZyJqEcejyVva2wU3
         Bkkds7XDfDBTAz6iB3T//qQBU1K7dO+dxayOHDDKV6+QlksKKzik4PWAbWXXDfpFFOVA
         yaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199675; x=1739804475;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3M5idA8N7HpwZKk/3+pcrUsB6D7VU4LeXOhWq3Jgugs=;
        b=n400vzcPM8J87bI7DxMbc78NDeFGLOPZ2gdXDvToHUZ/VdyFPyVL1p1j3rdVUSGcHU
         wk/s/tw7PAo418QlQHuK/1REcs8vLAPvPgsIr/Ez0KXlkC0+LWgn26h4idcRZnyb8P7k
         0Qw6F0aeN/TwPfhNypBoxaLAUBW061eDEQrTFfkIz5uczT0zUX3Y1B4fAVktFuFs2cCK
         FDEpRpB1crid0NVwyMeoeDioFri12E9/UlqINUZ/He4gVe+C2FBfgluSZTxcq828NPbr
         DMyzkG/4uzY5whY2rOcj+dqSQIkxLIhfpcKtKoY3tEfzpnX4O25JZlt6nYnr20KOhfXY
         c0/w==
X-Forwarded-Encrypted: i=1; AJvYcCXEBeOBmd9RUVhgIC44EkvKod/zMXLzJN9so9yQLdbBjv9hUC9T+rkIn5w3IV7EbA5g4ZY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrfztSGbqbkKUQyEj6vWeh09otO5e0v7rMh1fHash0NlqAjka5
	yVC5DfPU27Gx8bbxoBw10U0COypGxtzPSXDI8KAXPZGNkhRns1ZX
X-Gm-Gg: ASbGncv//VpKToNCxZO5X2xb0+YWzgu/2CXTFx/YZYWVDuiURnOEjcsCNHEcbf9/KiB
	GFW3W9CzwZc07rIFIf8pfHr5dtAPsOB9miGGakrS8yA4s7JLDjs9ksb6Oajc1jLnpNlX0OWnTw0
	53wkheWQXiPcAvUqUsp9ubdDgYCZmi0AT7qTjgeyeAS6uG7ADae+nFnI5CF7vLQRgcLFTOu0pf3
	ur5QumsR5N9OyS3eGdOm+JpSxh099cI+IUK1Kn6IAmxV8VTzpE3Qp+0iPiypBypwJxqW/GhnYNm
	vuIEDPZSbEUma51jLtsX50PNZRAwcPJK
X-Google-Smtp-Source: AGHT+IHDvJX3+ekZa4vY1LIl/WMEIul6AD+KtHvHZm/OrLAAq1fRlkjI0uEBHS/oueveFzGr668vsg==
X-Received: by 2002:a17:906:6a29:b0:ab6:d4ce:5674 with SMTP id a640c23a62f3a-ab76e9dc14amr1858509166b.26.1739199672976;
        Mon, 10 Feb 2025 07:01:12 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7cd7ffaa8sm122042766b.132.2025.02.10.07.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:01:12 -0800 (PST)
Message-ID: <03ff407fe68e46df4844e5dd244e7c609331af71.camel@gmail.com>
Subject: Re: [PATCH 03/10] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu	 <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann	 <arnd@arndb.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
Date: Mon, 10 Feb 2025 16:01:10 +0100
In-Reply-To: <0d5484d1-be83-4f38-befd-94d458b3aaa8@kernel.org>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-4-alexander.sverdlin@gmail.com>
	 <0d5484d1-be83-4f38-befd-94d458b3aaa8@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Krzysztof!

On Mon, 2025-02-10 at 09:45 +0100, Krzysztof Kozlowski wrote:
> On 09/02/2025 23:06, Alexander Sverdlin wrote:
> > Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> > =C2=A0 arch/arm64/boot/dts/sophgo/sg2000.dtsi | 79 ++++++++++++++++++++=
++++++
> > =C2=A0 1 file changed, 79 insertions(+)
> > =C2=A0 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> >=20
> > diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/d=
ts/sophgo/sg2000.dtsi
> > new file mode 100644
> > index 000000000000..4e520486cbe5
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
> > @@ -0,0 +1,79 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +
> > +#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <riscv/sophgo/cv18xx-periph.dtsi>
> > +#include <riscv/sophgo/cv181x.dtsi>
> > +
> > +/ {

[...]

> > +	gic: interrupt-controller@1f01000 {
>=20
> MMIO nodes are always in the soc.

I think I've looked a wrong example (or a counter-example)...
$ grep -R -P '^\t\tcompatible =3D "arm,cortex-a15-gic";' *
arm/boot/dts/intel/axm/axm55xx.dtsi:		compatible =3D "arm,cortex-a15-gic";
arm/boot/dts/ti/omap/dra7.dtsi:		compatible =3D "arm,cortex-a15-gic";
arm/boot/dts/ti/omap/omap5.dtsi:		compatible =3D "arm,cortex-a15-gic";
arm/boot/dts/nvidia/tegra124.dtsi:		compatible =3D "arm,cortex-a15-gic";
arm/boot/dts/nvidia/tegra114.dtsi:		compatible =3D "arm,cortex-a15-gic";
arm64/boot/dts/nvidia/tegra132.dtsi:		compatible =3D "arm,cortex-a15-gic";
arm64/boot/dts/freescale/s32v234.dtsi:		compatible =3D "arm,cortex-a15-gic"=
;
arm64/boot/dts/apm/apm-storm.dtsi:		compatible =3D "arm,cortex-a15-gic";
arm64/boot/dts/apm/apm-shadowcat.dtsi:		compatible =3D "arm,cortex-a15-gic"=
;

But thanks for clarification!

> > +		compatible =3D "arm,cortex-a15-gic";
> > +		interrupt-controller;
> > +		#interrupt-cells =3D <3>;
> > +		reg =3D <0x01f01000 0x1000>,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x01f02000 0x2000>;
> > +	};
> > +
> > +	soc {
>=20
> Override by phandle/label instead of duplicating.
>=20
> > +		ranges;
> > +
> > +		pinctrl: pinctrl@3001000 {
> > +			compatible =3D "sophgo,sg2000-pinctrl";
> > +			reg =3D <0x03001000 0x1000>,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > +			reg-names =3D "sys", "rtc";
> > +		};
> > +	};
> > +};
> > +
> > +
> > +&clk {
> > +	compatible =3D "sophgo,sg2000-clk";
>=20
>=20
> That's discouraged practice. If you need to define compatible, it means
> the block is not shared between designs and must not be in common DTSI.

That doesn't come from my series, that's how original cv18xx.dtsi has been
designed. Same question as before: do I need to rework it if I will not be =
able to
test the changes (I don't even posess the relevant HW). But if not, I have
to adapt the same pattern into the new sg2000.dtsi.

--=20
Alexander Sverdlin.

