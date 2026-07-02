Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531AF22D7B9
	for <soc@lists.linux.dev>; Thu,  2 Jul 2026 16:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783011597; cv=pass; b=iiM7xXGnMGwbn1NFJXN9Sco6o0RqXJsOU5Tb3rWTbzyOi/IUAivAOjZ1itg06YDceEWVk1zuJt6F9RGik0BgR4A2aIfWO/jlIxlr1VVjB536rcTfB93gRAkwwdgtvlJMXL43ILQ/egJOYmYKuGmLFu/k2qgLA11LAqZJ4NXE/1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783011597; c=relaxed/simple;
	bh=BgwAdufrSAoLP+RKojy6qUtGPD3rIKdFWSnt3ocC1ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsRWs3emIbVIVdwd9b71FhyulgQM0liYUFkC1JDpL/GYnj/4IHE6HSjM7YHToeb9tcjTLgb6a5sBXpqt32rMKUp5LLtY3LerplB/bcobtysTih/4vp2s7RcZCg+HzJqrkUqc3Uv4PJCE64ZSsRc92tKSwtaXA6yMtgB1I4dgI78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=GkJ9HOoy; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="GkJ9HOoy"
Received: from roadster.musicnaut.iki.fi (85-76-33-40-nat.elisa-mobile.fi [85.76.33.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4grjmK36dmz49Q5N;
	Thu, 02 Jul 2026 19:59:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1783011589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AfeQVzy7M4lefzUDckto9D0NJkiUjBGQ4oKxkwviFJs=;
	b=GkJ9HOoycFOGbxLFMHKxFv/kfhEcZQxL3duwoIlOq5EkUog3KyKYMqfEDsbCFr31jrilb1
	+bNab/mtjoPOghtFeeYl1Z0c0mG2IN1fbhZf9VkXye/jhFOFittFjgF1vuaxThqWxXMxkb
	oS/7F3+p6v2hbcWYo4s9ccCOEb72EUlADSsfN4Pk40DmWEP5u8Wfll97qdnMe9Wrx0zcv/
	7l3/DJPrU7PphQPIFCOIK9uPgL++7HCvC5rQDdtCdtvD0Yvnqr+SUY80MCFlRTEjzVCFuY
	Rnvbg7wDPfnoNbn2TxpefIzzjI4KTNDJ2mQGv3ab3/u2kVpPh4oz88KgsEUAng==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1783011589;
	b=r2Asa+3N5St+n0wQwxx4gA6DFeEK2DHp3x23wq+lZHBCV1I5bDzjwl7s306ah90buJPiFe
	wBNkEQQ+glpnemw+lQZAOXECgfNi7ui7YKcQ6qbO7f0WAOcIotjNkOT7KIEliJ8uqofbyR
	NaG4C094Gy+N7CAX7BbvzUhBBRTbmzcrcWMqbwYWx+Sqx1+++fS5GVD3utCyw0JLeyR32B
	FxiskcuIlifwx2DffPaxBQYK6g+plceh6+20PdHXl2KLsqUv31N6CDIRTNw2CiYc8cnYwt
	fnQotKRUjD1UKh50apkX+mtttndXNgUELTDv0+9nSruhWIcrmSfJ1f/G0Q5L0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1783011589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AfeQVzy7M4lefzUDckto9D0NJkiUjBGQ4oKxkwviFJs=;
	b=r0deE2r0l3QDs6njbKGirYsF6nGKoj2OyluUDVpU8xxRyKKevX4GBJsf9NvVb7lkLdMH2G
	g6YxEqXfkC4HJKe7WyTWrDZYJFww0f3CB26tIkYK0+XvzJ875NJEjPZ4cwu68JOgxF3hhL
	eFfAp7KE4SV38DwEjYwZ9Mh9caUZhC7PoENKOheCczjWzHopD1z4l7jMsH2pL/0JfCb4oP
	7jvAUMX4M34KCF0dicVLFaEv09DetCeHdHHD3Zsz5SY/U/gpsGuI6mtGxp31wv9IGhbZa1
	1Nw7BtaToTC4b/C/urghmysE61Eb0a9pGz4uYDkZxkXGSLfmHa4iYpaKx76+/A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
Date: Thu, 2 Jul 2026 19:59:43 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
Subject: Re: [PATCH v2 04/19] ARM: deprecate support for ARM1136r0
Message-ID: <akaY_1tXCYACSbcP@roadster.musicnaut.iki.fi>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-5-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701212353.2196041-5-arnd@kernel.org>

Hi,

On Wed, Jul 01, 2026 at 11:23:38PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This CPU revision remains a special case as it is now incompatible
> with CONFIG_SMP. Only the Nokia N8x0 is used in practice, and even
> that one is fairly rare these days, so let's plan to remove all of
> them after the 2026 LTS kernel release.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi> # OMAP

A.

> ---
>  arch/arm/mach-imx/Kconfig       |  5 ++++-
>  arch/arm/mach-omap2/Kconfig     | 15 ++++++++++++---
>  arch/arm/mach-versatile/Kconfig |  5 ++++-
>  arch/arm/mm/Kconfig             |  2 ++
>  4 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index 041e73ad203a..f85a5f8c0a58 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -40,13 +40,16 @@ if ARCH_MULTI_V6
>  comment "ARM1136 platforms"
>  
>  config SOC_IMX31
> -	bool "i.MX31 support"
> +	bool "i.MX31 support (DEPRECATED)"
>  	depends on !SMP
>  	select CPU_ARM1136R0
>  	select MXC_AVIC
>  	help
>  	  This enables support for Freescale i.MX31 processor
>  
> +	  This SoC is scheduled for removal in early 2027,
> +	  since it uses the ARM1136r0 CPU revision.
> +
>  config SOC_IMX35
>  	bool "i.MX35 support"
>  	select CPU_ARM1136R1
> diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
> index 13987ffbba00..79f8afe3a6bf 100644
> --- a/arch/arm/mach-omap2/Kconfig
> +++ b/arch/arm/mach-omap2/Kconfig
> @@ -207,18 +207,24 @@ comment "OMAP Core Type"
>  	depends on ARCH_OMAP2
>  
>  config SOC_OMAP2420
> -	bool "OMAP2420 support"
> +	bool "OMAP2420 support (DEPRECATED)"
>  	depends on ARCH_OMAP2
>  	default y
>  	select OMAP_DM_SYSTIMER
>  	select OMAP_DM_TIMER
>  	select SOC_HAS_OMAP2_SDRC
> +	help
> +	  This SoC is scheduled for removal in early 2027,
> +	  since it uses the ARM1136r0 CPU revision.
>  
>  config SOC_OMAP2430
> -	bool "OMAP2430 support"
> +	bool "OMAP2430 support (DEPRECATED)"
>  	depends on ARCH_OMAP2
>  	default y
>  	select SOC_HAS_OMAP2_SDRC
> +	help
> +	  This SoC is scheduled for removal in early 2027,
> +	  since it uses the ARM1136r0 CPU revision.
>  
>  config SOC_OMAP3430
>  	bool "OMAP3430 support"
> @@ -249,11 +255,14 @@ config MACH_NOKIA_N810_WIMAX
>  	bool
>  
>  config MACH_NOKIA_N8X0
> -	bool "Nokia N800/N810"
> +	bool "Nokia N800/N810 (DEPRECATED)"
>  	depends on SOC_OMAP2420
>  	default y
>  	select MACH_NOKIA_N810
>  	select MACH_NOKIA_N810_WIMAX
> +	help
> +	  This machine is scheduled for removal in early 2027,
> +	  since it uses the ARM1136r0 CPU revision.
>  
>  endmenu
>  
> diff --git a/arch/arm/mach-versatile/Kconfig b/arch/arm/mach-versatile/Kconfig
> index de42da7de8c8..1ee9b6608d71 100644
> --- a/arch/arm/mach-versatile/Kconfig
> +++ b/arch/arm/mach-versatile/Kconfig
> @@ -110,11 +110,14 @@ config INTEGRATOR_CM1026EJS
>  	select CPU_ARM1026
>  
>  config INTEGRATOR_CM1136JFS
> -	bool "Integrator/CM1136JF-S core module"
> +	bool "Integrator/CM1136JF-S core module (DEPRECATED)"
>  	depends on ARCH_INTEGRATOR_AP
>  	depends on ARCH_MULTI_V6
>  	depends on !SMP
>  	select CPU_ARM1136R0
> +	help
> +	  This machine is scheduled for removal in early 2027,
> +	  since it uses the ARM1136r0 CPU revision.
>  
>  config ARCH_INTEGRATOR_CP
>  	bool "Support Integrator/CP platform"
> diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
> index f3d71e89a31f..27010b9389ad 100644
> --- a/arch/arm/mm/Kconfig
> +++ b/arch/arm/mm/Kconfig
> @@ -410,6 +410,8 @@ config CPU_ARM1136R0
>  	help
>  	  These early revisions of ARM1136 lack support for the
>  	  ARMv6k extensions for multiprocessing.
> +	  Support for this revision is scheduled for removal
> +	  from the kernel in early 2027.
>  
>  config CPU_ARM1136R1
>  	bool
> -- 
> 2.39.5
> 
