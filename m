Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FB047DF98;
	Thu,  2 Jul 2026 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993594; cv=none; b=U3j3mAQT6aPTYOk7E/yTcGlkktu34EuajUJtQNrzrTyVOo2DpQ872IcvA/ytrBNmdgMNiL27q9FujX5HIAKHY/5WXNPgL7UGKMZyWCq+VaVsktexCsjTzfxwPr/5PZKSuTBdrSjlykYeNXV3NOC/YW2201A5gCZZdHgNvBFp0WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993594; c=relaxed/simple;
	bh=q86oBJBMyt3Jflct1VzZWG2SIOHA8zzh+VLlvkOLNrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXdNG/gUhZrDfEJhvd3vzSR/odioq3u9ONXQo5rf/r7FUm9bH3clnmu+KP13tmvoMTSmXlngK1SzVaGfx7Qo4BiUfXtadqvHQS1OJLjeapeBXGl8Sx5Qp9Ul1PvCpzgSwQ/a4bVj1BVVt+Tj5ylesfT+RewnEc7ncrk+sivlBLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netwinder.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OutkGWzx; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netwinder.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OutkGWzx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=V59F5LeFLLk0hiR6HVyBNdzVUev2yIANYpC8FeFlguU=; b=OutkGWzxXx7M8LQMhloU9ATZyR
	Iye5/XEP+f1z6Ye/tHyHi5lEF/ahNeLVw90RxSDKUf/V4zXneTqBq4a/TpdchvDuT6OWw63K9JQl5
	UC88leaNfUs/KCVMbpVo4JA5DvSldIrc55gfU99M8mUvCk/0/h2B91LAk1o8voXmHC0FQi3gh5t3V
	reX40qWgzBSv1VnN5vPRtMp+Hdg0ETCOZX0tzJEjC6oV0FAYn617MBep2vePX8DfgLsdSCMNDi5w9
	00vYAaj0iTlks2rTV3PKWpvxw9SF+4f4KxJ5ZjdS27MEUAPBiEp4DPY/I16G6UlXewWTytCCD2ZPi
	bEtbk3Jg==;
Received: from [72.10.137.214] (helo=rfs.netwinder.org)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfG4z-00000008Tfh-24bT;
	Thu, 02 Jul 2026 11:59:42 +0000
Date: Thu, 2 Jul 2026 07:59:40 -0400
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
Subject: Re: [PATCH v2 09/19] ARM: update FPE_NWFPE help text
Message-ID: <akZSrFc_8ra8sysq@rfs.lan>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-10-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260701212353.2196041-10-arnd@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <ralphs@netwinder.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Jul 01, 2026 at 11:23:43PM +0200, Arnd Bergmann wrote:
>
>The help text is seriously outdated and predates the introduction of
>VFP floating point units that were available as early as some ARM926
>based systems.
>
>Change the help text to reflect that this is now a legacy feature
>and that it will go away along with OABI support in the future.

Indeed NWFPE was initially added in order to be able to execute 
pre-existing binaries from even earlier systems.

Once soft-float became available in the toolchain, the netwinder
userspace was rebuilt, and NWFPE became largely unnecessary.

All of this happened in the early 2000's.

>Acked-by: Linus Walleij <linus.walleij@linaro.org>
>Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Ralph Siemsen <ralphs@netwinder.org>

Regards,
Ralph
