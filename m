Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027A5C4167D
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7665C385AE; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D10E8C385AF;
	Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649334247;
	bh=ov04QdtLDa7lJ/7A6zs8wmicz7o81eRJXNiAeLviNyo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=YJXBVO+DPesf8RUxUxGwjjibQP/3fhKlF66RHRXaJbQkOTnzOe5lC1J7OW73EvVT5
	 PQaZAZ5eT9mBpzNVu78Hz01HESgqRrjI4mIbNabufgv2a9yUHWl6dF1qt8AY51jXdK
	 Wd+9IxZ3gNZLF6Pf/5hINBPp7479A8bgnKREzir8X+4kCOhBxIFFQ7KDq73oxwlnoe
	 7hEncuCPdigXJmFVxx8nDkd4eg9+ONzpDsQLxFq7VT4a9WP/qWTKy3tObkB0kVYCbq
	 XftVI7Bzp25exYoDyvZVkIl4HpA0b/yAvvBUN4MuXVUWOVrTDbcHNaGfSAIdlfWBAd
	 3bvfD3khHKLjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B83A7E85B8C;
	Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH] arm64: dts: tegra: Fix boolean properties with values
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164933424775.10369.11056219867331864894.git-patchwork-notify@kernel.org>
Date: Thu, 07 Apr 2022 12:24:07 +0000
References: <Yk3nShkFzNJaI3/Z@robh.at.kernel.org>
In-Reply-To: <Yk3nShkFzNJaI3/Z@robh.at.kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 6 Apr 2022 14:17:30 -0500 you wrote:
> Boolean properties in DT are present or not present and don't take a value.
> A property such as 'foo = <0>;' evaluated to true. IOW, the value doesn't
> matter.
> 
> It may have been intended that 0 values are false, but there is no change
> in behavior with this patch.
> 
> [...]

Here is the summary with links:
  - [RESEND] arm64: dts: tegra: Fix boolean properties with values
    https://git.kernel.org/soc/soc/c/1a67653de0dd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


