Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DCBC433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 14:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1F37C6138B; Wed, 20 Oct 2021 14:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 09725610A1;
	Wed, 20 Oct 2021 14:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634741407;
	bh=HPFq5aerP9+Ykxfk9a/8Pnl7ACIOVKlXEZBrdMgYWvw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ojJzFiq4EqFV3zHAfmvVfGJOETgs4l4E3CXQKUt8n8K4q7Wm9HG/0EKBnDi+L4CWO
	 YzIBh+kSTp4ug3rN9+8nZLTTs3bPbT61f6ZdItNb50ojMkj29Pwm6MyVc8hPNIE2yN
	 ilvZw0HRSb05+c7zh46FE1xOn8W/xwaYnV+fsHh3wW3u3iRSpo2vPBB9hBoUNe6Pcl
	 13A6fKw9S/weIyR+dqF1ZCSYM/qt0cCmlY7Vk3YhJbVjJViFe2ckhrbwK5c7PWTNwZ
	 pP8VDneImyAbdql1+G7sRPmZnxIy1u+Th3t/M5gN9vvoSvyGAfNBg2y3r1rCKJ7Kkn
	 9b0XmJpXoQ1AA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id F06C5609D7;
	Wed, 20 Oct 2021 14:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.15, round 4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163474140698.10750.14257818986286435769.git-patchwork-notify@kernel.org>
Date: Wed, 20 Oct 2021 14:50:06 +0000
References: <20211018000958.GC25810@dragon>
In-Reply-To: <20211018000958.GC25810@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 18 Oct 2021 08:10:02 +0800 you wrote:
> The following changes since commit a1467faa10414ab3d91be7ef6d2b11272ec00e95:
> 
>   ARM: imx: register reset controller from a platform driver (2021-10-15 09:38:06 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.15-4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.15, round 4
    https://git.kernel.org/soc/soc/c/72cd4e3bde4e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


