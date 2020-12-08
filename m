Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAECC433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:10:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5D11623B16; Tue,  8 Dec 2020 23:10:40 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
To: Heiko Stuebner <heiko@sntech.de>,
	arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 5.11
Date: Wed,  9 Dec 2020 00:09:43 +0100
Message-Id: <160746884873.2839681.1674742367162235185.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <4278011.LvFx2qVVIh@phil>
References: <4278011.LvFx2qVVIh@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 06 Dec 2020 19:30:06 +0100, Heiko Stuebner wrote:
> please find below and in the following pull-requests Rockchip-changes
> aimed at 5.11
> Please pull!
> 
> Thanks
> Heiko
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 261078ab9002d0b5aff807b374425ef8120a84f4

       Arnd
