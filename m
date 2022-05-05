Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A440C4167D
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20CE8C385BA; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07FAAC385B5;
	Thu,  5 May 2022 19:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651779108;
	bh=Xb2sxsC4REMdlRIzeHXUMT0agg9gWKF2bsoWN1Rhhe0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=q0aGvz4ugaHMAaqLd9YRE9vtpRFZpGvFzO79DoPrgap4gmVsw2bKSb/R9pYAw+nZl
	 LD7Fy6fkML1kEEiUxAmzFkWUvyf65i8pvez04SofNEaxgsbqcf4POZTgSuCpZkI2sB
	 kJIrSKhghuYuwQvjSsrBYn8Uq94FhCjPA03YSfOFXqN2JVe8+JPvZQrx5qGLcWwOnU
	 +5DD2WEXPNMO9PFwbsjVF2Fy/2XgeRln7dfODROCz2lkgJBj7zWa+4rfK9VnfkrOWB
	 K7i8PIHm/QZ72XHs6Cqovd16m+VOP2/bzjspauCrgLnI7/0GuSj3yb3d7DKVUQNo6X
	 gb8Mku3wrg5uQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DD41AF0389E;
	Thu,  5 May 2022 19:31:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Updates for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165177910789.9627.10578683161846997526.git-patchwork-notify@kernel.org>
Date: Thu, 05 May 2022 19:31:47 +0000
References: <20220504112853.3491961-1-sudeep.holla@arm.com>
In-Reply-To: <20220504112853.3491961-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  4 May 2022 12:28:53 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Updates for v5.19
    https://git.kernel.org/soc/soc/c/91f92d70387b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


