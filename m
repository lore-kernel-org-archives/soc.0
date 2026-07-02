Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC00A264A9D
	for <soc@lists.linux.dev>; Thu,  2 Jul 2026 13:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000009; cv=none; b=oF2si5/ptjpvM1UvOvjj3tvYM4BmMHXricr6/zk1B0YrT0JLekKEesSN3eIDavQ1Ab2u3WOBNHCc+YH6xiypaq3SWefmLc6RJ6qJuh7tQ9OznFj3R8+Low8FUb4AMKKJN3E8CVTD73efuIobAhbtzBqF0qly0R2PULHxhzy28Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000009; c=relaxed/simple;
	bh=skEn/IFe3xUJxJ5UAmsQ1c29eXvMrX+Yo++e7c0NkhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1IyyUKF69Dvekskr3C90eOsMAPTQgd2jhlZKzozoZyyJat1wFwhD6zBgEwh+10FpqJ5Celk0MsMLCwEN6YTd6Um/d2hRqVwnb6gDrG1+WedDWuyQrz7oU0k04+h0mCCeLF6BbHGG6LhRaylpTDMxFOj6W05W9dSymtoZIACSWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=W6P/pybY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="W6P/pybY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 35BD44E40C30;
	Thu,  2 Jul 2026 13:46:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFF1C5FF03;
	Thu,  2 Jul 2026 13:46:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39B2F104C956E;
	Thu,  2 Jul 2026 15:46:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783000003; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=MdlUDryvbddhGmIlxqCLhHKz9HIAtBGyDe5WZ8sEeKo=;
	b=W6P/pybYtgNauSY5LALJ6N4kqctALRck5zGB7Ii8HQ7e964qhQ10aKijam6pBrKdBgkCMS
	fy2dz/xrEiJLBku5Dvktg+1rJ1lt5wYeuTddtk2Kwawq1Bl8JQJk1kaLTPJEXU50xNZ5fA
	joSJMbJTdDrdj7KKVO09FJRdinsbgt9WJ2sohJpUKcgDxyfR6LVnOT0GwQWOftmTlGYdc/
	GSNfIXatQR/CNqsaHr9m4kq/6B2GZXvyRIvvyB60Vz2G+8XgwGd5Jlfxpso/AZz8hHqUCk
	1lQ8ju+FngKMcDglusM3wgqCcy2q0CnVMjIqh8RpK/E9+jpHcpDyAauWPmg9wA==
Date: Thu, 2 Jul 2026 15:46:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Ard Biesheuvel <ardb@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Mack <daniel@zonque.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Stefan Wiehler <stefan.wiehler@nokia.com>,
	Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 03/19] ARM: rework ARM11 CPU selection logic
Message-ID: <202607021346368633bfa6@mail.local>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-4-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701212353.2196041-4-arnd@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On 01/07/2026 23:23:37+0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Support for SMP on ARM1136r0 has been broken for a while, and nobody
> is working on fixing it. I had a plan to change ARMv6 support to no
> longer coexist in a common kernel with ARMv7 CPUs but instead ARMv5 and
> below. This would have addressed the problem, but after a recent mailing
> list discussion, we concluded that an easier approach is to just forbid
> ARM1136r0 CPU support on SMP-enabled kernels.
> 
> This mainly affects users of the Nokia N800/N810 tablets using an
> OMAP2420 SoC, which is the only commercial product with an ARM1136r0
> that is still supported by the kernel.
> 
> The other machines that are still in the same hardware catogory are:
> 
>  - TI OMAP2420 H4 reference board
>  - TI OMAP2430 SDP software development platform
>  - Freescale/NXP i.MX31 Lite Development Kit
>  - Buglabs i.MX31 Bug 1.x prototype
>  - Arm Integrator/AP with CM1136JF-S core module
> 
> To my knowledge, none of these have any actual users aside from
> reference boards being used more easily test the platforms.

There is a missing "to" in this sentence ;)

> 
> There are also a few ARM1136r1 machines, which implement the
> ARMv6K SMP support (barriers, atomics and TLS):
> 
>  - Eukrea CPUIMX35 reference platform
>  - Freescale/NXP i.MX35 Product Development Kit
>  - ARM Integrator/CP/IM-LT3 with ARM1136J Core Tile
>  - ARM Realview/EB with ARM1136J Core Tile
> 
> Again, these are mainly reference implementations rather than
> actual products, but since they support ARMv6K, they should
> continue to work correctly in SMP-enabled kernels. For the
> ARM Core Tile, I have not found a datasheet but instead use
> the revision based on what the respective virtual models
> report.
> 
> All the other ARMv6 platforms use an ARM1176 with ARMv6K,
> VMSAv7 and Trustzone support.
> 
> To avoid the broken configuration, annotate the ARM1136 based
> machines with specific CPU_ARM1136R0 or CPU_ARM1136R2 symbols
> in Kconfig and make the r0 variants depend on !SMP.
> 
> Link: https://lore.kernel.org/linux-arm-kernel/2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com/T/
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/Kconfig.platforms      |  2 +-
>  arch/arm/mach-imx/Kconfig       |  4 +++-
>  arch/arm/mach-omap2/Kconfig     |  3 ++-
>  arch/arm/mach-versatile/Kconfig | 10 +++++-----
>  arch/arm/mm/Kconfig             | 24 +++++++++++++++++++++++-
>  5 files changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/Kconfig.platforms b/arch/arm/Kconfig.platforms
> index 386eccc81868..2e118b65f93b 100644
> --- a/arch/arm/Kconfig.platforms
> +++ b/arch/arm/Kconfig.platforms
> @@ -33,7 +33,7 @@ config ARCH_MULTI_V4_V5
>  config ARCH_MULTI_V6
>  	bool "ARMv6 based platforms (ARM11)"
>  	select ARCH_MULTI_V6_V7
> -	select CPU_V6K
> +	select CPU_ARM1176
>  
>  config ARCH_MULTI_V7
>  	bool "ARMv7 based platforms (Cortex-A, PJ4, Scorpion, Krait)"
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index a361840d7a04..041e73ad203a 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -41,13 +41,15 @@ comment "ARM1136 platforms"
>  
>  config SOC_IMX31
>  	bool "i.MX31 support"
> -	select CPU_V6
> +	depends on !SMP
> +	select CPU_ARM1136R0
>  	select MXC_AVIC
>  	help
>  	  This enables support for Freescale i.MX31 processor
>  
>  config SOC_IMX35
>  	bool "i.MX35 support"
> +	select CPU_ARM1136R1
>  	select MXC_AVIC
>  	help
>  	  This enables support for Freescale i.MX35 processor
> diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
> index f3f19bcfca2c..13987ffbba00 100644
> --- a/arch/arm/mach-omap2/Kconfig
> +++ b/arch/arm/mach-omap2/Kconfig
> @@ -8,8 +8,9 @@ config OMAP_HWMOD
>  config ARCH_OMAP2
>  	bool "TI OMAP2"
>  	depends on ARCH_MULTI_V6
> +	depends on !SMP
>  	select ARCH_OMAP2PLUS
> -	select CPU_V6
> +	select CPU_ARM1136R0
>  	select OMAP_HWMOD
>  	select SOC_HAS_OMAP2_SDRC
>  
> diff --git a/arch/arm/mach-versatile/Kconfig b/arch/arm/mach-versatile/Kconfig
> index 513618078440..de42da7de8c8 100644
> --- a/arch/arm/mach-versatile/Kconfig
> +++ b/arch/arm/mach-versatile/Kconfig
> @@ -113,7 +113,8 @@ config INTEGRATOR_CM1136JFS
>  	bool "Integrator/CM1136JF-S core module"
>  	depends on ARCH_INTEGRATOR_AP
>  	depends on ARCH_MULTI_V6
> -	select CPU_V6
> +	depends on !SMP
> +	select CPU_ARM1136R0
>  
>  config ARCH_INTEGRATOR_CP
>  	bool "Support Integrator/CP platform"
> @@ -135,7 +136,7 @@ config INTEGRATOR_CTB36
>  	bool "Integrator/CTB36 (ARM1136JF-S) core tile"
>  	depends on ARCH_INTEGRATOR_CP
>  	depends on ARCH_MULTI_V6
> -	select CPU_V6
> +	select CPU_ARM1136R1
>  
>  config ARCH_CINTEGRATOR
>  	depends on ARCH_INTEGRATOR_CP
> @@ -182,7 +183,7 @@ config MACH_REALVIEW_EB
>  config REALVIEW_EB_ARM1136
>  	bool "Support ARM1136J(F)-S Tile"
>  	depends on MACH_REALVIEW_EB && ARCH_MULTI_V6
> -	select CPU_V6
> +	select CPU_ARM1136R1
>  	help
>  	  Enable support for the ARM1136 tile fitted to the
>  	  Realview(R) Emulation Baseboard platform.
> @@ -201,11 +202,10 @@ config REALVIEW_EB_A9MP
>  	  Enable support for the Cortex-A9MPCore tile fitted to the
>  	  Realview(R) Emulation Baseboard platform.
>  
> -# ARMv6 CPU without K extensions, but does have the new exclusive ops
>  config MACH_REALVIEW_PB1176
>  	bool "Support RealView(R) Platform Baseboard for ARM1176JZF-S"
>  	depends on ARCH_MULTI_V6
> -	select CPU_V6
> +	select CPU_ARM1176
>  	select HAVE_TCM
>  	help
>  	  Include support for the ARM(R) RealView(R) Platform Baseboard for
> diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
> index 871bd58d2ccc..f3d71e89a31f 100644
> --- a/arch/arm/mm/Kconfig
> +++ b/arch/arm/mm/Kconfig
> @@ -376,6 +376,7 @@ config CPU_PJ4B
>  # ARMv6
>  config CPU_V6
>  	bool
> +	depends on !SMP
>  	select CPU_32v6
>  	select CPU_ABRT_EV6
>  	select CPU_CACHE_V6
> @@ -386,7 +387,6 @@ config CPU_V6
>  	select CPU_PABRT_V6
>  	select CPU_THUMB_CAPABLE
>  	select CPU_TLB_V6 if MMU
> -	select SMP_ON_UP if SMP
>  
>  # ARMv6k
>  config CPU_V6K
> @@ -403,6 +403,28 @@ config CPU_V6K
>  	select CPU_THUMB_CAPABLE
>  	select CPU_TLB_V6 if MMU
>  
> +config CPU_ARM1136R0
> +	bool
> +	select CPU_V6
> +	depends on !SMP
> +	help
> +	  These early revisions of ARM1136 lack support for the
> +	  ARMv6k extensions for multiprocessing.
> +
> +config CPU_ARM1136R1
> +	bool
> +	select CPU_V6K
> +	help
> +	  Later revisions of ARM1136 add ARMv6k (atomics, barriers
> +	  and TLS register) in addition to the features from r0.
> +
> +config CPU_ARM1176
> +	bool
> +	select CPU_V6K
> +	help
> +	  ARM1176 implements ARMv6k, VMSAv7 and Trustzone in
> +	  addition to the ARMv6 baseline.
> +
>  # ARMv7 and ARMv8 architectures
>  config CPU_V7
>  	bool
> -- 
> 2.39.5
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
