Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E8FC54E5C
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6587AC43601; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F302C43609;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=QLPg1KyU7Erz9XOCmfQUf95p3pj25VagAtnhD8FSi7o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=a57zhc8brSpQc9HOrPwYrssOmXb8eaEbgSvWBXnUG8O/qUWnMJ1sdZLCyvUbGcKRa
	 t4LS1wNOnzf8kfhh3ls869GxerIZVCVioadsfnm8EGQJrusqw3eqXFXnBeB+SU9Bj3
	 Otn27Oz73rrtNSj8he3UNExu5+dyPD6YHUkYtW5mT9bZZWJ0h/eztN6S3orkri+VvU
	 duTOCL7b+AhD82vQo+lvHzG7sDDsKUx6LFDTzkhb0taZzt+1dwpheag4FTdWgpxUPF
	 AG5S1lO8hilzsHx0tcPt4dVTb8hxk0np2MHetPuGuchdAMdSa7v5NG2HrRI6TmupQ8
	 +ndOryPbUoIcw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3A894D88F8B;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Few more SoC changes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872023.25915.7255855890597854439.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <pull-1709194504-639032@atomide.com>
In-Reply-To: <pull-1709194504-639032@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 29 Feb 2024 10:15:19 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit c6e33edb02292059a06ce8fdc4249a5db86a6114:
> 
>   ARM: OMAP2+: fix kernel-doc warnings (2024-01-26 10:28:07 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Few more SoC changes for omaps
    https://git.kernel.org/soc/soc/c/b98ad40faa1c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


