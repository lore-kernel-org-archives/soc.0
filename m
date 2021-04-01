Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405ACC433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 21:07:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1EECD61106; Thu,  1 Apr 2021 21:07:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC5DA6112F;
	Thu,  1 Apr 2021 21:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617311237;
	bh=3oStrjzAvVbQa0S1FwZRjUrmDCAHpXIE1z/QYbHDtOw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q/81vyuzAp1HBF45rRIeQlHbO9Zz94x5zr9IvXtD1uCffpIiFbALWvmQ30MQxZg7G
	 nANGZ20jcv6h3XmC1JSWHHwzybVyIOgRL5dixRckSz5cpZRggIrsMr0V/bPkoCR9Lm
	 GKcY6UY4UVoxk2ffnCqmsld3s/I6x2xxz2hjLqrCvN0NoLI+E/bOxVIuSe4m73Tr6v
	 1lw6vyxlWYVef406Jq14IFFFqiuDXIQ4X6zjOXgD9UN9qbsK6Qtb5gdtsaJOx5oYul
	 7yOEitcCangyJvVHEEGi0+rZqfscxZ6MK980NlLGCFYAxPFo+nGGJWYmjF2AmF7T5e
	 A+ovDIRfwXiNQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [GIT PULL 3/3] Drop legacy data for dra7 and omap4/5 and clean-up
Date: Thu,  1 Apr 2021 23:07:06 +0200
Message-Id: <161731121857.663132.4089815992350147845.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1617004205-537424@atomide.com-3>
References: <pull-1617004205-537424@atomide.com> <pull-1617004205-537424@atomide.com-3>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 29 Mar 2021 10:55:22 +0300, Tony Lindgren wrote:
> The following changes since commit 083516ad540a1104a0ae5ae7e83f2a2d8e39d2bc:
> 
>   Merge tags 'genpd-dts-dra7', 'genpd-dts-omap4' and 'genpd-dts-omap5' into omap-for-v5.13/dts-genpd (2021-03-10 14:16:34 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/genpd-cleanup-signed
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 3e26eccd40f9d4ff43fbd05edaccb96abfab04e8

       Arnd
