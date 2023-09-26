Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B101E7F131
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 495DAC116CA; Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30B44C4166B;
	Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695763280;
	bh=uyD6z5Pj6brlo02o42Xrkpa7sDUQJEmrbAVwmit4z0s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZA86nzJF55mW1G+XlPYhsU5Q/X69u+nAnec/SFG2/vRItx3TCJj+tvZyrEK6Vu5Ze
	 fVyGCZE2ncEpPFkzqwGrGg3wU0LScrhACEvH5x+niS2LV2sQ2MOZxiIN/bFSJu/cA2
	 Y3Rz4i7zMysDcUn5rT6BF77CW8WJ9aDd5Njq22Z/hpzYSpgSMKf6gwPIdZOQxpJQhg
	 O2p0A9upqCTaL9xtXRg62yyQPmgQ9kKNRzIEHnVe8HWvvTqP+0dXdpQhTeWFEYDVht
	 Z7grO09EeFtu6EmpmkJpFOELoUdFlWeamavgO0gCVq4NTzC8aYjaddOle7DET0GAgS
	 9mAWxPhtm7Kxw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 12A2BC691EF;
	Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetree fixes for v6.6-rc3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576328007.24546.200899249000536526.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:21:20 +0000
References: <20230916-previous-oversold-9d30891ac6cf@spud>
In-Reply-To: <20230916-previous-oversold-9d30891ac6cf@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 16 Sep 2023 12:40:10 +0100 you wrote:
> Hey Arnd,
> 
> Please pull some fixes for the Starfive devicetrees, been sitting around
> since before the mw (but after my last PR), so figured I'd get them out
> sooner rather than later.
> 
> Thanks!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetree fixes for v6.6-rc3
    https://git.kernel.org/soc/soc/c/aab8130550da

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


