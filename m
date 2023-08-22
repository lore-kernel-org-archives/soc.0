Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93F8EE49B7
	for <soc@archiver.kernel.org>; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77059C433BC; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6163BC433AD;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692671476;
	bh=xqRb7PhM0+YZ6iVVexXpcgFmx7sHo7S2gfvLM/foQjY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ulf3q//6pj51yplc2pSoIkRMcuZxVj6JC6092ryll5rF8pmXgXuM2FEBcIkrwhNV/
	 8pe7DMsvdIZv8luLCb5gC1f9xQzVk2iFJNk/Pbw5I2cRLRgiUtbY3G9qQVJNg+PEzp
	 kCFcjvY64zlMzY66ybuQnsLac1Lb4esDHzXbPgeK6BEOxv8hTkoL/hb5oyBbciMKv9
	 v33gMIGeAxpPHyogx6tvQE4z3sIjx00w/aoCGqt31BAU+93sz04w/xwMTGLI5MXO16
	 RBHyVdBaaCQS48MjLhAgywqbLwAM2CLnu0M+lPsDHoMQpN1EjlxB1sqlDvWVL9xfx0
	 EeTPXGdcydb6g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4DCDFE4EAF9;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Driver changes for omaps for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169267147631.32531.17747488352315225978.git-patchwork-notify@kernel.org>
Date: Tue, 22 Aug 2023 02:31:16 +0000
References: <pull-1692158857-597450@atomide.com>
In-Reply-To: <pull-1692158857-597450@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Aug 2023 06:03:27 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Driver changes for omaps for v6.6
    https://git.kernel.org/soc/soc/c/6681618814b4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


