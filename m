Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC9825FA0E;
	Sat,  6 Dec 2025 02:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764986611; cv=none; b=SZMt5d2ZKN/FtwIswBobkMwCeMY/mQZyGZgU96y+8W+FlxpkcrdNL2VlBuHRsTSjIQyszvWjJce3rg/gDotXVd37h92NiXP9PAIQsK5htQdXXIrAwXP22zAZKnbGYrkYIyLWYrXXE4nIjnLkys/meV7NCagy5+TPWhkYPLSiDyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764986611; c=relaxed/simple;
	bh=gJ5r0a6TufP3WXYaoqIEUPLs5mk3mBUhlVCiIrokZOY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NJrNq/bS35kvS5siHxwn5ijWf7YgK3B4BaKcueHr99VPqiEVBT9WGvxwn7aOFcKQ7kMZgDriorGJj2mIkCVgCw7FDQ4LcQr56U4hiQTXZxYRoLU+Uus5TI2Y/UvngwKKUOQaeXCvZlejVteGukdLsNXF+Lc1vz+xcWxLxlQIBNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MshxxfK1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MshxxfK1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921DAC4CEF1;
	Sat,  6 Dec 2025 02:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764986611;
	bh=gJ5r0a6TufP3WXYaoqIEUPLs5mk3mBUhlVCiIrokZOY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MshxxfK1smTJiWW9JCxLdgo51Ls8m/0A3+8a64oFej9kf96sYbY1uZJ5Bvm/Opuf0
	 t6Mvjbt3+viCjeH5i6R5ooK29ROba4o4MabG3CXmxwg8sRpRkYsDVEaBra7qc5+9EQ
	 keV5JvMykbv9ioD6eo0qe/wJHHIm08uG2IPL/tOzOswHUCgbq1oGaT+0TsEG+4Up68
	 qKCvywXkYgPffIPtrGT3yTAOgm/7/3BbUNUN9fSizfbP/3kHYW/+WYZSwPyhbrZG3g
	 EZUrfxEGu/DLyPoFVkqKyqpn4zE2RLTwFvpJQJnuUggbOGTEwUXjRQ2pWHCF7fz25F
	 w/RAcrWisfoDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BBEF3808200;
	Sat,  6 Dec 2025 02:00:30 +0000 (UTC)
Subject: Re: [GIT PULL 1/6] soc: defconfig for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <347a999a-037b-42f7-b4ba-b05b81207fea@app.fastmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com> <347a999a-037b-42f7-b4ba-b05b81207fea@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <347a999a-037b-42f7-b4ba-b05b81207fea@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.19
X-PR-Tracked-Commit-Id: 00de4ef9d3abc0b195988c23aea2fefe5f76d3c4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b4c6c76e4039366017a4f568672e4ea9fc82f97d
Message-Id: <176498642885.1925836.9314675250384268584.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 02:00:28 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 05 Dec 2025 19:26:47 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b4c6c76e4039366017a4f568672e4ea9fc82f97d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
