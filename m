Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B09CC4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:10:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1C35523B19; Tue,  8 Dec 2020 23:10:38 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
To: Heiko Stuebner <heiko@sntech.de>,
	arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts32 changes for 5.11
Date: Wed,  9 Dec 2020 00:09:42 +0100
Message-Id: <160746884899.2839681.5301061292660173695.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <4582475.GXAFRqVoOG@phil>
References: <4582475.GXAFRqVoOG@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 06 Dec 2020 19:31:42 +0100, Heiko Stuebner wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.11-rockchip-dts32-1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 456983022454b2ea5db8de3129c327dba4bf1108

       Arnd
