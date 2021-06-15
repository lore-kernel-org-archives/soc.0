Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD222C49EA3
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 694CF6162B; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 51D9E60FE9;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623772813;
	bh=GAy0pd2dYS0bnDT6sHRb32wOR3tBAhPa2q+PnuwmMHE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=vALmSw8Za4TEJXP9LF1QV1TYBx6CdBqFCH+HN2pNyBg/X9aAGwAds8C4PJAjJOwwH
	 ivFqsOAfcVc1SKA5uRFkxDo71ZdxpjmZGatTljKQth6yEcYCDRutGB7iLjN6ysNYh6
	 vJXaJDXTNVLxHImFPoXSTmAc7idreM614sIunvozyHwHsiOCcj+WbFNC9M4z6ywmXJ
	 fOYL38rhV2NMBJP2omENk4dukSwMCK8ExaQ2WxbRJ8Kbx1JNPkHYYRbgjXof4988Jz
	 wwHnF0LbK8sZyR4Wm+tHVKSYSW3sJuiBYuq3gREn5R6R8+ucXwzxedkNHSA4HKDOOI
	 xRyzd/Gp0ClKw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4CC9460A6B;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm DTS updates for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162377281331.17464.12423225413789873036.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jun 2021 16:00:13 +0000
References: <20210614223840.393224-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210614223840.393224-1-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 14 Jun 2021 17:38:40 -0500 you wrote:
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.14
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm DTS updates for v5.14
    https://git.kernel.org/soc/soc/c/ab9c2a754664

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


