Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22914C4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 16:35:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EF20223B04; Tue,  8 Dec 2020 16:35:28 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Allwinner arm Defconfig Changes for 5.11
Date: Tue,  8 Dec 2020 17:34:53 +0100
Message-Id: <160744514011.359082.5475905621967584578.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <dffb8a7e-27ea-4025-868a-caa5868eb1ef.lettre@localhost>
References: <dffb8a7e-27ea-4025-868a-caa5868eb1ef.lettre@localhost>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 28 Nov 2020 12:23:20 +0100, Maxime Ripard wrote:
> Please pull the following changes for the next release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 11de454b4cac7ac92e93d3e3853c7ab8ad00a2c9

       Arnd
