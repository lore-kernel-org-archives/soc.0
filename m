Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFF2C433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 10:23:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6C556610CD; Thu,  1 Apr 2021 10:23:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DC216108B;
	Thu,  1 Apr 2021 10:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617272627;
	bh=p8DxaNEWZ0HLWX0VW1k5/nLGYEiaqjcI2GjQOj2jHiU=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=KQSxOJ6ksESDHqBoem712XvTkbELNFErHev103V8KjfBUt9wKT55g49CsCnRie8Zu
	 K8P9AEkdflfnGvKUBXPdSqSvdu+qNnE8VgAyEJSdGYrhpretY8FtBR5mCvZ/lyEolt
	 iheBNFlaEUH5DeM+ibm1O1Dr+PpU2AiOH3nB66IAtPJADym3UGH2Qvg6jW3R4wBQYl
	 6Tl0k5c3yHwvu153cU4DI3OApAQgmxoKMaIBx7AFXp9rMBKnMz3DeqRryxWO4q76g9
	 P7IBY54AQbgJK3OAjA8z6N6Vw/x8WG9fr7om0v7yWXlXUGi2fmLtmXxf6qo264cyhR
	 slG2siYABu8Yw==
From: Arnd Bergmann <arnd@kernel.org>
To: Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Arnd Bergmann <arnd@kernel.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@kernel.org
Subject: Re: [PATCH] ARM: pxa: mainstone: avoid -Woverride-init warning
Date: Thu,  1 Apr 2021 12:23:29 +0200
Message-Id: <161727243811.583633.1536328285829233051.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323130849.2362001-1-arnd@kernel.org>
References: <20210323130849.2362001-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 23 Mar 2021 14:08:27 +0100, Arnd Bergmann wrote:
> The default initializer at the start of the array causes a warning
> when building with W=1:
> 
> In file included from arch/arm/mach-pxa/mainstone.c:47:
> arch/arm/mach-pxa/mainstone.h:124:33: error: initialized field overwritten [-Werror=override-init]
>   124 | #define MAINSTONE_IRQ(x)        (MAINSTONE_NR_IRQS + (x))
>       |                                 ^
> arch/arm/mach-pxa/mainstone.h:133:33: note: in expansion of macro 'MAINSTONE_IRQ'
>   133 | #define MAINSTONE_S0_CD_IRQ     MAINSTONE_IRQ(9)
>       |                                 ^~~~~~~~~~~~~
> arch/arm/mach-pxa/mainstone.c:506:15: note: in expansion of macro 'MAINSTONE_S0_CD_IRQ'
>   506 |         [5] = MAINSTONE_S0_CD_IRQ,
>       |               ^~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to arm/fixes.

[1/1] ARM: pxa: mainstone: avoid -Woverride-init warning
      commit: b08f9cc97c8e1be0f06fc6e5d467ed389a4161ff

       Arnd
