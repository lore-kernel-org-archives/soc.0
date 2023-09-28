Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02DECE7B0C
	for <soc@archiver.kernel.org>; Thu, 28 Sep 2023 08:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9866BC43391; Thu, 28 Sep 2023 08:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B050C433CD;
	Thu, 28 Sep 2023 08:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695888103;
	bh=atyRE6/jGiixVty+wRLVobB3J1gHKHnzEBwE2rD+OAA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=sDxDD5vma2y5DPX9l/QRw9qOMn42OscnoAuj7VmbK0P5b5QArTuVg9Qn7cthCwrnW
	 qWLQrkBPOEj0hnGCcV847Lyoxnp8kbV0fMX7EV19+wJf0v5C2jKCe11W7WejFHoeEy
	 prACip/A9sOiwg6DVV8+Ao3qTxACApxEAbN2xeKfyXuAcNGIq7gGzpqK4ADZD639tn
	 4r5CW/s0++ESQG5oAmuI0aVVCb4BDgh7L3dYWduzw3v+2UwjZ2h07f95DqfK+82Lel
	 k0h8OBQLkKyKs+z67dKYP1QXUVx5HuutViXIYeBxg4ilFBLAEUS0QyI6lstiQ9rhwf
	 Yn7GDRrkWntJw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 68B60E2A05E;
	Thu, 28 Sep 2023 08:01:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fix for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169588810342.3136.8691993949480660585.git-patchwork-notify@kernel.org>
Date: Thu, 28 Sep 2023 08:01:43 +0000
References: <20230927121604.158645-1-sudeep.holla@arm.com>
In-Reply-To: <20230927121604.158645-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 27 Sep 2023 13:16:04 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fix for v6.6
    https://git.kernel.org/soc/soc/c/5106e65f23ce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


