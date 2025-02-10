Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711DC1581EE
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 05:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739164514; cv=none; b=UKNtDTs4iS+gYIO/FOpfOMhsw99D8hmP+5MIex48T1tH7CHw+hQU29FqAh1a88wG63KU5Al+b22nE04X8g34GiG4AsqTtBGIDuPEVMdGGY3gAIdUIu5nALmn2F5XkmKEcUcl3zmNruDf7CXnwYAq6m3bTen56mIWODo/9uXilHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739164514; c=relaxed/simple;
	bh=MG3Ad9L3pB9/1Waq7rcu6JsxoIBzEerr0O3vqh6hS/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCBMYBLnXdgbaUwdZswe4xHMbBpdntcxJxlglUnQvpPN4bHH5wbDjxG7LzoU/L+bypTR8LHKNt15JD3UOAEMsjXO7D5DDWykTygQQYac+x/1Rjo6VB+6pGZQqts7LM+3VxfxcyinN/sHhsJMjjjfTJjDewooWq+oCZrYNGUUndM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmtrNEoO; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmtrNEoO"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c060568959so33994385a.1
        for <soc@lists.linux.dev>; Sun, 09 Feb 2025 21:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739164511; x=1739769311; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GniGuM78BIcAr7ts8pXvWJNfUZLhduP49+7UQWf5Z0E=;
        b=UmtrNEoOQyYLSOrzNRO1yPol9wR7uQ9kLqywLnjBgt3zJQP7Vp6UhVQgV4tPf2uOzx
         L7oU7H0KrZdjNFhnK9CwZ7gntuf7RLTAwh2w1dt14a7fVKfgNfuVtn1turWjxkvL6qFx
         lrjaPuhAZZAAQjyCOdIe3jRCoy9q2E41dQemwT0IplB1ftEqbKWCHDxc8EEoeFZ0i77S
         iVPKz13eoCsPfbAAs6rKQO+9ugxVK3lEtvuzXdTnVsATdh9S8iemaPZdb06cB4Di5qOf
         3tgBJr6FkspjdSuY5rC7LYUHQWZIpSOzqXnk3EZHn3Wag+m0iKYFE39z+DvkbLFy5wa6
         vy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739164511; x=1739769311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GniGuM78BIcAr7ts8pXvWJNfUZLhduP49+7UQWf5Z0E=;
        b=tj54QFEduhIRZC46a+vLJszytLHuv3kpkNNoivwBpJC0HmgE0+a8MubOyz3lRaymP4
         CeefIL6hL4eAau7J2C+gqopKdS1uKxfnTnhoNh4HudnJMXh50fRz0EPeWl7Tw2FqcaDJ
         rSEN7jd1ZF1XK/fZA7xmt4JUMxASMuAiGp+Ei/U79qY5lk69X5CWTohn3VhuazPJvMkk
         q708DQgpNa2rIemX0kdYnCD3Akev08NjhWShQUSn7a3cbf2GQIjW38cGQMZZZY4ShXFD
         15I3P64g7aaEFPSaLkGF1wEOrM0ggKt64TXaM6cXLmadsFkoJFU+OsvbmtBVYQPxWgyW
         rIuA==
X-Forwarded-Encrypted: i=1; AJvYcCUNJYMS2huLnMgJcsUjdIOEYBdSMGyvVws/pbngPwl8QAEP1k56U0tIj14Q2hfLKUEWLOA=@lists.linux.dev
X-Gm-Message-State: AOJu0YznJNP2GEo46uE2kHgZM7nYPf1DcoQozJxuKnGlYvXtNXFNUO6W
	GmYfuor74VumbUvEPJmFVIH2M/tjTqzByhHiMtgFH9IctiB8KiNz
X-Gm-Gg: ASbGncsEY3L5k1sMHQgv/vnUdSkuiwA/9r1JRexQbm/Xr2i53e8YHWUQHTCQzn7Lki+
	zqNkDTmStOj0i0RHMWS/uz5TxqFSuYhQOVL31qoUR28IJfQYihBxfu9qqsBMomj1nW9Vwfg38Wt
	55dc2bG2zbd49jv4xtYbhUVBJZACBBlTmxZHGzBLKZOoYgS2mx7kcAX8HdnB32KersuVlv+M/OX
	bygh1/xUbQwfWeYQ7bv3xGYuRXuFGhC1cHUjVoDrdc+0dy/z3sutQ258yHX39h5r5g=
X-Google-Smtp-Source: AGHT+IH28KSGQngpOC4sMgaBVZJQsS3ItIqPoUQbHrVhyVBUOfjf9q5guk+CZKNPKJ4L2waMIxeNTQ==
X-Received: by 2002:ad4:5caf:0:b0:6da:dc79:a3cd with SMTP id 6a1803df08f44-6e4453fdde1mr194721716d6.0.1739164511260;
        Sun, 09 Feb 2025 21:15:11 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e460380644sm8468166d6.120.2025.02.09.21.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 21:15:10 -0800 (PST)
Date: Mon, 10 Feb 2025 13:15:05 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, soc@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, 
	Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 00/10] arm64 support for Milk-V Duo Module 01 EVB
Message-ID: <xfvvie67ncfy5vnmk2lcjatvpmyneponc7ex4nv7otiiolruij@ejpqdomocv7z>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <BMXPR01MB244050BA1841F4416FF0484CFEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BMXPR01MB244050BA1841F4416FF0484CFEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>

On Mon, Feb 10, 2025 at 08:02:12AM +0800, Chen Wang wrote:
> 
> On 2025/2/10 6:06, Alexander Sverdlin wrote:
> > This series adds very basic support for Milk-V Duo Module 01 EVB [1] in
> > arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latter has
> > been chosen because the upstream toolchain can be utilized.
> > 
> > Sophgo SG2000 seems to be a continuation of the Cvitek CV18xx series, same
> > peripherals with an addition of ARM64 core. Therefore it would be
> > beneficial not to copy-paste the peripherals' device-tree, but rather split
> > the most suitable riscv DT into ARCH-specific and peripherals parts and
> > just include the latter on the arm64 side.
> > 
> > This series adds the device-tree for Milk-V Duo Module 01 EVB, which
> > in turn contains Milk-V Duo Module 01 (separate .dtsi) on it, which has
> > SG2000 SoC inside (separate .dtsi).
> > 
> > This series has been tested with Sophgo-provided U-Boot binary [2]: it
> > boots from SD card, pinctrl, serial, GPIO drivers are functional (same
> > as for RiscV-based CV18xx SoCs).
> > New reset driver is provided as an alternative to the ATF PSCI handler,
> > which Sophgo only provides in binary form.
> 
> I just see Inochi posted a patchset about cv18xx reset driver [1]. FYI.
> 
> Maybe you and Inochi need to communicate with each other and synchronize the
> related work in this regard.
> 
> Link: https://lore.kernel.org/linux-riscv/20250209122936.2338821-1-inochiama@gmail.com/
> [1]
> 

It is a power restart device, not the reset controller, I suggests you change
the device name.

> > 
> > Partial SoC documentation is available [3].
> > 
> > This series lacks the support of:
> > - USB
> > - Audio
> > - Ethernet
> > - WiFi
> > - Bluetooth
> > - eMMC
> > - Video
> > 
> > It would probably make sense that the whole series would go into SOC tree,
> > even though technically nothing prevents the reboot/reset driver to come
> > in PM/reset tree. If everything would come together, `reboot` command would
> > work out of the box.
> > 
> > [1] https://milkv.io/docs/duo/getting-started/duo-module-01
> > [2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
> > [3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
> > 
> > Alexander Sverdlin (10):
> >    arm64: Add SOPHGO SOC family Kconfig support
> >    riscv: dts: sophgo: cv18xx: Split into CPU core and peripheral parts
> >    arm64: dts: sophgo: Add initial SG2000 SoC device tree
> >    arm64: dts: sophgo: Add Duo Module 01
> >    arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
> >    dt-bindings: mfd: syscon: Add Cvitek CV18xx rtcsys core and ctrl
> >      compatible
> >    dt-bindings: reset: sophgo: Add CV18xx reset controller
> >    riscv/arm64: dts: cv18xx: Add sysctl and reset nodes
> >    power: reset: cv18xx: New driver
> >    arm64: defconfig: Enable rudimentary Sophgo SG2000 support
> > 
> >   .../devicetree/bindings/mfd/syscon.yaml       |   4 +
> >   .../bindings/reset/sophgo,cv1800-reset.yaml   |  38 ++
> >   MAINTAINERS                                   |   1 +
> >   arch/arm64/Kconfig.platforms                  |  12 +
> >   arch/arm64/boot/dts/Makefile                  |   1 +
> >   arch/arm64/boot/dts/sophgo/Makefile           |   2 +
> >   arch/arm64/boot/dts/sophgo/sg2000.dtsi        |  79 +++++
> >   .../sophgo/sg2000_milkv_duo_module_01.dtsi    |  84 +++++
> >   .../sophgo/sg2000_milkv_duo_module_01_evb.dts |  30 ++
> >   arch/arm64/configs/defconfig                  |   3 +
> >   arch/riscv/boot/dts/sophgo/cv181x.dtsi        |   2 +-
> >   arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi | 329 ++++++++++++++++++
> >   arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 305 +---------------
> >   drivers/power/reset/Kconfig                   |  12 +
> >   drivers/power/reset/Makefile                  |   1 +
> >   drivers/power/reset/cv18xx-reset.c            |  89 +++++
> >   16 files changed, 689 insertions(+), 303 deletions(-)
> >   create mode 100644 Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml
> >   create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
> >   create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> >   create mode 100644 arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi
> >   create mode 100644 arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01_evb.dts
> >   create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> >   create mode 100644 drivers/power/reset/cv18xx-reset.c
> > 
