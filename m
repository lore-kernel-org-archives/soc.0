Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD849C433EF
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADAFEC385AB; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95EBCC385A0;
	Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649334247;
	bh=8mhLf6TqZMdyscATmfgNDHQf4wu4OIjPWB6AaveGw3I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=qaHfNf8BgH9eH8gWOpeFggNjAbSs4iZ/SmjtRP2ek0oi+yAdarxzkvjHXbOGhZkOu
	 8vbUyIjwUJyhmMN0OwIUIr1xp8ZB27CcNVkEPTmpbt3m3TG/eZMcf/1li3rt9G6xbr
	 D5MczzDdin4PQK56TWz+YLmgR5Xoe5pulawRv+ey+/owjYfzWCevDgHhOs4n8EA2c7
	 EtwtUtQcO+Thc3cKXr1LU+E46nJwTmIL4+flf7ICv5g97JTsVTFMcaeH75kH7IgQG5
	 BdvCF3PTyt5Cvv8mJn14agR3tCHcs9zHRY1KBhX2l0Bneq4En1pKEoUDDy06Eh+QqH
	 briVF6plD/5ug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 75A80E8DBD1;
	Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH] arm64: dts: imx: Fix imx8*-var-som touchscreen
 property sizes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164933424746.10369.17963593757235277681.git-patchwork-notify@kernel.org>
Date: Thu, 07 Apr 2022 12:24:07 +0000
References: <Yk3moe6Hz8ELM0iS@robh.at.kernel.org>
In-Reply-To: <Yk3moe6Hz8ELM0iS@robh.at.kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 6 Apr 2022 14:14:41 -0500 you wrote:
> The common touchscreen properties are all 32-bit, not 16-bit. These
> properties must not be too important as they are all ignored in case of an
> error reading them.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Can someone apply this for 5.18.
> 
> [...]

Here is the summary with links:
  - [RESEND] arm64: dts: imx: Fix imx8*-var-som touchscreen property sizes
    https://git.kernel.org/soc/soc/c/1bc12d301594

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


