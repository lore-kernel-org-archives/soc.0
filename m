Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0132FC433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:34:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B8E8864E0C; Sat, 30 Jan 2021 11:34:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B59B64DE7;
	Sat, 30 Jan 2021 11:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006462;
	bh=Bso/4fJToGtAt2kHxrbQGJO9hmxtdFSmmqvFwHPj8wU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=snO1dLtv7dI4cuRf+qKgdPVwHeyGQ4QpSkGJC+3BeAPHwzTzwsQURrhyFixtr4PJI
	 SQ+k85eNVIWfvW4k6LFcQ/AOw8xEy33rwOg8RXPl9SccfKnKxRCZRH3MA0XR47wGCh
	 0/rXxx4fLACu55t+8NdAzL2SpIR+YUZEgJw06sTRxcqqZG7zTpQ6InZ+TB488HKuYW
	 guyzE4H1eZLbSGHbKpeU5JiQmyukTHdM7pcvnhk0IWz88ws+QcTwkoJ61JBzxhMa21
	 aF5mrjXiUpXSphY6ftHNowlIVNHLLN2SFU0X6MTtJOYyy5f5Dz8wrytmaDwNxA/hbv
	 w8mnzW1Vj8a0A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	arm-soc <soc@kernel.org>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL 1/2] Renesas ARM DT updates for v5.12 (take two)
Date: Sat, 30 Jan 2021 12:34:09 +0100
Message-Id: <161200641665.2316427.877722063324058010.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129090815.2552425-2-geert+renesas@glider.be>
References: <20210129090815.2552425-1-geert+renesas@glider.be> <20210129090815.2552425-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 10:08:14 +0100, Geert Uytterhoeven wrote:
> The following changes since commit 1f4449e12c5c6682a6f4f8dbc7288c19c1c844f1:
> 
>   arm64: dts: renesas: r8a779a0: Add SYS-DMAC nodes (2021-01-14 12:13:00 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.12-tag2
> 
> [...]

Merged into arm/dt, thanks!

merge commit: af91156490c2eee7da65e75c10e2457beb9145d8

       Arnd
