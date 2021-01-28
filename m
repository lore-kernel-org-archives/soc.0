Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD18EC433E9
	for <soc@archiver.kernel.org>; Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7890C64DDF; Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6218764DDE;
	Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611844831;
	bh=gRw6t9JEHTb1/Ii7m+o5WswJRDQ3INH3eUm5eTUjiE8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IOjLa3MAnusHXsmRMLLwOuro7abcHJvwGYvKvZP+vkY51i4O3oK9C/6fjNlFta5ok
	 1dySlfqlOPYI0eixfHyH8chCitwbaQFhHLQtNPvZTSjTMITMm3m0ZW6R6YkLaXzjw6
	 CzBecCKT+QjxI23U9kbEkNq7w8Af0+Bd87ClBnpUxeFLLRScV5d5AMQ+ukMA4QkpzZ
	 KVa09JzrRPFyx0j1aSe500QmXkC6r/Fd39iJ9r4iSfM1oepa1DUFs5TYr2YC8PGR4e
	 l+2RO7OB+/y+o6txNWdzktqeEBIrlIVC8MEvDtoVKUVjGrTYWjHF20s14ti5+pIwq2
	 Kr0iUcClbAjeg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4A58E65321;
	Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fixes for omaps for v5.11-rc cycle
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161184483129.28855.15749323976935661218.git-patchwork-notify@kernel.org>
Date: Thu, 28 Jan 2021 14:40:31 +0000
References: <pull-1611818709-243493@atomide.com>
In-Reply-To: <pull-1611818709-243493@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Thu, 28 Jan 2021 09:43:50 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fixes for omaps for v5.11-rc cycle
    https://git.kernel.org/soc/soc/c/2a3e487a3e53

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


