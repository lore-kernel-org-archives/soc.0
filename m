Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6D6C4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:10:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6DE2823B16; Tue,  8 Dec 2020 23:10:22 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Iskren Chernev <iskren.chernev@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Kathiravan T <kathirav@codeaurora.org>,
	Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Qualcomm DT updates for 5.11
Date: Wed,  9 Dec 2020 00:09:37 +0100
Message-Id: <160746884645.2839681.14995823048779757399.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201130190148.345302-1-bjorn.andersson@linaro.org>
References: <20201130190148.345302-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 13:01:48 -0600, Bjorn Andersson wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.11
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 6ce23595b587a4cbb9f14cebdc20de4336f95473

       Arnd
