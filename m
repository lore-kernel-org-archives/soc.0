Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B6A20C029
	for <soc@lists.linux.dev>; Wed, 10 Jun 2026 22:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781130017; cv=none; b=bPVs7Ax/H7kqShOoD8lYETJx0UUN4PS1psb923DqCXTA7cnsAfgM9Wf2+5uMNvO7euczfqMb0e3nXG+8TT4bohs/QBYsVQlW4hq8gbO2E7I6TRLIqw1/6Apl3U/hoEXm4qtG0pof0PHTtn3famuFtx2e0VPiDfHhhvv7LlmWfjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781130017; c=relaxed/simple;
	bh=83NqKidSNgyHDxncJOy3dGUXYn3b3rU0poRgUZBo1uw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TC3PNNpk+z2QgvBIgRvqX9zwAWgaSqMeYwX3oOaJ7l4e6XUm3mSgk58eSm5Es5CVTHo3drS1jukWfJUgn6zR0uLmBF08oq4CxrIrdmXSlWgDmDPQ7FeNsOKRZxbbqozG4ETIwWPSrvli0qyXfyLBAl0vr13S1QDVeFtG/RptgrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PEikC06/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PEikC06/"
Received: by smtp.kernel.org (Postfix)
	id 7CB611F00898; Wed, 10 Jun 2026 22:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651E51F00893;
	Wed, 10 Jun 2026 22:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781130016;
	bh=Zi0aDKsJ0VNPgXhqhdIf29FhMfCnGvmYfIExbf4s2zU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PEikC06/XADfCaw+NM4qp5g3NuuSiIh636kLWhu2B4Ke8SyZHsDhZYjzV+aatPYnI
	 dSodFb/TMh9r8pzDNUxVm3qestQPZJyh7tSDF706asxROBZzL/EpLPpL3B8UtEfRMs
	 QfcLrdSwDnkjw5IeDzd81VsAxLqqmh2EieszQsFEC6nWUTsUFZknZmh5RkGWgcFYFs
	 biS0KxzrdwWO7dWLL9SOHMH8HAvbBLbZEL8i8o2gJ+FlFXGkaH1hqdBLxoXcYfo6mQ
	 groNspdJxx3kDUNXagWOuGSORqO298oO3qQdUeFcceAtD8MoO5IJk5yFqjfIXhvCuQ
	 o/EfAaBgORi8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568E53930DFC;
	Wed, 10 Jun 2026 22:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: remove the last few uses of do_bad_IRQ()
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178113001388.3654873.2655905443280608711.git-patchwork-notify@kernel.org>
Date: Wed, 10 Jun 2026 22:20:13 +0000
References: <20260610045626.248643-1-enelsonmoore@gmail.com>
In-Reply-To: <20260610045626.248643-1-enelsonmoore@gmail.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  9 Jun 2026 21:56:26 -0700 you wrote:
> The do_bad_IRQ() macro simply calls handle_bad_irq() with a lock around
> it. It also carries a comment stating that uses of it should be
> replaced. According to commit aec0095653cd ("irqchip: gic: Call
> handle_bad_irq() directly"), which replaced another use of
> do_bad_IRQ(), locking the IRQ descriptor is not necessary for error
> reporting. Therefore, replace all uses of do_bad_IRQ() with calls to
> handle_bad_irq() and remove do_bad_IRQ().
> 
> [...]

Here is the summary with links:
  - ARM: remove the last few uses of do_bad_IRQ()
    https://git.kernel.org/soc/soc/c/d7a163856803

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


