Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CB7C54798
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 18:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01B70C43390; Fri, 23 Feb 2024 18:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4134C43394;
	Fri, 23 Feb 2024 18:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708713845;
	bh=9VmOs9YbPuVBWIrpxF9K9aSvP6D5gdEcGMiS7WpNNz8=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=ml5CAwxRaC+rTwlUOwamrlc3xtki38WKyx1yFQ8EGe7AM7V1EQ8reAVuWj9vZRzBe
	 lCA6y9RAilM6V6+jJd842C2fqGUdW8tbD91g70lSv2eGGX/dQK/2alIDHGSeZkmcYN
	 35JMVeyidWvkGiS9P3Rl90jHah/qHqm5nldJc01EcD7oZS2ZyWdwlCtczSSnM3vdE9
	 mziOZx3OpSTqJT1hP4D5GF7S5HySiVGMfZeIJqD2zdyEPk+dOcMG65nTo13xjrTKZ8
	 sjJL3Cx/T1sSQ0Ec88z7uRzavOOMdUx+tMriM+Ty6TTTOymtik1Uv5NluQ8U15PfR9
	 YyodnPhqIy1zw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C1B7DD990CB;
	Fri, 23 Feb 2024 18:44:05 +0000 (UTC)
Subject: Re: [GIT PULL] Arm and RISC-V SoC fixes for 6.8, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <04be5855-9b18-4ff0-8554-8b9d626a7845@app.fastmail.com>
References: <04be5855-9b18-4ff0-8554-8b9d626a7845@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <04be5855-9b18-4ff0-8554-8b9d626a7845@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm-fixes-6.8-2
X-PR-Tracked-Commit-Id: dcb8e53e339e534eecfd86fb21674d7eef7380eb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e44baca779686425d0ca02491731b6d688c6711d
Message-Id: <170871384578.26987.6883523533721597550.pr-tracker-bot@kernel.org>
Date: Fri, 23 Feb 2024 18:44:05 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Fri, 23 Feb 2024 18:00:07 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm-fixes-6.8-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e44baca779686425d0ca02491731b6d688c6711d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
