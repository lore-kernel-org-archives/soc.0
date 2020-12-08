Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEAEC433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:10:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EBFB123B04; Tue,  8 Dec 2020 23:10:50 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 2/2] ARM: dts: samsung: Third pull for v5.11
Date: Wed,  9 Dec 2020 00:09:47 +0100
Message-Id: <160746884925.2839681.8240367369624280190.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201207074528.4475-2-krzk@kernel.org>
References: <20201207074528.4475-1-krzk@kernel.org> <20201207074528.4475-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 7 Dec 2020 08:45:28 +0100, Krzysztof Kozlowski wrote:
> On top of previous pull request.
> 
> I think the 2nd pull was not merged so it's message is here:
> 
> Samsung DTS ARM changes for v5.11, part two
> 
> 1. Add devicetree of Samsung Galaxy Note 10.1 tablets
>    (GT-N8010/GT-N8013), called P4 Note.  These are quite old but
>    still functional devices, based on Exynos4412.
> 2. Minor cleanups in Odroid XU3 Ethernet.
> 3. Minor fixes: ADC io-channel-ranges and P4 Note touchscreen GPIO
>    polarity.
> 
> [...]

Merged into arm/dt, thanks!

merge commit: b4e217d0b3204010782f2d9a176cb04e66bdbf0c

       Arnd
