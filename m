Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0ADC001DF
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BEE8C433BD; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 831AAC433A9;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=xJSQKByjFcJOvRQhZLdUZYJTSqhCd7iexpZH1sj6CMw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ptp3oLl5ZkX16yUgJMZtjLyhtfI7xb7NAifzBPLC7in5r0wvuAELrJxrgjK1x75zI
	 OtgwOu8AcztGg2jLjpISgaTjACKF1jaeWxAaibr7XRpKWZ/ZzpLpF6eFUbH52uin5l
	 tWB67zctk6bfzx2aN/lUq16gxWct9XiN4r1pKkAgQCnVQ6wg6tSBHEz/lVpN9OTW72
	 wvsAh/u7pTo6/dZI/8gvfg8PC89MsW1rVX61LNPQRB1lHAPqO8bmv2WO9UXP8hyyXe
	 n6k4fdJd+wnvpn3+OhXxwao+cHma08fHzwHKXbqLdG5ubQDapP/EyUc7gUJBN+lk8m
	 N7af2P2LWxu1Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6B88DE2A038;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mediatek: dts32 updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611243.12258.12445868077305340082.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <98e21acb-d792-6a8c-2de6-12d5af8a8111@gmail.com>
In-Reply-To: <98e21acb-d792-6a8c-2de6-12d5af8a8111@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Jun 2023 18:27:36 +0200 you wrote:
> Hi Olof and Arnd,
> 
> Please have a look on the arm 32 bit device tree changes for this round. This
> time it's rather small and only contains smaller changes to the SoC used in the
> BPI-R2 board.
> 
> Regards,
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mediatek: dts32 updates for v6.5
    https://git.kernel.org/soc/soc/c/f07c96511d00

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


