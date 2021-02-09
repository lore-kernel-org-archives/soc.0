Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2C2C433DB
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 15:14:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B70F264EBE; Tue,  9 Feb 2021 15:14:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A22BA64EBA;
	Tue,  9 Feb 2021 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612883645;
	bh=tW5KZER/roH4B6SBzwIkRa6JCnEucXcKBwFZvpiPcoM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z6N2RXXFcnfGHUeV4Z0cu+hBil8Mitalm8Ibj9nMFw+H5FEdKdi/p+hJE1U+STHrW
	 ZgLw5qQDd8du3BDtoMMFzqiN5MgDmfKN8FMwihnz/rPl2zC+/vxSCFPcnRMXpY7BQ4
	 XXMJxXn2YCVQPQSV4nGusjEwPxo/5DOZkGQEc70yvvZnfNuX9/cKAGGLbkTlIIpeuJ
	 ffC4C8qz6NfcSDiWIn4DaiHlO+0IDdKxiqhc/ctKutEJ4Y3qBaT52bbwZjIPGaU+qI
	 1xL2ds6Tipj8xKWG+XLnrWuJ0+IgYDzyfiA27rSNVdHmaelfObW4xG4fCQ2voJwLzO
	 eN2e9WUPQBC0w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Olof Johansson <olof@lixom.net>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Qualcomm ARM defconfig updates for 5.12
Date: Tue,  9 Feb 2021 16:13:52 +0100
Message-Id: <161288360536.2910447.17395557874947712257.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204052236.388783-1-bjorn.andersson@linaro.org>
References: <20210204052236.388783-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 23:22:36 -0600, Bjorn Andersson wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.12
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 7321ed736f5c4e7fd1e682c93b73db2967e10ea6

       Arnd
