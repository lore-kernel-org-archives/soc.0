Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BACC433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:31:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3AA5364E10; Sat, 30 Jan 2021 11:31:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA00764E0C;
	Sat, 30 Jan 2021 11:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006266;
	bh=E4s8bdfLA97x5d7eBVfzxaXWoW6vvMAOYmnLPFUd7YA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H2ZNRXLhDf9NQa7aR26oWuiOPSiwIjDPWsWnkQLHImJTVVaKFjkZSockPPQ1/HI/7
	 h/gIw4WZ1/Skxo/TtrGuuMUrUavx9UV2CX9rMc61E6YUqjr1/SgX+J4NAh1q82iuG9
	 fjf6HLtVsAkXigZmS4eqr79wKF7z/Zbw+2AOp9eJXwh0YuzUiuEKeg2E55qSlyjS3y
	 5CvDq0JyritBSvkRMpZNRGxn6nFVsGPeD1zgjB6wrL2nY3iXbimKvpeSrXwOkjLk5o
	 /3oNrA1cR7HynJ/A7x7icWCtOz58FUWQ5FDXCiqGDGjdyvY/JgahEsIrjfzZW20P1c
	 E7ImnoKPNXvew==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic fixes for v5.11-rc
Date: Sat, 30 Jan 2021 12:30:50 +0100
Message-Id: <161200622969.2192465.15081431917114285315.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7hk0s0x3im.fsf@baylibre.com>
References: <7hk0s0x3im.fsf@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 25 Jan 2021 10:41:53 -0800, Kevin Hilman wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 19f6fe976a61f9afc289b062b7ef67f99b72e7b9

       Arnd
