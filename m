Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657FBC433EF
	for <soc@archiver.kernel.org>; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2CD5FC385B0; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1658DC385A9;
	Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649970615;
	bh=c6K8nnAqw/r+9TK6xVam9MvNo1qWe3g4EjNdOPcpusM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=j6cAdCr1x2EDiLTbgI8sU62uyIZBj2uscedcsVGkMqBLT8DS3bxn/h1iqEPeGIXeO
	 ajkVlT8cYdba2R+26tEGv5R9BDr2ePzL4+3MO9suTWzRWfEC1qkbsAGZZUokExG97w
	 63aKZnaIUtnfR/WQDhUBe1f8tEKkwA36pAbONkyQJ5oFXYXQp5ODUus8wHA98/AF1D
	 9+hT0nRZnXTDuRtu0B0tBOheVai5CMCF7c8NbcXseHkU+cWNwa+cB2WJvuQBJ9v6sW
	 RtmDSfKhtwP6KiUHo7QBDl/lN+XUlYI+/ULzmSoRZkFGwFtsmKtYtQ+hU+1BwK0Twl
	 bgtk5MmiqSCkw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EB20DE85D15;
	Thu, 14 Apr 2022 21:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom/sdm845-shift-axolotl: Fix boolean properties
 with values
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164997061495.10394.18178885925453233929.git-patchwork-notify@kernel.org>
Date: Thu, 14 Apr 2022 21:10:14 +0000
References: <20220407225254.2178644-1-robh@kernel.org>
In-Reply-To: <20220407225254.2178644-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  7 Apr 2022 17:52:54 -0500 you wrote:
> Boolean properties in DT are present or not present and don't take a value.
> A property such as 'foo = <0>;' evaluated to true. IOW, the value doesn't
> matter.
> 
> It may have been intended that 0 values are false, but there is no change
> in behavior with this patch.
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom/sdm845-shift-axolotl: Fix boolean properties with values
    https://git.kernel.org/soc/soc/c/4f3d7e5a0b6d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


