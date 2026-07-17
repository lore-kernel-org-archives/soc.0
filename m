Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819FA373BE9;
	Fri, 17 Jul 2026 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303915; cv=none; b=iiUioJ9fHLWrWNhqIaIPxynHo1Dg+u857hWeeX36U6wjLWdUosFNWeGCrOhunQTsG3/C+NXu5PXaBBDSPgxTSejfylCN4pf+kbHBDNRGsWMWLzTYR5V7Xl60CVallTRBwIniyHopU8cNXFnmdWWuHeWvDhBpziyw58TaOY4xiWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303915; c=relaxed/simple;
	bh=1APzRpCMvbDkc/G9qry4imxq1BOnADxQhGfZjWQqrxM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=DpWxJaTRShMsVW86YRaZcPsF56r0DOM3hzbA9b78ObSv7cBA9cWOH1fOj9wj+3OfdXeUMhCgj4lpKijCjDEEQfkyeLCDw9N7bZlAJUyld877Gls899wuHd8f2meD1HBIlqGkmovapvJNJ6Eq2pOTAdMh1bWV+HCOrqJHMu24iQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcwqmmSS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcwqmmSS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B363E1F00A3A;
	Fri, 17 Jul 2026 15:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784303910;
	bh=Ek1Eb9VkZMykR+LD8Q3zhar8vnE6fcfEC8Ho3sIIKI8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=FcwqmmSSqQdQdUjB7uqnkE8438w8JX9GiHNTJMOBYIdhqRf/rg3uu4FzIyOb4U3Wt
	 KqMvQ2G3Hc3XlN/ItX+wFYDB1k8VF1nU2nio5k3OhRgEln8U0IgfHspf/l94xISV1p
	 EHurAZnWeUhjORMIx3UTWQMQX4rK0DVI4C1YgSeIRynrbEBQd7TZRayUdstz4b6I+L
	 w2AkjUXz+cxnyOM48lBMlJXuL0NJjokmC4/l2ReI+Jbn4m10cBrRr9MZk7WOvFnrpa
	 ePihVjRZPvy74mtSiCUf7PQH6HCcEneFyeaqwzPj8hVmgnh990+0YBIcFZcAYMgvtJ
	 T7kNBUK5nbh+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568F4380CEF7;
	Fri, 17 Jul 2026 15:58:04 +0000 (UTC)
Subject: Re: [GIT PULL] SoC fixes for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <69fe5d78-221f-4825-a2a5-fd78f62f3628@app.fastmail.com>
References: <69fe5d78-221f-4825-a2a5-fd78f62f3628@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <69fe5d78-221f-4825-a2a5-fd78f62f3628@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.2-1
X-PR-Tracked-Commit-Id: 3d9855d114f0955d590420f5670152c1099c1638
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 111e7b23e5b05e2298f2e1a4d2a632bee4dde8b0
Message-Id: <178430388311.1777518.601822504595355660.pr-tracker-bot@kernel.org>
Date: Fri, 17 Jul 2026 15:58:03 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 17 Jul 2026 17:36:41 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.2-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/111e7b23e5b05e2298f2e1a4d2a632bee4dde8b0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
