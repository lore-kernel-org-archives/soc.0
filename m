Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44712363C6F
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006228; cv=none; b=CsMse48/7jTVSXCLYFITehbaO1kDmCK/H32uIE8OJzD2BIl+eN3l/MIQvQPwT/7ucQzINM1p19qNuTPWBUoVJhq9FdGmkkIe1kWrFD7YyEzjoafJz8sexTgO2s8p2Wz6VXv382H2IYEdgvUgYiS3k+0e5EBsnmMkUWP6YJQjZZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006228; c=relaxed/simple;
	bh=a+N66dXePlVbhxPfG8ftEaZtM75m7bJ5yeq1/l3W/fc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=AbQ82q9RP+r8G6G4gw43AeZlnpvDrP6GAQL0+EBhdt0hJQzone4rhBDVs/Bc+TuDZt04dYsQAt3tfWyUH7nREIUwQfEA5a4l2cOC3+pkXB/1AEoTNLDM3VdmXnGjRNjD0oxcgmotKVy8J9+aICvvE4rR0pWX5I+Dpxfan6Fyz8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yf8B+BNY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yf8B+BNY"
Received: by smtp.kernel.org (Postfix)
	id 3FD4B1F00A3A; Thu, 28 May 2026 22:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FF41F000E9;
	Thu, 28 May 2026 22:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006227;
	bh=GhAsZJfZdyVnL91gJEcVUgGITros58Y6pWiW2kx6RE8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Yf8B+BNYPZqBbS6n8lFYRZAlnmciRxD7rilYG+7ldGrsLijRCLEyGJbcEyC9JqVD1
	 cXsWVzygMANoetJst6ABNU/20WL5prqdANzFX1YhtRz41PtlkxT8EoNODyOFHYTWU+
	 45E024LKHpO0HtLfwSwN5ee4gLQvRabuiHiFzztuAXqDvh3NJ9EL64Q3UrXJ5VFiJ3
	 dTw2ONJuG5zuCFdkuQhEzYNfpm30aTkflxxfG6Gw91oOR5Phmubo59XwvtB7fk4V4V
	 ChN0iKSuUDOND4UyXtcDlg2CQxbyL+fkCptlwks2YVMr7WB4qETWX+ypWAcQroS22Q
	 b6q0NXHhdNzwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939E63811977;
	Thu, 28 May 2026 22:10:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver fixes for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178000623113.1533055.13500375073857608957.git-patchwork-notify@kernel.org>
Date: Thu, 28 May 2026 22:10:31 +0000
References: <20260526144748.2776-1-andersson@kernel.org>
In-Reply-To: <20260526144748.2776-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 26 May 2026 09:47:48 -0500 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-7.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver fixes for v7.1
    https://git.kernel.org/soc/soc/c/a3a7c052725b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


