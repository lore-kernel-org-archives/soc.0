Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0609ACE7A91
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 20:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E939EC4CEC7; Thu,  5 Sep 2024 20:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3682C4CEC3;
	Thu,  5 Sep 2024 20:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725566438;
	bh=uvlFdrfGBrzeAjNJpLkQycsdlY7nWtY7xasQMbOZLV0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=d8SmzxubQMy33f0zUHuARLhYkkFODRenbxMruEGhYFtXTNKQbnjpjxWNyS9AMNswR
	 Rtq10Sq3oBo12dYNEK7DTBf3XOZk6YzOBfhM9xWZ77pSMNGrPjaQguc9swyFpPBuQQ
	 6oHHWht2v1FUecSL8xZMM0eCEcCkmszcoFBWp4LyWr+zhyTw9zpZ+Q/DBjgh9jOzL0
	 Lyx8Xm77tvsO5EQTq8BbS7i0zPoJS4ubw3dtmSNXm33JZA5db5m+5izcJU/NKGjSJV
	 qsRQdj6+HD59iNRVCyoozaGrRFVUA59ZzC+zHUXhEmusteC/6N/LDYh0i/rnNHVr3Y
	 b6ns1wW5v0afA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADFA3806651;
	Thu,  5 Sep 2024 20:00:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner SoC device tree changes for 6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172556643948.1812101.16746731533750404085.git-patchwork-notify@kernel.org>
Date: Thu, 05 Sep 2024 20:00:39 +0000
References: <ZtnZRhTwsBeO7Qtb@wens.tw>
In-Reply-To: <ZtnZRhTwsBeO7Qtb@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 6 Sep 2024 00:16:06 +0800 you wrote:
> Hi,
> 
> Here's the Allwinner device tree changes for 6.12. Not a lot of stuff
> for this cycle. How the PMIC is talked to was reworked to make it work
> better with U-boot. And there's one new board, and the charger for that
> series of boards was enabled. Last, thermal trip points for the GPU
> were added for the A64.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner SoC device tree changes for 6.12
    https://git.kernel.org/soc/soc/c/15eb92636c60

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


