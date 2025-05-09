Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76B4261572
	for <soc@lists.linux.dev>; Fri,  9 May 2025 21:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826222; cv=none; b=HdFprEc8HE9n3Z0LfSzcCqjMtC7mgXfh09k489Oe+012OtXzoUKFphOMfF3BZduEqXiO9XTig4nFy8fxbqWM+CGabuK1RxLDixYVvhkEdAfI3KUUEDp2O5j7/YOlAQY0tP0AVt48/2icMJGa5UNd20FPssfhf9+XVpXeJ2mRWVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826222; c=relaxed/simple;
	bh=Y9BoKk5ZXPCcojEVcz8fVdSc4T/PcDOz9FXjR2cxtIM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VECVCMr8GCq/y3wPwn3pCf+WfGeRpcC2K4e/PQupx/MgFvh1souAOyzQl0i9Q1HkGsiPCUDUy3pRM0rdMr3CbIB9A5FKQf1YWsD36itIa24HFeB79mdaocE/jsWh7pDRtijM7XqlCREYPrupjnVVfkc1QrfIW4+4cZkRqpbR59c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKhZofJJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKhZofJJ"
Received: by smtp.kernel.org (Postfix)
	id 700AFC4CEEF; Fri,  9 May 2025 21:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A47AC4CEEB;
	Fri,  9 May 2025 21:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746826221;
	bh=Y9BoKk5ZXPCcojEVcz8fVdSc4T/PcDOz9FXjR2cxtIM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gKhZofJJVA12R5tthDjOnSkP8CZ2suD/gXTrEyC7JJW2pz8W5FsXyEH0k6NJfSiF5
	 kLxrOeSryJJ6s7djZR4srCW6y9KMFYU/Y5vmlFqJ28qVNAzXp3Ce1+41WVqBp0rzFf
	 hcvAfaZ91kFw+uecZ/SYSeoAnYrYk7Rm6Pbbfasz9/Bmxe3IjeB7xPN145cBLyflL8
	 Vs9r+NJ+/1l4k7xf/3PSNzCMwKJslGCH9FRqMeq6DyxcXMz4Yke7m9UzyAQUpdC2K1
	 cfEKOuvXMK4tyzbTZ3ufmLBDzABSGrBO7IoPWUDUwnDjrbQP+dKj1KLvIt0MTLuqaH
	 rHL+ug/pWsMpw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD6339D61FF;
	Fri,  9 May 2025 21:31:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AMD-TEE updates for 6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174682625958.3817276.4376358332440099603.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 21:30:59 +0000
References: <20250509065833.GB4188600@rayden>
In-Reply-To: <20250509065833.GB4188600@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 9 May 2025 08:58:33 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these two small patches for the AMD-TEE driver.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AMD-TEE updates for 6.16
    https://git.kernel.org/soc/soc/c/60dce06e49c8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


