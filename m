Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4C6C433F5
	for <soc@archiver.kernel.org>; Fri, 22 Oct 2021 20:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E1262611CB; Fri, 22 Oct 2021 20:10:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C9F2661052;
	Fri, 22 Oct 2021 20:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634933408;
	bh=ZdxE4nyGjtHp53zI7WW5e/756UvcV1xdAcbbpI6vp2E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jiM+1qwdKXscvzqwadYeP5NyLZjXiXGykDw6BPoGEVGwZrrkQOrwGOgUvjjTWFxuL
	 dI9TE2IdWMfR2cbjMIRgctszF5FUaVmLUr2w/ypFTeGto8CSQ9zw9gLxqJZFHC7x5a
	 cUxCmkglxJlKAa9BcNmLA8xp1cPxlcw0N6sf7ZtSueGJ/PTQ87BOEK3oWrWoUUb0jQ
	 M/3pmr3/OcI5yQaQPV2zlC25KylAiWQcw7qJFA42JR0am8Nu/e1bFX5W6/TxgCed1y
	 yAe8ju9r9rS8yuSBQCVjvM8JoEzyOa6PRKQ/eyCgtZcuZjCsJbfEWd26N2tW5QZUvh
	 t4JlL5zn4tvQw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B93CE60A47;
	Fri, 22 Oct 2021 20:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/1] Add support for the Mercury+ AA1 module
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163493340875.6553.4307412881426661762.git-patchwork-notify@kernel.org>
Date: Fri, 22 Oct 2021 20:10:08 +0000
References: <20211021151736.2096926-1-pan@semihalf.com>
In-Reply-To: <20211021151736.2096926-1-pan@semihalf.com>
To: =?utf-8?b?UGF3ZcWCIEFuaWtpZWwgPHBhbkBzZW1paGFsZi5jb20+?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 Oct 2021 17:17:35 +0200 you wrote:
> The following patches add support for the Mercury+ AA1 with an
> Arria 10 SoCFPGA.
> 
> This version is almost the same as v3, only difference is having
> devicetree Makefile entries for arria10_* sorted.
> 
> v5:
> * revert `move devicetree aliases to socfpga_arria10.dtsi`
> 
> [...]

Here is the summary with links:
  - [v5,1/1] dts: socfpga: Add Mercury+ AA1 devicetree
    https://git.kernel.org/soc/soc/c/8f0450c51148

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


