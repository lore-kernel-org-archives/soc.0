Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC08AC6377B
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:25:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C109E613EB; Fri, 16 Jul 2021 21:25:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0528D613C0;
	Fri, 16 Jul 2021 21:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470731;
	bh=7P6DG6IhbonGWOaKpCz9+F5N3WELCWbes97+P9fqz10=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jvg+Ngn5KgoBWwozV10RLrckF5pSN+DGhvvu9eiQt0S//+LgNBFygho1RFlJxhuQB
	 TcFwW5SPzibQ8LIuiVE2l16OlG8QOQcXhqrNNQut++6OBnSiR5v1I4D0Xtj51PgBbe
	 D+KrkO/b9XY0t5BeRKNeXuO/n4+DFVoVdsHoBfFxcEeixbYk9k8o1gEgKT3ij97oYs
	 GQOC/GnfVxCv+23fA0kB4LA65+XyQsGWdPLEWO9ApbQcf9vSd9rurzQ5bQXx9SXGHA
	 1q6+AASvu54Zu//6Di67mLeyFN/ztmEav5lX2Y/l+Jb8wJ3i/WgQktMM7j4qBBgY52
	 IbcFNvzuWaREQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v5.14-rc1
Date: Fri, 16 Jul 2021 23:24:55 +0200
Message-Id: <162647049909.3478428.7523344403761685908.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210709150220.2543875-1-thierry.reding@gmail.com>
References: <20210709150220.2543875-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Jul 2021 17:02:20 +0200, Thierry Reding wrote:
> The following changes since commit c7289b1c8a4e10bbbdb7097a71a90652beb767a1:
> 
>   arm64: tegra: Enable SMMU support on Tegra194 (2021-06-11 13:33:46 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-arm64-dt-fixes
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 93346fb3f669507ba40a8876d1a349557fd0bcf1

       Arnd
