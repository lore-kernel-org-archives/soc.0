Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E499FC433EF
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1937C340F7; Tue,  8 Mar 2022 16:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AABFCC340EB;
	Tue,  8 Mar 2022 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646756412;
	bh=TWTgXHDwB3laDBUws+B9QMaSrtzgru1SAJk4iQR+xtI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TrsoUVOQZrt4JR57gT9Zu2COeFqrK4UYfZOU7360SiCSAgeA3ZFZY+YuEsj4W3waW
	 wUZIH6w7EgFA2fVcSnSdckAp9JIyBSDfTnCOVrRRwm//tdKHbAGEIG1wsxvlhUbBYB
	 JdLmvFTI6MWpnQxgn5T/eS3oxwt780Qh4zROT3DXA7J2yi55JnO9E647h1fWXyLrQp
	 A6nQHOs8cULOFCML5I7zwyJ9pjp7l3Sb22W9023QMyusPobVK1X4o3EqWL/+fTuR6T
	 oaTFp1+ep8zibfi2Rrk4yt6YrEwu92HzATV8fZDzq8rrDGuiLeKYyQcPW7Zj+zdRJD
	 nPTbM4HF9obXw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8FDC1EAC081;
	Tue,  8 Mar 2022 16:20:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: aspeed: Fix AST2600 quad spi group
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164675641258.4559.17542740646534283971.git-patchwork-notify@kernel.org>
Date: Tue, 08 Mar 2022 16:20:12 +0000
References: <20220304011010.974863-1-joel@jms.id.au>
In-Reply-To: <20220304011010.974863-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  8 Mar 2022 10:36:31 +1030 you wrote:
> Requesting quad mode for the FMC resulted in an error:
> 
>   &fmc {
>          status = "okay";
>  +       pinctrl-names = "default";
>  +       pinctrl-0 = <&pinctrl_fwqspi_default>'
> 
> [...]

Here is the summary with links:
  - ARM: dts: aspeed: Fix AST2600 quad spi group
    https://git.kernel.org/soc/soc/c/2f6edb6bcb2f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


