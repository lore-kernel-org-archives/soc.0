Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1CEC433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:16:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4EB22610CB; Thu,  1 Apr 2021 20:16:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE6D9610D1;
	Thu,  1 Apr 2021 20:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617308163;
	bh=mhCU1T8JgDN9u6ta7ZW4fCGuy6eAATlLzv7vMIfsVYs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gXT6XL6QTLbRZR6CMzTy1KJIMOgfVGEVLZg2zdTwtNPKYLqBGpLYA2wld/UVSSN2J
	 Wqq7wGYoDoiLOyaNRPsNdTgf7j4ZXFCYiTakbUgU8yOaZnyY8zfK/h5UBoc5nQRPJz
	 gJ25PAVQiVttfswIXv1jfCfovZdY+Yo69V9avEwQTgM6tlO9UkhHYk24K6r3LSjSwE
	 RW6PoYs+FO/8Ec2rDrmWBDODLgPJeeDTPIw6v9b39lWmbQ9beEyxVodpmlkBMAlYM3
	 k/07YZTjrtEJg56CYx8DZ96AVMkwPSPeRjAX/yZKtwp7LSewVk41lnPjs/IpaqFe9X
	 rl+umC3L1y4Ow==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL 4/5] ARM: tegra: Device tree changes for v5.13-rc1
Date: Thu,  1 Apr 2021 22:15:28 +0200
Message-Id: <161730808681.655497.5868198720723763066.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210401172622.3352990-4-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com> <20210401172622.3352990-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 19:26:21 +0200, Thierry Reding wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-arm-dt
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 815bacb522c5d5e833dad5be349c80de9afdf1df

       Arnd
