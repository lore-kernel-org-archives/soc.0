Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FFFC4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:42:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D24B323AC4; Tue,  8 Dec 2020 23:42:45 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [GIT PULL] Allwinner Fixes for 5.10, Take 3
Date: Wed,  9 Dec 2020 00:42:40 +0100
Message-Id: <160747095310.4097848.5073060870110923550.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <2a351c9c-470f-4c5e-ba37-80065ae0586d.lettre@localhost>
References: <2a351c9c-470f-4c5e-ba37-80065ae0586d.lettre@localhost>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 8 Dec 2020 17:23:32 +0100, Maxime Ripard wrote:
> Please pull the following changes for the current release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit a7361b9c4615951f52ffd2b1afa09a1384c7b4e4:
> 
>   ARM: dts: sun7i: pcduino3-nano: enable RGMII RX/TX delay on PHY (2020-11-24 15:24:28 +0100)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: d23e6297176453a247b83b3a476e33d75bf2968a

       Arnd
