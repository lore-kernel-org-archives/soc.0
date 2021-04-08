Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB3FC433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 20:20:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D6ACF6115C; Thu,  8 Apr 2021 20:20:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F2C0610CF;
	Thu,  8 Apr 2021 20:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617913230;
	bh=P6PT1hQasfOdzBnYgOkWcVty9BPwNuJx/4jTmTi+f5E=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BOD8Kh4OVcifqdyk8l1bHPzPwPl2xmWoUaG0UASx1NIcOnTMDrNPj7K2Ky796reu/
	 Hj6YT2cTdn0rmIIkeUlfu0Zg4ByMEIhmce8kTV+PXaCfNhowllzXjWmU+4q302yJ/i
	 Dyw3QtwVcx61tNYn9Wk6B8toX70SyHjitzVpweNdwqdvpbjkYBxuKYA39fvv1voAQO
	 LCzS7z+Yd7gqOSr6+TPe87UX+GxfHWZ+EyGfP9FNdn6CKaUpEUoetpuqe2OQavecUS
	 1g269O/adp0Lb4bxoqsCLdihdQC8CH+bKK0irBn8a8TWRuhifJiJ1CZ/F5KYcf4gYf
	 2R1Ku96+W92Kg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-msm@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Andy Gross <agross@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig udpate for 5.13
Date: Thu,  8 Apr 2021 22:20:04 +0200
Message-Id: <161791320105.1663026.16468860660574153145.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210404164841.712845-1-bjorn.andersson@linaro.org>
References: <20210404164841.712845-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 4 Apr 2021 11:48:41 -0500, Bjorn Andersson wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.13
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: d515102f56a02b68c5cc840880b45730736df73d

       Arnd
