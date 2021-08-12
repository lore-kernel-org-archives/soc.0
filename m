Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E62AC4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:06:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4D42261038; Thu, 12 Aug 2021 21:06:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBBC560C3E;
	Thu, 12 Aug 2021 21:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628802372;
	bh=fwBESCjZKo9gM25CESYUCaJhTCD+k9Slg/Pf7zTvUhY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hJqt22lrM4yV+oq97hYEyAr0m55/Uq6sHXpJmTMaYqxsVl2pSxUlPimNPMWtoSH7Y
	 785OOGErTQmzutOEeO+Bz85hXjb+VVRv4Ej9KfCBA65sK6BYaDJMgDq1dFWNWb9TnP
	 2Mez8GwCB2mzWcbWKLelpwImSRxdkSDAtrzgxTX+XOGDI3pn7YaOS4cU6wHE+m153c
	 JWXy+KrGh7zYtXPSBLVeV+SJld1CYgXY/S+sL7IHoPl6zzY5mCCHmGnr1PT8rvH58I
	 AOazBZhQ4yxOo/jeXlqkyL45zX7VNhwMwidpqFIpGyxPlYVtAAncqs/HGbYYVAD2vJ
	 bWFkPYdnq1i9Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org
Subject: Re: [GIT PULL 3/3] Devicetree changes for omaps for v5.15
Date: Thu, 12 Aug 2021 23:05:46 +0200
Message-Id: <162880206094.1376011.11267731078560363684.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1628153040-834155@atomide.com-3>
References: <pull-1628153040-834155@atomide.com> <pull-1628153040-834155@atomide.com-3>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 5 Aug 2021 11:46:44 +0300, Tony Lindgren wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/dt-signed
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 1c7ba565e70365763ea780666a3eee679344b962

       Arnd
