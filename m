Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFCFC04A94
	for <soc@archiver.kernel.org>; Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F072C43395; Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 650AEC433CD;
	Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690207549;
	bh=aEF1irvc12hmjRBn/0qNOyKUi18X8w5ZLTQD28k2ro0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QXVumAuwVUNqRVdVQgk30mtSuZLBpDmrO3nUqrp/bl8uHAb8Ffdgjvu5diLBTCqb8
	 yw2e5GgXdt5z1nBcpcsDyhrwGAg3WZOFqqtnziAv8oC4FPQCMgFqfc2JEEgNtTtiNS
	 8U8BKkWcG+lx10wNdxaUNBqfEfbeWR3+cOC9pyVb8gBy4PuWLge1R+rKa4NrYOZjVW
	 1d4Tq3bj7oY+OJ9UJ4porhIXO3qICYD233w0cry7s2r9bu/uq4Ob2xgLeOHydiOpOi
	 i/Li4tBHXJU88mBhSfRotitdyMDGgBAInakCMVJcRp3RFMAcwmIvGoBgSjlaiWBv0i
	 UW4uJSspnhJ7g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 43AAEE21EDE;
	Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: nspire: Fix arm primecell compatible string
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169020754927.21041.3445115145132956532.git-patchwork-notify@kernel.org>
Date: Mon, 24 Jul 2023 14:05:49 +0000
References: <20230711092617.1412815-1-sudeep.holla@arm.com>
In-Reply-To: <20230711092617.1412815-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 11 Jul 2023 10:26:17 +0100 you wrote:
> Commit c44e0503e5fd ("docs: dt: fix documented Primecell compatible string")
> removed the last occurrence of incorrect "arm,amba-primecell" compatible
> string, but somehow one occurrence of the same is left in the nspire platform.
> 
> Fix the same by replacing it with the correct "arm,primecell" compatible.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> 
> [...]

Here is the summary with links:
  - ARM: dts: nspire: Fix arm primecell compatible string
    https://git.kernel.org/soc/soc/c/b44c11d86b7a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


