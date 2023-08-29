Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E4EC83F17
	for <soc@archiver.kernel.org>; Tue, 29 Aug 2023 20:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E78B4C433CA; Tue, 29 Aug 2023 20:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1533C433CB;
	Tue, 29 Aug 2023 20:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693340423;
	bh=TNNw5JqoUYdVyL/7dhn1m41i2QjtQse7FRFqB8m74DQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=s5e4LARHMnddK7z014Kqu7m2SXisrSRujz1VF4I+tRhiZXelmzXY7IorvfEj62574
	 T5FoUCjxXAGvC3Uhh7aEBQfzVQyxOYRFutmwNbz9LYLA00pMjhCbKZcFDMi4bVecpH
	 CEFSOmRMlS+lmgZ4xndnzsu4ne9HVHvjqSqgm50RGDHOLfBWOFQf3EyFfvMLgiWxI9
	 xNAL/xMqN28QskQnNZDFGxgNCFRtDZb8ZJ0RfOe0GYNjaxheB5QWDzG3SXTeXRPni3
	 DvChg9Tdbe1udgCcEz4fsxgT6LxgO/UjcY2TiFpTQ0uJTcgK9sQzznNUl8vB1jHASK
	 SLj4jsZy4/B8g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B1DBBE29F40;
	Tue, 29 Aug 2023 20:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] ARM: davinci: Drop unused includes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169334042372.18037.17035856211534097587.git-patchwork-notify@kernel.org>
Date: Tue, 29 Aug 2023 20:20:23 +0000
References: <20230823165637.2466480-1-robh@kernel.org>
In-Reply-To: <20230823165637.2466480-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Aug 2023 11:56:38 -0500 you wrote:
> of_platform.h include is not needed, so drop it. It implicitly includes
> of.h (for now) which is needed.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Arnd, Here's one more that slipped thru the cracks. Please take
> directly.
> 
> [...]

Here is the summary with links:
  - [v2] ARM: davinci: Drop unused includes
    https://git.kernel.org/soc/soc/c/6e73bd23a1cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


