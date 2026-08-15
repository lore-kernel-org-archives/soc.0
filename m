Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB732F7EFF;
	Sat, 15 Aug 2026 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786809652; cv=none; b=VZ2q5BOV3Pv1oO4d95wokCTQX4rj1CmgH1DZNG0XKc/iIXO0/1+7W7c4pOjmp+DriTOEnsCEMGkz29DmLe08Nqf9+pfL7f3SGH0henD8KSWaaoSPgGEDG4BNnebxhZv6GieOrLCLh36cpoOoyNkstipx6iotaaoEhLeOfWJFoME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786809652; c=relaxed/simple;
	bh=QYkPJpWPMnIq6jfRc5gxJzFpNdfrFOI7nl9TsMUhsos=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SNf8QTV0wZqiR0+VtqumtbME8kSWLw7YwarNXeK5ZmYBTHxIrARF0YkNVlJy4t/pGSYZU1OjgQQM106PgWRnsjQb1lSzQHYsTOIhxkESugEtpgUKDbMQ1R/AYsztkzfw37LsUEJznMcrDzaurX5lJtKvu8CGS26aMn8YDGS5HN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kv2mv3/6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kv2mv3/6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4491F000E9;
	Sat, 15 Aug 2026 16:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786809651;
	bh=c5lAbQnPcXApM8835iE9HIiKmxCrViQ7fRtEowToby0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=kv2mv3/6809FcHe9aNwO0UuIfOyh58KCgtqdAZF3bT04vYCKorAH24bUm5az22AZM
	 cYdz5pYqbqFFxAjVbsBOHcj4BEMbdicP+XlkDfNZknKZmpgniXDQBCGlTMC98H8+Db
	 7uJbFA/tW+9DrQIs5qF6gyqNFzseSo18oNixeQWvmunUslepDbRCf7MG0//qUOzooH
	 bh1XVQkjAMlMcpnRW5aKC7d0PnE29hyksAMIfSmSc9UYpOg3/XjxruRetMPBrG7jXR
	 HjX1Ly3shcsJW8/PXx7V5QRFleQvzvAud6LXrcnG5vK4HIwvHcRATFTWJmUf8dAfEz
	 9HqWjgO25UrSQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id DDD863924A48;
	Sat, 15 Aug 2026 16:00:05 +0000 (UTC)
Subject: Re: [GIT PULL] SoC fixes for 7.2, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <308796e0-962b-4e8f-bd2a-af5be9cf15a9@app.fastmail.com>
References: <308796e0-962b-4e8f-bd2a-af5be9cf15a9@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <308796e0-962b-4e8f-bd2a-af5be9cf15a9@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.2-3
X-PR-Tracked-Commit-Id: e36c0670d5ebebd7dba493f14966051f354fbb34
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
Message-Id: <178680960474.22095.2957894126110984585.pr-tracker-bot@kernel.org>
Date: Sat, 15 Aug 2026 16:00:04 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 15 Aug 2026 10:15:49 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.2-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3eb40771c00a8488fa6ed2cc1fe203477908bf38

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
