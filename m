Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3409CC04E69
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06E9DC433C8; Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E08DDC433C9;
	Mon, 14 Aug 2023 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692033026;
	bh=1G21A3Tvp6jYbl0Subk9+lASs2ElrKyQcfJlSOYT4qw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=igJRs/ceqkOAOroQnYBkRzUwPlMFANIEAxoWuUMi9Fu0AwPm/p7RkNC7tt6+VxFp/
	 wjOLCjerzCUBac+qwgdH2lSmL1sIdVeYXT+z0erDtka3DulYHXp+LnRbNPfSfUF/UH
	 TunppdZu5pkmo4pSSXq0jMcO4ZZaEVLgdpFOj/V20UOOa+7lvI9C1pczA279xTKIbT
	 V9USmhJZ9QFdQBvdMYmrjFBh2UCtq9o88jX7ALpPhduj6M14y3Jm52fLEHgwzykpAY
	 cXlNJqU/zhR10/klcW5XIxc7pAIJ0mR9V284fIoAPrC4UpzUooFkY+1m36uFcd7STn
	 oeWLaxI7/+qBQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C28A0C395C5;
	Mon, 14 Aug 2023 17:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169203302679.15030.6667602167822253075.git-patchwork-notify@kernel.org>
Date: Mon, 14 Aug 2023 17:10:26 +0000
References: <20230814120052.27485-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230814120052.27485-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 14 Aug 2023 14:00:52 +0200 you wrote:
> Hi,
> 
> On top of my previous fixes pull (tag: memory-controller-drv-fixes-6.5),
> because of code dependency.
> 
> The memory-controller-drv-fixes-6.5 includes two commits not listed in below
> git-pull-diff:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.6
    https://git.kernel.org/soc/soc/c/3cb5b035d816

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


