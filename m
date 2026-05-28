Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD82363C6F
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006229; cv=none; b=NXC+7FB5rR5TlrEeTE8A03FwMYNRbI3UL4TQK7KFdNpJxAd2d7G13j6BZi0IS4yp21344JRl4KDZEehnwHfC5okYd8kM+jW9L9Ek8qOj59wiUgcNacTGQUngyoEjjQpgtRkTaWS0Xug0tnXpjxtxW6KPmIhQ6sOSfPTe9rzWlMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006229; c=relaxed/simple;
	bh=g4EpTx75MbSI60zb9MvuBxQP5CZQvDD11qyQDkPhpCE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=IpuECZTcK4vZXYqShPEDlyD7AjqzSiSBoKCKFvRkgDWX/th6GxO4C8abTtbt2EwvdgtflS70r9ZnrVUPMs/TFsXGyOnpCqb7iRAzo40NkVZ6nBeebYGoWc7P1vJWQSaNylMTdSuwDPezTIcVzsm4YsmhyFV6F5RMiavSbNJEW9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FxmI9k6p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FxmI9k6p"
Received: by smtp.kernel.org (Postfix)
	id B8C4E1F00A3A; Thu, 28 May 2026 22:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A21EE1F000E9;
	Thu, 28 May 2026 22:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006228;
	bh=oRH1PizA8D4KDraFS0v1V9tCfYiLY8oPp3aR/Pkxxuo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FxmI9k6pSsMXECQ0Nu1lCLt0gY5iq5v50QoHgkDgtdrteTbqArlgzDIK6f2v5ZHx8
	 Y2bWQ3wmlrXPj+pDPeKvpirk5cGAJ9QK7bml+jhNKAGfUMKbJHnoR0CN3vViV6dHvP
	 aGuveILacypNuvQe1pgAidIQMNTFndvgO8RPCN/BqzTwtFVUsRkx+tU5oLvFE05z9a
	 GuzUkvIQooSQiiKDo45atCEHUNAlxjH+0XAQUmrnKeP/wEba+KE5P3Saumo/Oib19B
	 4SalzhnLSCs6D+ci3e7pGNmzNiPZbAv2y+dBe3oYU2+GcmXSoguVKB8aJZgh5zyKpI
	 bX9dGgmyOfF2Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 197E43811977;
	Thu, 28 May 2026 22:10:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig fixes for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178000623263.1533055.5567037266742096594.git-patchwork-notify@kernel.org>
Date: Thu, 28 May 2026 22:10:32 +0000
References: <20260526145839.3800-1-andersson@kernel.org>
In-Reply-To: <20260526145839.3800-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 26 May 2026 09:58:39 -0500 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-7.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 defconfig fixes for v7.1
    https://git.kernel.org/soc/soc/c/acbfa4ed973a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


