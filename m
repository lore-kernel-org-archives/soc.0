Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F477C4361B
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 21:00:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E7B1923D20; Wed,  9 Dec 2020 21:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607547609;
	bh=yWVyruI1AVM4Tw7/Q5LgRXLCCGtkcConXT5CA0YxZCc=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=RHzcF4SD1gEkkdLUl9jCRhjiMYhNQUOF0t+Ax1y0kJgSlrMvz4Pu8exJlpygFjAIr
	 yT7kcljouHZV6am1+rDRs5x/x9AlhRUMJDgvq4i2mtJ98S9wTGVUA3J2ShtXemGSWK
	 28+HoF8V7Av14VpLBfRAwOU9c0KHLiCLjgZGkrX6uBQTKg0HWEr8g0yY163UWL2CGJ
	 cMDzUw30nH+mX6q+WgWH6H2jtvU3sgWHArq5OrXtjuPLPcpKSgvvzrtO167Dbagkxl
	 rL3H1iLjwn5MXHB3HNmhObHnFsa0jH+SpXdUUZeniPAO75PWtO5XvryOxxgUI+JZ99
	 6yGZPXW0cy9Dg==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160754760972.22697.10660566634364466199.git-patchwork-summary@kernel.org>
Date: Wed, 09 Dec 2020 21:00:09 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Series: [GIT,PULL,1/4] Driver changes for omaps for genpd support
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=393747
  Lore link: https://lore.kernel.org/r/pull-1606806458-694517@atomide.com
    Patches: [GIT,PULL,1/4] Driver changes for omaps for genpd support
             [GIT,PULL,2/4] Update am335x to boot without platform data
             [GIT,PULL,3/4] Update am437x to boot without platform data
             [GIT,PULL,4/4] Remaining genpd changes for omaps for v5.11

Total patches: 4

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


