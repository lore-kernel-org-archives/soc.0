Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629E1C433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:16:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 45489610E5; Thu,  1 Apr 2021 20:16:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0315610D0;
	Thu,  1 Apr 2021 20:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617308165;
	bh=jPNGUCNbVcKITJwrKf1PZUGFtBFu7AyQnlQFiQYd9RA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OxcexJ4Epc6tStF3C743sU3DdK0PW8I2qXOTWjjz++zd2V1xCzI53JNPGQmcF5AjI
	 +kqX5Oz8ihsXWe0LBJVdeSVntbtaa2RMUIpoQCE9uAmIQFqzbvpIKFpOQJaktDzrVS
	 pw6kqylx4oORyObFGPrjjML0Et3VfCp5bZagdk/iw6f+WjzXnkXEAtQY1n/vAPW+G9
	 PEWCUHkQg9mwsQndlPX05coMMP6m+BLwIZy/mfJDpmLEM6Ex++lcAMCe8LcdghOetY
	 XKuS/G5Ymwr67QHy1s5QD6+o+XOR2R4qMmGF2c4KGLIl7XhxiASOTP0+aKhy4EjZmD
	 C/6SXBucKjtCA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree fixes for v5.12-rc6
Date: Thu,  1 Apr 2021 22:15:29 +0200
Message-Id: <161730808690.655497.9362657785877242094.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210401172622.3352990-5-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com> <20210401172622.3352990-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 19:26:22 +0200, Thierry Reding wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-arm64-dt
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 520f30feb864e9baaf7bed677892b478ffd10232

       Arnd
