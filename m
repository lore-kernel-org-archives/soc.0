Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39870C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 16:08:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 15ADA23AC8; Tue,  8 Dec 2020 16:08:55 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Joel Stanley <joel@jms.id.au>,
	SoC Team <soc@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-aspeed <linux-aspeed@lists.ozlabs.org>
Subject: Re: [GIT PULL] ARM: aspeed: actually the soc changes for 5.11
Date: Tue,  8 Dec 2020 17:08:41 +0100
Message-Id: <160675365667.2641537.14525389407250717385.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CACPK8Xe=9ezhyWRMqVOEQr7SU1YoYfVBGGdGzjmE4SiBr--vJQ@mail.gmail.com>
References: <CACPK8Xe=9ezhyWRMqVOEQr7SU1YoYfVBGGdGzjmE4SiBr--vJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 06:41:35 +0000, Joel Stanley wrote:
> Here are some ASPEED SoC changes for the v5.11 merge window.
> 
> These are mostly the 5.10 changes without the XDMA driver, which I
> didn't get a response on my question about where we wanted that to
> live[1]
> 
> https://lore.kernel.org/linux-arm-kernel/CACPK8XcLOopkx0k14k25puD3YkwHzZS0+3TLcEL43xbxCZBphA@mail.gmail.com/
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 00c543f6f3f46ce02e300d76e22bb21a8a75e872

       Arnd
