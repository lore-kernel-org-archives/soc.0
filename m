Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603E7C6FA94
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 51598C4314C; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3AD93C43152;
	Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663950027;
	bh=2DewFKgH+wKrTV/423HORQyXMTMa7+nyYzTfSL6+O28=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JSQunkIG+kq7qnBCmal1d/Zr1ITaDK2YCTWPbHyIyc4GPyeP45FYeyNairywr3F6S
	 PTAw2C9ntE96bqQ/Hhot5gNpdKh7H96+KttM46zgG0PYjkDQo9dc4jLx39/vqXfIyp
	 IlkKdT/GCWxtsPMRRQxJtmwWogKS2LXFcbzwvh0Xq5eYMfQsVzjyj5qjShpmlc42iL
	 FtIZgW2qfF+Oe2JbD2yRWJTPJCdcORT8xqpnZcejqx0cJciQbld5ZXhc0hRTVASLzA
	 UM003PWGSQnuE5w+YWQvCK/PVe7QGNJnDhhi4ihM3ZkIQ4wNjVCO2TsHdi3R8yPv4U
	 ZZOYexfl2RUbg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 269DCE50D6F;
	Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner config changes for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166395002715.3905.7776279164446600031.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 16:20:27 +0000
References: <YyePcA5YHOZjdOf7@kista.localdomain>
In-Reply-To: <YyePcA5YHOZjdOf7@kista.localdomain>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 18 Sep 2022 23:36:48 +0200 you wrote:
> Hi!
> 
> Please pull following config changes for 6.1.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner config changes for 6.1
    https://git.kernel.org/soc/soc/c/e1381b13eef2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


