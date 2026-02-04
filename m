Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AD231AF07;
	Wed,  4 Feb 2026 16:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770224053; cv=none; b=BmtuGwa80QJ4mkdA6x/h8fanhcWV/WekSCCTpnL0G6uF+XoyaxtVs3REBowrb8OpbTXZ+9DT8QOC8ObUCVtXrMtFkrP+OkEdJ65sWlqlvxL5ymdiD+6UN4p0OilBOvv92DEJCqBhWXNuRIMUY///a5RYsoQ3LKL+q76FQBK1Bnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770224053; c=relaxed/simple;
	bh=7lo8w3BgNZyWjoPQvvRONpecpYL0Do1rMcsACXc+z7E=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=W43tqXJIegk8qtvmYxdIr8lgS6BJKZ3jnDfZYMnO+xEYxn211YL47VbSI2p44Ptp/ewiNOm/k2dyQ4KlaQCTTqp4nRSbQoT9w2G2/ZWcRx7+AZf37tLxSIsuqI5QuTbdbNTAlDilTv5jy2KItbyQExTXoLDsq83iMJpNGS6+FqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aW2xBkn5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aW2xBkn5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27B6C4CEF7;
	Wed,  4 Feb 2026 16:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770224052;
	bh=7lo8w3BgNZyWjoPQvvRONpecpYL0Do1rMcsACXc+z7E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=aW2xBkn5bxdEkl0O9OObKpU56tzY6gJGDoK41vbBPLWI4QBqt3KVwcRTaNyfMEWxk
	 woNvmnPcMa9hdjrlXm7G1IVNY9AlsaKnoXD+mbcNovWRC0bTjsV+kiafzsXyf8gHgI
	 0TcmAsbBI1hOo+iaHJ1TUwwZVrUwoIEhNnqcQxe+tdUitBvFMZcalc1xeG64hY2lJf
	 azqqUt/5CodAArl8yCBqtbDt9pyucfc0wbkdLvebqkjUkTwCBqWLstObDeVNA2lDLM
	 THLN+fzVbCRthDSRAp7nxDeZAtsFb7rwjEuiLr396sSimqzQDvJuO6g8j/pVfTSwpf
	 92cZE8JimmJVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id CE2373808200;
	Wed,  4 Feb 2026 16:54:09 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.19, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <d9748b0a-1b06-4d7e-93b0-3ceb96784fc1@app.fastmail.com>
References: <d9748b0a-1b06-4d7e-93b0-3ceb96784fc1@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <d9748b0a-1b06-4d7e-93b0-3ceb96784fc1@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.19-3
X-PR-Tracked-Commit-Id: c3cb2722e28969650c58d6defb09d57339a2a223
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a14980444f418de53a7cc315eb4fbd8a89c72991
Message-Id: <177022404834.2820859.14650392233570791827.pr-tracker-bot@kernel.org>
Date: Wed, 04 Feb 2026 16:54:08 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Wed, 04 Feb 2026 13:17:21 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.19-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a14980444f418de53a7cc315eb4fbd8a89c72991

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
