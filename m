Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF16DC3DA41
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1FE7C07618; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C17EC4160E;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=r0tm7M6kfMQ122RxAo20c1cj6f7HHTioTO7t2V9w04k=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=aEHerHS/OJlu5od8kCJGI2QO7xuv5cCyqX74mIn0BWJGmNQ1C/O2i1Sg8NhmXIhPT
	 nGXgy1lBLGWt/ddP/RnDNmGsqsH/J8oqjyZpWx6ahQqjs9SoecpYtkDb1h4c3nk7Hw
	 RRY3/lofPunSSvm1/hC9+zq4ugcXuOa3Nt05UlpgPfc+N5xRAPCIp/Q6lBycNjXWEn
	 XR21qF20KeEAlmRDSBhKj2ZyxeOxYfACWapY7bwx3ia00UiosghGyX9r+eTZQmcEqC
	 cFGmK3f02G2RyBQcLVHcTA6jaBWTHIHr/cQT4jpEsLzqnuXhTViUYNtnD2aMrvQItp
	 3PhKoSGP16AJA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 78CEBC3274B;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168949.30475.4663182267267853653.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <64CC99A3.5030701@hisilicon.com>
In-Reply-To: <64CC99A3.5030701@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 4 Aug 2023 14:24:35 +0800 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: hisilicon dts updates for v6.6
    https://git.kernel.org/soc/soc/c/a4cd6f26777b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


