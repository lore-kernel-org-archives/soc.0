Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821FEC64EC4
	for <soc@archiver.kernel.org>; Mon,  6 Feb 2023 20:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B978C433A4; Mon,  6 Feb 2023 20:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32B0AC4339C;
	Mon,  6 Feb 2023 20:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675714819;
	bh=4bjCZUDCf+N3roTeiekCxKidW6kWSA/7bqwHFV11Gx4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LsqUn8pym4e2LcvbehoP2ixj6KJicbRcIPwIKCVST41CrFjYeDBQfFY0kkDWdgKOi
	 Ia3v7v4KIwsPxFwmcB8+0S4Ji+ZcAE09XWKdk8/pyRf86g6UfObpPfphmM8xups9Ff
	 luBUYCL/GbeBZIKTiYqiT8+H1Z+Ylhk8lr+DjCb9V8kReoGXYpgmeL0Heq9uodI5xp
	 srKON3ZC24f21PO7AFxR87Lkkv5mVa64yDLFPfZmzctfYjDAXCUjH0yazBUej9HDd5
	 azBaThmU8DFU9AicMsLA8cU8VmhlrSq8/Cuyip0n1q/SKuJVN+TGDVHWFzwyFY/O0T
	 EZwSKfK2j/2YQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0BDADE55EFD;
	Mon,  6 Feb 2023 20:20:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm: dts: socfpga: dts updates for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167571481904.10318.2612547464827300558.git-patchwork-notify@kernel.org>
Date: Mon, 06 Feb 2023 20:20:19 +0000
References: <20230206162425.311593-1-dinguyen@kernel.org>
In-Reply-To: <20230206162425.311593-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  6 Feb 2023 10:24:25 -0600 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm: dts: socfpga: dts updates for v6.3
    https://git.kernel.org/soc/soc/c/cfd5bdf3e98e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


