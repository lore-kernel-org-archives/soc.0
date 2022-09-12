Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C26DC6FA8D
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32ADEC43148; Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B0D2C43143;
	Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662996625;
	bh=T/TsYFcOJE5s35cGVG52ha96IK1yUDwiT966Fy9buV4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RfuYLrPBcA3QnV3B0Ac92gx4bDs/xsXhSWFaUuD2DgJjZQSd3rDqjPzBieuJCvydH
	 JZws0kTLkR53+BWPIvlFOu7jd7U7GGpy0ixLpL8obex+RUtMDGfTfulcwXWk2aE2ga
	 N8GvKdnhVjXZXA7ia9tQdDm/ucNk0FkbjwZkJCtLI5T10vkYdTHnd8szQdfNExjH2f
	 cr6IH0Ofr96mx8/D8X9QDsBcPOE5LzCMsfjYSbqgpSNHBKofx+x6sTpSA2V9jBMpLf
	 QW1MzHlK7VBMTZGMepfibJAnTKzGHRO3KjtEOA7VjE7WT6HUB9KEbDyazw27PNMow7
	 u02zLg4/v7QGA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 03F3DC04E59;
	Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 6.1 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166299662501.5098.2786917412135969914.git-patchwork-notify@kernel.org>
Date: Mon, 12 Sep 2022 15:30:25 +0000
References: <4766760.31r3eYUQgx@phil>
In-Reply-To: <4766760.31r3eYUQgx@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 10 Sep 2022 03:21:44 +0200 you wrote:
> The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:
> 
>   Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.1-rockchip-dts32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 6.1 #1
    https://git.kernel.org/soc/soc/c/b68ec1163c3c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


