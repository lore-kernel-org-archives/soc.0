Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BD03A7832;
	Wed, 21 Jan 2026 18:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769019701; cv=none; b=M/MAApAwSq76M7mos0EnQ5K4uuAXStVnLGLNtWA4rvkFonMDWduNWceJDPSzTYI6y7B6H5sfLxm1WLxEetps1VPCZ3OgxzKPXrRs2dzSZo/X7921pg9e4DMB1z8KVY5CZcJlIaCm6XfZgKYTBSjO3/rjc12m53fa+XF/8BYiwog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769019701; c=relaxed/simple;
	bh=kdGbKUjg7HDZv9Xoxtbh3+nHI7tolhaWZdYz8UEZvEk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=eiTELgF4vb3uFghPaf+4uZQY2iA7UmApP69Yj3XKgDpfMMU1GfeAioBZQGt9ETifAePhqDAHCYloy15+l3OooOn9pzazwB5PERjq6eKODFZ5s+uQ232Ry6KO+qMAHDOxd/bIUAu+G6LzaRgE8zixCIU07FKDyZ0Y9747lmmKJcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQrDVeED; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQrDVeED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85668C19422;
	Wed, 21 Jan 2026 18:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769019700;
	bh=kdGbKUjg7HDZv9Xoxtbh3+nHI7tolhaWZdYz8UEZvEk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=eQrDVeED66DgA0dTt7m5pghFcvKPl5+Afmn4NDSo2QHva8ILvHBUygmuRlRhMrwuo
	 xN+NyooPMj7DQkim5oe1PnK+UMKL+/2J4xMLDyW/5ITm1X5H1DcNU4UO2xekKGQ69k
	 RoExbsY/4huS+dmWes8VPKxFRqhdHfNd2iGXR5ByVkrWFUnBM3xQTIF2l6Uc3SLRRh
	 h1lCwL5j871AA91rm+PwWbMaHbCznfNNbFZwz1TiLhPPbeeAjYyrtaMVLSInIRpBcE
	 s+LYFbMFbXiAVg8Bs1gvmRwuTYJ2fbuvBfydw1GTJUOet4FKzKN4pdqi5J3dniZo9G
	 qhGvRhZgNkXhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8EEA3808200;
	Wed, 21 Jan 2026 18:21:38 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.19, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <77a55850-bd7c-4525-8ffe-46d9e17dc1e4@app.fastmail.com>
References: <77a55850-bd7c-4525-8ffe-46d9e17dc1e4@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <77a55850-bd7c-4525-8ffe-46d9e17dc1e4@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.19-2
X-PR-Tracked-Commit-Id: 0638dc292e54ba0cbcb1ff81af3ca52d3bbfaf54
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cf38b2340c0e60ef695b7137440a4d187ed49c88
Message-Id: <176901969746.1402269.8266620976533586622.pr-tracker-bot@kernel.org>
Date: Wed, 21 Jan 2026 18:21:37 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Wed, 21 Jan 2026 15:55:32 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.19-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cf38b2340c0e60ef695b7137440a4d187ed49c88

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
