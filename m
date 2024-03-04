Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA378C48BF6
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9269EC433B2; Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D09FC433A6;
	Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568697;
	bh=amZgOdICsAhjsFkzo8zIOyL6foXEpj/eaV55QMTUj/o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=m6o4MhNJEhogZC8P0kkRSjZ4TJQ8vTSFcRpSfuNLT3dI1m/6An3N0Kxsg69txRvKX
	 JyCXS2LcbV7xy4T8if0hu2QrRzq8VQoQMxus3HJGAwpYPjY3yFNt5S9XaHGK2sjHO7
	 e1HfZ/Z6ooXxFL5REIEObGHF2CE4eYWHMfqi8LNz5cuA0zCozSiO4B5DMh4Lu7/RZN
	 EFxVv6HzBWbPfkeQUMxnixtMoQTG32eCdDr+dXD+0kcol/ZK3mtvc18V+n1UVL46de
	 0z/4uIBkuUDqYh72LkCZ3ffgcq5hN8WnC7ZNgas2z1Vbc4MWchTkBcBHigzxXPoHuq
	 F8SD74l/hHU+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5D3B6D88F88;
	Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree fix for 6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956869737.25915.15963995223279235569.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:11:37 +0000
References: <20240223205450.GA8881@jernej-laptop>
In-Reply-To: <20240223205450.GA8881@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 23 Feb 2024 21:54:50 +0100 you wrote:
> Hi!
> 
> Please pull following device tree fix for 6.8.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree fix for 6.8
    https://git.kernel.org/soc/soc/c/aa8bb984f786

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


