Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE993C433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:06:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CA14F64E50; Tue,  9 Feb 2021 23:06:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CA5B64E56;
	Tue,  9 Feb 2021 23:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612911993;
	bh=oZZ/3UxFQ8eAo5gQbDUvtCgPkYXeyOoBm/fjUqRiJFw=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ikqn5Yms2cuCO2WSEdg+vBC7j3DY4+1SnZcz0BQ/faU4fclY7Yros8Vw94G1/JzFe
	 oN/kHlxMvoZg08xIeTvJTRmqUo+a+DKpo44WOODyIzw/oa+LwN04uHQCimhPftxna5
	 EE+bP8NR/lBVTMLmz4gfKI0l21Zquge4jUkl1cBCbpNrVBS92XLWiQ4pyKHkenjivE
	 oBay96xDQoY4HwL6uGfULNHWn14wAEAmHduULAVuS42IwTR9w+od9z4oDny7f/ZkMn
	 57zz/WXnUXfbnD5FZOajp3JBGRl0P+L3fCFyw9m3gE8I3kIlcGc2rHB+acNQco6gGp
	 wcdXsYoZdVfAQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>,
	arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	soc@kernel.org
Subject: Re: [GIT PULL] Rockchip dts32 changes for 5.12
Date: Wed, 10 Feb 2021 00:06:07 +0100
Message-Id: <161291108112.974605.6402867046741602030.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <2184150.ElGaqSPkdT@phil>
References: <2184150.ElGaqSPkdT@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 06 Feb 2021 01:02:39 +0100, Heiko Stuebner wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.12-rockchip-dts32-1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 243d3de3bd40379bbc63523f3e5638a1ad850345

       Arnd
