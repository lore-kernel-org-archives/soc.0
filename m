Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC9BC64ED6
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC567C433B3; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A05ABC433A0;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675117860;
	bh=H6pWorc5sUjUMsYdh4fTUABga+aevNejstaZimBsaVQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fw90uFrW4NStnhIRTT8NC6CydlRRaG8BG/5p8INz7dyszFe8wzx+3k8xWGZRtSUom
	 RuTPOgs+xxT0azePeptoRmaA3EOBpbkc6nH3u4OtsmOKr9VeJc3egBhGQCpLS1Vn1m
	 c6ES9k4q+gSO28UVL4JwhYcWk0jZZOFK06bDt/STh/RwzecPMV3cjqAejrO0sXYyFf
	 5s1gePi78/cgJUJOWm/ZNgr4eS95ulvRbebPwZW+12Qepr6YK9UurWOU4wcj+r/Qy8
	 09skrUaQuCrU84tjxeq02D46nb7D4uSoKXXcpYZv3gYbPeHrL1UhVrs7b27sHMhrDV
	 OdbTrGH9X1eWA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 86C7CE5255E;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.3 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167511786054.29049.8254611662100699010.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 22:31:00 +0000
References: <cover.1674815093.git.geert+renesas@glider.be>
In-Reply-To: <cover.1674815093.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 27 Jan 2023 17:28:11 +0100 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v6.3.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas driver updates for v6.3 (take two)
    https://git.kernel.org/soc/soc/c/80dea24a4979
  - [GIT,PULL,2/3] Renesas DT binding updates for v6.3
    https://git.kernel.org/soc/soc/c/edb3f74332c3
  - [GIT,PULL,3/3] Renesas DT updates for v6.3 (take two)
    https://git.kernel.org/soc/soc/c/ad3c046a26f8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


