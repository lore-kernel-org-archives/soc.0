Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B844C04A95
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 53680C4347C; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36573C433D6;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664398829;
	bh=SkAsdg4NuRzPdNjKwPZByNb+HEbizFbANCizF/H3Sv0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=q8pi08aMth8kYQHPiXFg04vq5YSBImOsx7BF+HZhoKH/j8e1Jh3sbBZhpaMkbW+qj
	 bGcGe2+qX6bK2jBOVGkqKm5tpgR2Q/EFPEgTETTNBJVOvV9Nqswd+Bo2UKADyfEypF
	 Q1fDvu03uYz0CESjiZnktqyIEXYJLldgw4tI3DDgJAYXi/SdcEtAHAfoJbDYKlVtxW
	 apdpGlmrfizQ2HNImLdloFQ3b8d3OoJmY+kIDnxycl7O6HiXqLJkCwjfCG7t1ZKPat
	 DqHp/Rv5AZm9PncAnewHf/i40CAbTllMGqribSTqwcX30Xr43ghEMlOSWDvIgRqGsB
	 qLPZZWwl235hw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 121D9E4D018;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166439882906.18494.16010635410088455526.git-patchwork-notify@kernel.org>
Date: Wed, 28 Sep 2022 21:00:29 +0000
References: <CACPK8Xepnci+f+7Pi1jtXod8Jmt+OnJYfDRENjiP-xDBQwFCVg@mail.gmail.com>
In-Reply-To: <CACPK8Xepnci+f+7Pi1jtXod8Jmt+OnJYfDRENjiP-xDBQwFCVg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 28 Sep 2022 04:44:12 +0000 you wrote:
> Hello soc maintainers,
> 
> Here are the aspeed device tree changes for v6.1.
> 
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: devicetree changes for 6.1
    https://git.kernel.org/soc/soc/c/a51278056107

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


