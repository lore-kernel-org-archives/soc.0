Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BFAC47DDB
	for <soc@archiver.kernel.org>; Fri, 26 Jan 2024 22:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ACBD8C43390; Fri, 26 Jan 2024 22:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 901BCC433F1;
	Fri, 26 Jan 2024 22:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706306729;
	bh=N9SsXMMEIz6W0s6a25j4nRRqUAORhnzwDEPJ14spk7M=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=TmHl+wK79aOPYqUIkyl+O4hRZ9LtANjP+gIunhbMVZNIGjixz+5Y5/pPYe8c8ybij
	 fWSAk5/CHqBQ9OJ8N+4G0nI0jC6ONcnijs0+HQ8Fz/8S0tpJbv1B4XOU6nrsl4JfXB
	 Z5Y7RjA1VAp12cjl+6BMNjNlqjc7drxGPiAbTkLexpNBUIIL1ozYxSkDnmkeZdE2Ct
	 +3rpJiNv5vpih1O/h6p5ATenUkENmimwNWeeNPXSB2iU5aS9kLW0BJ2DpGNiJHCNeU
	 rCv2IC2oPlEoAmmYlLUCRTDr05hvUAt1rWItC41fw4amw8c+PsjVaNr+5E9ApyAr9q
	 0wG1Hgyt8BnXQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 805F9DFF760;
	Fri, 26 Jan 2024 22:05:29 +0000 (UTC)
Subject: Re: [GIT PULL] Arm SoC fixes for 6.8, part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <26b37af5-7611-4a96-a324-427927cc6ad3@app.fastmail.com>
References: <26b37af5-7611-4a96-a324-427927cc6ad3@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <26b37af5-7611-4a96-a324-427927cc6ad3@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.8-1
X-PR-Tracked-Commit-Id: 1f4a994be2c3d13852fd5c1054f292bd303352cc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ae971859f810d90c2e844cb2eb3daa5e061dd446
Message-Id: <170630672952.20742.6986632229064866379.pr-tracker-bot@kernel.org>
Date: Fri, 26 Jan 2024 22:05:29 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org

The pull request you sent on Fri, 26 Jan 2024 19:22:04 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.8-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ae971859f810d90c2e844cb2eb3daa5e061dd446

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
