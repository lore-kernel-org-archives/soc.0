Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC82C49EA7
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ADB85613BA; Thu, 24 Jun 2021 02:40:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 96C78613B4;
	Thu, 24 Jun 2021 02:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502406;
	bh=nkAhrCh2IosHGrx7FqgI8J1cw+oyM/52Ty9gpp9nw4k=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RT/I0bMgDO9WnHqtRRcy76cod3n54WfcnTNuAUpU0huhe5/ReTuj0akiv8ddRCHFG
	 N9R+rv2LYkqn+xaggX7NJZC5t94/C91sIefE59a+uzPSBEUWr31KGQqwNroXw+O9dI
	 J4JFKTsmUXXd9VdyMLh3+ZE3YIkIxS2mSt2URK8vf7J4Yp+a6IIVfrsPH9NKxS76VH
	 mzXeToAOgF1hvOGCz+iVbbMGtifZZc06bJO9QKuiDD7En90odggIKDlF3kD30yH3F+
	 uAY60xKigKpP1J7Lm9DHHppo7xeyW3R7HA7yAa/vW0+ihuDvkG2XR2/lVxDeHL3WMX
	 8AXZndWSTHPhQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8EEA3609B1;
	Thu, 24 Jun 2021 02:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] USB4 regression fix for TI DRA74X
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450240658.24025.10020500438950909055.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jun 2021 02:40:06 +0000
References: <pull-1623999845-180025@atomide.com>
In-Reply-To: <pull-1623999845-180025@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Fri, 18 Jun 2021 10:05:05 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit bae989c4bc53f861cc1b706aab0194703e9907a8:
> 
>   ARM: OMAP1: ams-delta: remove unused function ams_delta_camera_power (2021-05-26 14:01:27 +0300)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] USB4 regression fix for TI DRA74X
    https://git.kernel.org/soc/soc/c/3d6fe39ac6cc

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


