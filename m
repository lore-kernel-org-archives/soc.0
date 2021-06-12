Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A601BC49ECB
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 08A806141D; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E3E6161410;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=niku1JqRcpamLYQ1sApgb09xKJf1FLITIGzgR7p22J8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gIHeswCsxXE+q9aMh7WD48o9KiwreP6wqlqkbTmpyJWiIuyXoouS4pyuP9Ucojau6
	 iVbL96DIIByQON+H2sT3Iw4Bati7Ga6v3y++rNBhj/suzjpSWOCOC64uMiDt2NPrAy
	 22Czwt5QRfoLhSYbk07KHrU7bNhGiWP48i8B/QZNOwqZ837CUD4qIeaMr+lDHs3aJG
	 vee3tYHXjAFxQI9a11ezs/EW6iRObJdx+r/+48AY2mmkF6jqTi2hrkDXz89oXaT9mx
	 YPKBRjM20qe9heDbWygh9pb5UPNkReDMt0ZIJvgRW9uqHw5tl7tEvy5Kw1pPf1jPzm
	 17kYsjd059A/A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DE95160D0A;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner Fixes for 5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421690.27448.10454147890195243075.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <ad7ba352-315c-4201-b922-4bf914a00d98.lettre@localhost>
In-Reply-To: <ad7ba352-315c-4201-b922-4bf914a00d98.lettre@localhost>
To: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 11 Jun 2021 16:54:29 +0200 you wrote:
> Hi,
> 
> Please pull the following changes for the current release.
> 
> Thanks!
> Maxime
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner Fixes for 5.13
    https://git.kernel.org/soc/soc/c/37c2a42930e1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


