Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D0AC64ED8
	for <soc@archiver.kernel.org>; Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A58CDC4339B; Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 900CDC4339E;
	Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676302229;
	bh=lcOaQZfUxoYkWnnXTUxVtcjvFjACnP2cjnzUx0FiWLE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RSqwjBv50739vDpo2X1yPOpJoex+moMCiC6YV2CajxrjdsNmA/CZFAFvBdpDgnAmb
	 S5VyzFJV8LGaDLW4mXUSFavjoPij1oGK3x3axLVh/nO7Qls8MaEgxDTxEYBPpOGhr8
	 x/TGuWdY1+KRkymdf9PVM65+3i5p/NNi4CEZT62vcotl68//YKB5yF1Q7qrT5XxwdG
	 RWJcU3tLpnrEfJwjDmTQLBWuo61ssthVjlIRBx5+S6vKDsIGF1bxL8S9QFB37ss9L0
	 KqV+O0YduP0L8XKH+BbAhouWVeJRHVhIG0SlL8Yd0eUs2TQEWmGDpp5nVoREs9tywo
	 lOcLxobDrFbIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 74089E270C1;
	Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm ARM32 DTS updates for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167630222947.5266.10798748448357008825.git-patchwork-notify@kernel.org>
Date: Mon, 13 Feb 2023 15:30:29 +0000
References: <20230210185846.2032601-1-andersson@kernel.org>
In-Reply-To: <20230210185846.2032601-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 10 Feb 2023 10:58:46 -0800 you wrote:
> The following changes since commit 34d50b12d67795454139a1cfc7ca3add8efa3612:
> 
>   ARM: dts: qcom: msm8226: add RPMCC node (2023-01-18 20:20:18 -0600)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-dts-for-6.3-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm ARM32 DTS updates for 6.3
    https://git.kernel.org/soc/soc/c/fc54e13d7125

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


