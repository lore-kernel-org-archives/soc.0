Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41ACC43217
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF5D1C340F4; Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9843C340F6;
	Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644312109;
	bh=U1Li0lzn0/xGuuzfa+NqD9NuaFtam/+PZfiupIK5n4s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TdskAcpABS0goFLfNvehe+0psAmvZPiJ6XpoSPJ3VdME5uv6s2jyxVWLUvuoN32VX
	 37Upa/9bMjVp5ELcDfy+zM/PRZT/ttudWfoHFUEd8ldKAJBcN4SapNDPAnbS6eFwpA
	 xms1Dqxl5AIpKfZDOvIgvCKUfM7ch40WJHt363mNQu74PDWtzTCJgz3RT9Eu8ngpmE
	 eEwN/AsjtsUX0e4BpLXvch0MwYqstjr1sSvXowhETOMmU3yPLtXo2UWUpvB2qTQD97
	 d6HOKPX0ktkupVf6gvwI7ulaqtOxqGKXMPVwqTwoVcmPBCMsYc967hVfXAXcHJEnXq
	 UFMkH902u8cSA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A5CC8E5CF96;
	Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fixes for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431210967.18327.54688905354921107.git-patchwork-notify@kernel.org>
Date: Tue, 08 Feb 2022 09:21:49 +0000
References: <20220126102609.GA1516258@jade>
In-Reply-To: <20220126102609.GA1516258@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 26 Jan 2022 11:26:09 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these OP-TEE driver fixes all concerning the recent changes
> regarding FF-A and asynchronous notifications.
> 
> Thanks,
> Jens
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fixes for v5.17
    https://git.kernel.org/soc/soc/c/cc0def5b4ed6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


