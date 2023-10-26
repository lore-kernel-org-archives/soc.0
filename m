Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4C7C25B6B
	for <soc@archiver.kernel.org>; Thu, 26 Oct 2023 15:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D24A5C433C8; Thu, 26 Oct 2023 15:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B88A7C433C7;
	Thu, 26 Oct 2023 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698333023;
	bh=ZbXbWoXOco1nnKtgT8Y1t5Zofl5Zwe8HTNgpluhdfe4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GtLQtOuK5GRDM7EdlRxrt8yITnjPbhVAWTyLY8WN6dNzed7zVDK0A3PzY2BIFa6T1
	 C+KITPiGQGZENl3hBhoYfIywJG8ruXbtaDAla/jw0gGG/oitHMOHrYD4NG1jEPRVfu
	 ScN8S7MhMfQ0CJWyS0HSigBdUIy/tjWkpAS3hS6w8LVqN4umdXxQCfO/sz6t55tsKm
	 M1KEDhLUHvbGp1HXL+IWEoC5K3jJf18ATj124prmDqLF+qD1mUxB/YJ4e73YeIWXeo
	 wSlMAN+Dvfn3/hHvHi8eB8vepKFwvpx0e3DQZfdZWnILN5wuAZGInff0+bO7Z2w3ux
	 O4hpp9/Rj3+6A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A078BC3959F;
	Thu, 26 Oct 2023 15:10:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas fixes for v6.6 (take three)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169833302365.28075.1074134271445698486.git-patchwork-notify@kernel.org>
Date: Thu, 26 Oct 2023 15:10:23 +0000
References: <cover.1698312384.git.geert+renesas@glider.be>
In-Reply-To: <cover.1698312384.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 26 Oct 2023 11:31:57 +0200 you wrote:
> Hi SoC folks,
> 
> The following changes since commit 1531309aa2092a96c092fa662863ffa53da3ba93:
> 
>   soc: renesas: Make ARCH_R9A07G043 depend on required options (2023-10-12 19:46:49 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas fixes for v6.6 (take three)
    https://git.kernel.org/soc/soc/c/736a4aad8a9f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


