Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6B9C433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 19:55:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 96B2F61178; Fri,  9 Apr 2021 19:55:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86789610F9;
	Fri,  9 Apr 2021 19:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617998100;
	bh=AP8+aNUTnD+CO0BIHhYhziWO+97Lau3/XEnosXE8xuI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u8bpe3brRgIT/CSUUmz24bHvRs0skQ7oGM1Ky5kT2vqK6UyHh7KNKI+p7QjcdkzuC
	 yPvBIwpa1b9RurPI7wsP6h0zktCiYJSHmIUCldtUNcruL4AerJAdJuHb7uBGXUT8ww
	 aSqiWaxVKRaTMXdBai3LmEwlprJCWo9XXKfl2zshvpy4tzgf8e3cT7/+Fjrs0lQTtH
	 FCdBZYhMBP8QL8s5XUcyM6+PH4NQHv/O62sSNN4NLtjQWrtzjxSs7vex08ILR9txbS
	 U9bRccwM8uzqJqmebu+lPI+uNmb3fJtf5tL09jWTXunbrq4Q+m40fNkkoMAM+f0nZI
	 RhgUmFJ9lo5JQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-msm@vger.kernel.org,
	Ajit Pandey <ajitp@codeaurora.org>,
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Caleb Connolly <caleb@connolly.tech>,
	Jami Kettunen <jamipkettunen@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Robert Foss <robert.foss@linaro.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Sujit Kautkar <sujitka@chromium.org>,
	Vinod Koul <vkoul@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	satya priya <skakit@codeaurora.org>,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] More Qualcomm ARM64 DT updates for 5.13
Date: Fri,  9 Apr 2021 21:54:52 +0200
Message-Id: <161799808694.1862218.16413759565351084850.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210409163949.776530-1-bjorn.andersson@linaro.org>
References: <20210409163949.776530-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 11:39:49 -0500, Bjorn Andersson wrote:
> The following changes since commit e9269650db2f5b4aeeafced1a42b2e51d10bcdf5:
> 
>   arm64: dts: qcom: qrb5165-rb5: switch into using GPIO for SPI0 CS (2021-03-18 09:35:42 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.13-2
> 
> [...]

Merged into arm/dt, thanks!

merge commit: a8f6ba28257ab6fcf08138496afdcb2d6de3955c

       Arnd
