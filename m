Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBB6CCA481
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67241C341CE; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50CDCC341C5;
	Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655238815;
	bh=5NG9oXJ6xZ4m8a6/4Eoh1DpD9Hx2EzwW33JKiUnTWYY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JQ5PKZI1qrTn8AHOiclhTanjRQ4QThSQqY6dnyxIj9/FP0BQdCPY7E4waHzwO5T2/
	 6IKbNF/Izdx562llnYDcSq23dNW5R2LiSQNzvaSbWFqvDKpQvVVmiQJWksrfl38rno
	 MrmAdyVJOCF2zYWfoy5tIryysCvejgW0V2soZ6vux7QGa03GGseS8ffZPOyr2lqMCm
	 cweK55AFMYoqBchDR1wSpSVoo2pT3DnVf6twDZtHuta1H/Zwa/Mxrmc5JMf73ncivZ
	 KRWOKrCy2IHEB4OpSTbMADqiLo5tPd9lcq+tsYMyvqZegm6V1RQcNiOPvvgywFh+AL
	 iAlbQd2r2Q1SA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 21852E7386E;
	Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fix OP-TEE compiler warning for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165523881513.29335.8250351382337731010.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jun 2022 20:33:35 +0000
References: <20220530112612.GA1511426@jade>
In-Reply-To: <20220530112612.GA1511426@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 30 May 2022 13:26:12 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch which fixes a compiler warning in the OP-TEE
> driver.
> 
> Note that this pull request is on top of and earlier accepted/applied [1]
> pull request in order to avoid a merge conflict.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fix OP-TEE compiler warning for v5.19
    https://git.kernel.org/soc/soc/c/9c76d723edd4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


