Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9C1C636D4
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8663C433EF; Fri,  3 Feb 2023 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8D9AC4339B;
	Fri,  3 Feb 2023 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675434029;
	bh=fkEjgfzLJxVOK6kj0jMSbugkWgygzts0+pc7tBnrdH8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JiNGUOt58iPIDXlMMRduswxCxt+0zxIXiU1vHHL3T0Ch0rt3Mn1NC62QCi+fQIX1S
	 IrEpvKTp8vMOfdBfChi5s0MkDGvUt1RH5dOpfqq/b/1a7b9qpNRBbfWA06jPW2jqOx
	 ER6XIEmtwUJaI+gY+yXlqtfhZkzuWveAAcpScMB3/zMR9lElYJZHTxVqv9WX9ycxvR
	 QaADYR6/gEzxK13HbeDNbKTaiRsfLwY75P/+U1JlGExEK5bMtLM3JLzg31qoSg9HVQ
	 fnqG+scZOCDTckBkjU3mpgS8Wo4HSznnkECkM3cRlnpJ8Nq8wTTRh3ipW7LmXT0VPR
	 bz0Btz9sH6LbA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 956B4E21ED0;
	Fri,  3 Feb 2023 14:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Fix vdosys* compatible strings
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167543402960.11069.3454802065941836878.git-patchwork-notify@kernel.org>
Date: Fri, 03 Feb 2023 14:20:29 +0000
References: <20230202104014.2931517-1-wenst@chromium.org>
In-Reply-To: <20230202104014.2931517-1-wenst@chromium.org>
To: Chen-Yu Tsai <wenst@chromium.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  2 Feb 2023 18:40:14 +0800 you wrote:
> When vdosys1 was initially added, it was incorrectly assumed to be
> compatible with vdosys0, and thus both had the same mt8195-mmsys
> compatible attached.
> 
> This has since been corrected in commit b237efd47df7 ("dt-bindings:
> arm: mediatek: mmsys: change compatible for MT8195") and commit
> 82219cfbef18 ("dt-bindings: arm: mediatek: mmsys: add vdosys1 compatible
> for MT8195"). The device tree needs to be fixed as well, otherwise
> the vdosys1 block fails to work, and causes its dependent power domain
> controller to not work either.
> 
> [...]

Here is the summary with links:
  - arm64: dts: mediatek: mt8195: Fix vdosys* compatible strings
    https://git.kernel.org/soc/soc/c/97801cfcf956

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


