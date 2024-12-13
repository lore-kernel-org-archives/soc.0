Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6251E00BF
	for <soc@lists.linux.dev>; Fri, 13 Dec 2024 15:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734103410; cv=none; b=os8UwHe1S9d73nBtvgGGSSccNGHK5SNvcdAUyeRAwqMd7HOVO9f6cWwwYJZ8VWFLQjNrc09Ez4BTalGscAs7o7mxrk9ivH8DksQ0o0dt2IFszKrnnPjHgw8eKa4XK452vMZdFBElCQLXgFKRoHO1T8Wb4CAhhAkSZassyPCRnBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734103410; c=relaxed/simple;
	bh=dcOjQrWTgM55ti3oSjuZdfbJJOYQFDGTvu5dcx7Ophg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZgV6rYcsqOri5yQV2OfiXhR9P3oi0N/f9znzWUbDlyGsBWsZiYy6lvtLyblAybJ920w3oOn6s5z8obedjQGHLNlhdlUoCMhGdEgi/0ImI+esHVwQFaAz8vpsCmeSV2BzUD4X7sK2p3Xv5kcxYSUeaZ2xMslq7Lww861B4slx1ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UF97jpOU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UF97jpOU"
Received: by smtp.kernel.org (Postfix)
	id DA69BC4CEDD; Fri, 13 Dec 2024 15:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27B8C4CEE2;
	Fri, 13 Dec 2024 15:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734103409;
	bh=dcOjQrWTgM55ti3oSjuZdfbJJOYQFDGTvu5dcx7Ophg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UF97jpOUFaV8csD0sJbi8YF+hKmhIXRihLBR9LgPc3ngZjYtwvJ83QG616CFvz0GA
	 7y9yDTZWEr8RMcwkZd1hpHvG27SEJiv/AKSIcIh9GkwyKlHSDdONKADYwc4m7s4rvo
	 z2CgM1hfgjHZxy8M9A9CvOXdTHINbUpbziKszcAIH1Lh7R6tUJ4yNoYUpGdMDrr1X7
	 UyjC3KTZ9Q8B8WNS4lr2FlFV5yRqkR4vDMN989ExbxHclSMTbpoxHMZiKUW/HQ6eDX
	 pV1OLD+N6oV6o1qhFOPWowlA+OiN7+x9OxMrIhFB395mCKgaP4513Wgg6og4/pfofr
	 RhKpQm1fkHl/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 345C5380A959;
	Fri, 13 Dec 2024 15:23:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm: dts: spear13xx: Remove unused and undocumented
 "pl022,slave-tx-disable" property
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173410342601.3014960.6216146656838210191.git-patchwork-notify@kernel.org>
Date: Fri, 13 Dec 2024 15:23:46 +0000
References: <20241115193835.3623725-1-robh@kernel.org>
In-Reply-To: <20241115193835.3623725-1-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 15 Nov 2024 13:38:34 -0600 you wrote:
> Remove "pl022,slave-tx-disable" property which is both unused in the kernel
> and undocumented. Most likely they are leftovers from downstream.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm/boot/dts/st/spear1310-evb.dts | 2 --
>  arch/arm/boot/dts/st/spear1340-evb.dts | 2 --
>  2 files changed, 4 deletions(-)

Here is the summary with links:
  - arm: dts: spear13xx: Remove unused and undocumented "pl022,slave-tx-disable" property
    https://git.kernel.org/soc/soc/c/a21b2eb7cfe2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


