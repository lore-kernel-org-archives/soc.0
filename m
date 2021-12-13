Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DA3C41535
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39101C3460F; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FD26C34610;
	Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639405229;
	bh=KP43nJQd9VFXpcil1R7dPybn0nfZJ78uA1tdyYKxvCc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GL02bnTUqvtMw9WWiyj7z4xoY6kEi11fV4sALTsYMfzMcb85XbR0MqCBmWFJdVLS4
	 gHn5N13mgNln44nZv7JIuP+OguJSWPsfxqg/VRU7AVL67dEWR+WfXYmBEDM/NEVnbH
	 ya7PzLftAnDadg+RoXtemEDtLez2ki/2Q/4BN0iUWtCal12349cLi0YNFYPq0J9RS0
	 TZhYwOnFeD68TELWZ+aYlzi5lXlWqsyN7MNpvl1SIFNdDHyE6Od1CMfrT8Tn1Ibkd8
	 IgpSxNT8aJlqeALQpNC/0w6Z85WdRD3fYSVvgFESBFAk/j6DDQ6p0SJfheWi0Rbxou
	 0MG5n/CJ9+oyg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0C91A6098C;
	Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip soc fix for 5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163940522904.6863.10859242560557867593.git-patchwork-notify@kernel.org>
Date: Mon, 13 Dec 2021 14:20:29 +0000
References: <1827929.9bfCS3lLB7@phil>
In-Reply-To: <1827929.9bfCS3lLB7@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 13 Dec 2021 11:05:51 +0100 you wrote:
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.16-rockchip-socfixes1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip soc fix for 5.16
    https://git.kernel.org/soc/soc/c/38d5b296d39e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


