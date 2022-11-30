Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743C1C63703
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 628DFC4315B; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46E64C43151;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828262;
	bh=/rXhsMueusRoBH9H+on7CTLPr3IMKPrDp7oMhEtLCWQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=vAtcg32L05Nq+HLXg6qu8C5WUZwVMt37aHzGIAtRUDdithc4uxVa3IdYilwN2qBuw
	 DUe9FYKBmB+2xjt/B3kwFXCkFbygfq3JvWm1vvoGKS/q9n8sgJ0YNsqqF+Lw+PVMNL
	 C0kpsS/9tEY0KhrGVvMU35llEkgm4DzGQqAe4k6OSufCBKlblyuWfYjA4qPyyuZLnu
	 4lSTG+zYXMvDPvaWmZfKkE6SVNbC8RMhu2KM/ON/K+s/2MEAnZwX7qV10zy6WG07An
	 DUKJ8RwRs2AXf9hgWKirQc2ER+3QQ1pcNfyj5PQ5k0wRkYEETb5hHPDIUkwgo3x69Y
	 V0De0TAOXS7sA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 33127E52549;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v6.2 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166982826220.9936.7702088786285250749.git-patchwork-notify@kernel.org>
Date: Wed, 30 Nov 2022 17:11:02 +0000
References: <87fse39aer.fsf@BL-laptop>
In-Reply-To: <87fse39aer.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 28 Nov 2022 01:42:52 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v6.2.
> 
> Gregory
> 
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v6.2 (#1)
    https://git.kernel.org/soc/soc/c/3deeb5b079f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


