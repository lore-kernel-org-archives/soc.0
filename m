Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A33C19F2B
	for <soc@archiver.kernel.org>; Wed, 27 Jul 2022 14:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCBE4C43142; Wed, 27 Jul 2022 14:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6F55C433D7;
	Wed, 27 Jul 2022 14:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658933413;
	bh=dpSzTW6AfyTBzopQNfAwXFNSX+CWo0nG2PX6/GrW7fM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MukUgqyc0Ws1PcQ4Pn6CFATZ4L3Wtxv27ln15NbMrg7GrKck1CX5eYhrKRVo+DOly
	 1zAxqWvmJVMhR/TE2Cue+QUCxrg5vl3pLYSoi02jdqPDwrsTK+mUJdRlxlRsj6eQaI
	 MdY6sjwMmIlnYtC5BCVp7w7NhMwD1x+674XpYar7YaJ/SkRhpWXOw3fOwJBkz6hadu
	 dIKKbF7S2DsExRbEf/sEzwg0SzFi14dOl3VSNBJ+XQX1PPRUCK6OyP+MmsTNmIjWb+
	 COxwL+OJeOl1MKgpw72OUuBKfh5i4kGwbfnkFZkledKf7pSFU2sbnqeWjHKKPHQFW/
	 6I7qq+qbLxLLA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AAA6BC43143;
	Wed, 27 Jul 2022 14:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/4] dt-bindings: soc: bcm: drop quotes when not needed
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165893341369.18215.11282187505966503096.git-patchwork-notify@kernel.org>
Date: Wed, 27 Jul 2022 14:50:13 +0000
References: <20220726115841.101249-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726115841.101249-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Claudiu Beznea <claudiu.beznea@microchip.com>:

On Tue, 26 Jul 2022 13:58:38 +0200 you wrote:
> Id and schema fields do not need quotes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [1/4] dt-bindings: soc: bcm: drop quotes when not needed
    https://git.kernel.org/soc/soc/c/d07ae9004f18
  - [2/4] dt-bindings: soc: bcm: use absolute path to other schema
    https://git.kernel.org/soc/soc/c/47d8f8b78b9b
  - [3/4] dt-bindings: soc: microchip: drop quotes when not needed
    https://git.kernel.org/soc/soc/c/43f45415f31d
  - [4/4] dt-bindings: soc: microchip: use absolute path to other schema
    https://git.kernel.org/soc/soc/c/e48ef9a9c529

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


