Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9F2C04A6A
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 10855C43397; Tue, 20 Jun 2023 21:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDDEFC611A0;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296113;
	bh=1S5ZrlGFKs/yxRgIkTY9lwZp8fVpBFVQdZoNIximlAo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ursokW2z4qWLyKjSWuqhjUzPnHq5RJzMoQAfqMhselxY4789EROLCYOksdH+qsHuM
	 uWZX5QX2iU0P08AuQvyzZIpnD4sVPV7wtahqolIXeFve2uZAufo+RTmWd6Qr6GjKJg
	 JnGu5dmDrco35Rk2S8PdgcmUPeeXe4E7nKeHULs48RTWorb2FVOf5fnewVrdIyRIi8
	 8uqmx0toRo447xGutqsiRwVSePBbYRteRxim8qRu9ncRw0tU+nezUNlYDa67QgIhhP
	 2UhiGKoPN7cyxuryJYdCUPa9TlRRw2f07MVquAk1mnlGNX59EnPQJ3JDwJuWZAfw7F
	 JTSADunr/DuVg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DB76DC395C7;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v6.5 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611289.12258.2280159139369702063.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <08d711de-bb6d-a976-735b-5e18b19818ea@foss.st.com>
In-Reply-To: <08d711de-bb6d-a976-735b-5e18b19818ea@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 12 Jun 2023 11:33:03 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT for v6.5 cycle. A new board
> has been added (PHYTEC) based on STM32MP15 and we continue to fix W=1
> warnings and YAML validation. There are no more W=1 warnings on STM32
> MPU boards.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v6.5 #1
    https://git.kernel.org/soc/soc/c/b1062d1971ff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


