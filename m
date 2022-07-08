Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E29CCA480
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 21:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5E17C341CF; Fri,  8 Jul 2022 21:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0596C341C7;
	Fri,  8 Jul 2022 21:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657314614;
	bh=1uheZpm7gv0/KLQ8E43LEHPjpg8s4fYmjTLl9TngFJc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Vzt/eSyP6kDAGpapW5VQ6hYYGTT7/kLUch65HjMre0WQuDQFZoHjFrQBiONoiHroo
	 fDdyytbwnz8r6iID+VWhMPRB6uLTG2sehiGbQxsFxb/6Q2JaDbxwd4yDM4mDh6TLjS
	 jEMvp/qopfZvhsKUF6e+Y+mNYAUfF9O9+v5+AdXefn0qJZnx54H0cINrr+b3Ay89KK
	 JXoa89+2OY/cdxZxlkdD9cqa79GX7Uv3/beew9nR6Qv6ZSMq7Rvt+8taZkCUpe6qli
	 +c5YOqTRJuhYOlmTIgxVzyoInDNTYjbP+jiGS1HPTtkhKRIgTO1gvkMCaU/twcRftG
	 zrm45dfCXzUkg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7C468E45BDA;
	Fri,  8 Jul 2022 21:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE Fixes for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165731461450.21745.6662646019060778388.git-patchwork-notify@kernel.org>
Date: Fri, 08 Jul 2022 21:10:14 +0000
References: <20220708134607.GA901814@jade>
In-Reply-To: <20220708134607.GA901814@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 8 Jul 2022 15:46:07 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these small fixes in the TEE subssytem. The OP-TEE driver
> patch fixes an error which was introduced during the merge window. I'm
> not sure if the error really can be triggered, but it would be nice to
> have it fixed before the release.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE Fixes for v5.19
    https://git.kernel.org/soc/soc/c/2dc94f06127f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


