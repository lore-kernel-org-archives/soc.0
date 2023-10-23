Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F28C25B52
	for <soc@archiver.kernel.org>; Mon, 23 Oct 2023 19:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1746C433BA; Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7CA3C4339A;
	Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698089430;
	bh=v8FKjVBTdnr5kbLseDJXTUK1p4EtmQtGOKFEG1/zUe8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hTWiWYGn6WMccbE97xUQ7cg66mDhEKXVaBLZp9BQq2ViSv2z81dPei2wGbbuMSRJA
	 RYCU7gwSjOQTNDp1WGjpFT1a7HeEgFlIY/+hz28SlXzXjO7I6+STdHh1wB1SPFLkb+
	 oMpFWqw8gZB6L9/z6apOVGflLVq6QCD0OCpD1ts4NxTbTFcu4DfT4ad0hYJL5I4d0E
	 KI6c9cxGnV6YIcN6Td5vijq7CiIoBUZD7/0NuRS3Leo1ShRo2Y2IMkSrT+o+dHFOD6
	 fuLmbvZspp61E1gmpNGOiV2GJtqUnCOBcB8xHFX1jW98j5AeKUnBulsCG9OLjf0sY/
	 PEZCw8DU84a3A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 866E9C595C3;
	Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] Update UniPhier armv8 devicetree
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169808943054.14534.2442895774383990433.git-patchwork-notify@kernel.org>
Date: Mon, 23 Oct 2023 19:30:30 +0000
References: <20231023021221.2884828-1-hayashi.kunihiko@socionext.com>
In-Reply-To: <20231023021221.2884828-1-hayashi.kunihiko@socionext.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 23 Oct 2023 11:12:19 +0900 you wrote:
> Update devicetree sources for UniPhier armv8 SoCs to add
> missing cache properties.
> 
> This series combines the following patches:
> - https://lore.kernel.org/r/20221107155825.1644604-21-pierre.gondois@arm.com
> - https://lore.kernel.org/all/f9a2c0d7-a78d-9368-f9bb-e8aba11e7d81@socionext.com/
> 
> [...]

Here is the summary with links:
  - [1/2] arm64: dts: Update cache properties for socionext
    https://git.kernel.org/soc/soc/c/8d4f9145f52e
  - [2/2] arm64: dts: socionext: add missing cache properties
    https://git.kernel.org/soc/soc/c/e035ddb68bb2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


