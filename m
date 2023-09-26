Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A515E7F12C
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13180C433B8; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0ECEC4339A;
	Tue, 26 Sep 2023 21:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695762233;
	bh=GIh+z2axQweQ8rmRaGeKjVnyfBo/AcN+rp2iLmjDHPQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bb/9Tjuo5z80ECReeyLglNOgHPqRmkVlZTN2l2axkZCAiaDAHwzJBE+X5czHKqBgc
	 UV5y55cyTxqZaXi224NgMkYlPJ4i4KUHqgOk8q/QE/6YWhN3BVPJn3FUpfqYgGPdA9
	 m2z1OPuhTCLV1Eo75OC4lPqARb8paFw6mWmpcNh+fjDaNKllTf2Zp+rqw45Vx3ACD5
	 Lh1/0MqVxZJD/iyZczyXPuB2Lic2BHmryjIJ16MUp1a36eAsXuUQdzyMq+a8ykSOa3
	 43zUkPco1YDd+IsqBSEr9W/vlE93p0Qg24NU9Gz8M0k/1UUq1IgXBZtdTrW1Fl1nHG
	 m+lc5dQ5b3n8g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D53D4C64459;
	Tue, 26 Sep 2023 21:03:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/5] soc: loongson: Fix some issues about loongson_pm2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576223286.24546.5408220019085877322.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:03:52 +0000
References: <cover.1693474728.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1693474728.git.zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubinbin@loongson.cn>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 31 Aug 2023 19:43:10 +0800 you wrote:
> Hi all:
> 
> Since commit 67694c076bd7 ("soc: loongson2_pm: add power management support"),
> the Loongson-2K PM driver was added, some issues have been found and
> this patchset is planned to fix these issues.
> 
> Specific:
> Patch 1: Compilation error found by Randy;
> Patch 2/3: Rewriting the ls2k-pmc compatible attribute with fallback
> compatible;
> Patch 4/5: Add Loongson-2K SoC reboot/shutdown support as part of power
> management.
> 
> [...]

Here is the summary with links:
  - [v2,1/5] soc: loongson: loongson_pm2: Add dependency for INPUT
    https://git.kernel.org/soc/soc/c/9a7c9c7e34ac
  - [v2,2/5] dt-bindings: soc: loongson,ls2k-pmc: Use fallbacks for ls2k-pmc compatible
    https://git.kernel.org/soc/soc/c/8e5f17483ab4
  - [v2,3/5] soc: loongson: loongson_pm2: Drop useless of_device_id compatible
    https://git.kernel.org/soc/soc/c/59598d7ba6a8
  - [v2,4/5] dt-bindings: soc: loongson,ls2k-pmc: Allow syscon-reboot/syscon-poweroff as child
    https://git.kernel.org/soc/soc/c/019d79fe6c3d
  - [v2,5/5] soc: loongson: loongson_pm2: Populate children syscon nodes
    https://git.kernel.org/soc/soc/c/4e7b558e320a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


