Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EE5C3DA4A
	for <soc@archiver.kernel.org>; Fri, 12 Jul 2024 10:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37E78C32786; Fri, 12 Jul 2024 10:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21971C4AF0D;
	Fri, 12 Jul 2024 10:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720779631;
	bh=MK7g10mdlBghphnRYx1v2T5krgx5ShWut2oee9SQWrU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tjl5BJT0d4aOXwXWSkbZRDwn0Wwq3uNmj85KdmCwLc3zbTyzZCLuYaLKDrIPvkIGH
	 7qZ5+8+juO09s5UW1Wb0kSDyfFcglCI2MegV08lbcS0byRAIUANjrB45RUJcnxmz4Y
	 LZEgKH/A/Tb6h55jiI/Jvxs4aHizznLCSTtenFpiKw4r4NAIFhTF/FYS/MQio82LpZ
	 HMeVosF/FM+yjUHWpsYGhA4U5aeDFDpEQ8ow9OORkJui/a/spLzu8CDCmE9ZRmN5Fk
	 KB+GDeISt3gA5+R6jXA4A78mRlrrhZEL0y3f5xy/es2A/Smc8BSJaNb5CVMd2xVxgh
	 KXe89/UMHp6gg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EC43BC43468;
	Fri, 12 Jul 2024 10:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner SoC driver changes for 6.11 part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172077963096.4770.14923137468609477210.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jul 2024 10:20:30 +0000
References: <Zo7T4YsfamN0PbYK@wens.tw>
In-Reply-To: <Zo7T4YsfamN0PbYK@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 11 Jul 2024 02:33:05 +0800 you wrote:
> Hi Arnd,
> 
> Here's a couple more Allwinner driver commits for 6.11. Both of them are
> minor cleanups, marking regmap related variables as constant.
> 
> Please pull.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner SoC driver changes for 6.11 part 2
    https://git.kernel.org/soc/soc/c/77dc111f6da2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


