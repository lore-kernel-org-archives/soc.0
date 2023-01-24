Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3EBC61DA3
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EBE63C433B4; Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5715C433A8;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674595889;
	bh=HdtDRq0QcWtEZVOZ1nD3HO0k7Hv8/s942byB5Z6qdzk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=b5xHqx22RRRZ8SR+E8Rf+uXtWSv6C9PnZ1AqhSQO9bsIbE+eslMYG7LOZAa/oJR7S
	 L1eSiSjxXX6OiFEkkdHGz6FVdQlVCJNnYs4Zs74YjDMhnn/GoznLggAHYg+zxKb6AC
	 trTcVPodGsyPFYmgcaJ7GAfD+adxPrfLZzqfgbzRmyxyK35iqpig7d5ztvfXL68UsO
	 TDuffC1Ldd3yp3WjAffCaQy0d7zkG/V6YIthtyPBX31T2TAPLSQsubzFlVVAkH743G
	 C/Ca18/psxSxn05/edaf8skLEidylJsPGQs7YxhKLOSgxnX83jCQvHVvXHqpUwAJom
	 DoERajSpdtm4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BBA03C5C7D4;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: drop redundant "ARMv8" from Kconfig option title
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167459588976.12731.1863321513792548987.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 21:31:29 +0000
References: <20230120125722.270722-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120125722.270722-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 20 Jan 2023 13:57:22 +0100 you wrote:
> All these platforms are ARMv8 or newer and choosing the platforms in
> menuconfig is much easier if the titles start with something specific.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/Kconfig.platforms | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Here is the summary with links:
  - arm64: drop redundant "ARMv8" from Kconfig option title
    https://git.kernel.org/soc/soc/c/69d8a5f88437

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


