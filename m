Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2D5C433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 15:14:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 50BB264EBD; Tue,  9 Feb 2021 15:14:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3032F64EB1;
	Tue,  9 Feb 2021 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612883643;
	bh=X1mye9xPr2RjF5BpDtAu/7UvJiSKLQ1v6OO94UnDmwM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mlmPKT87POWwEG2peRcegHhgTNMzAjfHWx+A1cL4VKECcy5NuVzQA9avPw+3ttAem
	 6YZqGJpGZdt6C8xpwZJOyDV6u4NZyCQYaavf82W55VW2mcJwAa1o5r6Xfq5flYCA2E
	 +SqB2WDy2IoTX+3X2Clxpzg7j3SaGIvUkL7FogtMdt1yrw0jB8XnVnKtkksfguQuBm
	 DV2E+wiXl+TvbxQDpFSbKzcYZxOPuCRSDuvT6yZTIusAHmClTmqb9GVXnRHJLcqIPX
	 n30Wd3v5RFJewiI+c6ZFife/X6O/cXxQCXLAnslO09o1p+V2u66DRtS/O0EgqJc0LG
	 hV2u8F1bip+Qw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andy Gross <agross@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig updates for 5.12
Date: Tue,  9 Feb 2021 16:13:51 +0100
Message-Id: <161288360517.2910447.6558653724221288151.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204051956.388355-1-bjorn.andersson@linaro.org>
References: <20210204051956.388355-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 23:19:56 -0600, Bjorn Andersson wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.12
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 8c4501f0c03a3a9d1c875cfd99c390f4b86bf1ec

       Arnd
