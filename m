Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56D1C3DA4B
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 921E2C4AF1B; Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C1ACC4AF0B;
	Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720533033;
	bh=1ImEuIPDxfIHgpqIr8R3XGeip7HW8ylRYdgIKo8utZ8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=WKUdvYNBSTJHW2R902k75vLrDhCUw04Yt0RkWzy47udAGlkTDYwOviOLkYePuW2Ga
	 XbIZp7uXALo3zwpwkgq4hiYbfrlOsKgXcqM139L0fuZUkXR6waTH8I7kJCNR8KVam3
	 Bqq314OMVlCFr0CRcxca9UDZg/YhZ5OF7AVjb1Zal34QRkRg2HhlKEJDxxlRzH+mCd
	 nDyF+BrwCemJHgZfJuf0Ke/DePretTbmp3b305ddEYirNiwutps3XyzzCpHn8ec4M7
	 cRPYXYTUrm4R4qgiGuH7Sr/Lqt2o/1+2vlFsOzCR5bWjrsij8cilV+sV6B7JgBV1aA
	 4Afbmp+XV8M/Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6B800C4333B;
	Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] MAINTAINERS: thead: add git tree
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172053303343.5265.3847821429744981153.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 13:50:33 +0000
References: <20240704180913.2516959-1-drew@pdp7.com>
In-Reply-To: <20240704180913.2516959-1-drew@pdp7.com>
To: Drew Fustini <drew@pdp7.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  4 Jul 2024 11:09:17 -0700 you wrote:
> Add git tree for T-Head device tree files and, in the future, drivers for
> the T-Head TH1520 SoC.
> 
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---
> Changes from v1:
> - Add exclusion for thead in the RISC-V MISC SOC SUPPORT entry so that
>   there are not two git trees covering the same platform
> 
> [...]

Here is the summary with links:
  - [v2] MAINTAINERS: thead: add git tree
    https://git.kernel.org/soc/soc/c/480d9a6083f4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


