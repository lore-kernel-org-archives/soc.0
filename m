Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01324C7EE32
	for <soc@archiver.kernel.org>; Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D743DC433AC; Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB435C433A4;
	Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685980254;
	bh=PRteWxtEkL9djWPN8yoBD6cskLK+OirQHZnZ6Heh+WI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FLhd5WWe/Xb67bpanGYwg6lHneEVkZEn+wiyrR6GaH9XxAtTC7AILUQE68UtPeWXo
	 qKGq6e8I182QTzHXKAE0CpFyeH8F5JpVk7q4Zl1OD8UbgxS2xSCmITEk6Sbt5H+Cjr
	 o06Fr4QNai3bB7lMARN/ogP7egaa5+j77IRaDao7GvtInFuYu+ni+x9p2g/OYg/ZYU
	 Ufp1NF9kmnTBwJHDl8CvHOdD4mdeUOgLaFCWrkhsR0BE/DDgzxP6GgqdTP7oJgwf/0
	 6ciY2Adm3L3Ys6tCM1e7Gg1T1o+kOUrumFX/hpdS5QFnQmLTZ/+S4TtERgoZYUPo+9
	 agdRW72aQ5+AQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A14C7E4F0A9;
	Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM32 fix for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168598025465.10098.12668640124727284531.git-patchwork-notify@kernel.org>
Date: Mon, 05 Jun 2023 15:50:54 +0000
References: <20230601140347.2245680-1-andersson@kernel.org>
In-Reply-To: <20230601140347.2245680-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  1 Jun 2023 07:03:47 -0700 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-6.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM32 fix for 6.4
    https://git.kernel.org/soc/soc/c/1c278f8eba9b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


