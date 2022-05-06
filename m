Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D6AC43219
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 21:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0DFDBC385B7; Fri,  6 May 2022 21:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECBD0C385B6;
	Fri,  6 May 2022 21:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651871423;
	bh=Pc7AkrixnxvqaZ1RnzH/qH5pKHbCWuLEpW3S8deDPsA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=puaS1Sn542nCHmg7qYw8LS3hT4bQuH8lYh1L2Gb4fd2+PVZs+JGYiGt9fAME2GFBL
	 tHh7ycKIHlGZwbSGoMAP2eBzCCFbhQi0TZPbfHRRa904zEcdrmgWUE43SmwDvWfOAs
	 NYaMAodQNNJwiaHSlw2Ys1WLX4SrX63mv8eF2BFtIUp/BcegU48jDEneu828uHwE2H
	 /qW0HJXstABCmC+Wp4c8zU01osTFoGfOHe3lorhV4RnNBX0GRc5fHjNku8DFF82Ddk
	 aA8UFis9nXDSNn9TRxlpz2SPIoZzbqpAl53icaU8G7AZdHsDqc3TNMUbNNfDE4ACPo
	 IoyOhnexKhipw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CB572F0392B;
	Fri,  6 May 2022 21:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE Cleanup for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165187142282.4183.8814674158369538737.git-patchwork-notify@kernel.org>
Date: Fri, 06 May 2022 21:10:22 +0000
References: <20220506070328.GA1344495@jade>
In-Reply-To: <20220506070328.GA1344495@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 6 May 2022 09:03:28 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these small cleanup patches which removes two unused and
> outdated TEE_IOCTL_SHM_* flags and two unused pa2va and va2pa functions for
> tee_shm's.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE Cleanup for v5.19
    https://git.kernel.org/soc/soc/c/728c0d29415a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


