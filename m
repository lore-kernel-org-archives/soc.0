Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599AEC6FA85
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 11:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 297B6C43142; Fri,  2 Sep 2022 11:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D901C43470;
	Fri,  2 Sep 2022 11:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662116418;
	bh=W1CuumNhITbij+BEVLOD685ZqMIDLLcBI/0DshkrOWw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Qa0GBp1gxS6Nz9poFyF69iWD7jBmzTGnHh1w1QN7G2RM8wwl8HR+J/JGhupCGo10A
	 rHO8+hfA0ZOdOO0hycwy7HOUDw4WfeIb27moy8lRvJpOPEn1P2c9MESzyOGZAG0T2+
	 kHdEqGYWBg9wBxUX8bK8M0x1RGtNpC/voNa8YryOovU4it9gCWY2Mm6EHiRTza1ftQ
	 +3hEV89vHbRj/+ACD8T2JtMOU43YVZ5lOkUFO7qzBLWyHXi0ns5dCewM/fTvY50Aep
	 4pNaGz0JDPTDdJvznkTvRAe06xf0cg1+CJQMrqzf12BQKDTbba07li4T3I9grZnRt+
	 U0NiA5FfPqp0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E3202E924E4;
	Fri,  2 Sep 2022 11:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Broadcom devicetree fixes for 6.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166211641792.12856.13821085327073408886.git-patchwork-notify@kernel.org>
Date: Fri, 02 Sep 2022 11:00:17 +0000
References: <20220829225103.753223-1-f.fainelli@gmail.com>
In-Reply-To: <20220829225103.753223-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 29 Aug 2022 15:51:02 -0700 you wrote:
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.0/devicetree
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Broadcom devicetree fixes for 6.0
    https://git.kernel.org/soc/soc/c/06f0696444c7
  - [GIT,PULL,2/2] Broadcom drivers fixes for 6.0
    https://git.kernel.org/soc/soc/c/49f6d09bd046

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


