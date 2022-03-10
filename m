Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA1BC433EF
	for <soc@archiver.kernel.org>; Thu, 10 Mar 2022 14:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADDD9C340F3; Thu, 10 Mar 2022 14:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 902EAC340EB;
	Thu, 10 Mar 2022 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646923210;
	bh=CWTqmKjyK5PVSLDbwLwFj6vCYtAck4T9CtC4EAdi8+0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Mry0wTWwSyelvrvE4AxJBXhxy6M0LZbSdWhNWCXcUq1p2UsH7RvhXXJSLJt6Ota8a
	 3LIhLKgCAjDrD4cgS2dn3O0sJuScJKemzsERHQE0RABcakaEdOecc9mEAScCjsKFhm
	 Y2nF4mFPo1pZiXQRK66zEoabzQGnJejnDynWO2zXKGcTgZOi2d/mL4mx0bA/H3gnN2
	 KCiEH9VHEbGqZ3bNjsLfk8NYfbrNtWVPWyLhzr8U51CU6ghlPj49lcwRgu/qeIKx38
	 K9aDfYw5eKiDaDvcACBEFH8gRHwTRDMl5fbAcXQf9mfsP5f5/UCv23dGZNg1EnoKC7
	 /IVTbyGJkpgAA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65D14E8DD5B;
	Thu, 10 Mar 2022 14:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v5.17 (#2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164692321041.23312.8783506876500954505.git-patchwork-notify@kernel.org>
Date: Thu, 10 Mar 2022 14:40:10 +0000
References: <87bkydj4fn.fsf@BL-laptop>
In-Reply-To: <87bkydj4fn.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Mar 2022 14:57:32 +0100 you wrote:
> Hi,
> 
> Here is the second pull request for fixes for mvebu for v5.17.
> 
> Actually on the first pull request was not merged and only one fixes has
> been cherry pick. So this tag is directly based on v5.17-rc1.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: fixes for v5.17 (#2)
    https://git.kernel.org/soc/soc/c/7e606edaa0a2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


