Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0EEC433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:34:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4682064E0F; Sat, 30 Jan 2021 11:34:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD22664E04;
	Sat, 30 Jan 2021 11:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006468;
	bh=d8GcrjGDLIwrGWLphhWZs9SU7wZ1m4dEn+3+Vn4+5yo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OvXEvTuMyhIWSg2gB8+xRttkph8DEHfL0nz4jm0E3SwDKczLvw2TIqTdOQKGR1C8D
	 VR4qTrrnPDPIHVTcDMbPcmO8dTINF3m1LfQTwgnUjd+YGvzvRZK14wuQcOgD4Ex0Y0
	 UQhpJuVZ9dkZtI4KIId/nNEyADOoMFtYNdy4Qv9PVeCvbDBoAtkwuqzcnBduyKcqL1
	 mZc835QGLLlKqbLMYQr1IQfDr74RfPj+n/GBnjqljxLerFIodGLoVS9T6sZKmbMqSz
	 XZRw9pYRIGU5sq1v19rWvjRfFtIENKlfrVYkIp0qh5JryN4I1FbpBVHcQM71rggopm
	 1eo60qRV3+3Uw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [GIT PULL 3/6] ARM: tegra: Device tree changes for v5.12-rc1
Date: Sat, 30 Jan 2021 12:34:12 +0100
Message-Id: <161200641711.2316427.8570821957670465504.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129193254.3610492-3-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com> <20210129193254.3610492-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 20:32:51 +0100, Thierry Reding wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm-dt
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 7b76b46d07e0eb754e9517717227595637dc4a46

       Arnd
