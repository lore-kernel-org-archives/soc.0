Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7715B22A4D5
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 16:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757693409; cv=none; b=rHG5Oy+UuWvCnBIil4EBAoNeWYt2L4b26l6qF+37IMQ7+55EBCeJHUny9uZOLyYm4oHKBo2kPHJDmbLHZrZ+uneV7nFnCX5GR5xuiil3GKygp9OUCcmXlDj8p1XrLvle0XZPDHdww9Ieg/dLJyJ4pCo4k0I231IKeH91T9oM32A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757693409; c=relaxed/simple;
	bh=49HKnwqQNcVE2r8kABCPbd/lqzVLJJPI9m+bQGswHKk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lI698NIOcQBSx/ppHRk1bqq2VpYbhhFPnwZh4ZK5URzEANjN4vaNHeEq5ZNvYkbkcwcW1ZowcpHoLTsnpGvSlYEXW4+5Ox74LOW7Dd1kzUgdv1MnkPQHJu76ZitOJ7C+fF8oB3S1wvkrjg54hDrjLd+hYjjZA8cV0gnded5jYM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9ckkA0V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9ckkA0V"
Received: by smtp.kernel.org (Postfix)
	id 6CF7AC4CEF8; Fri, 12 Sep 2025 16:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A14C4CEF1;
	Fri, 12 Sep 2025 16:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757693409;
	bh=49HKnwqQNcVE2r8kABCPbd/lqzVLJJPI9m+bQGswHKk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=U9ckkA0VwsUSVQE2em7oPgKd3/ww+QHTO+Zq/gaxsQghYWeWgbFSGYLU6Ch9cBLo5
	 YqwpIOfM0E0b2FJpojjfzY67nwH++CFAi1+naN05uSJZ4vraNzGxwWUllC+/eu7e4q
	 PVsF4jrBfHpWwbAkYuyKIB+brqg+jjscDonKT+5c9nunqkxY15CgUxEkO8KXz/MHZN
	 PxhL8vUR0IBJ7grdgyZfDJpMRXum3tTY5Nk8C5q6YmQnI8PMyeYD4+m91YijOLi557
	 MkGZKavTQfUu4aoNvBgIhto8ih100lrqRyNll+gucbbmmBgivogsBOubmpJYVD3Bit
	 dQpcS8yULHeDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF3E383BF4E;
	Fri, 12 Sep 2025 16:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.17, round 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175769341149.2998972.9003366708234801844.git-patchwork-notify@kernel.org>
Date: Fri, 12 Sep 2025 16:10:11 +0000
References: <aMQs2zr4fYl2DYVr@dragon>
In-Reply-To: <aMQs2zr4fYl2DYVr@dragon>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Sep 2025 22:23:23 +0800 you wrote:
> The following changes since commit 37e5caa5571b5a60b0c835a0bc09ab1e53f57bfe:
> 
>   arm64: dts: imx95: Fix JPEG encoder node assigned clock (2025-08-22 17:45:30 +0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.17-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.17, round 2
    https://git.kernel.org/soc/soc/c/6865ed7ddc81

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


