Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8505AC54E5F
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78D89C3277C; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62AEDC4166A;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=LzoZ5kRlxn69+Cprs0sjTcL1KFzYq1X9VBDBHPuBbPk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=BDQL3SUNkcOvAYEeUnKDHocp9vdWYUbETQsdc+nLiuoViG6hHAMLlJyJJbUXqP411
	 FdTfduq5e2FviajXANKji98t1AKbJUsRCfmD+EhmswGTgUQyO7OkaJ9YSgOIks7khI
	 9rtRCQFJiHQ/MrtIBuYLHylovPTw12E1r1lZeShGkHHsV/QNL7S7A3TZWTCXnNERxF
	 ZFS39cEsn8TFI9tcdv4dIgzgbahP3t6iDTcfHpB6tSrB84ndZ7T+WBAg5+CChmHzZb
	 kU4K604glaRoaGwOElq92eNQab9ZI5Mgrie5l7SmsHX4VC4f1NHzqX9g4JDN68sObK
	 qmEW3/5kF/rwQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4DAF0D88F8D;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Update for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872031.25915.4232280354781812014.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <20240223033250.117878-1-sudeep.holla@arm.com>
In-Reply-To: <20240223033250.117878-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 23 Feb 2024 03:32:48 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Update for v6.9
    https://git.kernel.org/soc/soc/c/62080509734f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


