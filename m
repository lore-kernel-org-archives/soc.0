Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1375FC48BDF
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 17:10:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E3E796187E; Tue, 15 Jun 2021 17:10:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CCBD26188B;
	Tue, 15 Jun 2021 17:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623777003;
	bh=FXfai5e/UtmYl/GMqzdP/Pa134rAFnU2jb2q9jFtzVA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KSo4xApsPvS2CesZkZeawp+IfPXwVELN3bYid2t8T6pcCKG/2xgGvGdtw+VgSgIaZ
	 1qtHNRez8sDTq+/r5TB/2ATDPpp5vn+O5xlFW1/DH51yM6JMICH9MEhf1/UFMFA9jW
	 HGXO2mD8xtxdlzUXyQ4UKnNW/Y6OWSSvBXp6Mh/yAYJeku6/dEWITF4v9Os8BWOJEi
	 AoSTqfHD2+6lFU/HIGtWuHFEwZP0qXHePbdXkA6bGoWY7HOEoP6bOhHOb8lLTLBSRc
	 oX5kn1ED+4pZHOl2D7zve2QMMEUc1pPHCi1wq7Dg4GKKPfy8EJnIBKqjLpsfj/nUqf
	 YKcHiTJC9E92A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C2243609AF;
	Tue, 15 Jun 2021 17:10:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Initial support for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162377700378.21283.2855321253635751351.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jun 2021 17:10:03 +0000
References: <20210601095838.GA838783@bogus>
In-Reply-To: <20210601095838.GA838783@bogus>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Tue, 1 Jun 2021 10:58:38 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> This is a new driver pull request. One of the arm64 patch is being
> pulled from a stable arm64 branch for-next/ffa as the other patches
> are dependent of the same.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Initial support for v5.14
    https://git.kernel.org/soc/soc/c/e73153ba0c7f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


