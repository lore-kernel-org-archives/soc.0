Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFE7C3525C
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0ECE8C34101; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E65C7C340F2;
	Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644311578;
	bh=5umhoQqRaieBQQHnJ+bsS/r0CwQ+CJT4+S7Ut6ADC6I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gkvFGMk2MAGIYmaoAQs8Ik+ItZ/RUjt8UrWSh8QviykQXnCaHBl3YCBEJgBf/53yL
	 ZuzszWrY/Y4Agx8CUWdz2OuQgbb8J9F+6okHmxoBYwrQdXhZvrbS31oXhibpReljy/
	 70MQfB7V/NOt59lgDFTF6d6AgQsn1S/CBd67MhUg+nfkUrSX3fNVq4yS0FeYt90FoY
	 9u/WEyeER6P82nz/vaCgqgtLPUwHLJNkG4Wf/4RDWTmcKoC2k01Gugp+DYWFDJHAq/
	 5HlDv8DtO5rviflM4xc+nyRzPcxcQbJ5mHBPRrP1K+zAW/X6e4RubMySaR98xki0ig
	 otobm2mPTHE0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BFD8AE6D4A1;
	Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: spear320: Drop unused and undocumented
 'irq-over-gpio' property
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431157878.18327.1636824832609665371.git-patchwork-notify@kernel.org>
Date: Tue, 08 Feb 2022 09:12:58 +0000
References: <20220204004117.1232902-1-robh@kernel.org>
In-Reply-To: <20220204004117.1232902-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  3 Feb 2022 18:41:17 -0600 you wrote:
> The property 'irq-over-gpio' is both unused and undocumented. It also
> happens to collide with standard *-gpio properties. As it is not needed,
> drop it.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm/boot/dts/spear320-hmi.dts | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - ARM: dts: spear320: Drop unused and undocumented 'irq-over-gpio' property
    https://git.kernel.org/soc/soc/c/724004a11a84

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


