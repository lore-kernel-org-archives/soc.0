Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A19C7EE2F
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 20:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1EEAFC433A1; Fri, 26 May 2023 20:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F21E1C433D2;
	Fri, 26 May 2023 20:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685134222;
	bh=vjEPn/gMdaxRlr+yzbnEIr5E/TkjOMVNrV17qGI+WV8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=YgdCaXjjvsNXCw+heKPFnLU/KImPQCHvgHXJqgr4XlAqrXJ1IkWjQ+Eof/zItty8K
	 dEGK9WsU2oCgiNmVEDZEVzFEf9iCPOgSkv1np+iDPL+zLUptbVfVnhEdsRN7A69XcM
	 OCyQkZVyEhaQHp35t+X2umaA6xaf2oWbIZliNkK4Yj3TSx5VxX2sCCv3eaivD0ho81
	 REkB9ix8gP2B0Hxyy57fQDL6upBJec3CuX9wmN0QBIbwPkl7MRxI/2YfeBsf+Z7Ndp
	 NfaumDSdmY3uYIE7MkXW/uM1zr6rg8YOsG0QUdGVhV89cBAD6pZPnd3GBLsxa04z6I
	 c9zNJZvb8QXcQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D590CE4D023;
	Fri, 26 May 2023 20:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168513422186.30982.8342490267109608288.git-patchwork-notify@kernel.org>
Date: Fri, 26 May 2023 20:50:21 +0000
References: <cover.1685094238.git.geert+renesas@glider.be>
In-Reply-To: <cover.1685094238.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 26 May 2023 11:48:28 +0200 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.5.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.5
    https://git.kernel.org/soc/soc/c/8c86942c02c5
  - [GIT,PULL,2/3] Renesas driver updates for v6.5
    (no matching commit)
  - [GIT,PULL,3/3] Renesas DTS updates for v6.5
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


