Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BFCC001B3
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1307C433AD; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9C60C43391;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687379436;
	bh=CzsQPmJUjWkyIENyM69G6BocAZBmwILg8HR2sqWpstg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DTAbpqj5oEHse5OcqTu9u1iSpBXgYGrpaakVgqbLQLU+PKH2kZTtOFKAaO6EcNrzY
	 eb6PXkK9KJFKd1LLXmh8Hr8vbKrQS/vQxcg7aaJXY1d/pmxFg6slwu1oOBIymhZYfU
	 JqpE1Rdi3Rc2113xa2l6EVxQr8i9Yai7w0dsA5pD51KcyoZQ4w0eq2h74cnKoneYne
	 HFv7ULbV+l1jfgxb5QN31N4cFWLlrXPuwBrbBVErxoyKy0Q3PrnsCxRolIUuGyMJUV
	 p4bZ9U0FuZ3xVtebhDtXa2SrISQNnCIH38DLiDtq/OcSuuNcoCYNFSk8ZYSHPheUo6
	 g9pmnXpAJBIPg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 87D01E4F14A;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm driver updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168737943655.9834.13852720876163815177.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jun 2023 20:30:36 +0000
References: <20230615163104.1461905-1-andersson@kernel.org>
In-Reply-To: <20230615163104.1461905-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Jun 2023 09:31:04 -0700 you wrote:
> The following changes since commit e81a16e77259294cd4ff0a9c1fbe5aa0e311a47d:
> 
>   soc: qcom: ocmem: Add OCMEM hardware version print (2023-05-29 14:42:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.5-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm driver updates for v6.5
    https://git.kernel.org/soc/soc/c/37d1fc51dd20

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


