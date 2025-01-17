Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EFC1DC9BF;
	Fri, 17 Jan 2025 23:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737157486; cv=none; b=GtFvaFX4e5GvFnDIX1/1QjdRmrniz76J0n4q2rQDjFpO+ih7s4XXyC+B8/RLANsBAeGL2BiKsp90xzPLa1H96VMfbrcsZe4bu9yqhUsQJ4FVNAUh8UPmdFo+vd7MDBcKQUWhDioadBHcLfe4ZiboY90RF+GU+LrqJA5u5UOfbCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737157486; c=relaxed/simple;
	bh=8dSUKblfap4Zb+tgdq45FLILJMcyqgtpVOvFFYvkdDc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=E9w38bc/kxKScnPCoz3lOpZX1H5vKorRk856w7v3401TPQfGE5rppq9ydfagH7hYkSbbTXWYjveJGH7G0ssJ1XwHHcnCnBtI+cwLNknJ5nL1UYfvCW8UvkEcbWxTn+ScyB6ZrQbc/j6P9CFE4qzEMQKrBmC5p6mlHL2kkRzcktU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8zPiXyA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8zPiXyA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A51C4CEDD;
	Fri, 17 Jan 2025 23:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737157486;
	bh=8dSUKblfap4Zb+tgdq45FLILJMcyqgtpVOvFFYvkdDc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=O8zPiXyArCyo3MI5ua4pUBijNguGwZSSMLja15tVxoXXQ0aFV0G+buSLneNzJPAeA
	 uaPfB0kxS2Ss+FrMkFR+ugdUmQjC/mQlbuPsWMtJH6Td5WRJ5bnaja3gVrP5qdFh3/
	 Iqc9TZCi7WufIGpH+Z080LwLyJNg7YTDYGeKiGo8zn8XoQyWwHYVFfQvmg7nkBv2lG
	 WDVqfNp3Jz2TPdw3bTF+sfYkP2wTdy60gsXH/Xz+r4d1R1ZN78tlTNlsPFGbU/m6lb
	 s4l/S5GlikQocGkK0U7GoGpCh1qhDFq8eeh1ia09hHCMnYU8wgc4OJJhSiOh9RdxKB
	 teK/n+fDvg2tg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE84F380AA62;
	Fri, 17 Jan 2025 23:45:10 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.13, part 4
From: pr-tracker-bot@kernel.org
In-Reply-To: <99e7cf2a-2578-4b10-819a-16321a7739c7@app.fastmail.com>
References: <99e7cf2a-2578-4b10-819a-16321a7739c7@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <99e7cf2a-2578-4b10-819a-16321a7739c7@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13-4
X-PR-Tracked-Commit-Id: 352bba6c19cdeac107e7fc1684548269e6b0f111
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ed9add2b32253b73d4909cc5cd4e7abcfdc0568b
Message-Id: <173715750924.2291664.11872474582835471287.pr-tracker-bot@kernel.org>
Date: Fri, 17 Jan 2025 23:45:09 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 17 Jan 2025 17:47:32 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ed9add2b32253b73d4909cc5cd4e7abcfdc0568b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
