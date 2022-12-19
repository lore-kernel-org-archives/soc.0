Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2CDC3DA71
	for <soc@archiver.kernel.org>; Mon, 19 Dec 2022 16:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8880C43398; Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF500C433F1;
	Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671465633;
	bh=yjGcunqEhfT0FycymJ83twzycP2Gt+wFLHbvcTmRqNk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IaNRgA4IEvG0MB1emTFNe/ZfBNYoeAZOKHrTFb66AAj25kXucoSOiSXsgdTpAexGD
	 hL0VETPyinQXVNmrm7W6tCWmOoGuH7a45HlOZYnnb4dkHX+nyXuWwPTvnJqG9SGu2x
	 9RQ3tMIoLhogetH0FmPrmwETfivXtlJrcbE+MVd74lW5G71ithRDkstiErPjpOdXkP
	 qyY47DS+0CM1CHq/NKpcVqQrZ1SzDdGK5yswj4vlowN3JpUna0XTiVdZA1NpUl8CgM
	 dtGJKQQX4KgggvBlv0gCsAUTnwkjfxOxYHCfOSIVaZSuca4MpFILdOpftpLIIpJOpj
	 7QBoILv3cOAOQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 94434E451B8;
	Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] [v2] ARM: pxa: fix building with clang
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167146563360.24111.11277625536540898773.git-patchwork-notify@kernel.org>
Date: Mon, 19 Dec 2022 16:00:33 +0000
References: <20221215162529.3659187-1-arnd@kernel.org>
In-Reply-To: <20221215162529.3659187-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Dec 2022 17:25:14 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The integrated assembler in clang does not understand the xscale
> specific mra/mar instructions:
> 
> arch/arm/mach-pxa/pxa27x.c:136:15: error: unsupported architectural extension: xscale
>         asm volatile(".arch_extension xscale\n\t"
> arch/arm/mach-pxa/pxa27x.c:136:40: error: invalid instruction, did you mean: mcr, mla, mrc, mrs, msr?
>         mra r2, r3, acc0
> 
> [...]

Here is the summary with links:
  - [v2] ARM: pxa: fix building with clang
    https://git.kernel.org/soc/soc/c/4b88615950fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


