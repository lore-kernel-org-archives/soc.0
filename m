Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0EAC3527D
	for <soc@archiver.kernel.org>; Thu, 14 Apr 2022 21:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22EEDC385A1; Thu, 14 Apr 2022 21:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C9E1C385B0;
	Thu, 14 Apr 2022 21:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649970617;
	bh=8FTTbqdatoxIIX+vcd/REASPSCBQC54Pf/2JGSwC2aA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lF1dEn+gfDdk1PGX0knruBwrxkfJGVMWUs6e2qdsGr7cXQ4yBvZmSvvuPAVJJ/GdV
	 0FQjS7xHgGRWgJYMKEWv5VjfEqoIEvKpsLibOAqiznXXEvlD77UM1744rrKYi3U7L2
	 FyvLtNXKqcRpipfV5s1C2/Ow9dd8S4MXVaw7FBBIhCIAdQtBv+MNh6+muLDVzp17MU
	 yhGCK9Vln21QybW3H/WilzXJ74faXLaPfkOa3VUSMS2EntJmwAUMNrt0g5EM1s++Eo
	 EYxaGssYFVJS2xFEjKMvkwIBCj8rRRThgM/qMPPL5My/LVN9PW9GE16fHFLs0liaNG
	 Vvm0rql9MSnrQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EE0DBE8DD69;
	Thu, 14 Apr 2022 21:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Ux500 defconfig updates for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164997061697.10394.16594717125333271208.git-patchwork-notify@kernel.org>
Date: Thu, 14 Apr 2022 21:10:16 +0000
References: <CACRpkdY+_Go4XNzOh+Rvc24QBnUud2k-S7VQuaH5d-j71_dJog@mail.gmail.com>
In-Reply-To: <CACRpkdY+_Go4XNzOh+Rvc24QBnUud2k-S7VQuaH5d-j71_dJog@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 7 Apr 2022 23:57:34 +0200 you wrote:
> Hi SoC folks,
> 
> please pull in these Ux500/U8500 defconfig updates for v5.18.
> 
> Yours,
> Linus Walleij
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Ux500 defconfig updates for v5.18
    https://git.kernel.org/soc/soc/c/cfd08b94bed0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


