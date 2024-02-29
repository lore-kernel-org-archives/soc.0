Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254DAC54E5E
	for <soc@archiver.kernel.org>; Thu, 29 Feb 2024 17:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCAD8C4167E; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C24B3C4166B;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709226129;
	bh=2Y0VPz8aptNgo7HqiTeqcx/mB/s4NgwzbtLr5W6/Dm4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rTnzTJ5LH+zRmzgisrqdilaKAUYozKXjuRpM+JSLZJT6fu+ohTiOU3MT3/ur/UQWP
	 oeWwp61oOWprjGBgeabDNAjKoS+PA6DiZnSf4TUi9d6A5gosyEHX4jFshS6aStoOqk
	 8gCv9TMCi3N6RmGFbQ8PvHUWnnFJ9lKqi9Z7fAhhScqYjWlvVqEHFDGpIm4z7y6Fih
	 jgZY2RrEEjTbdEv+5npHBj+XTYOimuQqToQm72aApXCHgFL18HGlCJw4tTZVpL5QKm
	 ZIk7OC9Ch27fvxWL5WbrdNIe29GOT2xz8Cp70/Sp4V3u0qS3jNk9vWO4d1YZJQh+f8
	 YKVglmJF+PrAg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AD384D84BBA;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 Device Tree updates for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170922612970.13542.6332601387519439459.git-patchwork-notify@kernel.org>
Date: Thu, 29 Feb 2024 17:02:09 +0000
References: <20240219131230.157792-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240219131230.157792-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 Feb 2024 14:12:25 +0100 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] MediaTek ARM64 Device Tree updates for v6.9
    https://git.kernel.org/soc/soc/c/d90220915508
  - [GIT,PULL,2/2] MediaTek soc driver updates for v6.9
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


