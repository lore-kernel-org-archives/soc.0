Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6A622A4D5
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 16:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757693411; cv=none; b=P68hWZrf5eHBOxPYm9M4e8BQBj5c8yLnJX3rxOP4M+guNYzfpiYAPmnPw+ZWXUTPLBW2KQJgvzTnkQpYXbzB723kkEQDy4n/PrgjvAjAKySeneNRuY3GG+BCwJHNa4GXv7GULlC0gTnXPQFcx1XlFDk2EF0afi9F/yAs6CKIsqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757693411; c=relaxed/simple;
	bh=KI/QEzul1gtTvvrze1RCTsv78hwRA1KCL0d7gNWvvEY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hf28hHMmS3a+YwklDn0fFvFE4tN56qfRB3CwGrXOgA6v46I0tSBRcWCyAZTWGLfABoDc5fc/D2YWJ+/Qk+ixKjgnl7GkkdmjmJ8yy/HpUDGcsMSWIXJ9UIzqYcEUPsmIpi2ni7Jf98LKNDvsNlnRN8yE9ApJs4F5usqC8KUu82A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nirOGTQL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nirOGTQL"
Received: by smtp.kernel.org (Postfix)
	id E50F4C4CEF4; Fri, 12 Sep 2025 16:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91B8C4CEF1;
	Fri, 12 Sep 2025 16:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757693410;
	bh=KI/QEzul1gtTvvrze1RCTsv78hwRA1KCL0d7gNWvvEY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nirOGTQLJxuNV6i1YAYJ1ZlU4rBwgk31Xj+JQUTwO2WhAf5Y9V/qElhzV+dP0/TzX
	 g7GYS6A+aYzG9FDpJQjdbYG3+1exB/S7vozgRCewcZLCg66dIHkIy9yU28h2m9lgbs
	 3zAtPOU9/BIK1k8LaZFBwRBC7I9q6oXtk/5xRM82LCgAAtEeEdeeRbj9eCKW/8UdAe
	 UUJZBdrVzQWSAaZ/aYiiobLc810ns1u25btHCfDiTC3Ra2zM3ZjwjbNziifMU9l1be
	 1/bSdEIYi5yNagtcKoFsix+ys6WaY2wOAsz3Y2l/LRdNH+LQ3EALXVEBO8jfwEwMgl
	 0SWhS22sgW5rw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F0A383BF4E;
	Fri, 12 Sep 2025 16:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v6.17 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175769341299.2998972.8950389208670240149.git-patchwork-notify@kernel.org>
Date: Fri, 12 Sep 2025 16:10:12 +0000
References: <87ikhnn1pl.fsf@BLaptop.bootlin.com>
In-Reply-To: <87ikhnn1pl.fsf@BLaptop.bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Sep 2025 17:13:26 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for fixes for mvebu for v6.17.
> 
> Gregory
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: fixes for v6.17 (#1)
    https://git.kernel.org/soc/soc/c/f1a43af7a9ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


