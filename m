Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091D8C4321E
	for <soc@archiver.kernel.org>; Thu, 24 Nov 2022 15:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC68CC433C1; Thu, 24 Nov 2022 15:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B736EC433D6;
	Thu, 24 Nov 2022 15:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669303215;
	bh=sV0k1pFPgccfJ2+n1wakky+nCemR8u0kg0d6CK0glac=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=eBUTPbz2ppIJ+OUgHXo6esbU1zdRngPpEdNjVUjHLbwRFR6nCDK8Y4i5Alu9rX5fo
	 cgg9t3AIndiFArBLr5Ccdi2v0qprP0DoKcQqVtEyxTN7pQxnqLtk3AK2tI5sVwm8/E
	 DLloVtq2r0poJtaGpyCoVFjBCdt7ED2c42nlG5rykKFzGsjtOcYf352Ny6L2hhfWWf
	 s+n24ZRHnqKOB9BNNuzGoMqYRVLlUBrmdlqb6ckqy6kqUGhnhmXK6wnXhftasCMFvh
	 085vs0ObV+lOKyZ4syf1To8xW1IZKhlbiH8RQol7q7iin8sT5mBUMi1G0EOIYvjllF
	 QYIdpS/63fawg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9543CE270C7;
	Thu, 24 Nov 2022 15:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 6.1 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166930321560.21404.10599336147894263693.git-patchwork-notify@kernel.org>
Date: Thu, 24 Nov 2022 15:20:15 +0000
References: <9661382.T7Z3S40VBb@phil>
In-Reply-To: <9661382.T7Z3S40VBb@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Nov 2022 14:50:34 +0100 you wrote:
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.2-rockchip-dts32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 6.1 #2
    https://git.kernel.org/soc/soc/c/b10dbd6fbd7d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


