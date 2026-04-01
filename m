Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70B4A932
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 22:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081427; cv=none; b=gpd0e2gsk7w+QTGkrRPdyiXnCJBxWtA6s1xiv1/OwwZlqYbVOlJiEuQqNLa8S4lsihPQyxOJkKJDEir34hVktRWExMSmefncgehy+320xnAsLxsDzf3KAOxe19GwHAv1JYBF4lwnCX7txqPdsmMxBBIaDOu8SMeVqlrf4mCHM8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081427; c=relaxed/simple;
	bh=wz6kfBJVfqo3ukH4VjS1VSPJ1gRc96grBP0uDlnERfM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=awuiCL6rxaCUxkZMCaCmEvLwyJ5po8C1/OEL+bSU0GECTDFwHWnsiPXjMEfkQslNASpuOtixTwtFScq2FXRktb32ptcMDuU9Gn3ZWu6cuctBH+yPhAAAUPRIZaRH2wvHc4i6B9y6/p4JlNUQJT8bYvpQbmncNboQhJA26u240N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOYkxbB3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOYkxbB3"
Received: by smtp.kernel.org (Postfix)
	id 96B0EC2BC9E; Wed,  1 Apr 2026 22:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C38C4CEF7;
	Wed,  1 Apr 2026 22:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775081427;
	bh=wz6kfBJVfqo3ukH4VjS1VSPJ1gRc96grBP0uDlnERfM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eOYkxbB37aMuRx4cjOWwb3Xqc0GVAbjIiFE1hjVqReWF2xBPerbjW9kNgO/nXnKKB
	 5NSuo/WWBEtz4k0PPZwQLlgP8MhaUmZcEjpOjeRCtbbpsVpQzs+8H2+5neTboQ9mkC
	 CujAg2oIOwya63/FyntKlRB3U8dQKXbLpiTBSMf9UtzsfsJfayTwXXBWfQx7tglpz0
	 6ydDbvyw49SGUCB0sL4GrK6MmaHSXyK/Tk/n6a9VFOL6feOCwbDW29iWgkepkh7g7y
	 F8/Ko5hIPFnNTUKoMCyuv6uDpZtkLZGwqIXcxlj2K66dM50MlS25x/YCS2ldUwsdDz
	 iHuYEmVelCMEg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF063808203;
	Wed,  1 Apr 2026 22:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE update for 7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508141003.3882930.4972303884554846375.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 22:10:10 +0000
References: <20260327131909.GA3249645@rayden>
In-Reply-To: <20260327131909.GA3249645@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 27 Mar 2026 14:19:09 +0100 you wrote:
> Hello soc maintainers,
> 
> Please pull this small patch simlifying the OP-TEE context matching logic.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE update for 7.1
    https://git.kernel.org/soc/soc/c/95ff410d15e6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


