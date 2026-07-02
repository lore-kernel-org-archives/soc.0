Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C13AA4F6
	for <soc@lists.linux.dev>; Thu,  2 Jul 2026 07:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977958; cv=none; b=u+wAi6LBYD5dZtKv01J7ZblKRqvjIB7GbCAYVyj6PRak6+BkLwlWPFez2Wop1eZe9Ziszu7URhPswuWysKbUpT2H7kmuGX+m0eWjaFbpIrKLVa6CJKiEJnCMyLEzNA+mlqdPFZjFtoR+wnK4lMJszlQlX40I6JBNwfrrpOjUIf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977958; c=relaxed/simple;
	bh=/hiYXX+Tl9Oi9Ll1odfLmRU1+IL7JIxTnj5Jgck2HxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=erUrX63xPKugucldvurnttu442WePgwBa9LeUW8Z2BMxdvhux3UJ+bocUKFobVJM/Rv+6Ri+n2GG1jCMngqHQJg4HlzEaG+eTxZtu1zKr6NwPv8P3VfFKPHcHmYLxOMU+deFIUsltWBwH8cpo9MKUK6wQnDWtM8Wl+8Yx9PipUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=gDtkatht; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="gDtkatht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782977958; x=1814513958;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/hiYXX+Tl9Oi9Ll1odfLmRU1+IL7JIxTnj5Jgck2HxQ=;
  b=gDtkathtUtotk0gYXF9hjNYulENJbFTMOtJVSrk0ruVlegEJovFVeKGn
   8zBO7VqYcD3i4KFrc+L9ghCQ0jX48+qRKGIsjCRvhbe95menaaD1Ke1Mf
   OnfPh/mOsscPMW3WAyTJC6aq+9MYqA7qWQyoAjws7H9Qz0n8VEH2+w/kE
   29gifjI1pi+zW53Mhr7RQnADebWytr5QKU0zD1e1BJKRCL/f/20N5YtUg
   bMWzIdAZMVV0tyYHLHPduqq+qkqTr/+i5CCGe2Jcn8hY+Z4TXsQb8NupY
   sICduP1eLoaVDAu8EBu8Z5iATgzAwXQYKQw+ZoyIBnLg+Si+p0F0P4I/q
   g==;
X-CSE-ConnectionGUID: Kzlc3EJsT/a0PYNYbFcCFg==
X-CSE-MsgGUID: Q2pi1i4kRfO/I5PSg+70xQ==
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="60352475"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jul 2026 00:39:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 2 Jul 2026 00:39:14 -0700
Received: from [10.171.248.30] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 2 Jul 2026 00:39:06 -0700
Message-ID: <54e742dd-aced-40f0-b4be-df160c8cbe3d@microchip.com>
Date: Thu, 2 Jul 2026 09:39:05 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/19] ARM: mark Cortex-M3/M4/M7 based boards as
 deprecated
To: Arnd Bergmann <arnd@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<soc@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin
	<alexander.sverdlin@siemens.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, Ard Biesheuvel
	<ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Mack
	<daniel@zonque.org>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, Frank Li
	<Frank.Li@nxp.com>, Gregory Clement <gregory.clement@bootlin.com>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, "Jeremy J. Peper"
	<jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, Mike Rapoport
	<rppt@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, Ralph
 Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner
	<stefan@agner.ch>, Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren
	<tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, Will Deacon
	<will@kernel.org>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-18-arnd@kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20260701212353.2196041-18-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2026 at 23:23, Arnd Bergmann wrote:
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
>   arch/arm/Kconfig            |  8 ++++++--
>   arch/arm/mach-at91/Kconfig  |  4 +++-
>   arch/arm/mach-imx/Kconfig   |  4 +++-
>   arch/arm/mach-stm32/Kconfig | 14 ++++++++------
>   4 files changed, 20 insertions(+), 10 deletions(-)

[..]

> diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
> index c5ef27e3cd8f..cb0e3ff8e0ca 100644
> --- a/arch/arm/mach-at91/Kconfig
> +++ b/arch/arm/mach-at91/Kconfig
> @@ -15,13 +15,15 @@ menuconfig ARCH_AT91
> 
>   if ARCH_AT91
>   config SOC_SAMV7
> -       bool "SAM Cortex-M7 family" if ARM_SINGLE_ARMV7M
> +       bool "SAM Cortex-M7 family (DEPRECATED)" if ARM_SINGLE_ARMV7M
>          select COMMON_CLK_AT91
>          select PINCTRL_AT91
>          help
>            Select this if you are using an SoC from Microchip's SAME7, SAMS7 or SAMV7
>            families.
> 
> +         This platform is scheduled for removal in early 2027

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> +
>   config SOC_SAMA5D2
>          bool "SAMA5D2 family"
>          depends on ARCH_MULTI_V7

[..]

Thanks, regards,
   Nicolas
