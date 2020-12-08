Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE34CC4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:10:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7B70523AFB; Tue,  8 Dec 2020 23:10:06 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] ARM: at91: DT for 5.11
Date: Wed,  9 Dec 2020 00:09:34 +0100
Message-Id: <160746884391.2839681.15347071935799467817.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127220403.GA1735041@piout.net>
References: <20201127220403.GA1735041@piout.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 27 Nov 2020 23:04:03 +0100, Alexandre Belloni wrote:
> Arnd, Olof,
> 
> Here are the DT changes for 5.11 which contains non urgent fixes.
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 8caaf0610fb9948b1f3ad220f83fccfc24e33333

       Arnd
