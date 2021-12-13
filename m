Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106E1C4167B
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE903C34604; Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9787C34605;
	Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639438242;
	bh=fJCNWoaq3PhUAguQJhy9wP6r4i2ztmM4Yy2JuGH+m3A=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TZnzdvYMvMrMEWEIlV6xRTlhsyEnNyphAjTZL7Z1nbYkeM09RGp7/iKlN3g2CbQKi
	 0n2CIGGLzj+d6cppNw4MbG5sPVK5eUsLbMLfQ662CnN1yG0Z0/cwWqy61YfwgoBDdO
	 qG1XWScUPPR2UZ5N9C1tKJ2Qw3pOLD8+MA1LqCx9cP5w8ks0Vbx8LyOXfT7Q9S96Ti
	 PO5hPip9/PHXOBefcOZI1B3Rf6L9OKFyBGPSqsL4kA15YZG/I61+z6CE//mCTc7M0z
	 s2rE/0oWKxddyvD0q0J/8vfEIyvpsaoHkX0etml114oWAmVEsculpskZRNmFiQjlTP
	 nocTphiKEooRA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9F07A6098C;
	Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: gemini: NAS4220-B: fis-index-block with 128 KiB
 sectors
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163943824264.22239.11940940798112883907.git-patchwork-notify@kernel.org>
Date: Mon, 13 Dec 2021 23:30:42 +0000
References: <20211206004334.4169408-1-linus.walleij@linaro.org>
In-Reply-To: <20211206004334.4169408-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  6 Dec 2021 01:43:34 +0100 you wrote:
> From: Christian Lamparter <chunkeey@gmail.com>
> 
> Steven Maddox reported in the OpenWrt bugzilla, that his
> RaidSonic IB-NAS4220-B was no longer booting with the new
> OpenWrt 21.02 (uses linux 5.10's device-tree). However, it was
> working with the previous OpenWrt 19.07 series (uses 4.14).
> 
> [...]

Here is the summary with links:
  - ARM: dts: gemini: NAS4220-B: fis-index-block with 128 KiB sectors
    https://git.kernel.org/soc/soc/c/4754eab7e5a7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


