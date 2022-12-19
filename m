Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF97C3DA7C
	for <soc@archiver.kernel.org>; Mon, 19 Dec 2022 16:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1058C4339C; Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C29EBC43392;
	Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671465633;
	bh=ygNF5yJobn7S+G0mhMJ3ODdTdwjUpOvBgTft6LOALWw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=etqGnppIKxX7DRhGMVTrAgxUO9ospU0Pp2ERAHpehP2jOsyn72gQ5SEjhmqJcbzx5
	 KTp6l1UKNsmxDTW9/menABVb5FyEogk7CTpCoNPnRwAwC0nPH8ltHHeaVBHt0QGlxI
	 fHtWrkcOHc0Wexld1RMGuAEYOi/0caDCspR+Kbdf846UDyDjgfm/YD7tD8/+SoAlQu
	 jA6/t2rl6KPcKbgYNduQP2sFaIPANUCHA0c4NHyV/hNi+QBeZ+MwTMLVNya+9lCk7X
	 b5937nZPDDblNNXSg/9n9HkyJc5PG3/gMMRNZn+v0+vFAyal++Tn6sYGvlLmrFmNlv
	 pGBjY4S41z/Pw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9BA4CE451B6;
	Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: tegra: fix CPU_BIG_ENDIAN dependencies
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167146563363.24111.14476877221839283586.git-patchwork-notify@kernel.org>
Date: Mon, 19 Dec 2022 16:00:33 +0000
References: <20221215165336.1781080-1-arnd@kernel.org>
In-Reply-To: <20221215165336.1781080-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Dec 2022 17:53:21 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> My previous patch to prevent BPMP from being enabled on big
> endian kernels caused a build regression:
> 
> WARNING: unmet direct dependencies detected for TEGRA_BPMP
>   Depends on [n]: ARCH_TEGRA [=y] && TEGRA_HSP_MBOX [=y] && TEGRA_IVC [=y] && !CPU_BIG_ENDIAN [=y]
>   Selected by [y]:
>   - ARCH_TEGRA_186_SOC [=y] && ARCH_TEGRA [=y] && ARM64 [=y]
>   - ARCH_TEGRA_194_SOC [=y] && ARCH_TEGRA [=y] && ARM64 [=y]
>   - ARCH_TEGRA_234_SOC [=y] && ARCH_TEGRA [=y] && ARM64 [=y]
> 
> [...]

Here is the summary with links:
  - soc: tegra: fix CPU_BIG_ENDIAN dependencies
    https://git.kernel.org/soc/soc/c/ba4b4d0293ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


