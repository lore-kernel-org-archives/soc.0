Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53EBC433DB
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:06:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 572A364E57; Tue,  9 Feb 2021 23:06:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3C5064E37;
	Tue,  9 Feb 2021 23:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612911990;
	bh=+4xvOTWxhTit0m9fumxstBEea5khx19cdFunJqf2eFU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZNO0THcE1qAfFrP6rywrovWOHVialiqFJlQiBKZ9PxX7DZGDfAuiDcQwXw8WPlflD
	 eQx+SJNwEYpPN+dElBHJtYtiFmbhm3EvSDhutbEPUhUChzhZEazvA4QHFlBQO8yiSG
	 gNTRNXhNHWiAirVZYdZ5+zrXvcuSh2zTMH5amTEwxoMd7gPGzs+JwIRVaeWMpXCH8v
	 REA11E7bpf1Vq+XGBCL977cg6NF6DG6O1J/YYA9TNhsAzfmL8W8mqC5uQ7Lc91OnKY
	 ZthbpqzqwOe8SoBF7KtQBslPnXiGhVOsIYetILnffoYPeCh9aI8H9xUQKrLwET2OpO
	 5Vl05TG+AQiBw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Robert Marko <robert.marko@sartura.hr>,
	Andy Gross <agross@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	John Crispin <john@phrozen.org>,
	Samuel Pascua <pascua.samuel.14@gmail.com>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Jonathan McDowell <noodles@earth.li>,
	Iskren Chernev <iskren.chernev@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org,
	Brian Masney <masneyb@onstation.org>,
	Adrian Schmutzler <freifunk@adrianschmutzler.de>
Subject: Re: [GIT PULL] Qualcomm ARM dts updates for 5.12
Date: Wed, 10 Feb 2021 00:06:05 +0100
Message-Id: <161291108067.974605.8857529097964625504.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204052320.388999-1-bjorn.andersson@linaro.org>
References: <20210204052320.388999-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 23:23:20 -0600, Bjorn Andersson wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.12
> 
> [...]

Merged into arm/dt, thanks!

merge commit: b7976dcf363be984b8a33242f8e6b3b196f9c329

       Arnd
