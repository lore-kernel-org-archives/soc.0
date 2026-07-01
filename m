Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4250434AB00
	for <soc@lists.linux.dev>; Wed,  1 Jul 2026 22:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782944420; cv=none; b=Us+yGRKtHXbCmnPfAcqtlfTkwGJtEOjPWzgKEqXLiSSo7bTzhAv65EEK4HvlcTEAIR9E4tG4xexTeY3+rW7qZ5Id0UaZUrcCeHp+09ZpYUN7ohfRSzFi561B8k5hSFpUsGXlgN31cpvUzJdlkWrN6Hong5d/ijD+37nQ78FDgD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782944420; c=relaxed/simple;
	bh=PJ2SDvKqqc4aQ/2saQc79Z5u8elwI767ZgepY9FlJS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWNYWS5voRthwVModCojueUuVGJH1S4nVyXyMfop1qp0IMCp2KEIqfGly5Q6b9+e6FEmGuL+NWJrNDH2Dcf+HwJworFZsEfd0k2QOFdagXgUubWOdJOcTgInSPgQnW6631t2ioo0ngul2cpUk4JxnPObpgQ76uOdnchoXdsMuio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=Uo2ccDT0; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=dmk19z/m; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="Uo2ccDT0";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="dmk19z/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1782943877; bh=PJ2SDvKqqc4aQ/2saQc79Z5u8elwI767ZgepY9FlJS4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uo2ccDT0JltghcupX6v+4mSMli4bMGyZEoFRYbkwFCmBaR8w+wAfWCoRLz8DL3R84
	 hcKawMMVEm/2aXxcVvfwowzu0INc9a7EIEh/13PuxmmyFcgish49zstw5xQSu2BJmP
	 8ENrwZ/D52iL3ER9vNBxDGPvM7XWMdXKWepbOjI8CfogKekXk7K5laIHZFw+UlVu4q
	 hox+4OIjqO9xZNs6JIZbzbWXotviZkr8mWV2A7S+7I9nyJptWbC1Gc85VlTuCQvJRq
	 REsYtNLuYjWw2IyyGxR+6J6zYLy+8eq96efjeWysb12Ozp+Px8sycYUqLbcFpCmgIP
	 DSEzEBRf/cc+w==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id E6C0339470B;
	Wed,  1 Jul 2026 22:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1782943876; bh=PJ2SDvKqqc4aQ/2saQc79Z5u8elwI767ZgepY9FlJS4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dmk19z/mFKmG+RdhmtzpbzPp4KzYkBTY1W25BQcXo0AeHyzYCrvkp86qgM5EASmY3
	 QVHhy7du6/hryqez4wneXjTACxvcx49MkxSBJXJABj2HSwg+KgXIEPcuutskiEdHQQ
	 UeWrH8o9mjFN7rhSpu3d6nj2N99PD1PENVeeZBSnFZVuRgycjb+Sx4RzCBAsRTh5jP
	 Cf1CBa4flTMkyCzvr0SgGVW01echqFQlqzGMLdTTm3P1hi8PTp3aU+r0nbH1TOlCSJ
	 AYJJExEk9ei5VH3oHmqazSdLVw70JL28jMO8LfNrwE/GuuQ9kth2egOvj4MbIMEYVw
	 WyLM4JSyQnT/g==
Message-ID: <1f18b016-15c8-4b13-a143-23c9af22339a@mleia.com>
Date: Thu, 2 Jul 2026 01:11:13 +0300
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/19] ARM: deprecate support for ARM1136r0
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew@lunn.ch>, Ard Biesheuvel <ardb@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Mack <daniel@zonque.org>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Ralph Siemsen <ralph.siemsen@linaro.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Stefan Wiehler <stefan.wiehler@nokia.com>,
 Tony Lindgren <tony@atomide.com>, Will Deacon <will@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-5-arnd@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20260701212353.2196041-5-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260701_221116_972652_31659974 
X-CRM114-Status: GOOD (  21.07  )

On 7/2/26 00:23, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This CPU revision remains a special case as it is now incompatible
> with CONFIG_SMP. Only the Nokia N8x0 is used in practice, and even
> that one is fairly rare these days, so let's plan to remove all of
> them after the 2026 LTS kernel release.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/arm/mach-imx/Kconfig       |  5 ++++-
>   arch/arm/mach-omap2/Kconfig     | 15 ++++++++++++---
>   arch/arm/mach-versatile/Kconfig |  5 ++++-
>   arch/arm/mm/Kconfig             |  2 ++
>   4 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index 041e73ad203a..f85a5f8c0a58 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -40,13 +40,16 @@ if ARCH_MULTI_V6
>   comment "ARM1136 platforms"
>   
>   config SOC_IMX31
> -	bool "i.MX31 support"
> +	bool "i.MX31 support (DEPRECATED)"
>   	depends on !SMP
>   	select CPU_ARM1136R0
>   	select MXC_AVIC
>   	help
>   	  This enables support for Freescale i.MX31 processor
>   
> +	  This SoC is scheduled for removal in early 2027,
> +	  since it uses the ARM1136r0 CPU revision.
> +

Acked-by: Vladimir Zapolskiy <vz@mleia.com> # Freescale i.MX31

It's a nice SoC, long time ago its watchdog driver was broken in upstream
and never got fixed unfortunately...

>   config SOC_IMX35
>   	bool "i.MX35 support"
>   	select CPU_ARM1136R1
> diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
> index 13987ffbba00..79f8afe3a6bf 100644
> --- a/arch/arm/mach-omap2/Kconfig
> +++ b/arch/arm/mach-omap2/Kconfig
> @@ -207,18 +207,24 @@ comment "OMAP Core Type"
>   	depends on ARCH_OMAP2
>   
>   config SOC_OMAP2420
> -	bool "OMAP2420 support"
> +	bool "OMAP2420 support (DEPRECATED)"
>   	depends on ARCH_OMAP2
>   	default y
>   	select OMAP_DM_SYSTIMER
>   	select OMAP_DM_TIMER
>   	select SOC_HAS_OMAP2_SDRC
> +	help
> +	  This SoC is scheduled for removal in early 2027,
> +	  since it uses the ARM1136r0 CPU revision.
>   
>   config SOC_OMAP2430
> -	bool "OMAP2430 support"
> +	bool "OMAP2430 support (DEPRECATED)"
>   	depends on ARCH_OMAP2
>   	default y
>   	select SOC_HAS_OMAP2_SDRC
> +	help
> +	  This SoC is scheduled for removal in early 2027,
> +	  since it uses the ARM1136r0 CPU revision.
>   
>   config SOC_OMAP3430
>   	bool "OMAP3430 support"
> @@ -249,11 +255,14 @@ config MACH_NOKIA_N810_WIMAX
>   	bool
>   
>   config MACH_NOKIA_N8X0
> -	bool "Nokia N800/N810"
> +	bool "Nokia N800/N810 (DEPRECATED)"
>   	depends on SOC_OMAP2420
>   	default y
>   	select MACH_NOKIA_N810
>   	select MACH_NOKIA_N810_WIMAX
> +	help
> +	  This machine is scheduled for removal in early 2027,
> +	  since it uses the ARM1136r0 CPU revision.
>   
>   endmenu
>   
> diff --git a/arch/arm/mach-versatile/Kconfig b/arch/arm/mach-versatile/Kconfig
> index de42da7de8c8..1ee9b6608d71 100644
> --- a/arch/arm/mach-versatile/Kconfig
> +++ b/arch/arm/mach-versatile/Kconfig
> @@ -110,11 +110,14 @@ config INTEGRATOR_CM1026EJS
>   	select CPU_ARM1026
>   
>   config INTEGRATOR_CM1136JFS
> -	bool "Integrator/CM1136JF-S core module"
> +	bool "Integrator/CM1136JF-S core module (DEPRECATED)"
>   	depends on ARCH_INTEGRATOR_AP
>   	depends on ARCH_MULTI_V6
>   	depends on !SMP
>   	select CPU_ARM1136R0
> +	help
> +	  This machine is scheduled for removal in early 2027,
> +	  since it uses the ARM1136r0 CPU revision.
>   
>   config ARCH_INTEGRATOR_CP
>   	bool "Support Integrator/CP platform"
> diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
> index f3d71e89a31f..27010b9389ad 100644
> --- a/arch/arm/mm/Kconfig
> +++ b/arch/arm/mm/Kconfig
> @@ -410,6 +410,8 @@ config CPU_ARM1136R0
>   	help
>   	  These early revisions of ARM1136 lack support for the
>   	  ARMv6k extensions for multiprocessing.
> +	  Support for this revision is scheduled for removal
> +	  from the kernel in early 2027.
>   
>   config CPU_ARM1136R1
>   	bool

-- 
Best wishes,
Vladimir
