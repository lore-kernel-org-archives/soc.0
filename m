Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683BA314B93
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 09:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986009; cv=none; b=g8HdYoLzDX09KNAz8if3cvifCh3R6feCEVDygjoGXWMHz9mUKZbD6Cg4bX0qxSCPHqrsoatvtC2eN6TyDW3Y5qiR10w5pQwiXFDDBmCqbuQwHdp/LpzaqvQLMUYoRzx9x4Sq6Q/2HmmCzv9iD/TE1qNquoQGO+sjSOYgWXqDA4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986009; c=relaxed/simple;
	bh=eVjYIHcPmpoPQiEL2xjF+5O5tyuXAeFH+UpFpBHVNt8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BIm8HlBW7/T8hhqPthLs798x/8FNNUpwXj3p0v/HiBSIpkSsItmaYIyoXyzJwuY/lSDRU6jvNkcITkFJzqtOz68frN0YtliFAR0NPb0o4G/xTw6JQMnmldzzYFmnW66bdpt+LnfBeEXSgmZjWBXJMP2gVnnYpSO9jor1P+FfrT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOeOlSY/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOeOlSY/"
Received: by smtp.kernel.org (Postfix)
	id E9587C2BCAF; Wed, 21 Jan 2026 09:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D347EC19425;
	Wed, 21 Jan 2026 09:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768986007;
	bh=eVjYIHcPmpoPQiEL2xjF+5O5tyuXAeFH+UpFpBHVNt8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UOeOlSY/a/7TnslBLSlloraf19/lCBfKdf5tQMtWJxDdVDvQYqzLsD1a+7jxOYSvO
	 k2wrybHlQuCoz+vTMtlNUjcBymQK4jKZGbuIoq9LQ3Uyj50qi3Akt0TCZ1Jr1AKrDB
	 UXC59w9wPmfjT34btEUtUB2gFNMr31RgJV1kTtKFXZlL+jRudFMGl0Bwf6x2qy1Noz
	 IwfWHccsbF1+pBzvSCcP1n57r/uG1JhPPs3P9he/4mVKf2NtPOOE1ZJXImTRAopy/n
	 MjJ6G1/3U/fTWsByCsGB+GAArahEDDR/YdLEBcFnrk72YzolqrysKM1KzuOU3obHfX
	 FAAhOaZgIRuJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4EAD9380820D;
	Wed, 21 Jan 2026 09:00:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176898600485.793757.16451938778207025249.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 09:00:04 +0000
References: <20260119155854.839183-1-andersson@kernel.org>
In-Reply-To: <20260119155854.839183-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 Jan 2026 09:58:54 -0600 you wrote:
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for v6.19
    https://git.kernel.org/soc/soc/c/0638dc292e54

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


