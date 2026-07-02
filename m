Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47FA2DA76A;
	Thu,  2 Jul 2026 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997749; cv=none; b=g8Dd1hAafRktsRQ0KECQxusi4MKUiGqYb+oUMTUiH8eGqlwMARU71H9pBGSxdMiONLYKvC4ryPss44e8kc8sB3xpprY9LHkF1cnjmMwxJBu9Ey4e8RF4VtLRqm9qyed0Sq6d3szT8tgYbThH24noqFy76Z2is678d4ytR93C1WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997749; c=relaxed/simple;
	bh=YK/mBmUcEAg2EJ8C96n6if9d/idURjXdr+tTtd1QD+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olaQVSilXCEzkw6JedxtZP8QT/K7fKBIynWRhE6nOiTdArgCT5X1YQ5E5c0IkEBuVzp+iBRzSKcCAhJQPKr0NrVSWBVFjtpBvFVkRcIvIaZRk55P5vFgoTOq4TRu34z+3Zlg/33Nveq42+Gsm1mHTRq0V4XfKJ0bc3GP+R0mL28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netwinder.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CFgaahyD; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netwinder.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CFgaahyD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+vYmA9TUhXqQi+P/KHutU0J8y5jxe8n/jqKbfp/W04A=; b=CFgaahyDr92q2pMIzyy2szdZDW
	FAEaMniUxNoCmqkGUlz5yEeBo5Xj4Vu0/6l03ElmA8QmMeKY3OMUAgSeZ2tgamd/ccqDXMDE2UBDZ
	7jBqF7EJcbwXofEDcMFeOph0pQBMoIkItaNHafrgV4KFhfyI3MdnxqMPqbdrAVrASPOV+9NsBZRyx
	h5PlWcFvaz/6mIZbePG4xhheF0vRWR7U9LQiRXYnMpzUWLTrLFbgp+U3Ss32OG+fxmEHDVxVuPms7
	DFxEIJOngxtWwoYCT+W4jcXXSmKjYEwxoQzI4yPHpCC8cNjOeQbS20BJJpE5565+uLFbf3Q5mDHd1
	jzgG47pg==;
Received: from [72.10.137.214] (helo=rfs.netwinder.org)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfHA0-00000003qf1-0h0Z;
	Thu, 02 Jul 2026 13:08:56 +0000
Date: Thu, 2 Jul 2026 09:08:51 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
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
Subject: Re: [PATCH v2 16/19] ARM: mark footbridge as deprecated
Message-ID: <akZi2QajWgg6qgGB@rfs.lan>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-17-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260701212353.2196041-17-arnd@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <ralphs@netwinder.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Jul 01, 2026 at 11:23:50PM +0200, Arnd Bergmann wrote:
>
>Along with RiscPC and SA1100, these are the last remaining Intel StrongARM
>machines. The Corel NetWinder used to be particular popular in the late
>1990s, but was discontinued during the bankruptcy of rebel.com in 2001.
>The other machine is the DEC (later Intel) EBSA285 evaluation board that
>was made in small numbers in 1997 for software developers.
>
>The footbridge/netwinder platform was the main target for the first Debian
>2.0 "Hamm" release on the Arm architecture back in 1998, but was dropped
>in Debian 6.0 "Squeeze" in 2011, which only supported ARMv4T and higher
>with the EABI based ports as ARMv4 hardware had fallen already out of
>use by that time.
>
>Link: http://netwinder.org/
>Cc: Linus Walleij <linus.walleij@linaro.org>
>Cc: Russell King <linux@armlinux.org.uk>
>Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
>Acked-by: Linus Walleij <linus.walleij@linaro.org>
>Acked-by: Marc Zyngier <maz@kernel.org>
>Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>---
> arch/arm/mach-footbridge/Kconfig | 7 +++++--
> 1 file changed, 5 insertions(+), 2 deletions(-)
>
>diff --git a/arch/arm/mach-footbridge/Kconfig b/arch/arm/mach-footbridge/Kconfig
>index 78189997caa1..96a74d447028 100644
>--- a/arch/arm/mach-footbridge/Kconfig
>+++ b/arch/arm/mach-footbridge/Kconfig
>@@ -1,6 +1,6 @@
> # SPDX-License-Identifier: GPL-2.0-only
> menuconfig ARCH_FOOTBRIDGE
>-	bool "FootBridge Implementations"
>+	bool "FootBridge Implementations (DEPRECATED)"
> 	depends on ARCH_MULTI_V4 && !(ARCH_MULTI_V4T || ARCH_MULTI_V5)
> 	depends on !(ARCH_MOXART || ARCH_GEMINI || ARCH_SA1100)
> 	depends on ATAGS
>@@ -12,7 +12,10 @@ menuconfig ARCH_FOOTBRIDGE
> 	select NEED_MACH_MEMORY_H
> 	help
> 	  Support for systems based on the DC21285 companion chip
>-	  ("FootBridge"), such as the Simtec CATS and the Rebel NetWinder.
>+	  ("FootBridge"), used in the EBSA285 and the Rebel NetWinder.
>+
>+	  Support for these machines will go away in 2027,
>+	  unless there are any remaining users that speak up.
>
> if ARCH_FOOTBRIDGE
>

Speaking for NetWinder, although it is sad to let it go, the reality is 
there have been no active users in years. This is based on the mailing 
list being silent (other than spam). And the trickle of emails I used to 
get about netwinder has also ended for many years. So with that:

Acked-by: Ralph Siemsen <ralphs@netwinder.org>

Regards,
Ralph

