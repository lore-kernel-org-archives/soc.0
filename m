Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F114EC25B70
	for <soc@archiver.kernel.org>; Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7838C43395; Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1309C433CC;
	Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698268828;
	bh=UGWGY9nUPqg0z+JuztCnIfi3Fz911YhKfszpWi8wdws=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Nx59dnWm43d/kGbAUycisjt72tC6Zp0MQIvsFyJ5J35TJJrzYVCYlQXddx6my9Bba
	 /fHhX1VN+h/ZoAzM8pb6pcY6sjGAPXq+/BaRLj7lvV7Tu3mgBO6DxtYjvD2xqjh3Li
	 b9no/P8zdjkbEAXqbX2pFPohiGcjWTcJndedU0aVYqfjLnc5gIiZqffrhsMpiXi19S
	 I9OPL2Z7G7kTvhyPUV1rnVgHkPj/FvUsrltScqSAHmz+FpBNrW4HQcQVYYo0j8I4ma
	 b2uuctF7kM4u2lKeaK/KiM5lQPB8kDcskTUIoKNbDAK0G4Q9wKGkd+Bi8i8huRQyhJ
	 J1S2UxXH0gvKw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7F9A2E11F5B;
	Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm driver updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169826882851.12441.4401916095666705732.git-patchwork-notify@kernel.org>
Date: Wed, 25 Oct 2023 21:20:28 +0000
References: <20231025201109.1016121-1-andersson@kernel.org>
In-Reply-To: <20231025201109.1016121-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 25 Oct 2023 13:11:07 -0700 you wrote:
> The following changes since commit c0989f7d1264b2b1885345a28a32fd5e1e61f9c7:
> 
>   soc: qcom: socinfo: Convert to platform remove callback returning void (2023-10-02 11:30:39 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.7-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm driver updates for v6.7
    https://git.kernel.org/soc/soc/c/dfae947836d8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


