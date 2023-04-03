Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087D7C76188
	for <soc@archiver.kernel.org>; Mon,  3 Apr 2023 16:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7ECAC433D2; Mon,  3 Apr 2023 16:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91C5DC4339B;
	Mon,  3 Apr 2023 16:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680537684;
	bh=phhRedZFem7BcATlLAU8jvqKthIUyxb6xNmfk7wxAq8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OsRvg8Un/4O82gpqD7bypA+o685nnfAdr7fGfBCAM+Wb3ibPAZVqALhIUfDBFPlSK
	 e27NuedIByMfSMxcLkIBL5BSGNz8f7HcpUiycReWQfHOIJ6Xw3uVJb+EhuuhQyughS
	 doVdtDx87dSBu0+fQdSlSQJ9dMeHRiJ0ybnKaP8fQ1anzzwwPsGd4FE4VHJHJwjq2/
	 +t1kFSfmNWPYW62/9FVowJV4O8SAaJpLLzoZB+lRuuWQoF9PovOn1B+5tfI85nd9jw
	 2DgWGwGwLGiQRKZvMd7kvGIpri3e/te9PA2DpVqcV2bYP1BmI7i7jWhk9fg7uH1Drg
	 JzvzwDluNVQnQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6D754E5EA89;
	Mon,  3 Apr 2023 16:01:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic fixes for v6.3-rc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168053768444.32283.4673795157319772835.git-patchwork-notify@kernel.org>
Date: Mon, 03 Apr 2023 16:01:24 +0000
References: <db5fcdb4-60e8-95e6-06b5-1ac474ecabe3@linaro.org>
In-Reply-To: <db5fcdb4-60e8-95e6-06b5-1ac474ecabe3@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 29 Mar 2023 14:22:58 +0200 you wrote:
> Hi,
> 
> Here's a set of changes to solve a conflict between the DMC memory space already
> filled with a node and the Amlogic memory bandwidth perf HW that was using the whole
> DMC memory space. The patches fixes the DMC nodes definition and changes the base
> offset in the perf driver.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic fixes for v6.3-rc
    https://git.kernel.org/soc/soc/c/0311454f4f2e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


