Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABA2385D61;
	Wed, 17 Jun 2026 18:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781721425; cv=none; b=J9dmLitGauOIDcwvVb6MizDrTOP0LQKWh3FlE3+fDt9dAKv5ZUO0SxNKBjMCEnl65f4N7nDBFLnkcv5Po//Ehzrn/fODZGtGS2FlueqpKjrX0Q1lDYobW+z1P9vkjS/Zdrp/ppWv/zU3T9QQbqVxYUN/R1NpysbTvJe71QKTkLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781721425; c=relaxed/simple;
	bh=bRt+lpJe3hOtP1shPL2+/EZXau/wE/nJa7UTP3qmuKw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=gFyjFU352uqkI33y/xYT9NOHQoarQlkKDZAJYE1IGRsKp792Ay53637BQTj/LyAQR6GFtUJ1Q4sTUVfRj5iydKJWUDJKr91KSQXqE0zXiayp4mHSdNLZdI7GNWigNyV05MlZgYJ4X4SOTNpVCO9RbZpShT4dttyn7TAigswAnxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJK8VaG+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJK8VaG+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC8E1F000E9;
	Wed, 17 Jun 2026 18:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781721424;
	bh=WVXssO8EFA9BNezf6Qbqed3+OIPwO+I6eW/HhTeooU0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=SJK8VaG+vpPzyGZl9bsevox1vS4Xzo+icGA3JqIWwPKUHuFrVtvW+e1cdhWmq9076
	 OkwgTQ2qIPTvNVsIiXeGTM80/OxI900Ye+PFMN+YEr6Sq0Xejlxr7xUDXKTTtXv+PR
	 ddZluVD6Wp8U/6pidaxvdcUhXsLE6Ljhe/I+dbPvDANFTj1KreRfEOuRpO70bsp5OR
	 TFoHLu60qtJDScuaWR3DNurlgOmxPIR+JsagpHDNyz6aGE/pWMTsptKnDS7rSRoBE5
	 FfF230ap2gfBQtoMPF6mcfEvcQszmJy0TFY5M/OePd/HIRoRkD1R5mJIYSCvK6EfhG
	 s9X9uB2cf29rQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568B43930FA7;
	Wed, 17 Jun 2026 18:36:59 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] soc: arm code changes for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <c00cadd6-b8ae-4d09-bcdf-adbeab2f0e11@app.fastmail.com>
References: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com> <c00cadd6-b8ae-4d09-bcdf-adbeab2f0e11@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <c00cadd6-b8ae-4d09-bcdf-adbeab2f0e11@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.2
X-PR-Tracked-Commit-Id: cb2c3b5e113f26f74ef05926c6ace0f83cc3d0b3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6505114e82e7541414b176b5da4a3c015a1214ea
Message-Id: <178172141784.1757661.634270573366128584.pr-tracker-bot@kernel.org>
Date: Wed, 17 Jun 2026 18:36:57 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 16 Jun 2026 09:55:00 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6505114e82e7541414b176b5da4a3c015a1214ea

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
