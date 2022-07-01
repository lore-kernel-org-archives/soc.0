Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDD4C433EF
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 124BCC341CF; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB1D2C341C8;
	Fri,  1 Jul 2022 20:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656708097;
	bh=fGIskHSwK7ELYUD+sR4UdiRg3Re86uh9EmpGXhawxAA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HX8jA3kx7qFANKav6dLN0xnzibzlU3KYq6aJUypoCDPGPAy5EXjfBhliAbGScotgy
	 JbYtcyeF3oqndtDyWS/T12zndnUTAk2q3hjg/VW4KJOXxdpkuZWJi7nGEuZewxTHG6
	 Pu7Qq8A94qfrYOqjkcWjyE54u8KAEpZPJjN6D++dNN+TOumyTXVwEucE3rOkbEP7wB
	 6WaohfF29HcK3xz3P7nNe1Z2lLqwFZ8cwefjldHCqwc2inVh3KBK0cN/zui26hpQ+5
	 F2OeqAqwhbz/B+TrUD8sRKTqDPv6eZWRW3WlrdZfDYdl4zmopwCkaDmlxt23OQsAj0
	 xyaXT8xpyMfhw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D1662E49F61;
	Fri,  1 Jul 2022 20:41:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: adjust whitespace around '='
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165670809685.26141.15714221984060670815.git-patchwork-notify@kernel.org>
Date: Fri, 01 Jul 2022 20:41:36 +0000
References: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Neil Armstrong <narmstrong@baylibre.com>:

On Thu, 26 May 2022 22:45:51 +0200 you wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> [...]

Here is the summary with links:
  - [1/2] arm64: dts: amlogic: adjust whitespace around '='
    https://git.kernel.org/soc/soc/c/ad414ddf9de0
  - [2/2] ARM: dts: meson: adjust whitespace around '='
    https://git.kernel.org/soc/soc/c/c110f7a94015

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


