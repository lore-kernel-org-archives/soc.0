Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847A2C4332E
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5F85E23B42; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 43D0423B31;
	Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611356413;
	bh=SuKttW/XhrhFCeFVb+IJOhlWqDkfKynCy72SghjzHTk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nMk88Rh90TPzDuxQw+6mDXnSu4ec9YuGzPq4YQnidwmsu1oyQemnYcMDaEqW+qnoA
	 Wg1kVRi9r8um7S7GiJrXGZnj3FTh41IJdALmBxyVZch0ugPkH4tQZz444mbJKgYvOL
	 iYRTlQRyQ2W6RAIeHBjR4MveAvq7GnHgA2BTy97QRybmZ1bPZaW1riH7FQmUX6v5lc
	 H1rzFzFUbu9+M9001hAcPwaif/fbvVFZefzDfbE5PzeA0dgTeSDq1Q9v/+gKxep+rA
	 S5HcNrCYomwT7Orm9+SflrRF1EYRqIT9hrEvJQ8uX06zjZVwQ7k3bvrBjSbx9UGjjl
	 0mzkxwKXZzTYQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3C954652D9;
	Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable Actions Semi platform and
 drivers
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161135641324.29035.15729262214542417693.git-patchwork-notify@kernel.org>
Date: Fri, 22 Jan 2021 23:00:13 +0000
References: <20210121061447.26517-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210121061447.26517-1-manivannan.sadhasivam@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/for-next):

On Thu, 21 Jan 2021 11:44:47 +0530 you wrote:
> The support for Actions Semi ARM32 platform has matured enough in the
> mainline. So let's enable it in multi_v7_defconfig along with the
> relevant drivers. The platform can now boot a distro from eMMC or uSD
> without any out of tree patch.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: multi_v7_defconfig: Enable Actions Semi platform and drivers
    https://git.kernel.org/soc/soc/c/26ba4a474aec

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


