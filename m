Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E8FCCA48E
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7277FC341E4; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CF6DC341DF;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656708097;
	bh=Q2exTGVqK411IcEVBH/fNp1Lw/g1EQMmT7vweL4MWyo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oLZPGxz3CgvHFm5bP7gLTF+JDa2eHIRDsqN6iV0o9je8hOVQwjtSp1Z4dl9fymqUl
	 /RLiW9SPABzSCbHLXlQo7UTPAe45MCSmD8lcHyM9OcCh1kJCXYpaXSMAd8OoulWtU2
	 3L9FpdMQVjPPmr5S82dyttyLwpX37zlr0FHCo4THQi7cqKFtBtcSzLniIsCLxw+rEv
	 cEvblpFCQLoKKzO/Zc1K5766XtfA6huBaeWp3u40CPUeAYHBu94nukDSaLdnO2O57o
	 kfcZyG9g1gNsu2H+28atpCFUmOXlPN/bat1+imYRXOhK66w0SCpknQTtFESOJDEPuq
	 JAyXJ80B9829Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 479EDE49BB8;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: aspeed: adjust whitespace around '='
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165670809728.26141.10131028646840798569.git-patchwork-notify@kernel.org>
Date: Fri, 01 Jul 2022 20:41:37 +0000
References: <20220526204127.831853-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204127.831853-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:

On Thu, 26 May 2022 22:41:27 +0200 you wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> [...]

Here is the summary with links:
  - ARM: dts: aspeed: adjust whitespace around '='
    https://git.kernel.org/soc/soc/c/94d0a0329761

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


