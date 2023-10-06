Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B84FE9411F
	for <soc@archiver.kernel.org>; Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35E12C433C9; Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A056C433C7;
	Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696626685;
	bh=Opg5oT+jovKHcsRfx/RQbj2w52tpUAPMU88LDFCG4Ys=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KDUIJ9QlRnr9cBstlbzoLQRvNdngzxkHb6tpGvfCzfChy20flTCDvmQ0fqPEKORsn
	 4TCeZGLgSiOesxBwBPcPF+sKyv/fwGCjaAuXL53rqaJW5x9XpDtHKg6zgFXhblw6tf
	 R6qAyUmeQW+Wbn1jO+0gUzPzpw7aq8FArOtnBJrggkMSuA5NuTe3WO2lt6qGDNCMrX
	 UNGcZBuWWJ856F0CONjC42ye8apg4kyDIeTfdHsr7fee8BkL1vWJsBxCgrx1Azmw6C
	 nJ03U3mm5OPQeld9aLaFXw5npQ0q8n2KGR4pP4i1h94GsiInREMDJ7WVzaRNxVKjO9
	 8Xa8jRLAg8lgg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 06199C41671;
	Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/5] MediaTek: Update MAINTAINERS and dts fixes for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169662668502.6539.8371917147290355096.git-patchwork-notify@kernel.org>
Date: Fri, 06 Oct 2023 21:11:25 +0000
References: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
In-Reply-To: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 03 Oct 2023 13:13:42 +0200 you wrote:
> Hello SoC maintainers,
> 
> As suggested by Arnd in [1], I am sending an update to the MAINTAINERS
> file, adding myself to the MediaTek SoC maintainers, and some urgent
> bugfixes for MediaTek devicetrees.
> 
> mt6358 PMIC
>  - Bogus property dropped
> 
> [...]

Here is the summary with links:
  - [1/5] MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer
    https://git.kernel.org/soc/soc/c/cb3a7f63e99f
  - [2/5] arm64: dts: mediatek: mt8195-demo: fix the memory size to 8GB
    https://git.kernel.org/soc/soc/c/25389c03c21c
  - [3/5] arm64: dts: mediatek: mt8195-demo: update and reorder reserved memory regions
    https://git.kernel.org/soc/soc/c/6cd2a30b96a4
  - [4/5] arm64: dts: mediatek: fix t-phy unit name
    https://git.kernel.org/soc/soc/c/963c3b0c47ec
  - [5/5] arm64: dts: mediatek: mt8195: Set DSU PMU status to fail
    https://git.kernel.org/soc/soc/c/d192615c307e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


