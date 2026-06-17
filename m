Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788643803D2;
	Wed, 17 Jun 2026 18:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781721421; cv=none; b=YfDpZ07pEa09I+RlTNzn97jzdg5UdGk4wm/+llm+x//iWeXtBUU/tBfVWWaz7Idxfr9ZSAU6Loq35RpJ9fq6HDYp/glUmRm9zaxsqVHhcvQD8WxyBhqGP2vjYw7oDbNBkFMhHF5xBM3qHRf9AIqLAsak3PNbo/RspM62xCHkLUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781721421; c=relaxed/simple;
	bh=TZAs5H2sYdi7CdhYOEIzfXf7gBi7ee9QxPE00TcS4ic=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=KatY27eagmBtlstAE4yjNDTQdZl1o+5GEuYt77BcHeE+kvloRQY4evGgKqAzJrpQnTZBtpsxdKB0cKS0lv7vIpp9RNZKpuGgZHH9t2whuPA1x0gOdiDyXJbt3+7Xv9Vu1sUj90lWduD26dJQgkAVXQLi0p7NuAqm5ytXKWlOpAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDB0+OML; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDB0+OML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52BAA1F000E9;
	Wed, 17 Jun 2026 18:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781721420;
	bh=K98T3XteSTOhsyQJSjHjvWz/YyBhfYKEk/9xZSB6Vds=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=BDB0+OMLdR/FJ1vhAPLknh+oXF368g5+ByOhHVhFgOepX0yXVPCDtBOIsTn7ilQzE
	 mwUyPautF3NvNj9eyjs7QMM+PaOsbleJp7Pl9WSCZ175qV9nBY3/ZCRLaRsr4FoTsp
	 Bl9qXbQ6E876euoSKi3miipC+Iatd18+32gLKd6xPNBt4Ohku7PMOjoSCoSR2nT4vr
	 ks+el7Z/MiEXtc9MYcIXUFPurZIqNzQcfWwoP4eQj1DE2IcKsrl8fAs3A3OgRJShPd
	 1y70905rKXJLKr0RY776TILi0TZ5awVxEeG2jHEdA0evjS3rCyJLifP1GKHJNjUCWb
	 wbqec2cvHRCiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568BA3930FA7;
	Wed, 17 Jun 2026 18:36:55 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] soc: drivers for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <528465a7-4ffb-45ed-82e4-898b01d2da98@app.fastmail.com>
References: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com> <528465a7-4ffb-45ed-82e4-898b01d2da98@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <528465a7-4ffb-45ed-82e4-898b01d2da98@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.2
X-PR-Tracked-Commit-Id: c7437fab2f2249c1f12d805770c5ba15cbd0e46a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 70cb95c736807da2c4952423c9f9afe470341996
Message-Id: <178172141384.1757661.11904060001732717806.pr-tracker-bot@kernel.org>
Date: Wed, 17 Jun 2026 18:36:53 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, Marek Vasut <marek.vasut@mailbox.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 16 Jun 2026 09:53:00 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/70cb95c736807da2c4952423c9f9afe470341996

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
