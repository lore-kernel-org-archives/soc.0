Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444F337A48D;
	Wed, 17 Jun 2026 18:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781721419; cv=none; b=MdUo61gljL6AlatGnzgJl9i+jHCntiEGrkNBTGdFT6m9F6CCa23MELVUsYRIFapeNNJHoeVIJmxXxcKYtkCJv0Xf2n1ooVy9OMN9cokKHnYD08GLzy/MjOI2jTJeWyQ9Qt7dGTfXdg0oUA4L143K4yXmLdAeGuoMRkS/1vSsbg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781721419; c=relaxed/simple;
	bh=0bVrl8Hn5uWNZf5DmY8mdl46xDOY1BAfAwrS8kogbvk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=J0+UC8GAgdt2zK5q5K2nTkWjHoHzAuwp+1DgkBRJV/H8uoHc71pjz7TBUt0GbDyamXb6YqgH7+Foflkteli5LkklXE7U9PLIEJK7HbmHaloUJdtB5Lv9OyvVTjJUYFDNQ0HqcS+Oyej9yf0BhPcUYPUvWsBNCCDGqOoCgb5uiVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ThEU5PLX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThEU5PLX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F161F000E9;
	Wed, 17 Jun 2026 18:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781721418;
	bh=ciQOt6NWwfOog9VoModtejysuadNlQaMBIW440bGX6A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ThEU5PLXWXdgatxdxme6fxBxazWqxrclLqPSl1OQeetAt+toZ2hZw58PBX3Tv0Fg4
	 FHKpWBtSCUKOUSPqcLsZflM3wNcg294GOzx7tSMEEnsUrJxktBTeJXQeRplzwpobrK
	 BVU3pvaeizwOjTh0hoTEmkpBMNHiAp18Heu+/Sl5oh6+5gHF8AWizpu+XumoBngKkK
	 QDzdATMjzZbXXc7lbzyRlkWtOipoWnGxkxsWbckGDB7/SJsRvG14fk8tpFbsVJ33ek
	 vZIW45YmvS8jII3YrAmY5FyRmfh4g2OhMzhzgGeW6qQk+gpeX5yuxIXq+J1suJBV0m
	 2jrS8WRkVhM0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56C153930FA7;
	Wed, 17 Jun 2026 18:36:53 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] soc: devicetree updates for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ef5fa237-1d2f-4c1d-8940-0e8c6c156759@app.fastmail.com>
References: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com> <ef5fa237-1d2f-4c1d-8940-0e8c6c156759@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ef5fa237-1d2f-4c1d-8940-0e8c6c156759@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.2
X-PR-Tracked-Commit-Id: 9e84fd546dc3f9f97bfbf2717c2d71d878a4f46f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aab799b1bdd1ff3e6912f96e66c910b8a5d011bb
Message-Id: <178172141188.1757661.2783841397380560114.pr-tracker-bot@kernel.org>
Date: Wed, 17 Jun 2026 18:36:51 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 16 Jun 2026 09:51:35 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aab799b1bdd1ff3e6912f96e66c910b8a5d011bb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
