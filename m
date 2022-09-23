Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4163CECAAD8
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C2D9C43142; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11B70C433C1;
	Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663944728;
	bh=CSjh7JaIHk2XXoxTUIozBhbwXS4FXTDS2zDQGR78zEM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MsDL57Wp4OZf7oWSav5dZM0u/I0cAJfidBeKKsFqKM8NEYMO+vIRBA6e6GQdK9lx7
	 3IUEr6DF4lARoFzRsAIegjS23MKgRcqj4yC1k+l3d2zynAe3FCUTlOUn/LkBYE/s00
	 1f6J1g4za5Y7D6s/wIpr4GprLRH0FNbrWkpTyBHNneJzkwrwld0jQ+d6iVUxtXr8Ar
	 Vu6E2o/vlKiYeNpnbTaW0qWujocFBWKc+YPDGYdiK3TbIRLjqlfw0IbZlwDpfHzBjz
	 WgRAVFSdKxykjMPhHZs2G/lnC7KeajgflKeksAGUZY5aZgat57km1iEFev6zUGqA7U
	 A4ZclHl/V5Bow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E7CAEE4D03A;
	Fri, 23 Sep 2022 14:52:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] i.MX DT bindings update for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166394472794.12526.463270226013303463.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 14:52:07 +0000
References: <20220918092806.2152700-1-shawnguo@kernel.org>
In-Reply-To: <20220918092806.2152700-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 18 Sep 2022 17:28:03 +0800 you wrote:
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] i.MX DT bindings update for 6.1
    https://git.kernel.org/soc/soc/c/2b14d7da6500
  - [GIT,PULL,2/4] i.MX drivers change for 6.1
    (no matching commit)
  - [GIT,PULL,3/4] i.MX device tree change for 6.1
    https://git.kernel.org/soc/soc/c/07d0db46b3d2
  - [GIT,PULL,4/4] i.MX arm64 device tree update for 6.1
    https://git.kernel.org/soc/soc/c/b805cc89bd39

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


