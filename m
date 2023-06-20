Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE6BC04FE1
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EDCB2C433C8; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8106C61184;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=ruNlcelNrkJHXLNAoluz7nKGSIXBqUySizl0RNIEzDw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OScsm+eOjMkEdySz0ngLAqLYnjB4VDWc6F/osDM7Oo/rTN1kb25cZWgV1HM9V2gxE
	 K7nN39YXTBX7XbIqAMRTCmxu5H95jFUxYBqZcLZugtomslZhyN+I4R9UOvKGvu4lqn
	 G657IQQp/ErAaJHwnz38BGXByMCAviS6XY4gW5ZMfqN7eiE+P6qQgFPBe5JzhXzi1h
	 pxWx5tl6O8Z7Moja/i2MFuN4wy0/l/PIgrQYulFm4npKlyz+PqOaMxjESGTb4LUXda
	 x4YZd71SYL7C0E/eJBwGhnJghP/zzJ7m8GMdrUiO87N9ZsxRHK1OJuFo51BGr8fC17
	 g/74Te9yH6R7w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C5BF1E2A035;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.5 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611280.12258.88094318432539949.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <3239799.44csPzL39Z@phil>
In-Reply-To: <3239799.44csPzL39Z@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 11 Jun 2023 23:11:20 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in a subsequent pull-request
> Rockchip changes for for 6.5 .
> 
> As always the 64bit DTS part is the big one, with some new boards and
> yet another lot of added support for rk3588 peripherals.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.5 #1
    https://git.kernel.org/soc/soc/c/d0b5886bee4b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


