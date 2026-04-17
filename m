Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F78363C7F;
	Fri, 17 Apr 2026 04:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776399075; cv=none; b=dBLetFx6dO22ny2OkV2qHAwAd3LK0Fa7/YnbQH4OPagrU6ae3kENgd35vidsL1nMNVQ1XEoO6nx8qZ+tRtx+04N87LicGJXC/P6Myx+OfFjhd0gngQYsYtiNAdeND7Hy5w4q3eosli1CSeyD+md1cgtbMt3KB0yEVds6N3jpLXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776399075; c=relaxed/simple;
	bh=E10JRXjAArC+gw4mkvjfjJvB3Q5k9wQg/kwMVF+t7Bc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=X/GisHunt6CpGEJx/1mKkqg7DsXfvOa/x3+KkhdTMy7k+3ryX1vUQVnxZQEhr6PLU+gEnQ9ct/B9vn209Myno+EIoCU9vypuecgCBYAMtQfuP7D3q9vqE7DHTjn4pTucaW9U9ZxVhB2WTTRvynDIl3E+YDV345pH0CCsZa31azI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQoU9OjH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQoU9OjH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCBFC2BCB5;
	Fri, 17 Apr 2026 04:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776399075;
	bh=E10JRXjAArC+gw4mkvjfjJvB3Q5k9wQg/kwMVF+t7Bc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fQoU9OjHAvYMDxJlSua611Tvx7NPUOmZld4QCaCJ8+ihiura18U65m/5uHmhctiIq
	 m9A501lQObfmXmX29pG6HnMib1HGHgk5VAvnQYGfPeFvmO3tGgzIsqfNaM/8legy/l
	 e6GlTD2A3Ptc6I7/9SqqhVS2CY7kakedhKsltxCsJhuCv3zuJK3xExMer7vuXhHOWo
	 QvNIzJh/i7CZP0FG+1FziYpiqiMLQ53expQ7ayC3hO5GkBIlt2WKKWYpZCjAyb8aeC
	 1pTmNBAvG32FtESh8l6gA1D9MEOI1CrElAmxB9ypxbL1smyRtDp1QjCM7OYWEEaQVC
	 r/WLV5OielAdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 413FF380AA7D;
	Fri, 17 Apr 2026 04:10:44 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] soc: ARM code changes for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <2af6e914-7d5f-4976-8b18-0a98ad3a427c@app.fastmail.com>
References: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com> <2af6e914-7d5f-4976-8b18-0a98ad3a427c@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <2af6e914-7d5f-4976-8b18-0a98ad3a427c@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.1
X-PR-Tracked-Commit-Id: 3ef628c3f37f1dcef0da51e73ad6e458ec74bddb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8242c709d4ba858c483ef7ef3cc2dc1280f5383c
Message-Id: <177639904300.3519243.17509720046680609301.pr-tracker-bot@kernel.org>
Date: Fri, 17 Apr 2026 04:10:43 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 17 Apr 2026 00:31:18 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8242c709d4ba858c483ef7ef3cc2dc1280f5383c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
