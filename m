Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C2EC25B77
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63B5EC4AF68; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E671C4AF64;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714424447;
	bh=mK8UxEet3n68NlNLvWuPBujCifF/hi476AqL7TSu2tA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=p/G4gpz/AmO/zAoueTsVm3l4G/jmq8c4SpyIouUkPLZd4HmVcu3MGBqFhVeVEgPGP
	 3gc8SCQdFKFHtlGNDp86eNBMYCLQsushyBq8OWAW4Rh8y7oRF2Zr/NgXIhAOzmOgyr
	 CG3Xxq4sLqnzyISS8jtEUUgtGQ40qw8aj2C3rhl34rw+BjDzd9zS7pttq9I/1B5LL1
	 3+PG3G+w/E43qwEVdW79GG9MUivkw12Ua03MbQx8R8MgAxfIaxBjDlskOMmRgx1/+z
	 t0aUZFHTBiT7jBnaxJF6Q2uPp+4mJ5QmqUAVE6dJm5dkd5oOqCW3SP9V0uSTjc23zr
	 NiHtg+WFOFKZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44933C54BA4;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171442444727.17402.7926038346743678089.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 21:00:47 +0000
References: <20240429140245.238210-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240429140245.238210-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 29 Apr 2024 16:02:42 +0200 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts64-for-v6.10
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.10
    (no matching commit)
  - [GIT,PULL,2/2] MediaTek driver updates for v6.10
    https://git.kernel.org/soc/soc/c/d1734cfcece1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


