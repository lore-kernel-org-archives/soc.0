Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F30C41513
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F80AC4AF13; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53285C4AF0D;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720517438;
	bh=6SwnJ9wKJgq6/ThNJNAfKLia7MI1mmMQlN6nIRr79xk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mkPUB79JiFMWe1YJ38flDB80CQttX1nlzNQArok3nuYyCIikTjfr+ZaFtKAGGM1qK
	 ctLMAc+Vpoqqsh5aQ01zsfnmUePg4Sm1P6Fj1mgwqdAka1uEiNNKuznA0RXbkQabY3
	 455PHgZFSORR8l47If451n+UjiqKz0h1eufVcjRQXBoxMowpq9MG1f1gdqw4c1LRWo
	 /WSzXetWdPibFmTYhJqnxkgFUuk8MzhhNWZyR/XPFyzSzTFuoLg7vcsYZdifPB9CL/
	 RvTv6k316RtBTr1uZxqFP+Y+9Xyv3sqv3uo7N31+dlVTPikhrXN1JpYtrCsDNRHl5Z
	 qC1ZmMqNNSk7Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 43BF6DF3712;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] Allwinner SoC fixes for 6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172051743827.12156.7965703392289868105.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 09:30:38 +0000
References: <ZoQY5k21RQLOrBQ3@wens.tw>
In-Reply-To: <ZoQY5k21RQLOrBQ3@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 2 Jul 2024 23:12:38 +0800 you wrote:
> Hi SoC maintainers,
> 
> We have one fix for 6.10. Please pull.
> 
> 
> Thanks
> ChenYu
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Allwinner SoC fixes for 6.10
    (no matching commit)
  - [GIT,PULL,2/3] Allwinner SoC driver changes for 6.11
    https://git.kernel.org/soc/soc/c/097d4193b16c
  - [GIT,PULL,3/3] Allwinner SoC device tree changes for 6.11
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


