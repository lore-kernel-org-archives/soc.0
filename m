Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07238C432BE
	for <soc@archiver.kernel.org>; Thu, 26 Aug 2021 09:46:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BCEAB610CB; Thu, 26 Aug 2021 09:46:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2717360F44;
	Thu, 26 Aug 2021 09:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629971212;
	bh=UxrM0x4j8G0mI+Ow0VfTZTJDPmtZUpaAU+MPTSxQzfM=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=WbIzb9SmlHK6nBhcq3lt39+X5IkxAmkplDE6T9j/+9V6wCMLApzcAbQHW+gk/gtEy
	 BoYHGggblkqolDo5CSpzRWDOdwArqzsxv7xJdhkgJ+XMVCAAxZ9M4vrzb6NHKlh4s/
	 pagjui2iDzvKogbY9dMKOjvQHg2GglgAPvIdqMcxvleLLVx85dRdEIb/iILhrwQc1o
	 u6tj/JvlzthvQGCC2MXty5slnwF5cuccY20iGWdyUD3WDjma7MO6TmmfBBCiX3uXeF
	 AhVSE1wERMq6DzcwpwoikS+pGQ7xLqw4GfCzuymudmrlmMGu0jQWtxAr6bRn6jtIRf
	 1md/1XzAZ0QVQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>,
	arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	soc@kernel.org
Subject: Re: [GIT PULL] Rockchip dts32 changes for 5.15
Date: Thu, 26 Aug 2021 11:46:47 +0200
Message-Id: <162997120229.839533.16666800980996064954.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <4142796.VLH7GnMWUR@phil>
References: <4142796.VLH7GnMWUR@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 22 Aug 2021 12:17:36 +0200, Heiko Stuebner wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.15-rockchip-dts32-1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: bb4544c6d415d42018ecd67826c0ac714bf86b7d

       Arnd
