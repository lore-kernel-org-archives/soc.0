Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69927357A4A
	for <soc@lists.linux.dev>; Thu,  2 Jul 2026 08:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981837; cv=none; b=Y1QLqMGfYuAZnTA6nBSpgwgN90uy59C/bnqSXlScXuU1tKVpRGe0E2hhzN68xQX6ngbuAaCmq44RRoCrmObJaLAEyPDMDAArmlJ699tI6GX0Q2EQkc8lr+6ZwqpKVAcUJ15VP8bH3ZZ4DzVGbQKij2zi+EhyGraNF9r2lSvfKo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981837; c=relaxed/simple;
	bh=rPDevm0YRy77Ne+62P1HMegZMMVYnYj/WPFGNqP8hQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EY8G+IRaJ5sSP66zw0dauOpZbdMjO5k5Ki3+qUhtgzereJTIyBMrDwksbiAWMwc7q7We3phJq2x36tKOJjvJ1hzPqDZVUFaQb1pJ5fmsezPWyJoKxVd61ARxX2JXwgeUwf0wTM6nym17dkpZyBfpKuZ2KctPWzj+ugqQRf88sW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nuVyVZ97; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nuVyVZ97"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 676A4288E;
	Thu,  2 Jul 2026 01:43:51 -0700 (PDT)
Received: from [10.1.36.193] (e121487-lin.cambridge.arm.com [10.1.36.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E584E3F905;
	Thu,  2 Jul 2026 01:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782981835; bh=rPDevm0YRy77Ne+62P1HMegZMMVYnYj/WPFGNqP8hQU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nuVyVZ97ajw+6v98/4yS91JCo/Xkwuch52Og9baGNKpm0As7HkehfcOM3vrN9x49A
	 d8N9GHMU1JYWDjRYsfsZPaXsdUAC3MvElbKlWVxslNdPdsPnWznzOR06TMSLtIwUUD
	 yuruJZnUwxa5Yums5P3FG8S2xbngrUfYXS/K+ISI=
Message-ID: <1de8cf96-3e46-4d86-818b-7a2a1ded6166@arm.com>
Date: Thu, 2 Jul 2026 09:43:46 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/19] ARM: mark Cortex-M3/M4/M7 based boards as
 deprecated
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
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Will Deacon <will@kernel.org>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-18-arnd@kernel.org>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260701212353.2196041-18-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/1/26 22:23, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The Cortex-M3/M4/M7 cores were designed as a replacement for the earlier
> ARM7TDMI and ARM9TDMI microarchitectures used in older microcontrollers.
> 
> At the moment, Linux can run these cores either when they are integrated
> into a larger SoC, or as standalone microcontrollers. While there was
> a lot of development work going into Cortex-M support from 2011 to 2016,
> this largely stopped when it became clear that Zephyr and other RTOS
> had taken over that market. To date, the only Cortex-M based based
> microcontroller boards supported upstream are reference implementations.
> 
> Schedule these for removal after the next LTS kernel, so if any users
> remain that want to update their kernels, they can stay on that
> version for a few years before having to maintain the platform support
> out of tree.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/Kconfig            |  8 ++++++--
>  arch/arm/mach-at91/Kconfig  |  4 +++-
>  arch/arm/mach-imx/Kconfig   |  4 +++-
>  arch/arm/mach-stm32/Kconfig | 14 ++++++++------
>  4 files changed, 20 insertions(+), 10 deletions(-)
> 

[snip]

>  config ARCH_MPS2
> -	bool "ARM MPS2 platform"
> +	bool "ARM MPS2 platform (DEPRECATED)"
>  	depends on ARM_SINGLE_ARMV7M
>  	select ARM_AMBA
>  	select CLKSRC_MPS2
> @@ -493,6 +495,8 @@ config ARCH_MPS2
>  	  Please, note that depends which Application Note is used memory map
>  	  for the platform may vary, so adjustment of RAM base might be needed.
>  
> +	  This platform is scheduled for removal in early 2027
> +
>  # Definitions to make life easier
>  config ARCH_ACORN
>  	bool

Acked-by: Vladimir Murzin <vladimir.murzin@arm.com> # MPS2


Thanks
Vladimir
