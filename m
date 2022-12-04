Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743FFC47090
	for <soc@archiver.kernel.org>; Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A2D3C43148; Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33EFBC43143;
	Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670156416;
	bh=Q2xgCJiy2Y+5Ype6CCATh/wESeeGl6oEVJOwZIYLMn8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QEuYR+V8avrzhF56laeIemRDPV9PIowA2rVsfWdJIEmSEuxCqUPfGgq3czqkhyG4M
	 znO0il9kcUTJ3RhpZIvfhC5QfPHCceTjcNHDn6JPNjg/mfkVJVFul8oBbaXKkUJTox
	 3y7xZ18SIg8++V2OiwdDnEED39J6tPge74JA80MnC0/T7S9il7Bln0w01Td4fd/Yrk
	 ieL0Fksin2I07H9TiBmeAV1k86k2j40hZiNsZ4A/eD+L1qIpdcp2ATQsNtTJjkNNZk
	 +CRe00zrbF39DmUDj359AZFNYEprS82PqRMBD8yhg2yC62QyU2d5RNnF2/cm20/PFg
	 qlQjvfnAz69cg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0D425E29F3F;
	Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC DT updates for 6.2 (v2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167015641605.6046.16560387240427076503.git-patchwork-notify@kernel.org>
Date: Sun, 04 Dec 2022 12:20:16 +0000
References: <a9353121-7fed-fde7-6f40-939a65bfeefb@marcan.st>
In-Reply-To: <a9353121-7fed-fde7-6f40-939a65bfeefb@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 4 Dec 2022 13:41:26 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these DT changes for 6.2 (I hear there's likely going to be
> an -rc8, so hopefully this won't be too late).
> 
> This batch pulls in the CPUfreq DT updates that go along with the
> respective driver, which is already queued for 6.2. It also includes a
> patch from robh to add the cache topology for t600x (t8103 still pending).
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC DT updates for 6.2 (v2)
    https://git.kernel.org/soc/soc/c/8bc638ea67b2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


