Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1262C433FE
	for <soc@archiver.kernel.org>; Wed, 16 Nov 2022 21:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4E7BC43140; Wed, 16 Nov 2022 21:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B894BC433D7;
	Wed, 16 Nov 2022 21:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668633616;
	bh=I/S9QE/X/0dGpK+nU+3K7Wslgq4zcQJUj1l/B4KzH6g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JH2uMhr3f/yXmnVa9E7pAU0EU3ttqyEWQWKN0tCNZeuJj3n2Whv9lFLwREN7igU+g
	 WWTjG6/g89B/qMoRft0zHouZT7TaQcoec5YhwdliXWC+dAzOZm25FdBFjwGy7j1o8q
	 D813ZPlGIsDwV8iFPGilvyYUlakp1cJmHWueBTKByWfXuRNlx6O/wtOFS/Vsux9toQ
	 NsQRB1vuium8/cg222Eyk0YvnM1yNE2wwqG9mKPnJjYkr4LGEFW571b+25/i7zNw8K
	 TfxxcDp/ACpnmajPIb+l5Y4V+0XbNobC33XXchYS+BspOXMutZJ00xe8Ap2F4QKmWD
	 M2R+e6FbA2JAA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 92F96E21EFD;
	Wed, 16 Nov 2022 21:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] HiSilicon maintainers fixes for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166863361659.3865.13543709233728153205.git-patchwork-notify@kernel.org>
Date: Wed, 16 Nov 2022 21:20:16 +0000
References: <63744BAB.5020307@hisilicon.com>
In-Reply-To: <63744BAB.5020307@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 16 Nov 2022 10:32:11 +0800 you wrote:
> Hi ARM-SoC team,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] HiSilicon maintainers fixes for v6.1
    https://git.kernel.org/soc/soc/c/f9084ecbdab7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


