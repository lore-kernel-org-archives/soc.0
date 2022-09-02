Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F7FC6FA87
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83DF5C43141; Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6CF4CC433C1;
	Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662116424;
	bh=ca+Z5XIeCcBLmZYO3OQqDXpKMUflYeeQxB4pGDymceQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZOXI+aFxn88z4wNTp88N433x6duYrzotQmjuydL+5KeaXg+u3wECiqfT5J8NeIRVJ
	 mZHwpd1hmxLLZmqzsU51GU27AQzsMRqxv7mQ2LnT5cUmLlmEqjsV9u8E2RIKypimXp
	 wmWTD6NcbK/G1LoPmJOESA2gA2bw8N1nrucw/GxC+dEXbbczeuBz/iLJznn7YYTprR
	 E8s7YhwiHEeZxnokC4UeNJl03+z0YaVA4Vcni+htNtZtM52g6TgEX9oZl36XkvYoDX
	 NzMxxDQZXGPDMgF0L9GIIyVJcSMJ2FagHCANUkvzD3hi7vIgCYDnk4ZcoWj9koQE1h
	 AXF1lgWCp5iSA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5A86CE924E4;
	Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166211642436.12856.18414737081332088238.git-patchwork-notify@kernel.org>
Date: Fri, 02 Sep 2022 11:00:24 +0000
References: <cover.1662111124.git.geert+renesas@glider.be>
In-Reply-To: <cover.1662111124.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  2 Sep 2022 11:36:48 +0200 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.1.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Renesas ARM defconfig updates for v6.1
    https://git.kernel.org/soc/soc/c/853ca4bb741c
  - [GIT,PULL,2/4] Renesas ARM DT updates for v6.1
    https://git.kernel.org/soc/soc/c/73bf60ba7c18
  - [GIT,PULL,3/4] Renesas driver updates for v6.1
    https://git.kernel.org/soc/soc/c/c9a2577d417c
  - [GIT,PULL,4/4] Renesas DT binding updates for v6.1
    https://git.kernel.org/soc/soc/c/71772aa7dd2b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


