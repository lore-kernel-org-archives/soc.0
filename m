Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBC5C61DA0
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E95D5C433B0; Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3854C433A4;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674595889;
	bh=ZEFSN3zxfprCygrtvpZY+oZS5SiDzVh2hvcTslmqjjc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=onj5NWXMQrAQT30geOjoPuoAn3guDhce0lSrnIk8jIsyObYBaTjE+b1NF7NTLzKJC
	 JgGc7wB4ssgQutiJNzCevEGwyTAKGrjdhlTysG4Hl87wRp05yarE6129Ek50DfAy7I
	 R811/oNNjNjdlbzCccs7CblhMahtFVayyN4kQowmtj15MA6HOTQNakjb51BUcL1xDm
	 P3uKZGCUe1yZK19/rlmePEDFaB/MAdSzCiA7Z/u70+Bvh0In4DfKcB8p0+tMavBcRH
	 dO/AKuJK0NEQZeFQ/NKPSK/MqDAkEMuOPbbO9Em1ZVa2hPdAyBJY1pg/NM8te3TdwE
	 k2KLpe6ZIub1A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B3CA2F83ED1;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.3, corrected, v2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167459588973.12731.9493929019930104990.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 21:31:29 +0000
References: <20230123105330.63709-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123105330.63709-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 23 Jan 2023 11:53:30 +0100 you wrote:
> Hi,
> 
> Version 2 of the same pull request - dropped one patch which was not needed.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.3, corrected, v2
    https://git.kernel.org/soc/soc/c/0d01e09022c5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


