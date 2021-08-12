Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0CFC4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:05:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AA0E660F35; Thu, 12 Aug 2021 21:05:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2816460ED5;
	Thu, 12 Aug 2021 21:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628802357;
	bh=ZwyYkfusAoiXRC5lVO99zRtbkt4u3eFlcmYoxtjQlT0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GLYMCgw1IN+Ft66Ql8uQ6UqdR/bNslKCRfCGR/CWbm0W9wPxQlB+iocoQvtq9GwA6
	 PXEoHKcQ/MBhhpIui8HIOoJLmrIpkoswrgLXtn3z4GxcPkdwsCwOcw8iB6GA/lHt3y
	 qtq1WE2jowC3TyHnrPQSF3Tyc1pnbziqOyNhGkSt0Uz1s5AlpMPiD8JNIpzNKY/RwY
	 ukhhv9Nng0caT1opYKP7pAkH/tOrsFyJ/R/n+YmXh218YGGw04cAC2jEMJRx6838sH
	 5kyNvN07bxyBfTEmx29aHCS0OU9aZJp23Tk77EzK2Zj8ufXw3ZQODC+lYX/mGjNIcu
	 18LaFieOEhCQQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	arm-soc <arm@kernel.org>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [GIT PULL] IXP4xx DTS updates for v5.15
Date: Thu, 12 Aug 2021 23:05:38 +0200
Message-Id: <162880206121.1376011.11565462796731927482.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACRpkdY19AvWT--OcmEKbwFue_EcThVs7uZeHkzORten7xj-RA@mail.gmail.com>
References: <CACRpkdY19AvWT--OcmEKbwFue_EcThVs7uZeHkzORten7xj-RA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 Aug 2021 02:15:57 +0200, Linus Walleij wrote:
> this is the big DTS update for IXP4xx for kernel v5.15.
> 
> There is still some two device trees that need some more work
> and some of these may need some additional hammering before
> they are perfect(TM) but the basic functionality for all these systems
> should be there and we can proceed to delete some boardfiles
> as soon as we have successful boots on them all or we get tired of
> waiting for someone to test them.
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 34827ffe3502285ce9f588e7427089aff46df790

       Arnd
