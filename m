Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37324C7EE31
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 11:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18452C433AA; Fri, 26 May 2023 11:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 021B3C4339B;
	Fri, 26 May 2023 11:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685101828;
	bh=mYR04vW03dYd3fHqTzl+6Re77PbaVNbgXMaPC5reRGY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SFjk9nixyWbvFgtMjAHPYjRyTrA4JRb7/NRfXq+WXXQlVnSBEnPmxnihAg2f4gEB7
	 +PdUxf2y1HQE+vNX24G3IK9MSRqWOkFc347qgjmHj91OkDVFP7IulbMyH59cG4rX+n
	 vbv+SuzlBHTmP2S0Y2cwd8/epVSlXzH+mQmjXJEti93lKUq3LEjmH63rx9nZeUL6G7
	 pbOD9SBanByRWNyRi8oscc6NXur1XMjBTpBWHF0M+Ye7n8qheUJ0E9+rIXFFx25zz8
	 FjbvuGjLQHxF0fTu0CX5HGtWfXStgQkKSGwnBDxZY6K9goikXiXbNvf+O3HtU8T6ZN
	 6MEZDJN5GnZog==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CA4FBE4D023;
	Fri, 26 May 2023 11:50:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168510182782.28560.329490827179216051.git-patchwork-notify@kernel.org>
Date: Fri, 26 May 2023 11:50:27 +0000
References: <20230511133235.874566-1-p.zabel@pengutronix.de>
In-Reply-To: <20230511133235.874566-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 11 May 2023 15:32:35 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v6.5
    https://git.kernel.org/soc/soc/c/eaae5a8977d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


