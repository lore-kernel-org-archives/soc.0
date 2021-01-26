Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F406CC43381
	for <soc@archiver.kernel.org>; Tue, 26 Jan 2021 23:20:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AB08764D76; Tue, 26 Jan 2021 23:20:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 94E2164D78;
	Tue, 26 Jan 2021 23:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611703211;
	bh=5ObwarQyHBfGxEnkQV7K3cpXFDFIPrgIMYEiWCt0Q9U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OuOBX+ioEX1iDkd7qk63EKoFrwx0sbR393SwqzRbpd9wA08BDs9cFecB/BT0Fcz9s
	 QTUoCNpEVNzRZyfe2gsWVuH/dl05UANd0YoxzDHfcIdY8X0vUZXd3vEma9DDV76ZOY
	 wxIBiR/iVDWTJy/0pY7Ig17pmhqm/8ARMiLGFRnJBhpuWlex9Niu8jFqdInRXT69sQ
	 vXiPQT6KkxX1rXk9EV5vaXxKkr65GQfV+W/FTKi2iFlkSgE7WYCEjzLhkWCAz2m+eF
	 vo5VD0L6Hqul/m5sBJAN+zpd7TLkTtgLDmEusLxNOt21qXw4bZf6+LPmA6maKm4M4u
	 c99LdtgPD1RoQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8C764652DC;
	Tue, 26 Jan 2021 23:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT fixes for v5.11 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161170321157.26028.14005655465241794196.git-patchwork-notify@kernel.org>
Date: Tue, 26 Jan 2021 23:20:11 +0000
References: <b7379980-857e-736a-85d8-58e2bd300141@foss.st.com>
In-Reply-To: <b7379980-857e-736a-85d8-58e2bd300141@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 25 Jan 2021 17:21:52 +0100 you wrote:
> Hi Arnd, Olof and Kevin,
> 
> Please consider this first round of STM32 DT fixes for v5.11. It
> concerns DHCOM/DHCOR fixes.
> 
> Thanks
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT fixes for v5.11 #1
    https://git.kernel.org/soc/soc/c/e6777b8d35dc

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


