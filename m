Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36A531715C;
	Fri, 17 Apr 2026 04:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776399069; cv=none; b=K5sHlZK5JTSan5CjDGQejAMESQAbXqT+q17eO8fmM49Sy0JtZQYOmZZqRKBAESG5hRtn/dD2GHV5h9DW2T8YIX9wPH/bYsgAFAgMnVGR7nRThjmBTwMDhePTOyRAW4yoz8hZPKYlRwTSIS3zcWPLcCQbgpatYoqMu2TTDlnwJ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776399069; c=relaxed/simple;
	bh=gpI+2bvrautKEg+CLlAd+ga/Zkn7dCmVgn0MpfJyFLI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=pEwRdz5jIQlN1fX32rfErqDEai2bH72ptL3QKxxrlaRnFr4i/+zLWBPh8Mr+61M8atr3cknr/a4ZWqvLXXK/sK84QpEkA1gSBWfUOCtR/0+ZYimOZNyDxEzdXVNIi1Sx0NSW2H5g6u00PAy4K+QS+V973uHSno7f6S/NVAmltrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOdbDNFA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOdbDNFA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10CFC2BCB0;
	Fri, 17 Apr 2026 04:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776399069;
	bh=gpI+2bvrautKEg+CLlAd+ga/Zkn7dCmVgn0MpfJyFLI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SOdbDNFAWaZBmD5luB8ew3rRok/JgahfHEbnZalvWgIFj/phG69j7lu/ss/urKdBG
	 aDs+Ome4xiwE2TULEVSZe+iiO8eD7h99IDvCQjdnl4WfsG/KTY7EE2sHHMrc45GT+d
	 piI0xqG5GJZ6BnFf4smd9RZ+lzzXF6hyMgVw3qNKfnMVmQqZNi04Y06cJBcijw+/JZ
	 +5AyTdacp/hQepaAol+l7yIEXutTSOI2H9yFYcW6zqyjOQiDhKd/YieiNJg+38LXLM
	 GE11DjQjAwULiF1fdYyXX/kibVqvvR88wp4Gp8bxVXmRR4JIYg+A7Cp5ZtlgfHqsAo
	 lLSM2LvTx2KCA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D1D380AA78;
	Fri, 17 Apr 2026 04:10:39 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] soc: dt changes for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <b3203b1d-4c1d-49b8-924e-c17cf6be7ec0@app.fastmail.com>
References: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com> <b3203b1d-4c1d-49b8-924e-c17cf6be7ec0@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <b3203b1d-4c1d-49b8-924e-c17cf6be7ec0@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.1
X-PR-Tracked-Commit-Id: 41d7004ab4e521ccbd98793d7da55022796c463f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e65f4718a577fcc84d40431f022985898b6dbf2e
Message-Id: <177639903769.3519243.4077028477830670105.pr-tracker-bot@kernel.org>
Date: Fri, 17 Apr 2026 04:10:37 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 17 Apr 2026 00:22:48 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e65f4718a577fcc84d40431f022985898b6dbf2e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
