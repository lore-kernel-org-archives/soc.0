Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2C2C41513
	for <soc@archiver.kernel.org>; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 852E4C2BBFC; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F12AC4AF63;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715074839;
	bh=1Q00392YkABibh+6KuV0HKaYyB7J66qsuFplEUKqn88=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ca0hs0w3X8OapMtXr9gPhRMkWo2oWfvqVUgqU+seVJq7V6gbdNU1SEcLZ3w9+jJp1
	 9axjPIl/KbNXF2OH6KgkM/3qp4Rj9OLE5NsAtyQGHETrZerV/7POKuPrD1wgMNlGsl
	 EBzFEWQL3g5LDfDTiV1GS7ROPaoOP3m719/vbVt9InR38+cWiC1GZMvteYIfRmAPUy
	 K3hbu2MWw6OrzUjweMCVeYRTpse6Je85U5cuq+LDcaKc0+vSlWJyMpqeJLCzDxWQd8
	 XDo+rZN19C0mUKg2ZRu4kBeqj0l1nQIc3rJTLsw8iYPhPtvQ4pCBDaDbANL6Mda+6m
	 zvsaZ8oU+6YVA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 609A3C43331;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: samsung: dts for v6.10, part two
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171507483939.24942.5952976813166030208.git-patchwork-notify@kernel.org>
Date: Tue, 07 May 2024 09:40:39 +0000
References: <20240504121233.7589-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240504121233.7589-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat,  4 May 2024 14:12:32 +0200 you wrote:
> Hi,
> 
> On top of previous DTS64 pull request.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: samsung: dts for v6.10, part two
    https://git.kernel.org/soc/soc/c/f89d22439fd6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


