Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406FCC77B6E
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 09803C433AA; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8741C433A0;
	Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680619283;
	bh=T5sVo0+LHZVH1qhEC56gktDfBHB8qQHvQ4VEj1Aq28s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gNzY0plVHX55464vnk1hUcclAquCr3FSovKckRDanIuuMlCgxKzoiMAYulateMEtj
	 FwMwOUN41ie2gjCryQzNtjIiRPETPXPD7GKbNmOuP/wFj/4Fg4ulvQH8KFvLCA1IpE
	 7MMM+2usf/0mGZL9rPrzKaShh+qddU7r4UoTwJV34dCsJloUGhTbG7+qC9B9yJM9YM
	 MK2M0ueQn73rJyUlJTI9gqDFFK25Jg8D5TjfnbJwyS62MJqKkkZlg6wbB9Xp622Ow0
	 xLbGKA3oNFRniB95mY6tjvdEldjESShyPkq7GtXjHYpQFofWHV/s3Oocb9ZDwjwg+T
	 cZWo0xp6q8pjg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C60BAE29F4D;
	Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Clean-up for omaps for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168061928380.17322.15914596583809984644.git-patchwork-notify@kernel.org>
Date: Tue, 04 Apr 2023 14:41:23 +0000
References: <pull-1680180293-92168@atomide.com>
In-Reply-To: <pull-1680180293-92168@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 30 Mar 2023 15:45:22 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Clean-up for omaps for v6.4
    https://git.kernel.org/soc/soc/c/fb481b2e5a59

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


