Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557B0C433EF
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 22:12:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 33B8560F92; Mon, 11 Oct 2021 22:12:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A75A061074;
	Mon, 11 Oct 2021 22:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633990333;
	bh=hHn5DDSjq8SpP4KOM+zZtj1bwdwzFAEpyBRm3GVitr4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=doeBgO4AUT77FTMsIrb35CRcDeLoaavwzEiXVewL8dYLLZmN8ySSRiHsvQi+6yDyh
	 d+BIBcHGUMM3Q4tPVvRVyY8Hpr9yiuzfIY/IZ9zvqqy62N0pOcHFSjlYTt9zH0ck6F
	 o+fr/ubzW69Uv+p+bMJbl2pB+ir47lnDQ50nwu/hTUGA6TWEHD4qCy9DtcIghN6ebC
	 Mov3n8Jtu/o/eARdLYuqWUnhsOpg6kZ15R0P6RgFlOa64sE2r/16mS0oD6htC1lYWt
	 KTKqPQFYl2+6jnC9gpFxn6ZDuNd01LvUSVAFB0qRa4IndTFfM0sWOcJrYAGLPsJZsk
	 mLkpgp8eca26g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 6/7] arm64: tegra: Device tree changes for v5.16-rc1
Date: Tue, 12 Oct 2021 00:11:47 +0200
Message-Id: <163399027739.3049179.11971461150420845165.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211008201132.1678814-7-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com> <20211008201132.1678814-7-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Oct 2021 22:11:31 +0200, Thierry Reding wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-arm64-dt
> 
> [...]

Merged into arm/dt, thanks!

merge commit: d1edc9865caca19cd0fecc4fda4f90962b4f03c3

       Arnd
