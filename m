Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5207AC48BC4
	for <soc@archiver.kernel.org>; Tue, 20 Feb 2024 21:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20B63C43330; Tue, 20 Feb 2024 21:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B8B9C43394;
	Tue, 20 Feb 2024 21:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708463502;
	bh=9IbJs1bE7tUPz1ST6MvxBPAf+/W3japply8frggQN+k=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pQAiaXif3YAzYSbgDAh2EcJs8RmlZU0xNrdE+86dtP5AA2C8r5iwsU8KqPEqgj+qM
	 T5Ga4OHJvOhlIDgw8v22EYQ1pR/tnfACAr1Yk4qAIyWtLWSBazh0BT140rBxTrjW1x
	 Dmz2/rwytBd5LcuaNWw9nTfKXNy64jN6fmwbhDFujgOdOn07yfsTqQZoprOe9mpQQR
	 0OcYWXLc21e7MwneMHalcmrn7gCzQ9A8gANhzFaXbdvnfOnoKbvKWgmKrTG8nR4ePP
	 XG1pO9kA6Fvng5sLnmVbNqwP0oTXsttc0BXMnAoUKhxXEC78ku6sfyEr37IjzLwGHh
	 EjkQUfBqYpvBg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E30EAD990D9;
	Tue, 20 Feb 2024 21:11:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170846350192.4365.17170167595548898389.git-patchwork-notify@kernel.org>
Date: Tue, 20 Feb 2024 21:11:41 +0000
References: <2450634.jE0xQCEvom@phil>
In-Reply-To: <2450634.jE0xQCEvom@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 Feb 2024 21:02:46 +0100 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find a below a collection of fixes for the current release 6.8
> cycle.
> 
> Please pull
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.8
    https://git.kernel.org/soc/soc/c/0cf54e404d4f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


