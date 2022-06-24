Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26832C43334
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 16:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B006C341CC; Fri, 24 Jun 2022 16:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2DD6C34114;
	Fri, 24 Jun 2022 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656086413;
	bh=aySho60tQdJTNuKgprwlgwp+4oz4x+igWmJ3TIM6aU4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=leNFwomzDtqfZA0XntJbFkH7+/q/n/ipf1e9y2DxMSC0RDUrHdM9wVFBylP2IUGad
	 sWFVgF7krrFCk/M+FEUILPR00gkE0dpyZm9egcgehurzYhXN7m7icm3XcLHynrJgBZ
	 64JHCb+ASHD4zc2cG6Ihm2ZAsEZAuKSL80x6IG6i509F2/omfgEN9PbIeNmRiW5xbH
	 soCXUsbTHD2/pqkIsUzH3B/zDdwugLN8h1l1Q4L5fEIYk09GCdu3vZpQiDwB9HgFNp
	 ETeVqjwknXTAXxCXnyeD9GrgOuBOumjFpEZLVErULEBrtbOtze62NKvve9A6FmAx/3
	 6DxxSe4RH3npA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C9174E737F0;
	Fri, 24 Jun 2022 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Broadcom devicetree fixes for 5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165608641381.3411.9550528204633958349.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jun 2022 16:00:13 +0000
References: <20220620170745.2485199-1-f.fainelli@gmail.com>
In-Reply-To: <20220620170745.2485199-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 20 Jun 2022 10:07:45 -0700 you wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/devicetree-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Broadcom devicetree fixes for 5.19
    https://git.kernel.org/soc/soc/c/b262b3b571bc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


