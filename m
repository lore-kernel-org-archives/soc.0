Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5D5C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 16:08:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 29CF123AC8; Tue,  8 Dec 2020 16:08:50 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [GIT PULL] ARM: at91: Drivers for 5.11 (bis)
Date: Tue,  8 Dec 2020 17:08:39 +0100
Message-Id: <160675365603.2641537.15905485355591975594.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127214140.GA1688544@piout.net>
References: <20201127214140.GA1688544@piout.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 27 Nov 2020 22:41:40 +0100, Alexandre Belloni wrote:
> Arnd, Olof,
> 
> As discussed with Arnd, here are two cleanup patches for at91_cf. My end
> goal is to get rid of include/linux/platform_data/atmel.h.
> Also a very small patch adding SoC IDs for the sam9x60 SiPs.
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: c6241fd5de13f561ad147173f93f70a5f7058690

       Arnd
