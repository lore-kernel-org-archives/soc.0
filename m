Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F935C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 16:35:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EA11423AC8; Tue,  8 Dec 2020 16:35:02 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.11
Date: Tue,  8 Dec 2020 17:34:45 +0100
Message-Id: <160744513987.359082.6744128367341808542.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127215517.GA1733715@piout.net>
References: <20201127215517.GA1733715@piout.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 27 Nov 2020 22:55:17 +0100, Alexandre Belloni wrote:
> Arnd, Olof,
> 
> Two patches limiting the number of compiled media drivers.
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: d4ff08d6e2227086a4946c3f557aa06ce3b67208

       Arnd
