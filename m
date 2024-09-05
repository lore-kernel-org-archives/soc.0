Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D6ACE7A94
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 20:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7BBE4C4CEC7; Thu,  5 Sep 2024 20:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651EBC4CEC3;
	Thu,  5 Sep 2024 20:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725566437;
	bh=yqO/XNFBkuyMa+4FbTrJUsuBBXmrsjCiJacyhvVugys=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=exRQj6VawEkEzAvPfyWwzRq3OC47BylyicaiXSfnsFdjHenfLYi4VuCrsgr34z5vy
	 IIgwGPxsrUyzLxVQ1l+jUzoLU1/W5wAodErngWWTJswCPsBvd6l5qX6IMPWS95kt6u
	 DcAnt9Ucpo2DZ74RhC59qP7jsSSlR5D752I0TUPZK7nWmDSq2E66c7Lv2TsU8fspz0
	 kB7UFHHMW/Xnt+ASI6P5lZrIE/yoWGPvgBloL9Y5117cBaAk+yNTr4QFVQ+zyhdZYz
	 uSMc5r9h4krDqPjVTzfonbXSnhv95d8MZYXD04CvA+gXlX6uFFshTrlz/6cFoOEEFw
	 c3s0cSwwGOjyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D5D3806651;
	Thu,  5 Sep 2024 20:00:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner SoC driver changes for 6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172556643798.1812101.6587395494720955009.git-patchwork-notify@kernel.org>
Date: Thu, 05 Sep 2024 20:00:37 +0000
References: <ZtnYUswjHdLRYq8Y@wens.tw>
In-Reply-To: <ZtnYUswjHdLRYq8Y@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 6 Sep 2024 00:12:02 +0800 you wrote:
> Hi,
> 
> Not a lot of stuff for this cycle. Just one commit for drivers.
> 
> Please pull.
> 
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner SoC driver changes for 6.12
    https://git.kernel.org/soc/soc/c/fc282a6643ee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


