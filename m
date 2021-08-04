Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016F4C4320A
	for <soc@archiver.kernel.org>; Wed,  4 Aug 2021 13:56:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D7A3D60F58; Wed,  4 Aug 2021 13:56:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81EF4601FD;
	Wed,  4 Aug 2021 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628085395;
	bh=L4VivQRgk2G9nlLJGjT1/uuw/ylsF+lfuINmJiLSFc8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GtbYGEwTGw4udsWH7ZzA4Tw64wPGXlKSPsgDUtVdzIBsFRQcjE/nZDeXRPczpXh0z
	 40ogSCFoTm3TQcmQCybhX9TkdwvvwDNZCQDyndGOJkL0FLz3hj2goHLUNPMBY+RqC/
	 z3vjOj83rbLuIoeS7P/D97YgcwHxau0UBew87FPcRMHB91y/zOZ/xwOYfk+CivgEYl
	 iX0Qg9m8dBUXTvXN02kvek8Mv5bwPOSmitYczrG7wmViiyAGGoxnWXIVlgXvmvdglR
	 0WyrR24k+PaXaISyRmzSQLTCzKKJqp7FTUud7M8Lu9CE0fmPLdcx9C9VP9wPe40d5H
	 AykQchraA8dxQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [GIT PULL] Fixes for omaps for v5.14-rc series
Date: Wed,  4 Aug 2021 15:56:31 +0200
Message-Id: <162808537404.328794.8883222389640665372.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1627995895-406133@atomide.com>
References: <pull-1627995895-406133@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 3 Aug 2021 16:05:29 +0300, Tony Lindgren wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/fixes-rc5-signed
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 19c1eb3605a1bcd784726380f520925948b2962e

       Arnd
