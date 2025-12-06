Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF60726D4F9;
	Sat,  6 Dec 2025 02:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764986617; cv=none; b=sPqHprQtlnpGtn2GbTqT3HAw07SobVs+Ti6KVL7rIULYdLB/9vEuGnguTnuKbEzTCETkLkj4EqTyxOunKEnUwV7cedVbcE1u1hqVd9JY0NJ9kIbJeItU/2ShZR/VM/xbCKYCcmCDPs2Syiv2/So8FcMxk56Vh7wtnloN8xxxV8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764986617; c=relaxed/simple;
	bh=sOxfTz5XX2KHn1yU4OcAJyg+SrCT9QXAYx7dCLcwwzE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VGG/DyFrqh8kkatrWV0NmJ8xR63uGjFt6WeBhCo0CFlWFq0mt6MNOoqyTOomaLrQU52R+XDeLFJshJ85HbySDwIQekquHchGx2lQNF9CANFrfR1zDLnkgQlT0uQZWGHGNjtCpABKypF5fUxjbGehCrmCJF5ddF+0xRwcsc3r3So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wef6TiQN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wef6TiQN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93244C4CEF1;
	Sat,  6 Dec 2025 02:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764986617;
	bh=sOxfTz5XX2KHn1yU4OcAJyg+SrCT9QXAYx7dCLcwwzE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Wef6TiQNMCPPpKeuLTFqjWlhMe7KMbrFs61vvEF3/Uc/BWbW+Na8075aPnP+pMfpB
	 fvj9NPkIF4QuCjAL7PMsQ7tZI5jUFMlMpWS+Kol3shJwDQlXZi3KhvLjsdKkO+brCK
	 Yv7gHQzpVzc+592zzHW9vNE3J/L7TDLG/S0mcmPrRsotM4VIJjALzGqC5qQzyHeGD/
	 OpB3Ca/cod+CQdjUQKD2emSjCiVq98Sx2O/1jrex9gsKniw8hBVf9ZV8pPzVCIk1Yk
	 qaP70fvRwrn06eF1BEtMXttNIHHmnzNFeQe0JagfYj6yrmuUygTGVCSFbCbivpF03F
	 6bcvXzKcKz3Lw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B7643808200;
	Sat,  6 Dec 2025 02:00:36 +0000 (UTC)
Subject: Re: [GIT PULL 5/6] soc: driver updates for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <dceb9f99-cb69-498f-9717-34e3f28c8fc1@app.fastmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com> <dceb9f99-cb69-498f-9717-34e3f28c8fc1@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <dceb9f99-cb69-498f-9717-34e3f28c8fc1@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.19
X-PR-Tracked-Commit-Id: 4b1e81570144f03521482f7659fee060d8f63481
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 208eed95fc710827b100266c9450ae84d46727bd
Message-Id: <176498643469.1925836.14273165403476324157.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 02:00:34 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 05 Dec 2025 19:29:18 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/208eed95fc710827b100266c9450ae84d46727bd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
