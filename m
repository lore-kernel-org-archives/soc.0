Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F123C4338F
	for <soc@archiver.kernel.org>; Thu, 19 Aug 2021 15:45:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EEA5260FE6; Thu, 19 Aug 2021 15:45:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E73660EE4;
	Thu, 19 Aug 2021 15:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629387905;
	bh=mVerFQzwJGqAny4J4xXZEF+C+JcvILCRfHvCGAoXIPQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QbZC7L5On0xIrRC/JwILPKwgK0AfI7RsGQ2gftRTm7DOKFWoOyDzVMD6Wq9OZDiGp
	 k9ipexDije329sBg6Bx9mJPq3Qmzz7CP3KYGGZboz0FCHrda0qxAkBP/5WAPxy9rnp
	 wSHA5GGaGt3+ldUI3JY9FIUTWVIMx5f1f2itfqVpyvpOCBtouojdqBxmUro7kNdnRr
	 Gmj8oNGCvAnTR/xy6p2XoEn0orJkT5gZGIe+gHtA5Cls7MFrWz2j1+dHPUtLTe/tyj
	 uelb0qmSCCb7Y0kK98p++AjndzpL9s+I2CXxgmQFiznZeEMWQhrXUqk8d0tnA8vzzB
	 fgcvUXqINtN5Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [GIT PULL] Fix for omap gpt12 timer error handling
Date: Thu, 19 Aug 2021 17:44:55 +0200
Message-Id: <162938787885.467628.7575175058025149397.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1629354796-830948@atomide.com>
References: <pull-1629354796-830948@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 19 Aug 2021 09:34:36 +0300, Tony Lindgren wrote:
> The following changes since commit 353b7a55dcaf5fb8758e09ebe2ddf5f3adbac7c5:
> 
>   Merge branch 'fixes-v5.14' into fixes (2021-07-27 11:25:08 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/gpt12-fix-signed
> 
> [...]

Merged into for-next, thanks!

merge commit: 1e16a40211208d2d6e217e5013607219f4272dff

       Arnd
