Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683C1C49EBD
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CE50361408; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B5491613F9;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=ydEkaZ4k/zgdS4I4juPXZTJwhQI/6JYIMeARxvg+3xs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ACPPm02BSvBQBjgqJpuWwqHFK8joFMc9RbeGYB1Gxo5R0gWd+esM8gTo5OSEkzse6
	 5BQ1+AH03PUd2KamH7KeGQRY7C+VvSgob03uY3GtdGvYLJv66VQTtIibLdd00f/yfk
	 yRDU3l8+S7KA6PVJ+fQQqhv5x4Z1fg7wypS+LXTa15JgNsHh3wxPAU5VPmgpGjChOn
	 hSBFRdWahTMkz831kIKtctYhOMAgPBS3qQCEjD198caOcLDB5666IBjcIkKnxGB8S1
	 YACxUOI+Bp7nnoXz14xyyYRg4R8YlHvhcei6H6cKSwh3KMVM2kzMIQ5NoTcW5oi85S
	 n0k53tT8Sjbtw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AB37960CE0;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: updates for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421669.27448.102097123410007884.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <20210611075722.2813550-1-sudeep.holla@arm.com>
In-Reply-To: <20210611075722.2813550-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 11 Jun 2021 08:57:22 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: updates for v5.14
    https://git.kernel.org/soc/soc/c/959cd8f125bd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


