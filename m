Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1428CC49EC7
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 763C6613D9; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5A689613E2;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502411;
	bh=MUAYxICU/OBSSZxp/JNVFyLNsRrUPfwhzcpFsWSaamo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=qw7+gYBRUgXG+yJc2tpnusnJxi3Nr9y6crdtgd3UlQSBpj21LvbKn4dI3+cW8MZWb
	 hWDFb6Z1r7c25FMQAkuky5Sij1+HAXBvqcMfnWjfGgabdXow+DYB4P3oLW9kfU1YKV
	 yRZ0TIjkE2mmU8rzdXVJDuvw+LPsqmVtJBoUasR/W2HvQGMA6rnmH9nZh9F3xufePw
	 nbCq3AfkHfCXJ37QObti9yCkizhjF3HYr0t5zfI9TaaecP09UR+JhSfeFGFlEKhMVg
	 gv6K7yfgF4uHX9zCstzAxOmfaA6w2vUEcifz+HjADCJJSTRgdjmMdyCScFG5JNpRye
	 fQs3WESkGnCzA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4ACBE6094F;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] USB4 regression fix for TI DRA74X
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450241130.24025.17434303000862908426.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jun 2021 02:40:11 +0000
References: <pull-1623999845-180025@atomide.com>
In-Reply-To: <pull-1623999845-180025@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

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


