Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1283272E6E
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756557; cv=none; b=GDh2431kf36SWYbnuLrqCZpzLPvBzjC6SbOxjtAGB4c2KxJxU20KfdQEuu97glrd8YbrP+7jyQnptoVVZnnEA7iMHZf0aTzILMK+fAOACGM5u6wf7NR8fPyFyb/QtiqsIK4x5qTBwiGfR+l2806UChR0tCwQqQR+GLgnRjH7y1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756557; c=relaxed/simple;
	bh=73TFz/BwXg0l/srKfJqNr1wdXV2yI87kK1qweKoVarg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fSRzZtRF+wQJqrgcTq8M3cJdxfaXI4DF0UP6e0UNZ2W3V/gGcU0bzIuzi3e6lnlNXXdM7hbDK6lHnbif3+iycTSmX18Kvf3+lfBqIjgbEdUINObiGfzqlrbywFGRZs4rO6+eWcrTJQXXx7PueJp6nfiiVxWlOteLRmFTYcV2yC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbzYPmSW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbzYPmSW"
Received: by smtp.kernel.org (Postfix)
	id A7DF9C16AAE; Fri, 21 Nov 2025 20:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9200CC113D0;
	Fri, 21 Nov 2025 20:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756557;
	bh=73TFz/BwXg0l/srKfJqNr1wdXV2yI87kK1qweKoVarg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FbzYPmSWiRG7wGEK/6vUK0gBgRIlSdCEbxvt7xadt/eH5jZPtTPnFR37LmR5GCk6t
	 j6wCGda0IHzVBHliIRvqfLQfXLyOp8Al6DBfWmG/Pe3o3F/ixQGBF7Dak2vvOUrmGH
	 t8ZmjPqyJkadsNkhnrjJkpUPU7PnXrZqDY1fwVGY3G0Ou+vQ5Gkbbff3GjOehMVtSF
	 bdM/WAXyNGRimwW6mI/Hk4rA0S9B+a225RuFjvtzR+qQLoJG18X/j2AXrW4mj2vVKw
	 tDb964yX33N56ZBSdLzIB/TFuiCf2ErcSPOHSXPfSF90pKt71/nsudBowQiHhvgD/y
	 xP+am/Gvn9ueg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C373A78A68;
	Fri, 21 Nov 2025 20:22:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v6.19 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375652199.2571237.8285989194148293952.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:22:01 +0000
References: <87ikf3a26a.fsf@BLaptop.bootlin.com>
In-Reply-To: <87ikf3a26a.fsf@BLaptop.bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 21 Nov 2025 15:30:21 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v6.19.
> 
> Gregory
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v6.19 (#1)
    https://git.kernel.org/soc/soc/c/887bc881634a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


