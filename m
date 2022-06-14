Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CBCCCA483
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68E63C341D2; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 512F9C385A2;
	Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655238815;
	bh=miCZ5hIBytHIBlqISdUCXF87U9EB/ncjl/Pe9hFOnmU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OEkd2Bkd4QkOIxKUAkTlsvv8CuP4z7q+yjUWhVuSeRDPInsTZqIEUb1b9dP8WCOVY
	 zJsakzPcMOQIeNpdPjnglct6RKeWg9u7aqtoINJsQYMzXPlLAWAsTzBSk/d0iRTI2T
	 yL0pAZ281M2YwVS1Y+Pbq150U/SoWr40i1A40ynbwksVbBURmcp3nVFigk6he0AVuI
	 uOMobFwA9/8Xjf7MFCF2d2cVVmVy49IBXBRZjzDdv6jf+vGPGKlK5zw7A2SXQUEoYq
	 /Q7vhm30iqHe0YTpqYmX+Hrgo/mIbhFYdBUrN2KN+KRXYv8SymDFLtqErEM/mKK9C5
	 eI7PPQ5Q9t9fw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 29B22E7386C;
	Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: configs: Enable more audio support for i.MX
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165523881516.29335.4797818921408508260.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jun 2022 20:33:35 +0000
References: <20220513121258.168364-1-broonie@kernel.org>
In-Reply-To: <20220513121258.168364-1-broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 May 2022 13:12:58 +0100 you wrote:
> From: Mark Brown <broonie@kernel.org>
> 
> The generic audio card for Freescale platforms is used by a wide range
> of i.MX systems and also has selects for the various audio controllers
> used on them so will help with systems that don't use that specific card
> too.
> 
> [...]

Here is the summary with links:
  - ARM: configs: Enable more audio support for i.MX
    https://git.kernel.org/soc/soc/c/212e3b6b8734

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


