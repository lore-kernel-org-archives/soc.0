Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC346C00528
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD582C61185; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5E56C433BC;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=fWwjNWdzpQPHPBVyH1V9xd1MnZQjkBm98gBy+yPvrCE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RRAbbX06KvJ/wglpwNQaW+HqE+VTlmzgHvZWMacBPixdlL8wL0JoEiGnVtLdigdx5
	 aTb1tPexxQe4Nunl8MUWKwFVZ2q2YV+AMNgRtKQF/1ijVgnCTWH0MKsuNjF25ttLNI
	 pIttOBOg/LAwU3x8gfcMZngopuZ6VMtdYnY759nGr+PB/g+A58BqVZmZwqoW8e5NTg
	 OAUEwbL8ZQ60rq4acKKOpJKOCOrBWvz275G0zhcInUrMONV6O1UpE2qnq2e1fY6cdP
	 hd6Ems7gQJIEVvOrpaXsWFZs3ZE5jkdAYm5xMnopZFBUSx4KFaguJfREmYPD5g2oEW
	 pj1pV7Ps+LAEQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 92587E301FA;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] i.MX dt-bindings for 6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611259.12258.7698089169899117034.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <20230610072530.418847-1-shawnguo@kernel.org>
In-Reply-To: <20230610072530.418847-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 10 Jun 2023 15:25:27 +0800 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.5
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] i.MX dt-bindings for 6.5
    https://git.kernel.org/soc/soc/c/3230271930ad
  - [GIT,PULL,2/4] i.MX ARM device tree for 6.5
    https://git.kernel.org/soc/soc/c/f50a4e594db8
  - [GIT,PULL,3/4] i.MX arm64 device tree for 6.5
    https://git.kernel.org/soc/soc/c/70cdf5e28c08
  - [GIT,PULL,4/4] i.MX defconfig changes for 6.5
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


