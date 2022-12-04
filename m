Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74743C636F8
	for <soc@archiver.kernel.org>; Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32B4DC4347C; Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A8A2C433C1;
	Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670156416;
	bh=7hygP3aa7DPafU1O3KFivAvM7+9vJU0nIxNV0xOHKoA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Sef9T5sL8h0euQr2Y/fV0rb2UFrJ4b68pY7xcwoKbclTletbaA1hfnbx7xoSuux/C
	 TFroBxYaOZIhXPzVTmO19zk9AGqKB6RgQXLU6UJj87gkVx+X/yXBn55Vlx9+fXYF4v
	 x8nECBsttPzZI2vQNLuEaiFF60OAEuFBC56JYgTKrifvvhWMpvMxUDO5uRXSHo9Np0
	 LTJVXn2DB/LHZj7p6+F0OlnhKPcwXPp8FbuYJXnhe2Qb7/jP+rUnw94JZfiUjmfqdx
	 qWMM1Mxy6gSZAou9QDvSVL+CVl/hv+DPQ6OcWVMkfCmX6v0dpI/3pWexUyGxejORs3
	 hVpf9hIXrkCeA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EEA71E21EF1;
	Sun,  4 Dec 2022 12:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] ARM: mmp: PXA168 timer fixes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167015641597.6046.760220284472846130.git-patchwork-notify@kernel.org>
Date: Sun, 04 Dec 2022 12:20:15 +0000
References: <20221204005117.53452-1-doug@schmorgal.com>
In-Reply-To: <20221204005117.53452-1-doug@schmorgal.com>
To: Doug Brown <doug@schmorgal.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat,  3 Dec 2022 16:51:15 -0800 you wrote:
> This series contains a couple of bug fixes for the PXA168 timer. The
> clock wasn't assigned in pxa168.dtsi which eventually resulted in a hang
> at every boot after the clock was disabled. Also, the timer read
> function wasn't waiting long enough to capture the new timer value,
> which resulted in erroneous high CPU usage percent being reported with
> CONFIG_NO_HZ_IDLE=y.
> 
> [...]

Here is the summary with links:
  - [1/2] ARM: dts: pxa168: add timer reset and clock
    https://git.kernel.org/soc/soc/c/7b3e7df92a06
  - [2/2] ARM: mmp: fix timer_read delay
    https://git.kernel.org/soc/soc/c/e348b4014c31

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


