Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE705C54E55
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D885FC433F1; Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C36A7C43390;
	Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708693829;
	bh=LvbTM0otzO9Prd7uhdpseUDcVWfCMuQSIQw/DgDr7n8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Dr0sMPIXaLs0oCekAvrLK5+q1TL85MU64S7hvNzJlCRX7L0wHotSRfExNIeC0YOAT
	 SS947iglJ4Sc0Miyh8jcYhYqn9MDm44kmz5sTLijmdJst/ai8K8PnpDXzvnbIwco9n
	 ZKLbC5J8jfipjhNiD3lCYfUB3Wx2ewNEnRCHDMppgJFss5Xmsi7iLjQcYYrfxyLIDn
	 UR6KAAdUqTKnZVuQEhkveZlAaP8Vl+HFEFrd+8i0Z86FbR5rpRG1e3FkNLAxxM6AIG
	 Ts4JTvJXNZvf74rn4HmcRbS8d4nxlo699Sm/6RZZayOhcIsmIE3yyX/t43lsYHR8Ic
	 pDQDRBwlyk3Nw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B1557D84BBB;
	Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas fixes for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170869382972.28623.7315455202741941104.git-patchwork-notify@kernel.org>
Date: Fri, 23 Feb 2024 13:10:29 +0000
References: <cover.1708597150.git.geert+renesas@glider.be>
In-Reply-To: <cover.1708597150.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 22 Feb 2024 11:42:51 +0100 you wrote:
> Hi SoC folks,
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas fixes for v6.8
    https://git.kernel.org/soc/soc/c/dcb8e53e339e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


