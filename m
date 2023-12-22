Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95536C47070
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B770C433C8; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3083BC43391;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=tfZwh2HCsq3EZB03r9c2gVaKCuft0Uy7zNHTpo7oBEM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RmdcVEwd9sWskAw8JS8Zd9IuBoygFqhbdBFyj1EjZW7S3vwEbYK5I8hnnLFzazlzo
	 I9ZnyRa5nyuczYHLpOf0pmhr68Ewotnv9L8UQL0Kj50jU4jb4J8uDo7TY4fDryDGDc
	 TjKPRW02baqgkoGnsBX2b408+FVpmByrG0ga+aRnaWOUNUKCw5P0YyCa0sMi282AYu
	 ndTJfwEPgr5cpOqD/39sVoaDzAimDolcF1Na7pX98ec5rnHpwKqegWslYbaboWUQQa
	 7zXzToSpFgtqb5ZzXmFbvGr6DHEHeW9byIWWRR3+4QVesEVF0mCH0jJOmBKvEGGb6k
	 1n0AFK5cdJdrA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 16367DD4EE5;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646708.10550.2274924168335802328.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231212114515.121695-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231212114515.121695-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 12 Dec 2023 12:44:27 +0100 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.8
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v6.8
    (no matching commit)
  - [GIT,PULL,2/3] MediaTek soc driver updates for v6.8
    https://git.kernel.org/soc/soc/c/e92c0b8b1592
  - [GIT,PULL,3/3] MediaTek ARM64 defconfig updates for v6.8
    https://git.kernel.org/soc/soc/c/b9339f63ddee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


