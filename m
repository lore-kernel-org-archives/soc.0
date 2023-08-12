Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC35CC05052
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6AA15C433BB; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54B40C4339A;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=LGyxPB+tZmEOpbciAErKZBKvet5ImaR03WRpEzYRe7c=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CKPq3ClV1ZnosXdRgd1u0/vx/Cq/IsgUrITyX5AnCuIshl+nfNtxv0a3LyDQN3RHc
	 AIcggRSVHhNm5izTRXPPVMO5Im/le7Pb93RzMQ8YnciLC7Mu4JkdcPkGApadqJND0Z
	 PA/TS3lZbzaGRs3Ey65m4ZHD8/9l8s40BcoBHSTAcEH+bFx1qWHEE/3wFfy8m3Gg0o
	 pA5BKIGtUpwDgXD1xm3OXOSrL80PdF3eWLugz+XIfN8DpcnNV3RlBUtUOoZMZqGjge
	 aSNDeihN+penzvyB8jJli5B7x3dWL/vxhrjbNFjIhMzkyVVx1Af24jJNOqHzHw4glz
	 wJOO2iHsDzBpg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 38DE6C3274B;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168923.30475.3398643205704958686.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <bbdfc9d4-6e02-a1aa-7871-b24f9da3419b@linaro.org>
In-Reply-To: <bbdfc9d4-6e02-a1aa-7871-b24f9da3419b@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 4 Aug 2023 15:16:03 +0200 you wrote:
> Hi,
> 
> Here's an Amlogic ARM change for v6.6, Drop unused DT includes in mach-meson.
> 
> Neil
> 
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM updates for v6.6
    https://git.kernel.org/soc/soc/c/b5410ee66126

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


