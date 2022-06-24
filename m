Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DB2C433EF
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 16:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E022C341CF; Fri, 24 Jun 2022 16:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07E3AC341C0;
	Fri, 24 Jun 2022 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656086414;
	bh=qo+Q/+rhF7Zu+iU0j9b7HAWl5j2QiXxSSpi3Nlq9UU4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZzE2EdbKm+ffkqoc0Sl1zAzDcGoBKmEiZQ//NE0+XqqYa3Mthc3BoTT4VKeZkT3bm
	 G9Yl45X6SleRsP7n9XcZivlTYCbgaOR0ukKS3wUxwyZwXmTFUtvX5EILDQCxQ/gauN
	 rtLtMon4XSfDI7vUwslf087Fdvtep9qvtHTwJwOWKX1+AX0NxCAwW5upfXXs04E2Z7
	 EoAuJmVzRe3WTKZsGryU2OjuR6zNJHgr5kBu2rg/NGvckPLH+ykTVdPwCnxPBfhN8U
	 Q1NUEkw5DNv9rv0vwy4uB8ar03Z5T6OSdTECSCOoupjMSUbl1GxDZy9PGu2RyLpszA
	 9K35f7m9X5Teg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D9C70E85B87;
	Fri, 24 Jun 2022 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: TI K3 fixes for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165608641388.3411.14329953604692396220.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jun 2022 16:00:13 +0000
References: <20220618031627.xxvscc22c6doaa3t@kahuna>
In-Reply-To: <20220618031627.xxvscc22c6doaa3t@kahuna>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 17 Jun 2022 22:16:27 -0500 you wrote:
> Hi ARM SoC maintainers,
> 
> Please pull the following for 5.19 cycle as these fixup critical boot
> failures noticed on 5.19-rc1 testing.
> 
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: TI K3 fixes for v5.19
    https://git.kernel.org/soc/soc/c/db6b92459f59

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


