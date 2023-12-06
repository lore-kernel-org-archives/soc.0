Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74FDC10F05
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B485AC43395; Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97020C433CD;
	Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701879541;
	bh=AHg64dFmLgabgmCxiJ5Vfr8tbqCv0zeNccBD7/qc634=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RMBLF5tKdM9D4R9y6kjisaT4VsUD7NCsJ385YB847uvZu4AhsbUR0vAsDXRg+mvXv
	 A3Znqf07Qs2WLuehaKGgN9QI2s3VFnRWDWpEvDzh3Sg0HM2+CpG7vqrz7z3ED9BGvq
	 G4/u0Iv2634IJ+ak4n3O8OKeAbhJdOUgkc3hsjcWjnpzNvLQux+ZkJFTyU/JKoi1H0
	 ImQEze1GgwtIoOVqGght39az9Tb+p9Hy/puXuKKS/HJmZD8Cpbmg6UuPQYAYBNm+1W
	 eDeFYkGbc8LvxwfQp3jT6tPpwipFZ9kh211nGMoggYT0p4Yp0cgBnaWH8ZfvaY7TXj
	 MWbA1Kjf6KRIg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 795F7C04D3F;
	Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] MediaTek ARM64 Device Tree fixes for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170187954149.26038.9788719857465463361.git-patchwork-notify@kernel.org>
Date: Wed, 06 Dec 2023 16:19:01 +0000
References: <20231129113905.134732-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231129113905.134732-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 29 Nov 2023 12:39:05 +0100 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts64-fixes-for-6.7
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] MediaTek ARM64 Device Tree fixes for v6.7
    https://git.kernel.org/soc/soc/c/1133ae113d6c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


