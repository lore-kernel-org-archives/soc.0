Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B087DC3DA41
	for <soc@archiver.kernel.org>; Wed,  8 May 2024 07:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8DE60C4AF17; Wed,  8 May 2024 07:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7827FC4AF18;
	Wed,  8 May 2024 07:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715152830;
	bh=Y3BiVviX5yevglg6Zpo8GUXVHBa0oUqO87eTwJ2no1g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PIL3nu712D5GYhEiaCa6CKnr+/4aiFCFsrqgqkv1w2pSMW8V2Qn+YLt0S5lfzlJ22
	 gQo7/gKgameauYA87Ov0PbLm0F63yJmhp9SSlPNJgcGi/l8YNOYAfMcdMhEi4L7ePG
	 fv19gGBd7DUvm0L6T0lR69t0uiiQMAEAcfxsWfST3KRWIGGOGdEdWaftjExuDr2+zl
	 NWjo1X9j5GycW0u38ZEEPr5USRILR9Z6ppOOEHgIY5QDXtNKqvkrexXDp7OspYSEiy
	 BQjAtRlJnsoS1sPzNdWwLi4ZHKioD2zvXFrdNRQnf7zGhLJ4zxoncwJLzON4YG1mGG
	 YuE4pT7KQexDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5F719C43619;
	Wed,  8 May 2024 07:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] One more Qualcomm Arm64 defconfig update for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171515283038.32265.10952677544263183895.git-patchwork-notify@kernel.org>
Date: Wed, 08 May 2024 07:20:30 +0000
References: <20240508021312.206121-1-andersson@kernel.org>
In-Reply-To: <20240508021312.206121-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  7 May 2024 21:13:11 -0500 you wrote:
> The following changes since commit fefda685ec0846a1f1c2b13af2cce4cea580a768:
> 
>   arm64: defconfig: enable REGULATOR_QCOM_USB_VBUS (2024-04-23 14:09:14 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.10-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] One more Qualcomm Arm64 defconfig update for v6.10
    https://git.kernel.org/soc/soc/c/93b24002d4b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


