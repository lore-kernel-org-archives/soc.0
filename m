Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C404AC433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:31:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9A27864E0C; Sat, 30 Jan 2021 11:31:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4BF764DDF;
	Sat, 30 Jan 2021 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006260;
	bh=/A7V7n3yMz5TfIqHtRuoIkTq93H6Yx+JtQlz3ROUMn8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uF84PjEUuJ1xteMTgadizJz4gvwYpSI+hAxcGcp7oJsA4d91uJxNlIQMxGDWg894d
	 8h8lqCbi8BPI7WsODZZ+X87Nwe/xGDmtZcP17z6ZVXZcOIoRMR09Di+P4SJCuzN2zL
	 cNbaa0UvqpIpo+FCbWFxnFMu1z0njcwtMp+Ls+lbm+bBjGKDW2E6zmaNKrLfWCwnfX
	 wV2P/hhy9KWlU0Nkw4DVTwONdj3kRYTN1AMJQEUSWbVfVLQ9fYeQ2kBxNBc0fI2+US
	 DoCF5RjJcw1kKOA81vaC0pINsIUDAEYCluWfmoxXR4FOphKULZawrqj5w//VK7pGME
	 8tw0mcDybQLsg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig fixes for v5.11
Date: Sat, 30 Jan 2021 12:30:47 +0100
Message-Id: <161200623000.2192465.13870148872058315331.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125232412.642834-1-bjorn.andersson@linaro.org>
References: <20210125232412.642834-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 25 Jan 2021 17:24:12 -0600, Bjorn Andersson wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-5.11
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 082153866e6600e37a98d6fa21fbc347fa22f6a1

       Arnd
