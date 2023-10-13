Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E720CDB489
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44514C433BA; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C9BFC433A9;
	Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697230838;
	bh=SBReUhogUXTVAxazvqnxuGOoFoQhvOV2ftV1fS0jJjQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dwZ2XPgECeleYEK0FHieKuY603fDSj/I+oRuCyv2t5Y1UQq/+EXhu8tkY47NZYjh5
	 gu+wreGR6igQee3WcYrXYwwRwYexJdmpVlXf/5/DY8Q86kz/HoPwqF+0P25/jh54RF
	 B1rMiLCBVqMsMg+blAG79nix+5KT8FUH1Dpx7JLwgROGrf+AuOEA3Ba9zxMQdLv9bL
	 UuRAmzgPeKCebB+FnfnPGOCOqLNl9nMsWeehLEvZU6YsTIiomuks5nxZ9AnHCTdWTm
	 JC1lS1PISDcdrEHTNPLvAHVqNSaGWhYKB56cl3a7R9KXqr2yMcUHCm/XegJd1uFWZV
	 1+7CeNX/QX3aQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 17456C73FEA;
	Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STi DT changes for v6.7 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169723083809.14185.5728916889738266808.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 21:00:38 +0000
References: <e6b975f2-9936-465a-8253-6fcead974006@foss.st.com>
In-Reply-To: <e6b975f2-9936-465a-8253-6fcead974006@foss.st.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 Oct 2023 09:58:33 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STi DT for v6.7 cycle
> 
> Patrice
> 
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STi DT changes for v6.7 #1
    https://git.kernel.org/soc/soc/c/4ec57f57bf75

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


