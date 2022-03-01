Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04069C433F5
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 15:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B058CC340F5; Tue,  1 Mar 2022 15:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 902BAC340F2;
	Tue,  1 Mar 2022 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646148613;
	bh=IRa8Yohpr6X7PJDRfhaGswQdoAODHHAvvStqHbZ6F6M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ev3wKzWcWdVkKvvnCnBurkdEI8qXDHvalrQ8I/1k6SEGZAfFtf3QbJ2DTKoaX8ilK
	 l3Dhgl/Yp8hPzrAQHV3/kmkDdeoA6WR4XM0L9+UBYLpjJ2rBAEyMloc1Q2W0q3PMdQ
	 ndVp/nuEv1UGdhgbrvuj8miSiN5+DJ9s62b9Bgk2iF5pUN5Mc4g5m2fsJijargXZB6
	 JZVFhB7R/3qlbXyQ8WSyRC77SxJuIkAZyKGrr9m6Yg/BF8WPX7VMaxmf2i1bHnjBzB
	 Kund+h2shb0b5Ze1w9KOl/NWgSKAvrU7fKE8xkfgoGtHAWFEjvjSU2geUO5SgdbyBx
	 R/bcvQ0l9x8Wg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6D43DEAC096;
	Tue,  1 Mar 2022 15:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt for v5.18 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164614861344.22804.8899012755829129129.git-patchwork-notify@kernel.org>
Date: Tue, 01 Mar 2022 15:30:13 +0000
References: <87pmn5zrd0.fsf@BL-laptop>
In-Reply-To: <87pmn5zrd0.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 01 Mar 2022 15:20:43 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v5.18.
> 
> In this pull request there is also a patch updating the device tree
> documentation, if you can't take it, I can do a new pull request without
> it.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt for v5.18 (#1)
    https://git.kernel.org/soc/soc/c/7d8e1702b572

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


