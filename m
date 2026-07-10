Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E77426ED1
	for <soc@lists.linux.dev>; Fri, 10 Jul 2026 13:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688430; cv=none; b=UaBHDPAYsoqL8vBjO05OmAy0MBsmt9xnD57kCdSCXerQay/hAC3vAjH1/L+P8CcL7U4XISee0zn26MTfAgkLXvRfxBGWUEH5KTRVHg02YNlT44R1LaCwwsSqWLtfhIHurU5VWtpINPW3YeJavjCrMVKybn0osIFmlH+BoXFDhBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688430; c=relaxed/simple;
	bh=hxE6dB6BhLxvQaI3onRoNnHQuenM7PqWAEvaQWNW+fs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UNY5b9bpyJDpZwZPeBQ47AF7jpEaHnx6/79PmLw/tlf5MND5JnY5SppoqCWEs/FLgypzPlnyzfvg0UYEVyyIH++WpB7wE4FVeAP+CdLRcCyTdNWknvl9+B0iczzp6UuKR7KUSxc1BttsJAYXFlKv37FjxNokWByNVLobRH6+fGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z14gT8Gv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z14gT8Gv"
Received: by smtp.kernel.org (Postfix)
	id D1A2B1F00A3A; Fri, 10 Jul 2026 13:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4501F000E9;
	Fri, 10 Jul 2026 13:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783688428;
	bh=zB49af5TY8qrk1m0io+agwi2dV6crPjm3DSMEEI/3lE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Z14gT8Gv6UFYeEzA/2FH0n5X3wszSR6KOJQw8G/4PIilmfcYN7hFF1vxjuEydBxnj
	 hno/6s2DWBIDj2qLyA55oPqv7pQEi/Ww9cpS6JXcYDQj+HGhYUvItGINI2+wnF+foe
	 kJ6Uu+wjC9dLuM1ZSelaG1ZUT2YybfmVsiYrSx2+31q4l7AMZrNO2PLtqaEL+RMNqS
	 JY5rOUEw4cKSBf0J8X/RnY21pddx/u1GUcdOk5tQFSgV7RZLSo+q31gNDWT9Ff+yDv
	 DTAgqDywEahB8LIIDHsFcPHUtVDiP4BjZMlVqg8jpO8oll29QsBMyDZS3QQj8mUBtk
	 l1agFMVsV6oQA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AA33924F93;
	Fri, 10 Jul 2026 13:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] soc/tegra: pmc: Fixes for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178368840647.229479.4354846497373349304.git-patchwork-notify@kernel.org>
Date: Fri, 10 Jul 2026 13:00:06 +0000
References: <20260703144042.1190046-1-thierry.reding@kernel.org>
In-Reply-To: <20260703144042.1190046-1-thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  3 Jul 2026 16:40:35 +0200 you wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> 
> Hi ARM SoC maintainers,
> 
> The following changes since commit 2cee7da9743396aff1fd13124109c78975c92ad8:
> 
>   soc/tegra: pmc: Add Tegra238 support (2026-05-31 07:21:15 +0200)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] soc/tegra: pmc: Fixes for v7.2
    https://git.kernel.org/soc/soc/c/3865105546a2
  - [GIT,PULL,2/3] soc/tegra: Fixes for v7.2
    https://git.kernel.org/soc/soc/c/6243664a29fe
  - [GIT,PULL,3/3] arm64: tegra: Device tree fixes for v7.2
    https://git.kernel.org/soc/soc/c/b69110c1ef9e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


