Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA3EC4332F
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2ED76C43148; Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E284EC433D6;
	Tue, 22 Nov 2022 22:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669155626;
	bh=8TGG57MK7bICWgs8KAb4hdGbBkb75osXxNOsCvhbBhs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FqiwQnUatpYt+CRWUFBQkO3EvZ2FTj8AJ9gnSOt2lz9uVgj1E2+moQHkmRgz7bcCd
	 iLChytBkQxLMAU643c+vtytrVNXUnK0mlcpwmvcN/bCe+WPRXlRb7VLdxZ0+x0kvG7
	 AauOtwYIZZt6JCp86Gglcl15J1bQkjeHmVflh3ooI1lhVky/DnXIKUL4FEwNaKcEvj
	 tx3LZ2yuDCFXBzVLOb00ye9/yavZMjpai0qaLW/mDFalxB1UjxTlVomIu+Mb93hdUR
	 lDVIRNsuEdOJomp14Fu+mq7n1imd323I92N3fZZHcfBhfKGpDHrCQU6+ptBCBJkVsi
	 04z/eqmQjcXag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C278FE270E3;
	Tue, 22 Nov 2022 22:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc: mediatek: updates for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166915562579.11152.9203927342044505986.git-patchwork-notify@kernel.org>
Date: Tue, 22 Nov 2022 22:20:25 +0000
References: <cc756001-a942-90b0-b79d-62c1fc189828@gmail.com>
In-Reply-To: <cc756001-a942-90b0-b79d-62c1fc189828@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 21 Nov 2022 19:41:17 +0100 you wrote:
> Hi Arnd and Olof,
> 
> Please have a look on the latest patches for the SoC divers.
> 
> Best regards,
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc: mediatek: updates for v6.2
    https://git.kernel.org/soc/soc/c/919977b690ca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


