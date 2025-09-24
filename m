Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8907A189
	for <soc@lists.linux.dev>; Wed, 24 Sep 2025 22:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758751812; cv=none; b=Gq1gUSy86eHra4bqIm5MjAVsDjqkmKx2bEesT6G7fSU3lIxTuvDD6RvQrYZv170xG5T+c0BKgvZYk3rm6QlNkjVeIrY/q72YDzwadIWP/4KExvWCq5qb3XnPWVr2LwlHI5nHVZe9tQbNu+dyz2PsE5H3sGcTrPZFzx008vn35aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758751812; c=relaxed/simple;
	bh=06OshQv8JclO9gOKUBCNmGsaKwu3mh41GzOLOMSOANE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GNdPklEsYNOJVMWkWbmF6j0rHlgMenGFWj23CkQOUXdGqTIy2ewJRcQz6y0tV1nXotNqYGM98FaEHHj5icEHn6tBp//XODSLHMuSGL/G89ot/wQ1TpEhQAf4nKhcNthguD6wWlHe7TaaGUfBushv1/tVXOOkNp9jehSgcmfrjpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMw4vJRb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMw4vJRb"
Received: by smtp.kernel.org (Postfix)
	id 3B25CC4CEE7; Wed, 24 Sep 2025 22:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204ABC4CEF8;
	Wed, 24 Sep 2025 22:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758751812;
	bh=06OshQv8JclO9gOKUBCNmGsaKwu3mh41GzOLOMSOANE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FMw4vJRbk4uFTyfx/S0CSC20H6HBDUMl/78wXtJ5DRoo5hFag3PfJgNtSrdr9SVxx
	 maeU2KbNFBkOGPLWDvNgNR47SXj6L0WIgWmtemEa6eSi/gXpROXORgsm2VxMeWKOzd
	 GZAdxmhwA8/1sybTb+xceO9lqYhmNSgRwcAkEDhKo6BNnGoqdbED5FIcWO83vLlcZN
	 AvFtRH/8DyjOpKuHqtqeM+sQJWLqFnVxwN1XfhaY856AYww1pWtINge1hdC5kbrzCK
	 ul4WrgZIxydczqe4UATyMUPitfD78DJ3GGIkV2oKIS/JyPaFCNbfj84VeSIncML3Bz
	 JMtDv6fjEZLOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF1B39D0C20;
	Wed, 24 Sep 2025 22:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V cache drivers for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175875180850.2716298.18367005206895144794.git-patchwork-notify@kernel.org>
Date: Wed, 24 Sep 2025 22:10:08 +0000
References: <20250924-relenting-aqua-a4a93b89809e@spud>
In-Reply-To: <20250924-relenting-aqua-a4a93b89809e@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 24 Sep 2025 18:50:14 +0100 you wrote:
> Hey Arnd,
> 
> Wee PR here with just two changes, for the standalone cache drivers that I
> look after.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V cache drivers for v6.18
    https://git.kernel.org/soc/soc/c/c4ebd661282d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


