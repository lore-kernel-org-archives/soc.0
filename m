Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4C11EF0AA
	for <soc@lists.linux.dev>; Tue, 11 Feb 2025 12:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739277818; cv=none; b=BKt890ayVNAD420LFK8RVohLMdck5V3UBUUxkE1vqj8nkSEXSgHLgsecK9DmzWdcEB066izzVSps0aXPMDiYHZC5CygDMAkM3FZyU9tdNqxJ0K13UyabO/LjPsN54ebUtarLNFm82I7XMTyLO6oSxWC758JxUhbmmWiI82B6tQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739277818; c=relaxed/simple;
	bh=uepduHjDPy55AkkCGXbAU8w+LO18qfkEQA77TDsyyXM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FivNtL793kuoXJNcWpQPtV7UDA33T1WCzYhysWrZIOIlQIp7ATHj+dDpY9kMXvzpO9Whc/88masEvdaMxA0vihunuXsapMWDGTJtU6kKpU78agg3cpKGWGANJpC7iD+tIq9n8baRn8zY06VsBzELAloRrp4A+L1mbr+JqLlxhbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgmwFIPm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgmwFIPm"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43934d6b155so17930945e9.1
        for <soc@lists.linux.dev>; Tue, 11 Feb 2025 04:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739277815; x=1739882615; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uepduHjDPy55AkkCGXbAU8w+LO18qfkEQA77TDsyyXM=;
        b=cgmwFIPmDgVRWo4Z7VqDLlcMwJfthHJOk85w3q1+VlOAD1//nrJ21FqtPQFA2SdTsq
         vkqbqdt+L7nf0WZOoXfanYrIP+FBvvu9JkI9qQOb3NdrU+aVcAalBJFXYGCjhfDESiZM
         tyZTsJxW4OAgKlGoGuphHxoRXOt3pp07qutqmgit62tj2LizS6j3CPQRWJH1rAxvYUL7
         iykVIO9CdwzYSMTrzRIHDaWZcqKSUEczQvWdCqq7fNcy2j5ZMZ7aKeIhR8EpBLV/dQH+
         Xhis90enlkoOnSnkJ+du9ePRBWmvjRN5o9SDxEGFfARkBkiSXPXrQ6rZccL7/qLjEn4G
         1vRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739277815; x=1739882615;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uepduHjDPy55AkkCGXbAU8w+LO18qfkEQA77TDsyyXM=;
        b=JjKDmGQw9aKSBK/uCvC+dMo0yFbSsu2IYsJE4h/YbCaN/w4X5bvrm51K0JANF763Ah
         0FQrRO857y/vEg9PMb32foGY5vtRpiLK+lZHhNsIImyZQL9H1Si0UAS/WvkDslWGwJTN
         KZing9Wd/IMSFfsQdLXgHaGkTxeGJxyYNzo1Lur9GIc/8ORalgFxpY0N0lnSRFYcZjEo
         MOoVczt6lV3rcDQ4fsNRE3kC+rcfqQd8NGilsWZ6lZE2T9nYe/BoYJp3hETkaeFR4PEg
         d/tFzpYAfUXEBJTxG4/qygcfMxAm0EwRr/YiP4VJkPTZM518XBqiDAqxtYf/g0yhsi0K
         VOCw==
X-Gm-Message-State: AOJu0Yya87m5wvpzbsKnzPkzQJZ+aBu25jWKvCS7QYh22bfiYUvUsY+O
	Zb6vCwsQlaAIs4jaIIivgOmCb9RZ/amIF9hvDEjDsHDvGtzTHVZcWSpu5Itj
X-Gm-Gg: ASbGncvYInSijgkfOy4eoY8fiiCcqRGPVQCQQxuBETlLFN7mgF5MdLogmS58SgUavpa
	YTRm+Y5jCoyqI4ZuM1JfbEew1xY8s05IAkf4bob5x3GPCtH2QkQ6xiosCNI7j50Ru9MXZsc1vLr
	Q+dTTtLDy3n4ITgoccg7ghb62ktaoI1cm0BjnlH82VMUbcz0E6HyR6ew6E+sy5T27c0jSBEN1TB
	NXrOaVupBH3jKg15I7SIUMlE7sy30L0gmhrF2QAPf+i3cmTiAIK0YMSly3PqgNa3RamMDiGc9kE
	dYsEAs3O8tYgmksKchLpJDGYtQ/oKfF6
X-Google-Smtp-Source: AGHT+IEBhVLUgJKyLV9yDCk2soLE+OEkOUesnwWNG1Lpa/Ktin9FkzYLpEqwqMjhtsNnoPajSZttXg==
X-Received: by 2002:a7b:ce8c:0:b0:439:31a6:276a with SMTP id 5b1f17b1804b1-4394ceaf874mr28491015e9.2.1739277815164;
        Tue, 11 Feb 2025 04:43:35 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcd8213f2sm11711856f8f.67.2025.02.11.04.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:43:34 -0800 (PST)
Message-ID: <b1f05bff1d6c3f0cb1b381c15dcf222ec4c7f1b1.camel@gmail.com>
Subject: Re: [PATCH v2 0/7] arm64 support for Milk-V Duo Module 01 EVB
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: soc@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	 <inochiama@outlook.com>, Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Sebastian
 Reichel <sre@kernel.org>, 	devicetree@vger.kernel.org, Haylen Chu
 <heylenay@outlook.com>, 	linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, 	linux-pm@vger.kernel.org, Jisheng Zhang
 <jszhang@kernel.org>, Chao Wei	 <chao.wei@sophgo.com>
Date: Tue, 11 Feb 2025 13:43:31 +0100
In-Reply-To: <20250211-backwash-jester-2fdd6740000e@spud>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
	 <20250211-backwash-jester-2fdd6740000e@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Conor!

On Tue, 2025-02-11 at 10:50 +0000, Conor Dooley wrote:
> On Mon, Feb 10, 2025 at 11:09:40PM +0100, Alexander Sverdlin wrote:
> > This series adds very basic support for Milk-V Duo Module 01 EVB [1] in
> > arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latter =
has
> > been chosen because the upstream toolchain can be utilized.
>=20
> > =C2=A0 .../{riscv =3D> soc/sophgo}/sophgo.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +-
> > =C2=A0 arch/arm64/Kconfig.platforms=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
6 ++
> > =C2=A0 arch/arm64/boot/dts/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 +
> > =C2=A0 arch/arm64/boot/dts/sophgo/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
>=20
> I'd expect this to be maintained alongside the riscv support, how come
> there's no maintainers entry change here?

MAINTAINERS file has "K: sophgo" entry already, I suppose new files will
fall into this category? That's why I've ignored this specific checkpatch w=
arning
in all patches. Am I wrong?

> > =C2=A0 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++
> > =C2=A0 .../sophgo/sg2000-milkv-duo-module-01.dtsi=C2=A0=C2=A0=C2=A0 | 8=
5 +++++++++++++++++
> > =C2=A0 arch/arm64/boot/dts/sophgo/sg2000.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 75 +++++++++++++++
> > =C2=A0 arch/arm64/configs/defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
5 +
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv1800b.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 64 ++++++++++---
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv1812h.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 64 ++++++++++---
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv181x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi=C2=A0=C2=A0=C2=A0 | 5=
7 ++++++++++++
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 91 +++++--------------
> > =C2=A0 arch/riscv/boot/dts/sophgo/sg2002.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 64 ++++++++++---
> > =C2=A0 14 files changed, 451 insertions(+), 103 deletions(-)
> > =C2=A0 rename Documentation/devicetree/bindings/{riscv =3D> soc/sophgo}=
/sophgo.yaml (80%)
> > =C2=A0 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
> > =C2=A0 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-m=
odule-01-evb.dts
> > =C2=A0 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-m=
odule-01.dtsi
> > =C2=A0 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> > =C2=A0 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi

--=20
Alexander Sverdlin.

