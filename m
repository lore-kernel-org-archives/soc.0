Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCA93502BA;
	Wed, 11 Feb 2026 05:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770787117; cv=none; b=YQN7wFN+Nm/MCTbcEkLEom2KBHPv4+8K7KC1fEMH9W4w0GoncLIWqPSE3p1FifHnS4KHwIWlYu1CuJZi9xzXU/IVMz15aHjpnYSOxRVrr7LBKhTn/9xMBIak9jQ5Q7u5v1AUVt1z/KZJ6894NYuwbEi44Fp3PtLzcuseBa9DGCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770787117; c=relaxed/simple;
	bh=HGKpmO3WORsOmpGiepKUWk2K7vzNd7+196hKvaikgeI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=d45xTn8PWZEW+PAjCIHiyvHbOYChnimOEVa2F38od70HheJVZ+K7e671r0+rc62RuNMt0kRTa5mRmIs++Maf1BFqILbAXDataPWF/gVzBFMJr/N6ne1QYBwAFWBxqQFTn48eJuaZ7hz37RVGyAKlSaKq5pLPohIBtZs+9BudJeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQFexxlq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQFexxlq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDCAC4CEF7;
	Wed, 11 Feb 2026 05:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770787117;
	bh=HGKpmO3WORsOmpGiepKUWk2K7vzNd7+196hKvaikgeI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CQFexxlqoulQf34KxsdXUAjO0isxEHkmImPb3vaPHbKRMxNzTOjjdLYOwOiuP4vnx
	 z4H4jekGLWphMCbQ+vwxZiuuOpHKtCr2bTmck3wrt0OCvdEA6rhmHjjl/k8Ddq7Pg+
	 qq2XMnEL7eixvSYzF39K9GUat10KivIFpMDTUZzXVTUr9ZlpUs3UjXGSZihJrBlfjO
	 WdQ+ipR40KowEG0iYm70zoz3k39BJyOWT0NRD6p/c+cKjR/t3Aur9RJKYIV4eB/WK3
	 vHFIcknY9DZ9bnbAoGCy3UuYE+KJu7tPps4Lg5RwgLIoP/f/OMYB3pyHvaCnk3nShs
	 vtCcKu0qSoDuw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0AEED380AA50;
	Wed, 11 Feb 2026 05:18:34 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] soc: arm platform code changes for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <8964e89c-0cf1-4184-920f-5cd852ba782a@app.fastmail.com>
References: <a34ea40f-e0d3-459b-8233-9f87f6cd73e5@app.fastmail.com> <8964e89c-0cf1-4184-920f-5cd852ba782a@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <8964e89c-0cf1-4184-920f-5cd852ba782a@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.0
X-PR-Tracked-Commit-Id: 16868b35b915a8a0fc810cd14b3b4927a5fb2213
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 60dc45dde44e0b5c433d8db574daf86b59eb6dc3
Message-Id: <177078711271.18664.13401446700095291121.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 05:18:32 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 10 Feb 2026 18:08:25 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/60dc45dde44e0b5c433d8db574daf86b59eb6dc3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
