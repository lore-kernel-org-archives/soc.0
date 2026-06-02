Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BE235200A;
	Tue,  2 Jun 2026 18:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780423753; cv=none; b=an1EXVdUav7UDvUqGulwaSFyviQTnEb2/Cr/vb9qck8jJFco+hCm4upy7m8gGo+jYAeBe9HcoVRExEYPFoYTVdH8/lOIiP6nsmM6mO+jq+nxvzQjV2zVhy87MBL18t4Zek7IqlNqoY18RqdmI44tlqB9NsnuG5iaUROIfJu5lVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780423753; c=relaxed/simple;
	bh=G5UiEs0tPGAO76uQhrB250gZy+PCmtVztJMeAxaKaQk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=e95sMKh/FFfIDyqDCjKYjqyGX2hLkFq4vy/JgKNyrhd2MPAmtJJqn/QVNdOM4k1JvMwDVl0duJzjSweCH9fQc8v0SZmWZu7siKwK5M558XQYYbJp0ZTdHpz1jfSpf2l+b2sfybES0vCZ6jwnvNjiTErAeQ+BBOLM/UwUh8U37go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jeEySSWi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jeEySSWi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35861F00893;
	Tue,  2 Jun 2026 18:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780423752;
	bh=uwNqzZhDav6G0K8R3d3rn3EEFZ7UfykZqJM2o4QK144=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=jeEySSWi9iTphlLtihYV/kOTw4630E2gUIUFxb1MMTn8ZrxLkUx0+NB8klUbttdZk
	 n/I+fjU3RuU3yhMtBS9IVGmLJdfNtFn/UFADKlZMmayvKwYEtagdhUux6C9xa8YTNt
	 17tGkIQ2zPjHCdax8xH0LLMpQzBPqfpsU3cK82OkSLIJTYnYnVDATbud2yHNwel0jJ
	 uL057WCLpKMYP58U/NTu6wdXp/d4RwJz1i7AlO3xXV/JBp4iG+BIRuQQGUCHta03zf
	 vAA8M4E2xVV1QrOCwvPzTfETicxlSbwrbEFJN0G1T+DXJPSdAk9ZXmUuFqMHGOFMpx
	 4254w2kHpXfcg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AD23811A6C;
	Tue,  2 Jun 2026 18:09:15 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 7.1, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <7636fe41-9a6c-4494-b0fd-a55387b92f29@app.fastmail.com>
References: <7636fe41-9a6c-4494-b0fd-a55387b92f29@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <7636fe41-9a6c-4494-b0fd-a55387b92f29@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1-2
X-PR-Tracked-Commit-Id: fce4668a01227abb2c60e3202cf866137fbfcef2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
Message-Id: <178042375435.983785.13583312706640781660.pr-tracker-bot@kernel.org>
Date: Tue, 02 Jun 2026 18:09:14 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 02 Jun 2026 10:03:23 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ba3e43a9e601636f5edb54e259a74f96ca3b8fd8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
