Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B13DC47258
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 827D4C4167E; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C8C7C4163C;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=gVDxXa+F2KHMNHZ6icCZVLxnb8ALnKAVVzHgFplA89k=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QblQTyQEtM4rYOBfgY+RxqfaMLLwq+KGWnGYO1vzKrxcxryE+I+KaE3RY1A5ytm3V
	 DJbMuNGyo64zusKO6n8JkjPgISCIAF1qaMmhffs4myYSKKEIAYoRSzl+nNNAcYtvPH
	 3j0nO2fOaTVp0BiAvz1IBuKGGM0/UPDzaQFupknMhfC+ypiONagY7RU0PQTNXPPBuG
	 jdnEULt3gHM4DQ5yVCZIan/2x6SmSrq45hf+LziCC3zGrkQ0fjuYIPXAyaVecgBAsE
	 Q5/lkm7PGiErQc+bk8CLHpkvVqLD5eNkWMlfNkPDz1ZUc5op98qCPRKootc2gpDKOs
	 KSas3nehB6sLA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5D5ABDD4EFC;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Renesas driver updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046637.3302.1601436859104767779.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <cover.1702642340.git.geert+renesas@glider.be>
In-Reply-To: <cover.1702642340.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 15 Dec 2023 13:15:20 +0100 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.8-tag1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Renesas driver updates for v6.8
    (no matching commit)
  - [GIT,PULL,2/2] Renesas DTS updates for v6.8 (take two)
    https://git.kernel.org/soc/soc/c/6af50f5af215

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


