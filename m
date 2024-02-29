Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBFBC54E59
	for <soc@archiver.kernel.org>; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0DD4C41674; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBB66C43143;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709226129;
	bh=NLLJfUvGGp5708Gdk7VF9cx5qqLzbMjXJNzF80TDcaI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cK6dQUV4jMRA0U0CHRYfsIdICwWCmO967v2R6LFwC/XLtLAO9k3KsvtsN1EWu+ZjY
	 0lrIa/byFCl2ilCe812Yra2t1+Sb32V41xtkFPUT8QAvlDObFZgahxL59BwWnL8+cs
	 1XStfwovOSR3U/lDYEH39DjJuIJM9TY8/KT//E3RJOXvPrgLhDdkaFgUKhjWwjlGHW
	 ewAMcpzIJnlz3NcKc4iC0G7CXtoZqufVvs0hbiyI/K/M8XZvoHPg2Ko2rMzfiyLm8u
	 WFXZENQ9yPq7kbhSGnyOLGFzZeEtxxl+Lb6urrEntxhjXFksFYuOwmsJGvj68/7awx
	 92E03joQeyTPg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 916AED990AB;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM Versatile DTS fixes for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170922612959.13542.14247349616763193585.git-patchwork-notify@kernel.org>
Date: Thu, 29 Feb 2024 17:02:09 +0000
References: <CACRpkdaL6j6OdixHFHoMms4e=tXEw_6ynBMFb6m8=7KkVgEedA@mail.gmail.com>
In-Reply-To: <CACRpkdaL6j6OdixHFHoMms4e=tXEw_6ynBMFb6m8=7KkVgEedA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Feb 2024 23:35:20 +0100 you wrote:
> Hi SoC folks,
> 
> these are some ARM Versatile DTS fixes for v6.9.
> Details in the signed tag!
> 
> Please pull it in.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM Versatile DTS fixes for v6.9
    https://git.kernel.org/soc/soc/c/5d9f164317e6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


