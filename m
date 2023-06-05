Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CB9C7EE33
	for <soc@archiver.kernel.org>; Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C83EFC4339C; Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD22AC433AC;
	Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685980254;
	bh=8xe7FXNKi1q0Ol87ruR1Q/72xAdm66gGRU7ZR/4xyj8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ouI6VhV6xamA4B3on6lvKNlJMJuMmbzwzCqae2cufWXIYiE5NAFupiJMJJ8/KDW8o
	 MRuitgujaPPdYA9O1NwH6Dd2Q4zga41geZYFCJ8/vWUkrkpf+pFuLp7Qrn88MUCTa2
	 hpvMQH8crR+U2BmexlaK0TtUnv/auoH/HzIud43PmY4AaVYOjxIu38ecerMz9RgFSF
	 saXG8PtsZ/EawT6PMLqE1lfFsT7KGtX/2UAbt94Oe2O1h7DxjxX4LE+zOxRbJayPRv
	 MZHfTCzlhPkbetn3eMhAH9sIEbbRGbCHnQOIfXPYBCr6ypdSWjLGnNza74t2q0LU8d
	 9kyZLhSzxXo6g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 980FFE4F0AA;
	Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND GIT PULL] Qualcomm ARM64 DeviceTree fixes for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168598025461.10098.10665681210997976829.git-patchwork-notify@kernel.org>
Date: Mon, 05 Jun 2023 15:50:54 +0000
References: <20230601142659.2246348-1-andersson@kernel.org>
In-Reply-To: <20230601142659.2246348-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  1 Jun 2023 07:26:59 -0700 you wrote:
> Resend, because I missed that git request-pull complained that the tag had not
> propagated to the server and thereby gave a partial refspec.
> 
> Regards,
> Bjorn
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
> [...]

Here is the summary with links:
  - [RESEND,GIT,PULL] Qualcomm ARM64 DeviceTree fixes for 6.4
    https://git.kernel.org/soc/soc/c/44b5814fbab4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


