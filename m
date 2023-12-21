Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A029DC4707B
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94C07C116B9; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F1FBC116B5;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=zGm/w3y5rle4zs4zuhnibaAU6Pk12f05WwhQckyv2EU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ut7DJ8hRfJfdlbEH6uvifFIa3ihrAWUSr4NFUv4xH8TRHHIKnBf9pIWiWG9ry5tbT
	 auErPul0B4V2jsmFPW9qxl2CiNuOO8OTAb6Tzxfplad7QRE6K2qj3S2jXdfUURQC96
	 BFbry7M0L3b+t/Wg6vl2fmi0DBAZpReLkZbIwJ0MyBCGhmIOYniJwam5hZAHWecpEM
	 f0CQowbvntcTRcJ9OftDpH4DqldrRUtTxklU/ReVmu3JbH3gqmYXVE8HSgg1/me2I/
	 k3D0aaVCUZtI6Ze5HKFL7SXRA7mTaoO3oRk35SqlfAhRjaF6A/YEDaf3NreFusyH1W
	 jvENK4kI04Xzw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6F22DDD4EFA;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046645.3302.7370082711439728992.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
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
    https://git.kernel.org/soc/soc/c/76955bc85b50
  - [GIT,PULL,2/3] MediaTek soc driver updates for v6.8
    (no matching commit)
  - [GIT,PULL,3/3] MediaTek ARM64 defconfig updates for v6.8
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


