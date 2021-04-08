Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6CDC433B4
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 15:49:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C8BC96113A; Thu,  8 Apr 2021 15:49:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE89F61132;
	Thu,  8 Apr 2021 15:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617896981;
	bh=olb/BeUnUWrIc42bUkFXurxIFBPFBMmAbAPvSCR7p9M=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YVwKJ/rVn3vHbPuD358X4rRHMRsNqz18wGOZDnhZ9jmS888M01VGfoRUcACaBugAW
	 x3fPtYsPY17AtEdiz7u5iWTOOoKelioOPR0OR3fvzIyFAA5eCtXk15aORUDN7tA9d4
	 7bPaVzaaWrk+1V0Hhcz+Bna4VOfpGmODpD7WJgsY6i4jKKDCfqhbdFZERtDd4G76qr
	 TV6eBX/leLjdNeg4kIUjr2W3pptGym2NkYpW/dxPk7Szn/2PpnuiCha7Su1pV/9r9K
	 cdcnc27jp4a96RYpvB8l3w3Q2srtLO1O2NbgJymojwak6i1ypUEYLZmLoZUAck0csd
	 NepUzUyfIQhsw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-msm@vger.kernel.org,
	Sibi Sankar <sibis@codeaurora.org>,
	Pan Bian <bianpan2016@163.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Olof Johansson <olof@lixom.net>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andy Gross <agross@kernel.org>
Subject: Re: [GIT PULL] Qualcomm driver updates for 5.13
Date: Thu,  8 Apr 2021 17:49:27 +0200
Message-Id: <161789693288.1636044.1145984086185945508.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210404164951.713045-1-bjorn.andersson@linaro.org>
References: <20210404164951.713045-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 4 Apr 2021 11:49:51 -0500, Bjorn Andersson wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.13
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 207481077b07d53cb378bc5dc71ae5379c91e8a8

       Arnd
