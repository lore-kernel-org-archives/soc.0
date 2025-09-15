Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7361EA7C9
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944264; cv=none; b=rHjWqyxjDvQd0c7siv8FFmuxh7/SmJR3qFB9UCQ6dpMaMyFZdMhLOAD842ed6dEmANjybIu88qpuwbuEHEXNuuCQH072Be6lGWPVMTokJ0tIYHx4L8xikcR9O78l+mJqgvWLPgm1r5TWSnFmAXD4C/7OofE71FrnAdvOzXeI9QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944264; c=relaxed/simple;
	bh=GAjqjeSff1BbXxkrqTxFNbWm/QeBZj8yn92JTfke7ZU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FPPfirpSCwmmyGso7SuezoEdaBt+cPAkfmhHfEvwJJ8LcYRn/UfUcN5droK4GMPAGz4Qd1sKn4t+tys+4H0m3V+DoHESi932aNk9M0bzaLxm6K6oxws5SAEc+4LsIQ8BB4sTlKyRASVCus5iOqWM8sExS/XGbmGQUZLOvrR34/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NECWTzrX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NECWTzrX"
Received: by smtp.kernel.org (Postfix)
	id 82867C4CEF5; Mon, 15 Sep 2025 13:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D755C4CEF1;
	Mon, 15 Sep 2025 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944264;
	bh=GAjqjeSff1BbXxkrqTxFNbWm/QeBZj8yn92JTfke7ZU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NECWTzrXVjcfTrmMuCBzz5Tkc/lF6YRkUuh2F7VgUHMFCgDKSQd0EbZXaf7rgVoFg
	 1H/RLNrzDrab2k2WDjKDI5/1IADcRstIpj7uMHvIjQV4aoxHeljg/RlOIIUalbbY1r
	 Yvb/+lZnV41cRb/ljQYAgRljjmqiC+hCDrQa1/QKR2d6PhVgXNzulkzOHJwC9P6t6s
	 Xe4B5xnUH8bGiVg67CHfKT08qbQEgfgyEOD4WCR432za9Syalh8PKXVdor1nTBpIeO
	 125mki13OgA4QxWuS73vB9Xgob/uRjBm1/6FLUJ5oDGLwsiYu2h7AoDrCiXkZSppk8
	 puTjMAbS8wSuQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B3239D0C18;
	Mon, 15 Sep 2025 13:51:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] NXP LPC device tree changes for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794426573.4179625.6603990837162073128.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:51:05 +0000
References: <20250911130642.41958-1-vz@mleia.com>
In-Reply-To: <20250911130642.41958-1-vz@mleia.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 11 Sep 2025 16:06:42 +0300 you wrote:
> Hi Arnd,
> 
> I kindly ask you to pull the next changes.
> 
> It's been awhile since the last NXP LPC32xx and NPX LPC18xx/LPC43xx pull
> request, fortunately today's Linux runs on the platforms with no issues.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] NXP LPC device tree changes for v6.18
    https://git.kernel.org/soc/soc/c/4c4457342a12

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


