Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C081C4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 21:21:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3EC8B60232; Mon, 16 Aug 2021 21:21:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3ED660F5C;
	Mon, 16 Aug 2021 21:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629148870;
	bh=MVhs7hiwPdDtFcUQZRD8fkkOdFDOTlOTBzwc30qz4/w=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J/GVqsPFsk/4MPWj9cn07aqAmzjufvbnotRiyp/A9a2fGf1/90SnM1QXFUpcrhlqc
	 v6Z9YFjnYu4L0HgJ0gtn2XiXAk/p2T0HKeQukhBvgFOJbQRHD3VAmCSApir0qKgrbV
	 pV3nCDx496LU5/fjmkbVvAtGcavo+9Zj+QLQw+5Jfy+KymFi1vxHH2O7Xp3wZO9gHl
	 efj6Vco7iF7h+5RpbilbZtnYixhe602zzCekV84GIDj/IyDlXjSmldUxM+Dk+r2qX6
	 2MAUaJgjcpBbOEiHr9KCepbxBwcclwq9k/gVucT9HtyRTXDV+fP611F/oc6YJER0EY
	 K2oMItXNfDyhg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL 6/6] arm64: tegra: Device tree changes for v5.15-rc1
Date: Mon, 16 Aug 2021 23:20:54 +0200
Message-Id: <162914852256.237905.7021775229797910596.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210813162157.2820913-6-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com> <20210813162157.2820913-6-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 18:21:57 +0200, Thierry Reding wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-arm64-dt
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 1de48932389887f83f0f560c741dd57cc69a40b2

       Arnd
