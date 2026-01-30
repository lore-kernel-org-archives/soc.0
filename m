Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06354314A83
	for <soc@lists.linux.dev>; Fri, 30 Jan 2026 15:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769785358; cv=none; b=fIzj8Zdx+l0ffRjRwzixov1MGQFHjBfpbazSL9OE/8gsU1Hfex+cuC05aSrqumj69i/FQ8W/AD++426V/7lX6kUDVGU0n7EAB7goOxF8M3UW563XTI6QTVW2VNgrxN3PGp6Qk2eM511R2FiC+NqEJSnHDWCELH1Qcu/3JiSHH3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769785358; c=relaxed/simple;
	bh=SFm2W5zmX6FZbaapkKK72p1jA8ee+EQy1J7MPNhCiFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lSBAbi6rGrx0BtxMfiCTXr/r2jnV2tRDugcsG3GyKuWowTFg0rfOdmkuQkLHdgnceX3jlWYD2s38Wkkb/cI30PMxILEEuQaDXkRoM5du5IgG6bYkTZ3SDnUrQvrE2yGmobNUbvwNy9Jd1j05U4Zz/TXsKaXjY/K98yJm9Bz3daQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pk/PnTlp; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pk/PnTlp"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59de2d1fc2cso3157474e87.2
        for <soc@lists.linux.dev>; Fri, 30 Jan 2026 07:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769785355; x=1770390155; darn=lists.linux.dev;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ua8lq97NxZFVhL5+3f9y9xRGjdmm39lr8OPlguNpmk=;
        b=Pk/PnTlpBVa2eVj2gmttZa4kcxOl+5VbtnEqj5wVLWMbRJ/+qb6jGbGm/U+pF83XmD
         uK1P2pR+TYq13xrf86oqq3kDTcw6gFfyIF2WjxDX0EEjhLVutL3BsM5GRw/yLw3mfpfJ
         oi7KAKbRtlrO1/kzyIFukOF67j0WGi3loRiT7ExCYjj941Fodzsclfsjs1SeGyOl09kT
         b/FKoudyiHXirUyIKClw5/1ufBCkNpzGwPNA9McblQXtVBDG90lXZLRAG7pGjR6B901G
         SOEdagsP9OJZWiNqXD88eMz8u+de8GtyG30f1fZHHsUyhF4+MZIX7EcumosErRVa/Q7J
         DuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769785355; x=1770390155;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ua8lq97NxZFVhL5+3f9y9xRGjdmm39lr8OPlguNpmk=;
        b=sjG5dTL1KcP0XF6KFJ2ux7ntpdngi4EvGk9JcwZCPPspvbyBF8uWIKkZff/2VB9i8h
         yxeMwy9T6uPE7Ib9T8Vm7TrlgZ2F8+mHQ8yh5kQBEQsfzxfewmh7pGri6WN1Yz1zFRBv
         t0INNqzsWy8z9ofQ1mgwqcc8a4ttUHyxsxlTMtWFuAUhxDDVrdk1KbFgZ7/c3mmt7MSe
         5pp7jgK+SVcKxXUq0B3kfQIHDHxCXh3nGrqB85MdMeQ+yU61+1SvPLJJJFAZNtDs23zW
         s0pQl6YZbFyOhlstJntYzi9Vv03V+WSbi972mtEcNlzEW1TPaS2HIBQJ+w6mQiwqGMCx
         fnVA==
X-Gm-Message-State: AOJu0YwyTG5QuCSv2Da3UKWeI3atIVofxNm/3kG/oZ9Jag0me7AIrVT+
	gIMkjoT9fquJrKSF/Kz6UXcktHHnjozNeSsfRuJfFxJ4JZuC0d7oaS4N
X-Gm-Gg: AZuq6aJwhpCWdf+kMK7XQ9ucLGVJFAtoH7mfoTVycvoPukuAU6Q6HuopmRzlCqIJB2s
	+p0gTdzIbsVVEW+GbmZ8k485S/otAJuY5g7JugrkO5CIW4LmOYh8285XWsqm1r1NYirW15Te/Px
	uFwR8oeOkgp85EbCSmsviEW5fePoXT7riMAbLxIdCwobSFmdMddiCb9SH4Ic5duh8dHguUB6r5Z
	bXEaQdm32gztjkGAy3PclLdTGX+B5I6spV4ogWI9dXPUL8KpwKmsUIZZmIJg6aKkCh/DP7xGu6X
	SO0F7lSTfw8eTcveqCac5MqDiYqXAbex3xWlvpTzt5uDsJir1dEm/LzjRJZiVhyyy1WTb9GATF7
	ecNcxZBfNowaQ1wHy6Jc9hJLe85Qj9KQ6lJk5lUu/xLVbsgRcEO1xXnCFWqhCO8wSqJH2Idal9z
	fx39qJoxN1+/bk3jaUmxaJP+s5
X-Received: by 2002:a05:6512:3405:b0:59b:b17d:9852 with SMTP id 2adb3069b0e04-59e163f5a11mr1004299e87.1.1769785354771;
        Fri, 30 Jan 2026 07:02:34 -0800 (PST)
Received: from strix.localnet ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c40e04sm270613075e9.13.2026.01.30.07.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:02:34 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Andre Przywara <andre.przywara@arm.com>
Cc: soc@lists.linux.dev, linus.walleij@linaro.org,
 Jun Nie <jun.nie@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Drew Fustini <fustini@kernel.org>
Subject: Re: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
Date: Fri, 30 Jan 2026 18:02:25 +0300
Message-ID: <10794569.nUPlyArG6x@strix>
In-Reply-To: <5c8e88f9-4f21-41ec-ba55-bc3b06861157@arm.com>
References:
 <20260128203455.38569-1-stefandoesinger@gmail.com>
 <5c8e88f9-4f21-41ec-ba55-bc3b06861157@arm.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2338004.iZASKD2KPV";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2338004.iZASKD2KPV
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
Date: Fri, 30 Jan 2026 18:02:25 +0300
Message-ID: <10794569.nUPlyArG6x@strix>
In-Reply-To: <5c8e88f9-4f21-41ec-ba55-bc3b06861157@arm.com>
MIME-Version: 1.0

Am Freitag, 30. Januar 2026, 17:02:16 Ostafrikanische Zeit schrieben Sie:
> Hi Stefan,
> > 1) The GIC is a GICv3, but there are some extra registers (probably on a
> > different chip) to switch PPIs and SPIs between level high/level low or
> > rising edge/falling edge.
> 
> Wouldn't it be possible to fix this up in firmware and not bother the
> kernel with it? It would treat this like some very platform specific
> setup, as there is probably also very little point it ever doing it any
> other way?

Yes, this is certainly possible, and it is in a way what I am doing right now. 
As far as I understand the hardware I won't have to switch this at runtime, it 
just needs a sane default.

> The arm64 booting.rst specifies the expectations of the kernel very
> clearly, for instance it demands the GIC to be setup correctly and be
> booted in non-secure state. The arm(32) kernel was much more forgiving,
> mostly because many firmwares couldn't be fixed, so there was no choice.
> But I feel like for "new" devices we should lean on the safe side and
> use the firmware to bring the system in a sane state (pun intended).
> 
> It looks like you have access to the firmware and can change it?

Yes, we can replace Uboot on the NAND and boot our own via USB as well. ZTE 
actually provided uboot sources too. And I can certainly add some preload code 
into uimages to fix up registers, so these kinds of setup quirks won't go into 
the main kernel.

How we handle this for user-installable systems is still open. It depends on 
the risk of producing a bricked device. But we certainly have options.

And yes, they are begging to be called "insanechips" :-)

> > 3) The SoC has clock and reset controls in the same MMIO space, even the
> > same 32 bit registers. What is the preferred way to handle this? Two
> > separate clk and reset drivers that write into the same place? One
> > multifunction driver that exposes clock and resets? One syscon that
> > contains the reg values and two separate clk and reset drivers that
> > consume the syscon?
> 
> That's quite common, and the solution is to have one driver, that acts
> as both a clock and reset controller (registers to both subsystems).
> Look at sunxi, for instance (from the sun50i-a64.dtsi):

Thanks for the pointer, I'll use this as guidance.

> Allwinner cores also reset into EL3/AArch32, there an RMR reset brings
> it into AArch64 state. For this to work Allwinner provides a writable
> MMIO register that backs the architecturally read-only RVBAR, so you can
> program the AArch64 entry point.
> https://github.com/u-boot/u-boot/blob/master/arch/arm/mach-sunxi/rmr_switch.
> S Not sure if this works here, of course, but just FYI.
> In any case I feel this beast is better left in arm32 land ;-)

We tried to do something similar. We can actually change RVBAR and read back 
the changed value - and the value becomes 32 byte aligned. However, writing to 
RMR doesn't seem to do anything. The CPU just continues to execute the next 
instruction. I can even read it back later

What I'm doing in EL3:
mrc	15, 0, r0, cr12, cr0, 2	@ read RMR register
orr	r0, r0, #2			@ request reset in AArch32
mcr	15, 0, r0, cr12, cr0, 2 	@ write RMR register
isb	sy

and it merrily continues executing after that. It does that with or without 
the attempt to set RVBAR. If RMR worked I'd at least expect the hardware to 
crash in some way, not go back to the interactive uboot prompt (which 
continues to work fine). I also tried to set bits 0 and 1 (reset to aarch64) 
or set all 32 bits. There's no observable change.

We don't have any board schematics or datasheets, but I assume the 32/64 mode 
pin is wired to arm32. It may be controllable by one of the GPIOs, but I doubt 
that. So far we don't know of a way to reset the main CPU without resetting 
the entire board either.

The third way I read about was to attempt to return from 32 bit EL3 to 64 bit 
EL3, but I think I ran into some AI hallucination there.
--nextPart2338004.iZASKD2KPV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAml8yAEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJED0TvMhUTxoimbQP/2/ZC8c09EYTFbL1/YBT
KrYvJ31zSi1DULgwWY0gSXfo0S39FX5e5xz/hvxUs1GIbKC0VQky5zcbV2KazCzY
mzk0U0aMCs8QF3pP9KFogroAwUuUvwbzdjMGhDE/HK2KQMWry208EZ+nRu/W+sxq
R6K/2Hb4lmFp8Z3FFW/bVxLPtzX5wo1SdJd+ajwa6O2w2RVJEBFevggLt68BSFd/
xcop1GkrmQXAjDs0eqpEtI4At/B4UB1ptpY2ldl6pObEvtSrjs4KS1+kkljd4bSk
YI/EFXxfDWWGnGs4aebY3t/XwCQ9UtnZseDMub3UQhXo+TZKUqSyW5Wd8S3xxFE2
o2oxazO5sfipQ8DHnDZyJrFqK7UybuBfF+GcXswFRPDhcKFv/3eqa0pwR1s9oKeX
BbG/kcSUI2wLasXyXd7hd/96q2DhLdrbjWx+9qArGirjIaVDqp1xsESI+6iuzQs7
6fLBoeytl5rl0oZNTaPhnKI6zLLe/h6Vz7p7gRAfq+q3XNbaJZ7Io2WbN6Qhk7zy
KXCcW4yKK1X+Ov4y6Ttg3gIU/Kc5PPZxRT+SyjFgRnznE974VQOxWc4AGsUS7kmk
Is9svnetixmYsV6IVW2q1w7G9LYwcTaS7bG7I94pY1oLqszw4ybYOXddEIfIYHna
8HYH6emOZ7yx3T/3Z6VhGXEJ
=cBkk
-----END PGP SIGNATURE-----

--nextPart2338004.iZASKD2KPV--



