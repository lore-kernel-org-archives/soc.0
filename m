Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2254EC05027
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 14:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF86EC433D2; Fri,  3 Feb 2023 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA8D1C4339C;
	Fri,  3 Feb 2023 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675434029;
	bh=RZo3Fuc5/zExizJO7JFV4jWTbbaVhPL6TyXP+7qbg4E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nGZKXCr8exk4+aeGvZhTlNXipRFLfG9eC/rizC6W065+AEKCshvZWiJhNIU7StpsU
	 VNDMCBG502cg5LZjevZ08KN8pmG9W2BLYjVEBOuZR+CkJ0ZLAW8vgSEVv0L/i3I6lE
	 vDVV2KfU3J+gFbdqFHNxwha7kbyJ525QkwkCjiC0eEVUaaY8Ll0E5oNjH01IxIJpD8
	 9kN8fVhCCem4FIYOjJBdDmu/JDIWQQ2g6L1B+Uf5jYvBTQygMaXHiOe+P8Wqd/SolM
	 T+1mCrif7gPyr2JS6K70tuFFUWwYtgkBndxYSyHBFQRLXrQtItTEYXwVq4SUxWVIqK
	 3n4raZ0NjwTZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9F2F7E4448D;
	Fri,  3 Feb 2023 14:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167543402964.11069.13998778040201894401.git-patchwork-notify@kernel.org>
Date: Fri, 03 Feb 2023 14:20:29 +0000
References: <3514663.mvXUDI8C0e@phil>
In-Reply-To: <3514663.mvXUDI8C0e@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 02 Feb 2023 00:01:54 +0100 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.2-rockchip-dtsfixes1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.2
    https://git.kernel.org/soc/soc/c/07975ef0faae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


