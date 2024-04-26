Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4DAC25B5F
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 16:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 672E1C4AF10; Fri, 26 Apr 2024 16:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50AF2C32783;
	Fri, 26 Apr 2024 16:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714148483;
	bh=OdVShDNLlo2wB0OexPQHt12My96Qlj63iW6MJFkxayw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=am+stae1OrfgKDaKU98IiG6RWIYGwlOToKhD7CmyFOoqC6MfFPEQjdCqdgPpwKXTL
	 pf5GdcQCIEH62f0l3A/I2FnUlsLduqtaLC1H+Kc02VUBeyf8EL2RoZNkW/qkXP9ed7
	 yO8VdPegkyvEhwODW9MpZJ1VvMVGTziQRr1Px2Pn73un7xqd6ki6nmPmhDclV6X/Ix
	 sdOigJiDv6In0aIZWHOdd1eEDBButp0vO4lz5RZOSXissQOFgvCCG9z/GjKT95t4O3
	 Jp8ea/SiRrZ0PK4I/MEW8wBCaGCoPRcnhBOjrVAK1t6LBxWELLUCyHyq8LUiAlG+7m
	 yL+w+4nmkR3QA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 394FAC54BB2;
	Fri, 26 Apr 2024 16:21:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171414848323.5338.8701420680702735732.git-patchwork-notify@kernel.org>
Date: Fri, 26 Apr 2024 16:21:23 +0000
References: <3413596.CbtlEUcBR6@phil>
In-Reply-To: <3413596.CbtlEUcBR6@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 19 Apr 2024 13:34:30 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find a below a collection of fixes for the current release 6.9
> cycle.
> 
> Please pull
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.9
    https://git.kernel.org/soc/soc/c/32a1eaa986f4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


