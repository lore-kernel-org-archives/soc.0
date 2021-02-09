Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E47EC433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:19:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BC8AB64E4E; Tue,  9 Feb 2021 23:19:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7CBD64E3E;
	Tue,  9 Feb 2021 23:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612912776;
	bh=bEdAkSwCJxFLmXKzkXktJ9JtWQpqXjUOCkgYjRyloJ8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h7UryQ4qZBGHYUH4H7ZjF+ZTza/Tbr2hE0PkNAKteCE3TrEluCx77/t26GKKO0W4b
	 B/F9DXexEDdBjl3hZ0Y6P8Ofpn+gMn4M7mtZSDCBNqRiP9zzSV70A3q5k0oeiqRHjt
	 BV4va0JgWQ6NL/aASutO7tsc6KsnOWo/IkANpKN02Gw1oEgHmVAc5cIBShDVRp6NWQ
	 ZHYz+7F0mnUJXZf8FTweUGcK/zNA9Tb8NFEKQDR1BwBhr+JH0oEcTNcG9ZRexh34Wm
	 Go0GBnBXBfYqTWTYH49TglcYmWR5w3fWne5kp2cJf82u5itE90VpLhbRJtQLssPG4A
	 DnNGVkNau/m+Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Andy Gross <agross@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Kevin Hilman <khilman@baylibre.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Konrad Dybcio <konradybcio@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Vinod Koul <vkoul@kernel.org>,
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	Lina Iyer <ilina@codeaurora.org>,
	Colin Ian King <colin.king@canonical.com>
Subject: Re: [GIT PULL] Qualcomm driver updates for 5.12
Date: Wed, 10 Feb 2021 00:19:08 +0100
Message-Id: <161291272313.978640.4442336684772475191.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204052258.388890-1-bjorn.andersson@linaro.org>
References: <20210204052258.388890-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 23:22:58 -0600, Bjorn Andersson wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.12
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: ce8ccf21c040cd1d76f8c16c5cf67e4bc0d8a06f

       Arnd
