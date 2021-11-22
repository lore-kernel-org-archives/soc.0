Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14626C4332F
	for <soc@archiver.kernel.org>; Mon, 22 Nov 2021 11:08:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9720D60FD8; Mon, 22 Nov 2021 11:08:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7BE0360F6E;
	Mon, 22 Nov 2021 11:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637579312;
	bh=m09++3fXIwt2xDSXHs2BTDqwwQojZY5xhF2C1EzG80g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FKGoAbPlIQWsvewP0i93o8ITB3jwNPjKznEq3jv+59yjv/hRIxBMO3O0TKiwEIVfC
	 afdSn8e8XBkpUhihKGyCiWj8MIDegOkz0BQGVDj12uAKvp2GZXLioqkklfVvtKWOiN
	 HviKWVBWZz1vlh67Kq825egB/hVlWoU/1JJGL2hndRxieUkfGS5qXuMkCtLk2n20Qj
	 gajsg01BuXKK3SzPeANrwrRBeT38VHDh30cfAKQ8owQIMR2paanLlQ6FE7cyb1yZBI
	 AbqSC/7NZQMQu9dmL7exHr72Zrt2S0LAxAqEqJYTyZmCIIfiuoex/50Z7TW+TkFOo8
	 8jdbk3vP0BKRg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6D88860A6C;
	Mon, 22 Nov 2021 11:08:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163757931244.7615.10118284845879600267.git-patchwork-notify@kernel.org>
Date: Mon, 22 Nov 2021 11:08:32 +0000
References: <20211118121656.4014764-1-sudeep.holla@arm.com>
In-Reply-To: <20211118121656.4014764-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 18 Nov 2021 12:16:56 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v5.16
    https://git.kernel.org/soc/soc/c/d17c4bf2c7e9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


