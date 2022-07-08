Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD413C43334
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 12:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AF9E7C341C6; Fri,  8 Jul 2022 12:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DB9DC341C0;
	Fri,  8 Jul 2022 12:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657281614;
	bh=Rz/dxGgBJP8W/srNxg/aIlJ5pWBXbU1W1I+yfG2vZHU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=VLX3MeAXh0txmtswQPKujuhwnVCAVIIapKtQooa8I4siELV0/pe4yVAibq/ZpeJ1m
	 VmLhneWZBemYEP9gM65q1GPs7/p+8d40iGSCfYbs9p7Tg52TKbKX3LoIxDjVOPgvAQ
	 2JlAqspDoR/UNZVZACp5w9nnnusCPJMlSIDq5cwH7VfcLBNzAYngwRoQOym0DaJZ8H
	 PlkPPMX1wmzjIfjOVK2ax+oQH/Dwc+9POqgQlXoz43WUe7G7TRtxEA8TyV3AxR1Dmy
	 soqK6lITwryVPRMWNCT03OjLJTs/fITOqqlmucLdfPuvYWACHy00B/xnusJgPlu2JL
	 HpMlB0RMIwrLQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7A6EFE45BE0;
	Fri,  8 Jul 2022 12:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v5.20 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165728161449.25834.6687823752860368793.git-patchwork-notify@kernel.org>
Date: Fri, 08 Jul 2022 12:00:14 +0000
References: <cover.1657278843.git.geert+renesas@glider.be>
In-Reply-To: <cover.1657278843.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  8 Jul 2022 13:26:33 +0200 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v5.20.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM DT updates for v5.20 (take two)
    https://git.kernel.org/soc/soc/c/132582d21075
  - [GIT,PULL,2/3] Renesas ARM SoC updates for v5.20
    https://git.kernel.org/soc/soc/c/11055c32c71f
  - [GIT,PULL,3/3] Renesas DT binding updates for v5.20 (take two)
    https://git.kernel.org/soc/soc/c/b83c42935c91

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


