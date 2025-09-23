Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96DD265CBD
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662471; cv=none; b=Ks+66t8uqofeKeQ7YOdSEPO14nJwnbN3U7aAaq6wRMi32/lIf4/ip6nomMoIsRh1eO1mV5DRKmzD2n+DQ4Jbr6B3b27SjjGc9hX3YGd+Kt8tx0f0yan6vMuNW9cw0OD2hGIFvqLGPd8h7FIw+gcf8e0qjcafPlaH1d2Knn4AbLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662471; c=relaxed/simple;
	bh=vEuk/gMsHHQ53nGwR9MYL262Ug1e8XSdMlztr2JAV/w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Xdbbgjm/q6H9qy+KtK0CoFYULTeA1kc7Y280Q0RbCIjCYFykmeTQRwGIzKgMtUiFDysGiFl9UCU5DPeWKq8aBhdnv9Nl1CCtuJSGgWvbvQZXc04zDaE1tPQJ8ShnidSh9dGLNSCjpAJ8j0DwfLwZ5x3Qet0w71s4LGCuk4u4GzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXJ8J+OY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXJ8J+OY"
Received: by smtp.kernel.org (Postfix)
	id 552A8C113D0; Tue, 23 Sep 2025 21:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F793C4CEF5;
	Tue, 23 Sep 2025 21:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662471;
	bh=vEuk/gMsHHQ53nGwR9MYL262Ug1e8XSdMlztr2JAV/w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fXJ8J+OYjOk1tUNYAMmAjxKLChVsheutw8ERb1EVm3HGdYwxC4cZmTY1fKNNi8Xn2
	 Iqp8GZLk4f5+jQqL3SPFvxuc5bcckH1UxyX+Dlp6uWpwPvINtgR5+km30tLsIOQm74
	 OEbeZR+O45kBH44y8s/zTtb+/Qzy8Biq03/w6m232lGDIKMr+XksQEbkxHFESC98c0
	 B94UWeQWNEj7sELWIEzTjbu61lgQBPHOZJD0nDDhAtd2VkgHkTTp38MuKWl3CFFsG2
	 JAuxPfmVB8m3xZBZwgCCgPxaDV9bShS4o5uniUu8ETSDHz1ht6gfZewlyYyDQn6PE5
	 mZYlxd86kK+Kg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BFD39D0C20;
	Tue, 23 Sep 2025 21:21:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] MediaTek ARM64 DTS updates for v6.18 - part two
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866246824.1926563.17772432922567580112.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:21:08 +0000
References: <c0e2e902-2a10-44a7-9592-491ba7382df0@gmail.com>
In-Reply-To: <c0e2e902-2a10-44a7-9592-491ba7382df0@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 17 Sep 2025 12:22:25 +0200 you wrote:
> Hi Arnd,
> 
> can you please have a look on the following patches.
> 
> Thanks a lot,
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] MediaTek ARM64 DTS updates for v6.18 - part two
    https://git.kernel.org/soc/soc/c/83ae575d6f0e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


