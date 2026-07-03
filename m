Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8542C326F
	for <soc@lists.linux.dev>; Fri,  3 Jul 2026 16:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783095550; cv=none; b=A4MQnNQh1Jcgp53O0Un5lIbFVvNOKAzkF+6xMDsClbJrvuUm29CU2uKSPsGetVfeobW8xoeT+CDDgqz+I6BPKQGyfFPPcSgrThEbvgEjmqUtx2jC1Phbhxq82Lyol8D0UrnwTiw7z4IKEzRsD862K+G+JAhRWWIEyKMPiaL7CQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783095550; c=relaxed/simple;
	bh=5ikSNglN68N4oDoD4bYoXCGh46zsp2D8rH8EezVNWd4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=efq0SIlL+OCqZ0NeMnTSAgG7PPdGYiv39y6WRDXrUAVLa/sUuzWeG3blPwlI5ofBKbDtPCTxpZPiGjtZf9h3WOr3KlDNrILV0G3kg/ahiEagL3x3075FVNvTrc3gCeRSg6OEVdzdLglHX+GvQY6bNEQzKaeAItsK7sYl4sw0YqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=whj5jeAO; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="whj5jeAO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 907964E40C6E;
	Fri,  3 Jul 2026 16:19:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 49DDA60300;
	Fri,  3 Jul 2026 16:19:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 447B011BB8526;
	Fri,  3 Jul 2026 18:18:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783095544; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/QJAmkOnoHA495YFan6Ky8WtBEo4v0J5CtKrSDPHCEg=;
	b=whj5jeAO6iCTFq0BeQBQC4nFBg4yNtvwwlzpeXzd1S6uO6lqsB7ZJVl/1/tqfzVQ3a5KkD
	bq2U8kDlCTijPK9qC8AwLzRwUFrdzolVBYPpbzxSRFSO5TBncDpn581K0Wz9ph8JmvNxpV
	gJhwBVgnqegNOR1fdWVP6fHuPGGpmJKGlM7ynmWo/Hp7cMwj27yMs3TTiAu2tz6jCWCTKk
	gEKUu/Is60Y4BQf5hQ6EoCZOieTx5zzmXP5/QfbBJvutrnsx5Nc5EW0slTi8Z77rDW6mKM
	CpMwSIUT0FPlHPHxfozL31kvcaeBrDFxVmzvJ8kvRK76ZsAoKF6hzxXVUMIhIQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin
 <alexander.sverdlin@siemens.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, Ard
 Biesheuvel <ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Daniel Mack <daniel@zonque.org>, Ethan Nelson-Moore
 <enelsonmoore@gmail.com>, Frank Li <Frank.Li@nxp.com>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, Mark Brown
 <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Patrice
 Chotard <patrice.chotard@foss.st.com>, Ralph Siemsen
 <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Russell King <linux@armlinux.org.uk>, Sascha Hauer
 <s.hauer@pengutronix.de>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Stefan Agner <stefan@agner.ch>, Stefan
 Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren <tony@atomide.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 19/19] ARM: mark mv78xx0 support as deprecated
In-Reply-To: <20260701212353.2196041-20-arnd@kernel.org>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-20-arnd@kernel.org>
Date: Fri, 03 Jul 2026 18:18:54 +0200
Message-ID: <87y0fs6o7l.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Only one machine remains supported and was kept in 2022 for the
> Debian_on_Buffalo project that was still using this, with plans to
> convert it to devicetree.
>
> The conversion never happened, and Debian_on_Buffalo does not provide
> kernels later than linux-6.1, so it is unlikely to still be useful
> for a DT conversion in the future.
>
> Mark the platform for deprecation after the next LTS kernel, which
> should give any remaining users a few more years of bugfixes.
>
> Link: https://lore.kernel.org/all/20221019150410.3851944-6-arnd@kernel.or=
g/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory
> ---
>  arch/arm/mach-mv78xx0/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-mv78xx0/Kconfig b/arch/arm/mach-mv78xx0/Kconfig
> index 670e6587827e..98b35f5d05ba 100644
> --- a/arch/arm/mach-mv78xx0/Kconfig
> +++ b/arch/arm/mach-mv78xx0/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  menuconfig ARCH_MV78XX0
> -	bool "Marvell MV78xx0"
> +	bool "Marvell MV78xx0 (DEPRECATED)"
>  	depends on ARCH_MULTI_V5
>  	depends on CPU_LITTLE_ENDIAN
>  	depends on ATAGS
> @@ -14,6 +14,8 @@ menuconfig ARCH_MV78XX0
>  	  Support for the following Marvell MV78xx0 series SoCs:
>  	  MV781x0, MV782x0.
>=20=20
> +	  This platform is scheduled for removal in early 2027.
> +
>  if ARCH_MV78XX0
>=20=20
>  config MACH_TERASTATION_WXL
> --=20
> 2.39.5
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
