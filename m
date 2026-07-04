Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D167E30FC27
	for <soc@lists.linux.dev>; Sat,  4 Jul 2026 10:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783161238; cv=none; b=D/GKvRUMLMWGiymQ/8txPE0IiVKjLnUNOJNf9IrC54Gk3RyBE9LRJLNfIdAVfqoTQHpG73DGfKvVq6o/X0C7pEqo+dlW23HJCgIIfGtfFySp7xtkhbQ8D2OpdcKVHiCFisNc5GYVZynZTwa9GDA2fAJh3c7/+jXcSPlt+9UtlJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783161238; c=relaxed/simple;
	bh=mLEYQRb1+GHF3V7e0fLiIE+ZaNmLxGjoOBr766xr2Yw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=aP/GBLENXn+48sIRrIUcEEPdHNBCxK5lGfi2ZikxlfOiW8o2yDZIeTwlsLT6cyIQHQk9AzCVqLRPR2PO/NxioCIT6bhOywLKLDFv5yp/6Ysat+MS9ZJreqTdlVIxD9KgJfwC+YGlLn5HBW5KMkDo7bw8PFbF57RJRpjMDICO3G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=RLGfFcmp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RxQQIFPq; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="RLGfFcmp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RxQQIFPq"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4327B7A00CC;
	Sat,  4 Jul 2026 06:33:55 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Sat, 04 Jul 2026 06:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783161235;
	 x=1783247635; bh=Pk/O39fz+1gp1fJb+0A9sDLTAVlE4ct4QMhdah91OAE=; b=
	RLGfFcmpFO0uzbMHo5JX/7hvQCe2Enmu5ARvZzU1wGtcm1Wiq4BJjraggYPO1Vg7
	INzkYRyrfkexu1ta8+gAf+jxo9uqlDt5GTtuGvdqkM4VKbi71VkCF2X2binQLpIg
	Hb3sc+x7rnbQm5lU1PjWTTDMESOpuqlZ/GwUOTQPD0F0ZLPOmM29E3u5moUzVwgH
	kfOp1MkBS9hQAuWre+IdnYK3IjCi0I3yCshcb5eOYEI/4bhdsRa27RnJawctfQAc
	y9A0A8F7+XXYu5V1LHReN+4lVR9hwbqv7ObBszzVB1udUCp8HWUYgqh89ilHVn0b
	LnN+Li4D52wGBhy2hhHy4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783161235; x=
	1783247635; bh=Pk/O39fz+1gp1fJb+0A9sDLTAVlE4ct4QMhdah91OAE=; b=R
	xQQIFPqP1Be1Y09HzV81oUD1QHRf06t0ybqPchugNdN4qfgHz/XLeAPKbdtljzfS
	ziVOHxZSXbhSerPccs+mnuhRiVyyg/iEcItGEhgu8GMExsw8XV2nt+DccoecVcrv
	xc0EFsFJfUYcrZosraTpdMPdehh541EwlOkv0VkWG9ih371T4kPcVhLwsBzjzU0r
	BudkUHffKLjjb6R2fcCq0uzqm2y3GE3coNNgV8LgCy+zpmBMYx2qIf2OjYy8Ot6q
	c/L0v5+HyVKQUTjVR+97tNK5cGUIzTT4+eyyLgtZfbbaCYQzaI7iH4EVbP60BxSr
	iEyTBsHKygZ+A1+//3qMA==
X-ME-Sender: <xms:keFIag7q6PFBjkx_1-Lfvn2P5-30S7vJurbsW0isHBGms2_JXCBqBA>
    <xme:keFIassP6wax8kHt0q94TCVvYWe1mBUAlbH3404sDV3ClC3vOUCKC9QY5RX6ZAiqp
    byQ4mF_OHILeAiJDdK6BwgDBN12EF-OUZNo2UobFjOEwDjRT6t3vS8>
X-ME-Proxy-Cause: dmFkZTEacy3upSSrbkX3pWwGQJ86g2RQfGMcbRL2ANvZhso5kc/iwbTAtZscI5teXO4yFa
    ApBpWOXSlWqXMJOLIQCkH0ecdG1X4j0Wk2weX1Z3+F+uIT1qRIgL2GbA9TxSUqPCrc5eLE
    1TalPPYiOILi6KFKJC5GSNhshM9/lDyNuNFmIhxGiQEU57xEaVv4/rgg/xQi35K1ltBRt+
    yZ+k1QW53+uXHY+bUM26QIhvo8Rsq1M+rmEO7K7Zfd+VfE22cnJWHtpln7FD9t44vghsfR
    kvDOucO3VhePAvTXnl0UjaxyAF2/xM0V6Z6908vQBBcQMyE7+5MIdM6T15Zrig+fRxxweC
    bSfSJtrUyqN7l2t+j+LnjzIFou7x1NodT37bwSALD7a4t8cznDc68vf2z52kY4PA7bngMH
    wnunT3JELxXwrctCGB0G7hrofezYHHHprXbCkyWzsp7+wrLGPk/Dt0cpzXqY1gt91p8cie
    p7EGrTdr9fNymZ3ADSK3AHZ50R8EhM8yH1nVww71WGDquWFQ0/YZkT0+La3aOF9QPiAhoy
    n0pN5WZVLquUHB9/pE/LJqRUVTrTRCQHKKpLV8PHPgi2fpEDZSl3F4B0q17UNL8qtaNx1V
    QhUibO6Tm3NVENYHqxUYk8Y2jHCAd/3DOCNGc5pz0DcEGSHDb3ACFubufbNw
X-ME-Proxy: <xmx:keFIanLR4m_S9p_h5eSK4pUBtMD_HcEpZSv_9cxLLyni6aMsR6VOsw>
    <xmx:keFIauEvZTr9TcFm4gKRpK8euxFhevQMQqTd2f9j_oYFOL-Pj-cEEA>
    <xmx:keFIaj5Uhx98wenuFF5AOrVU3w_-efH5_gfvNdl4Q3K0WCuZ7vFOOA>
    <xmx:keFIatkVJ48SfhLLzvGC-lIqnF8DRnb6B7_J_FiyR3_GPTjL4TZKUg>
    <xmx:k-FIahbClFBmviFOusoSXpc1m8FlLWTAo37yZoG56Db9aKiZvb3_dAat>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 286EB182007E; Sat,  4 Jul 2026 06:33:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ALI-OaCDsipc
Date: Sat, 04 Jul 2026 12:33:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linusw@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Andrew Lunn" <andrew@lunn.ch>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Daniel Mack" <daniel@zonque.org>,
 "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Frank Li" <Frank.Li@nxp.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 "Kristoffer Ericson" <kristoffer.ericson@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Mark Brown" <broonie@kernel.org>, "Marc Zyngier" <maz@kernel.org>,
 "Mike Rapoport" <rppt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Ralph Siemsen" <ralph.siemsen@linaro.org>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Russell King" <linux@armlinux.org.uk>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Stefan Agner" <stefan@agner.ch>,
 "Stefan Wiehler" <stefan.wiehler@nokia.com>,
 "Tony Lindgren" <tony@atomide.com>, "Vladimir Zapolskiy" <vz@mleia.com>,
 "Will Deacon" <will@kernel.org>
Message-Id: <60541bca-b0ec-4ffc-a2f8-31f196f43dc2@app.fastmail.com>
In-Reply-To: 
 <CAD++jLmX9Kt0TJ7ZV5z6C71STSFasj+tteAuRZf1kskLPyg+8w@mail.gmail.com>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-7-arnd@kernel.org>
 <CAD++jLmX9Kt0TJ7ZV5z6C71STSFasj+tteAuRZf1kskLPyg+8w@mail.gmail.com>
Subject: Re: [PATCH v2 06/19] ARM: mark CPU_ENDIAN_BE8 as deprecated
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026, at 22:29, Linus Walleij wrote:
> Hi Arnd,
>
> thanks for your patch!
>
> On Wed, Jul 1, 2026 at 11:25=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:
>
>>  config CPU_BIG_ENDIAN
>> -       bool "Build big-endian kernel"
>> +       bool "Build big-endian kernel (DEPRECATED)"
>
> I'm not so sure about this patch because it will look like IXP4XX is
> using a deprecated feature. The IXP4xx actually has many OpenWrt
> users.

How about the version below? If you like that better, I'll give
it a thorough build test and use that for v3.

     Arnd

diff --git a/arch/arm/mach-ixp4xx/Kconfig b/arch/arm/mach-ixp4xx/Kconfig
index cb46802f5ce5..cdcb42517eff 100644
--- a/arch/arm/mach-ixp4xx/Kconfig
+++ b/arch/arm/mach-ixp4xx/Kconfig
@@ -2,7 +2,6 @@
 menuconfig ARCH_IXP4XX
 	bool "IXP4xx-based platforms"
 	depends on ARCH_MULTI_V5
-	depends on CPU_BIG_ENDIAN
 	select ARM_APPENDED_DTB # Old Redboot bootloaders deployed
 	select CPU_XSCALE
 	select GPIO_IXP4XX
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index ac09b546b14e..a1716db26623 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -796,38 +796,32 @@ choice
=20
 config CPU_LITTLE_ENDIAN
 	bool "Built little-endian kernel"
+	depends on !ARCH_IXP4XX
 	help
 	  Say Y if you plan on running a kernel in little-endian mode.
 	  This is the default and is used in practically all modern user
 	  space builds.
=20
-config CPU_BIG_ENDIAN
-	bool "Build big-endian kernel (DEPRECATED)"
-	depends on ARCH_MULTI_V5 || BROKEN
-	depends on !LD_IS_LLD
-	help
-	  Say Y if you plan on running a kernel in big-endian mode.
-	  This works on many machines using ARMv6 or newer processors
-	  but requires big-endian user space.
-
-	  The only ARMv5 platform with big-endian support is
-	  Intel IXP4xx.
-
-endchoice
-
 config CPU_ENDIAN_BE8
-	bool
-	depends on CPU_BIG_ENDIAN
-	default CPU_V6 || CPU_V6K || CPU_V7 || CPU_V7M
+	bool "Build big-endian kernel (DEPRECATED)"
+	depends on BROKEN
+	depends on ARCH_MULTI_V6 || ARCH_MULTI_V7
+	select CPU_BIG_ENDIAN
 	help
 	  Support for the BE-8 (big-endian) mode on ARMv6 and ARMv7 processors.
=20
+	  This is deprecated and will likely be removed in the future.
+
 config CPU_ENDIAN_BE32
-	bool
-	depends on CPU_BIG_ENDIAN
-	default !CPU_ENDIAN_BE8
+	bool "Build big-endian kernel"
+	depends on ARCH_IXP4XX
+	select CPU_BIG_ENDIAN
 	help
 	  Support for the BE-32 (big-endian) mode on pre-ARMv6 processors.
+endchoice
+
+config CPU_BIG_ENDIAN
+	bool
=20
 config CPU_HIGH_VECTOR
 	depends on !MMU && CPU_CP15 && !CPU_ARM740T
