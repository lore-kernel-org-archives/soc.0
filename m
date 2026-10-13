Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDADC51DAE0
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907829; cv=none; b=bBjqdAq2u9Im0KpcmH0vmbEibv4TDU/g1MjphYPQJXUMU5xjIKKW+j/gdzteYNXgPjNmi6zvFtShG1vZc9pcW7Tup8YRc7TRCDmlvGf5PrLG2UlhphK+5xECYjZnmG7hASwvjIh0XYziVTD3afkMBUzppV92v/WYKUXvkJ1WnTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907829; c=relaxed/simple;
	bh=2czIidCVRby4QBSJDkI3Hz6Y6F208Sk3NW1kKgfmc60=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=b4J+/3Xn287o0SRpyGArxO3LCjXMUnd42v+Tf+/Vd1X2lolDYKpR4uWQ25Um3Ijb1R/ZmLq0zigAZ3fw6MnoWxNYDvoTjOCjnPdMc2rPoDmO5u7VKDUDbFwdFUCMPux6Gzf9wTH7YSAdBc3r3Q5nH/44mwPPsKhIj3O+LfRK2Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbOfoSSZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbOfoSSZ"
Received: by smtp.kernel.org (Postfix)
	id 970BD1F00898; Tue, 13 Oct 2026 16:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804031F000FF;
	Tue, 13 Oct 2026 16:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907828;
	bh=0sERbwJ20Svh9UH6z8+FcBhw4XQU12PXFmIPT/E93uk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kbOfoSSZKBqC9M/lk+Tse3LK2yGFCgIYfbisHR5Y1pAO4uVelyo1vlCPnru4JDZAw
	 CyneW4epW9DOHCFhk5AeeIoqLtVk5dh0IeDUFaDcE0NA2X04r90DlqPI0E1hDjTO/o
	 G7T49biXQOFmpiyA7s+KeYFUizfg9QFTM+hwB/kGg1lcS0ge4iWM/xD79TA/fcM918
	 joDYnVNK0EnFvPzcV9wGw79s+ZIsu++5BoFG2Vx7tsuG0w0TjG4FsAMwsjf7AtHEBt
	 eHRxJkcRT1EnGH+G7WYTy1pzE1hcsHQ6azapw1ZQ9/d4YuPXhe59L28sFH3tIHnKF4
	 Ii+jSrZpb5x0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7737E39D5FD8;
	Tue, 13 Oct 2026 16:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm Arm64 defconfig updates for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190782713.417156.16400718731723305255.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:27 +0000
References: <20261012192301.13361-1-andersson@kernel.org>
In-Reply-To: <20261012192301.13361-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 12 Oct 2026 14:23:00 -0500 you wrote:
> The following changes since commit 897cf6d54f366885e190e75b3a221e7b3ae35065:
> 
>   arm64: defconfig: Enable PMIC5 Gen3 ADC thermal monitor (2026-09-12 14:18:26 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-7.4-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm Arm64 defconfig updates for v7.4
    https://git.kernel.org/soc/soc/c/6db3ea21a541

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


