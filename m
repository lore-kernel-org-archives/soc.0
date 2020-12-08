Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D642EC433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:32:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AD34C23AAC; Tue,  8 Dec 2020 23:32:32 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [GIT PULL] Reset controller changes for v5.11
Date: Wed,  9 Dec 2020 00:31:41 +0100
Message-Id: <160747024216.3766805.9460404683899134020.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <d586ada0073f2ac50a02274f42bf07bfb0603835.camel@pengutronix.de>
References: <d586ada0073f2ac50a02274f42bf07bfb0603835.camel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 04 Dec 2020 15:25:02 +0100, Philipp Zabel wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.pengutronix.de/pza/linux tags/reset-for-v5.11
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 03c48a830e9d256be34f15f782f9877d0d9a9c2f

       Arnd
