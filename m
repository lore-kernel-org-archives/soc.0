Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE52C433F5
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 113C7C340FA; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC200C340F0;
	Fri, 25 Feb 2022 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=6jErKKOyq3cy4YWpI1gI0hxUoSFsHhk5UK3ifZiMOJE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=orXvlwyveWsyxkIY2N5onPDp/0LV47Cjlkng9HRlG4J7lnX6221VGe+IR6UQMsf03
	 rqa83DcHCBiWnWoS43JtSG1SDJEehkH/8YbfHD9H/7frnpkCGvCxUjNjFCQB/cuiDt
	 c6Uo7ezm9mhWP7RpjkZ0g4W7NGNhi+cRJoYi+TPbekgrnJmphIVu7xYczYpGC148lH
	 z/Utco9ctK1f8WpYTUPxSn2WVKh+afkINZIxIdfshWlQhzrbgADYMIcLsGGdh33Cf/
	 vDcMYZdCdx3VNtty+mJPfHoS2+DEcASjBZtlMKpljRy2ND3t8JSIWeuac5xMkFajWz
	 S0F0X7QWVNg5A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CF3E7EAC081;
	Fri, 25 Feb 2022 17:21:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] ARM: dts: socfpga: dts bindings cleanup for v5.18,
 part 1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966284.15608.5584375070724280689.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:02 +0000
References: <20220211112556.98940-1-dinguyen@kernel.org>
In-Reply-To: <20220211112556.98940-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 11 Feb 2022 05:25:55 -0600 you wrote:
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_update_for_v5.18_part1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] ARM: dts: socfpga: dts bindings cleanup for v5.18, part 1
    https://git.kernel.org/soc/soc/c/ab2dad6f9e74
  - [GIT,PULL,2/2] arm64: dts: socfpga: dts updates for v5.17, part 2
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


