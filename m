Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E3EC61D9D
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C30CCC433EF; Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1EC4C4339B;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674595889;
	bh=syRIq+JqSWGIPeVQQhAhuUOesGAUSYDBkEsAo2o70pA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Zcw7OPsdIzDTkk++9sW9ewvUMPcwm9on3RZSSEltm85qFEmkdCJB5ry+mdE1ykAIC
	 pj/tf31YWdqdQi32R4C2gmkrqeLrR43MyXTilBEUyiCIokGnX1ZnorgU0VvTq9Vw06
	 HXBWE+v28VE/o/AG0dw3lIfAn/Chl8Iwk//+r2rhRRxvFa9zWqrhceaZPZiETnFuuT
	 mp/YYXNsR+7Y7EJ8jHsQdKJi0vQTPRzTiFlohoyp4FeW/V91yBD6oUWCrLFtDxO5ya
	 VQ7H+mVCjvqu10Akjrguxn0Q5/Bf4OuIFg3WxqFMitP+QBYR41zAbEA2AD9v/Co6D4
	 p8olwJ/1OkOkw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 906EAC04E33;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Devicetree changes for omaps for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167459588958.12731.7987514152856631838.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 21:31:29 +0000
References: <pull-1674566471-434733@atomide.com>
In-Reply-To: <pull-1674566471-434733@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 24 Jan 2023 15:21:55 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Devicetree changes for omaps for v6.3
    (no matching commit)
  - [GIT,PULL,2/2] Clean-up for omamps for v6.3
    https://git.kernel.org/soc/soc/c/fc939b172eaf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


