Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FB3C43460
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 09:41:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0D9A66108F; Thu,  1 Apr 2021 09:41:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E9A0660FE8;
	Thu,  1 Apr 2021 09:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617270061;
	bh=EiY0EjzzpRQq/3hOUN+hLww5vgdtlc0aTM+7uQLurnI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lCe7QK2zbSSXMV8irt/1r85wwEeklFqR/VPr9p6hv5/0rtKRPcak1h8GyCweXT21C
	 CpSzswitf2m6kib1tuHgEi55y7QCzl4iaBCAQd4BfkkMGcmBAYfM4paABSJPYcWV4O
	 ScTxslAsoYA4HVav8mnKWsoTzHm2FEDMl3Nr0HXX8lm+/dk/ZVW7op188sIf/MG6Bs
	 AC5325EKqqdWNX2ke3wlCSmbaG/0uNcAdKNDZ/gqA6zYZEeEvf6zhWo2ZFlD2OVN8e
	 UeUfDrZwwWIDajuQcY3WfplYbWvdENAcC0ENU1hZZ+xIJjirR0nUPkH/1GM7aVXPt1
	 DKzEWhUNzr4yg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E0F4F609CF;
	Thu,  1 Apr 2021 09:41:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More fixes for omaps for v5.12-rc cycle
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161727006091.25375.6717547268485823430.git-patchwork-notify@kernel.org>
Date: Thu, 01 Apr 2021 09:41:00 +0000
References: <pull-1616584662-702939@atomide.com>
In-Reply-To: <pull-1616584662-702939@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 24 Mar 2021 13:20:39 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More fixes for omaps for v5.12-rc cycle
    https://git.kernel.org/soc/soc/c/111a5a421fb7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


