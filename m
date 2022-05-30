Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6D6C43217
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 09:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B89E4C36AF6; Mon, 30 May 2022 09:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9728FC36AE3;
	Mon, 30 May 2022 09:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653901815;
	bh=0sQpSI2ZRL5y3r4aC7lHUSv7TBcY4rtOFP/0zFTKbbM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hth878qgdi+7QyMB/evdRzTo0VnD7t7t24QpjzcCckfZUAXIaezbqmWy5J2UPgwI9
	 uBdcC4AfzILd4Hpd7vEtvUGKf2oUOWZrbMVYRnFV8qjBXgJErQnUouIPc90+i1uCba
	 wNhNwC8O9lmsuJIU72FrsgiTswG3ZsGWK1u+JRYjl3EKjAKt0gx2G6y8Mbg9c+/vO9
	 YCtN+5/fSI35+Cl9PCjJihfZDjoR+yZUUnRbNYM5n5/tIgTuaH8Gl6wTQZXsxS4iy+
	 sYiWHQWcL0J4FFik912eZFZR9FEIInS5Nl4KTmDYLdbQ0Eecx5GmtFurcdq6m63Lzz
	 ZNXtU3V6B0KXg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6DA74F0394C;
	Mon, 30 May 2022 09:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: socfpga: updates for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165390181444.1903.6622330505099980569.git-patchwork-notify@kernel.org>
Date: Mon, 30 May 2022 09:10:14 +0000
References: <20220519232317.16079-1-dinguyen@kernel.org>
In-Reply-To: <20220519232317.16079-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 19 May 2022 18:23:17 -0500 you wrote:
> Hi Arnd/Olof,
> 
> Please pull in these updates for v5.19.
> 
> Thanks,
> Dinh
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: socfpga: updates for v5.19
    https://git.kernel.org/soc/soc/c/8eecf1c9929a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


