Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4742FC43334
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D3E4C341C6; Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1802CC3411F;
	Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655239034;
	bh=MLKVQVSHQAv2vJf4GYJGdSGQyo7jju0nsWg/7Kan/ok=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NFtgzJG2Bp0miXcRQ0PJvcr4v6+ZtXNDHsxYZmz7PQV6WdWt70a4JG19+9g1Fh3PZ
	 s7jomP/9r6EGXOD+4epZOPtmPoUdBWCIRHsrCfa98PBZSDNSS0nU9JR1/OUSz+HaLD
	 DYHslJHUeqmENzZy6/ECbnF4rKpUMk6t9lvmYAaBRnZUVbgqzcPMKYCy8NQED1uppY
	 vledyHZqiHx2lotN0rswu+gLDyFR1HAura4FaA81r4ZzzQUHBpXW9/gYouNUGvVz2S
	 u7jMzuCuFDnZz3Vvb+QGItKi4GqXuCZZbfT+MSq9chxh0NORzw32MKfHy9mHLv0szW
	 w66bSqzMOlPtQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E9B41E6D466;
	Tue, 14 Jun 2022 20:37:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: s32g fixes for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165523903395.29335.817577555604580802.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jun 2022 20:37:13 +0000
References: <Yp9Y4nGrQ2kVKV6S@linux-8mug>
In-Reply-To: <Yp9Y4nGrQ2kVKV6S@linux-8mug>
To: Chester Lin <clin@suse.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 7 Jun 2022 21:55:46 +0800 you wrote:
> Hi Arnd, Olof, and ARM SoC maintainers,
> 
> Please pull the following two changes for s32g. Thanks.
> 
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: s32g fixes for v5.19
    https://git.kernel.org/soc/soc/c/2d2cb31bd36b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


