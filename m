Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621CEC4167B
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 14:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D01AC385BA; Tue,  3 May 2022 14:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2637FC385B5;
	Tue,  3 May 2022 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651589422;
	bh=+y7eVFIK2RcysaxxrkMnczaKk2sRQEaLxkgwk81cm3I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XqMNRhixeIN8AqYi3sPW34ZaPHiV5j1kj5hNCET6a5atpmKeMEz8is4xjV2WpE7HM
	 pOw5VsxBEzgI2/77QvCV9oTI0UTBcS4Nc+FllmvhFboSXL7SoMefCEoJrOp0nBYQjN
	 5JF8wCn2MsJ6wW3ExPuC3dVOqL6zT0iInKI09QNb6gKSRC6nCR7i1xc+nKsNXF1pkZ
	 UP8rp7F64L1HPjk2SNdV8UFmm9/ZtxzpA/Zz07oCXV+GbLalKVxfBOpWsaJA3Qq1as
	 2KfeFVGAMiqCbHUTWqVgmcWftuYEqJJ4xHRg37aoQnJFPyr0raiuLPmRiGnESeOdmS
	 xmRf4cdVo8wqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 09131F0384A;
	Tue,  3 May 2022 14:50:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: Fixes for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165158942201.22061.11135218511831093220.git-patchwork-notify@kernel.org>
Date: Tue, 03 May 2022 14:50:22 +0000
References: <CACPK8XdhLfafOfqvR0r7p6V6AhtNXD4uZGaz7Y+Y4P-rc9p0tQ@mail.gmail.com>
In-Reply-To: <CACPK8XdhLfafOfqvR0r7p6V6AhtNXD4uZGaz7Y+Y4P-rc9p0tQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 2 May 2022 06:42:03 +0000 you wrote:
> Hi Soc maintainers,
> 
> Here are some device tree fixes that I have for v5.18. They have been
> ready since the merge window closed but I've not been available to
> send the pull earlier. If you'd prefer not to take them now then I
> understand.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: Fixes for v5.18
    https://git.kernel.org/soc/soc/c/2391e0d7bd0e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


