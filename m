Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884491B6CEF;
	Sat, 11 Jan 2025 20:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736625667; cv=none; b=KZkoXv0VKQtU4POuDCD8X41Vb586lyHGPcupeMsfKRTG7fI8+Tkt88ogRVU1Zzapg/kulO3lbTtE9Ogy5z7NS2cVZ0+JNzgtD9ZALX8GYmoUuWV3iTQv76sKoN2COJ1R5xdytX7V7X2m47XAOMylCII2KRrUVdhIomn3UW8+YFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736625667; c=relaxed/simple;
	bh=Sgwi84VkkgZnJ6vUPufItBOuLmdBhf9RZRhF/vTtie0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HPrGLCLjo9pZWRd1AW7Lat4ldW5rWu2W5oz76ZNltjtYaSnetG3rClsnSy/yJC1mS+AoXvjTR8ha4O1EPgt5DMUS/UmalH+nGijYIUpN+y5LntDoWMd76W7g+UOj/mm/j+kuhXfdpeWJzqv8ZGDHVkB+LBFFAdCQtY2T+vRhX1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDSBF2py; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDSBF2py"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEDBC4CED2;
	Sat, 11 Jan 2025 20:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736625667;
	bh=Sgwi84VkkgZnJ6vUPufItBOuLmdBhf9RZRhF/vTtie0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CDSBF2pyUb4YrSZtWUey1O1ehqdrJl1uomgkobFYraOljjghax69bHKTAUcSRTkPw
	 KAoTMI4lZUsTuf9PWTGO+pimBFF4T/FvNwMAaxMTEBcLLhROcbtYT+KNZH07FT23ev
	 EIDSmd/WAV6YElDqwcrha+8vemq7JuosWhZQviBuz9NnflaB/bN3r1ApkE+ZGYnPsI
	 M/hM1qF23N3XhWyjAkRx4A52FvQHq2m9vd9gvLGXWugs5TmGzTDGuf+FsbrAzmOk+v
	 IuDFdKmzjcUGTXHJKP+F8sx2ztK/Qnfg3bVlgx5w1o0tY7vsiMMfYmibyY042yIJa4
	 WuQh5ZiO+ecqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E81380AA54;
	Sat, 11 Jan 2025 20:01:30 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.13, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ffc40760-bb53-4e6f-8e0b-efa1fbb171e0@app.fastmail.com>
References: <ffc40760-bb53-4e6f-8e0b-efa1fbb171e0@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <ffc40760-bb53-4e6f-8e0b-efa1fbb171e0@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13-3
X-PR-Tracked-Commit-Id: 5391c5d8e60610bf914f767a6a749004e2d223f0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: da60d1547deea5d597a0a70d43a547e6148b719c
Message-Id: <173662568895.2439897.8837686119817785965.pr-tracker-bot@kernel.org>
Date: Sat, 11 Jan 2025 20:01:28 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 11 Jan 2025 15:41:22 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/da60d1547deea5d597a0a70d43a547e6148b719c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
