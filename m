Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5995C433E6
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:34:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C190064E0B; Sat, 30 Jan 2021 11:34:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1292264E0E;
	Sat, 30 Jan 2021 11:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006464;
	bh=1n/bsZ0nwrIUoWoKyKy3t+PDsVBV7kD5L24bjqHDG7I=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gLyw3neyn4KQLhn3PoEI1fjBxsKJsxKQolyo4v5MVMqJalKBbwvOR9OY15YwB5Mpk
	 AIS0rHpF1MBPiLSTppA0wT0V6E2hDXvZHSnSQzscSnYlEtnVCaz+jl4CKmAiB4oFjr
	 jHEESwFTZs8rQkvcIylGMguYgEsXqakTIbLLmYzg/fddJUyVkcV06S3hk4S4wpLQU5
	 EKGgg9QDjRtcjVWgUpXcAQLFPzkD0CkzoZjtTCQ/yNnEpeppdMDkP2MlmRI2E4ddKM
	 bG40lGOsIrOQx24xEk07I0F9wcjYa8gWsOUfpicD3dZBeCcL8eEetYkhaWjhsAcKj+
	 VdMFVFF195VRQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 3/3] arm64: dts: samsung: DTS for v5.12
Date: Sat, 30 Jan 2021 12:34:10 +0100
Message-Id: <161200641635.2316427.1280617565306145416.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125191240.11278-4-krzk@kernel.org>
References: <20210125191240.11278-1-krzk@kernel.org> <20210125191240.11278-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 25 Jan 2021 20:12:40 +0100, Krzysztof Kozlowski wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.12
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 1f99bd1a51b836bc60482370d89bd16a564d28c2

       Arnd
