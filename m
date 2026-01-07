Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6895933D6E2
	for <soc@lists.linux.dev>; Wed,  7 Jan 2026 17:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767805411; cv=none; b=V1V0cAVOITJmiKueMZ6AP1QRCLS+rSvMWJZmNuZyBK7Xt8ESn62IP05ueNE9S3vhUvcxpvHBoKKMTN2H/elTgNEptwjMNpqlyzrRTsbmsfcMvD4SKYTd/O3KZmor38r+tslZ81lDstWIH1dzLZS86MvlxVyeZ6AANgFTOhPqca4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767805411; c=relaxed/simple;
	bh=5xRy4HApolb5z9dr8R9LJ8GR9EQTgmybb3jXAvYbRn4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PkUbfQLABa8pywENMNpDGRMNfBykjz/J1r0SIXpXm6qakS95v2wl5ZN8glLWMFKUETEVC1nRyHhczPWUzT/cFom8cjXgUmkAV8JhVcvoqXWBFZ1f73g7s29BKLTjsbMQK2O0+axNnfqudAKIl/vh/7j5JEA7rSOyGPXZKnUqhCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qkfvq8a+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qkfvq8a+"
Received: by smtp.kernel.org (Postfix)
	id 0E8F5C4CEF7; Wed,  7 Jan 2026 17:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE9EC4CEF1;
	Wed,  7 Jan 2026 17:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767805411;
	bh=5xRy4HApolb5z9dr8R9LJ8GR9EQTgmybb3jXAvYbRn4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Qkfvq8a+c2P/UIVoglBtEM9U/0lTkIZtsGJfiLtRn7J6H9rUDmDIjM+5i4UAR61Dt
	 JhFT6O0kolb4h2KycbuVMlQ8vCg9sBWw033cQvZ7v7mt0QGzkRiD4L8xzeavIeWPoZ
	 49gfz63I+DMpqKqii+l1jCVSPhrsr2K06wbzUanzM01c0L4mFEAuWbivF2MRNxtacS
	 R+aoyTmtjkzi9FlC5Aw8yA9NJTf+SloEo0y778mdPul7SYLsGeRDSDpUyfg2eI9Wek
	 X0MGbdvHvYK3RPxCDlwukrzC5uA3GbsdSO1TQk8/aW60WM+IWPbT3NFeGUM/i+leUC
	 HrI99Ueo66YsQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BBAB3A40FD1;
	Wed,  7 Jan 2026 17:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176780520805.2859028.17545110019717527588.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jan 2026 17:00:08 +0000
References: <aVSX6SK_LADf1ti4@dragon>
In-Reply-To: <aVSX6SK_LADf1ti4@dragon>
To: Shawn Guo <shawnguo@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 31 Dec 2025 11:26:33 +0800 you wrote:
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.19
    https://git.kernel.org/soc/soc/c/c221cc877bd2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


