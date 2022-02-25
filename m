Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E15C43219
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4CF4CC34103; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 313C1C34100;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=gckqj/3HDJikhScU1UI37snl41bKG0cFjQDdfCrqNRs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OQvPlRt1LweS3j6QXKiph2+fJEJ58dmebKEFOc/8OjrtaR+1pW1SUEICmJqaIRSv0
	 6/rEFhpbXqE6AalnA38a1R6e8IxU01NZKenpsg+3nVkutjTT2WmrrjpZQnaQp5hj17
	 HqNse1qfPb2kmLQI0ayGc3hrLZF1sNy+ATRH5E+jA4zxbUPh1DZsDRLF6qS3IfsPwv
	 F3qSjhfrJnmEeTqUnva4E4WjhJNANm736dNulFz3AcGZAjCXGlmnn+cA6zsCrcX7oT
	 d0Ss5rHAgFpiAJp9Q8D20GuRZp74hv+poBM8Q3V0XozeD2utW7lSYO/zY83zL/1xfk
	 ZznVBB9Soyuug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1CA2FEAC081;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: nuvoton: devicetree changes for 5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966311.15608.9321407968721301311.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:03 +0000
References: <CACPK8XdjF6dG04hR+iMpUP8=LSJi5x-hRivgCGDaY7o_461eJw@mail.gmail.com>
In-Reply-To: <CACPK8XdjF6dG04hR+iMpUP8=LSJi5x-hRivgCGDaY7o_461eJw@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 21 Feb 2022 09:00:36 +0000 you wrote:
> Hello Soc maintainers,
> 
> Something a bit different, some Nuvoton changes for v5.18. These
> changes are from Jonathan, who hacks on the legacy WPCM450 platform.
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: nuvoton: devicetree changes for 5.18
    https://git.kernel.org/soc/soc/c/fee1601dc26e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


