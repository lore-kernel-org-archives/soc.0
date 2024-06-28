Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF26C3DA40
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1BDC8C4AF13; Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03391C4AF0A;
	Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719609650;
	bh=AJUXHKmuGwz8/FAl6b217xPVwvvA8f89vptqBd+Hk0w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LuskcSsRMME6gyxm8UD3yTy6cp5Qcyz0PS+1S3geW45r1QPMys93KGkez7ij7jmkp
	 AY5MIEHLu5R0KGgOSIgQbG3vz4jsgyugSZN4cEdrpIE9oefMz4A0uTFnyLXIo2TOJ3
	 n0lqGUolvJGp2gFzXhAfobejcCwEWlJDV9lpaaRG3X6d58675Zfsv1beTxGC2x5KIY
	 B2gF7ZDk1JeXQvR5MSs/dDG6nWWl7GITU6kL1kGiEF7mZIMxWftWR+HxIxoHEpRB2S
	 HtqNT7U2h/g3Nu+VEUpFsMyqHg4BBAaInAb7ll65bvDp2LmgkR9S9NOebbQPewmNGQ
	 ENYo4QK/sRhHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E8047C43334;
	Fri, 28 Jun 2024 21:20:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/1] MAINTAINERS: Assign MTK Airoha to MediaTek maintainers
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171960964994.14447.3551812392754767066.git-patchwork-notify@kernel.org>
Date: Fri, 28 Jun 2024 21:20:49 +0000
References: <20240628095044.132276-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240628095044.132276-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 28 Jun 2024 11:50:42 +0200 you wrote:
> This is a single patch assigning (MediaTek) Airoha ARM64 to the
> current MediaTek maintainers.
> 
> Krzysztof Kozlowski (1):
>   MAINTAINERS: ARM: airoha: add entry to cover Airoha SoC
> 
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)

Here is the summary with links:
  - [1/1] MAINTAINERS: ARM: airoha: add entry to cover Airoha SoC
    https://git.kernel.org/soc/soc/c/c03088be18b4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


