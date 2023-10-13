Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644D9CDB488
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 565CEC433BC; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F633C43397;
	Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697230838;
	bh=33i9oaKXgrUhn2GO1Egz9By98I/RiAUcy2S8qCtuE3g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mcDS+rrrhMDg9rAB/q5H4ikN4oSybRkVPGsk9+2PGrZMeGONyIgYkXjUmlO67wgBZ
	 yfaBve5C+54hCLwhg7jKV3KVNaSeaOKRhrQAK0mRDnViajBQGnvMj1FIIMNTSzolt+
	 Xa3FJ61ZZqk0yd5shCkTNgajlPb7vpZBRtJNb4C1ogYmjAx34M0qvlHh47ZpuQElNr
	 CCEjQCZCx59PoaH+c0sIAHCaG1G/EDNgYFTg9i+b/r0cz0g2UW2TsD5ziBfYUA5Fq2
	 dooRZVl0BJwn4M7IPoZ0VuLZMEsNg1qD9TMdqR+SGe6aG9i8rPDo/TT3kOXInBvfdz
	 o6wWWwgjFU5Gw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2BE5CE1F66B;
	Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Ux500 DT updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169723083817.14185.10275372862208183029.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 21:00:38 +0000
References: <CACRpkdZc5Yzsos2+gRPtCT-+ohmaV69ew5YFJLakD+9VFkrkfQ@mail.gmail.com>
In-Reply-To: <CACRpkdZc5Yzsos2+gRPtCT-+ohmaV69ew5YFJLakD+9VFkrkfQ@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 25 Sep 2023 11:21:46 +0200 you wrote:
> Hi ARM SoC folks,
> 
> please pull in the following fixes from Krzysztof for Ux500
> device trees.
> 
> Yours,
> Linus Walleij
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Ux500 DT updates for v6.7
    https://git.kernel.org/soc/soc/c/1dca98e70c10

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


