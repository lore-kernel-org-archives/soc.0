Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E89FC433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:31:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E112D64E0A; Sat, 30 Jan 2021 11:31:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6BD464E0E;
	Sat, 30 Jan 2021 11:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006262;
	bh=rWm5qSEWlYg86Rpo8qFvrwtsNEUMx1P5Exn7jOyMXFs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aJn7N1ZcuctSPepF5NlNOZZtdZwc0gC/51LLoM6O0rTBwI8B3zRS3Lm+xdKemfOlf
	 B2ct1X3MHaCTverFSNjYoj2JPapnQRsiIqN0Ex/nfbVL0RjdB/owU0qzDq2GlF+xRG
	 CzcN/7JjMDT4QUR5LWOR4bRL+JMMGOQAQpKHVuCwCfhzvZ7kzlkinouN6HlZ8tzYTq
	 Mw/AuYl7NrPXABEbA11uVaH2HpVIcp+2OsgAodA52PUpK26feJbb2oBAGmcOB5XRjC
	 RB/flm0bWa5kbLEUrD7Wro3ThHd/aC+T7Ffo41CZAidgrSv7prZDA9Zq7FBibfYQ63
	 Wm/RaDZW4EwLA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andy Gross <agross@kernel.org>,
	Shawn Guo <shawn.guo@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Qualcomm ARM64 fixes for 5.11
Date: Sat, 30 Jan 2021 12:30:48 +0100
Message-Id: <161200622985.2192465.526164988632554427.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125232039.642565-1-bjorn.andersson@linaro.org>
References: <20210125232039.642565-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 25 Jan 2021 17:20:39 -0600, Bjorn Andersson wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.11
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 3de834b29239fb752f042dd78c88158541202063

       Arnd
