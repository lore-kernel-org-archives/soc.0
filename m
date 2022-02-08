Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407EFC4707A
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38595C340EE; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22AC4C340F9;
	Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644311579;
	bh=qHh+TWPbQECT0U+Cj6FU4/fhfM076m9/O4KhUS/XqIQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PEnMZQXqaqexVDwbVddFEcbGxWy4FJcv+M+kQrHQOFpC1MysAy9EdmemyR5PyTVBj
	 wyNQdVzJRlCZ9P31tB33J4TtsgR9yFqaWZnKxDLZ/Uz3c+BgwTG4KGgVbVuyW3v34W
	 OEXOPoS3Qy4jFH5Xo1IwNr3NghkUN+jIpSw28rDUHalMre+uuoNXPgtrE18iTGn1AT
	 Gj3ngo4/0JsohyNrC++lMHsreGSXskQXL9zZGefATWS9NIU8DxnBTTdBnp+2UkEMCA
	 EtGUzxgcXkHCjb6H23T1Way51bQSYqHqF9dNo2dc43bcuAacXB2ZYxUnYJ1PyLbfmd
	 3kaDlS7wLRbYg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0E688E6BB38;
	Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] MAINTAINERS: arm: samsung: add Git tree and IRC
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431157905.18327.13820695782504476358.git-patchwork-notify@kernel.org>
Date: Tue, 08 Feb 2022 09:12:59 +0000
References: <20220207175503.425200-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220207175503.425200-1-krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  7 Feb 2022 18:55:02 +0100 you wrote:
> Add already used Krzysztof Kozlowski's Git tree for Samsung
> S3C/S5P/Exynos ARM sub-architecture and IRC channel (#linux-exynos at
> Libera).  This documents purely existing state.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)

Here is the summary with links:
  - [1/2] MAINTAINERS: arm: samsung: add Git tree and IRC
    (no matching commit)
  - [2/2] MAINTAINERS: add IRC to ARM sub-architectures and Devicetree
    https://git.kernel.org/soc/soc/c/5b52ada7141f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


