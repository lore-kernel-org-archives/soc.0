Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD683BFE38;
	Wed, 19 Aug 2026 02:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787108348; cv=none; b=ByEiApQ3llOJIs0AUeERtn70Auc/jeP6OUdwixnDjGPYhnMd/NOv0HwY2epY67XP1hiCBf/5arCiq5L0wj45FzCxNBAoLA8+4Akz5TC0GH4rr/1GH6FBUKqNnLrGqpvmQexHv9YogDAJyvK0RtThBCEXZyQyIB8hV5TfhT7MMrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787108348; c=relaxed/simple;
	bh=NmVJ9uUPHYjEONGQprzpQ/OF5fQamqGVXn+Si2inYSI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nw9+UfnqTq6btnQe88bdB06UsFxBOuqm7o2D1F9F7qMeJqGDeU07fuV97rbpbekWk395+Ity2e86O01EPk9vkId1n2dfQ0McIDqY781d2LIZZXAX+lnTTo2YhkNMAEQ4KrTp0VrQRuP/MaydZilPLZpVvIO82iuONoxjwHj7nSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMaPCB1K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMaPCB1K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBF01F00A3A;
	Wed, 19 Aug 2026 02:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787108346;
	bh=qL4RpGwgnk9/NidRbhhSgsl91K4IlB43YJ+Xvkb2QC4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=LMaPCB1Kjn6pG8K+RoFUmS0v9fQuw8aSb0oJ9r2Wxr4/gianIRtyYoH0MaLzu+/EM
	 KaFE5uS24fsaRGQGj5xWOkNOUPRnnUsgG1cZ9CQZFKGSeFlrF10TrzwcCxRITpRgJb
	 +m/U95iD0uEzw3h1qFpEwjM8y5CZhtUwrJxGxyLJqTF+jsswn8+bYyFueXZK79B9SH
	 ePCV9OJUdV6u1lWnq8u6MhR8Uri+tPH5l+G4ROG384wRS1XNZxGjGghJVMI6aYoB3F
	 /JuY7R1Btn/nqoBLksiODZVRWhNjeaYJk4DxF/jnNdkek87hDPe0lNPxE/emXVLtf/
	 pL9NGNXa9K2iA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 69E77392706C;
	Wed, 19 Aug 2026 02:58:19 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] soc: Arm platform updates for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <714ff494-4bb6-4482-9972-84380d87eff5@app.fastmail.com>
References: <714ff494-4bb6-4482-9972-84380d87eff5@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <714ff494-4bb6-4482-9972-84380d87eff5@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.3
X-PR-Tracked-Commit-Id: acf1efa9485fda84f332c8fbbe7b4453dbec183a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bd5f485f3f026225b86573e559af0b7254ef4184
Message-Id: <178710829822.2816674.7570982886082870719.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 02:58:18 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 18 Aug 2026 23:16:45 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bd5f485f3f026225b86573e559af0b7254ef4184

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
