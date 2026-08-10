Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5FC42C4F5
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 16:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380687; cv=none; b=ryz6WUg8cvAb/favyqSQFgM+6JPTJ1f6YZFOeMGVuGnQh+ZBVCUPne6KBPzZsz3VXu1sAuXvO/cZhlsNYYgkVywLXyP5XAEHrZNgAirdDlnbnxOjS3om8KurxOU2VUDu942OZyufEGoF8cWPSklrTd5VgebzZ0KqYt6fiwFZvQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380687; c=relaxed/simple;
	bh=bfn5wretq+/mhAF+cI3u39FYGtgPFMilRG0Bj8h6dEk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NRefAc69w6fB0oDwnmxuxhxCzD/s+uUndSQsK2oAdGz1kxTafesha1nXXm1NNYrws8XWcC7wfflTpM1LqrNDggdR3SahJsz+daOXKcAIltLLhtQVk8jCo+b8cFbRWbympLSlGIjvBy5ED8mZnNj2awGfIr8CamoCLlBpbQ3jkzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0lp9KT1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0lp9KT1"
Received: by smtp.kernel.org (Postfix)
	id F01971F00A3A; Mon, 10 Aug 2026 16:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8121F000E9;
	Mon, 10 Aug 2026 16:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380685;
	bh=oy/4LCzaC3fXWnmMww5iBvX/SbPM3L+NbYoR23XLUUs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=F0lp9KT1Ymxo7HQ8O9GieTO3veKLB+VY25lHhd5/MzMTPO7lJQd5BBruMw51mdKba
	 nZqF+iyiDdZMEnrO4WkZg7vCoAizh/ah3MRHSxnppIhK39HOausieasn5w9sS5+H/8
	 mDIIzMt3tB/ADtt2a3dtbPJMTVVNDHsNUTj4XaQ6ffAvZLoQyoirpz+KDMmeAXDL+M
	 anF7o/87wjwlVCL1qMr6MfuvXxNlxA0MAFI+KYVs3FszEAgcSdf6kTpt7n1z1QKOjj
	 VEeVcXLmr+VYyFDx64REUDysC466hoehPh83UccRs6QzqEycmP8rgH1wBndmsHjkXd
	 vC1CsLQ1LcB5A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09FF39253F2;
	Mon, 10 Aug 2026 16:50:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: ti: k3: DT updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178638064239.3872609.7684011694634065763.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 16:50:42 +0000
References: <42ae17e3-f40d-4825-a45c-5f046ef3159f@ti.com>
In-Reply-To: <42ae17e3-f40d-4825-a45c-5f046ef3159f@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 6 Aug 2026 21:31:34 +0530 you wrote:
> Hi ARM SoC Maintainers,
> 
> Below is the pull request for v7.3. There is one non-critical fix around
> MDIO clock which missed my eyes as it was tagged to different  tree in
> the $subject. Interface just runs slower w/o the fix, so no harm done.
> 
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: ti: k3: DT updates for v7.3
    https://git.kernel.org/soc/soc/c/0d7bd2704579
  - [GIT,PULL,2/2] arm64: defconfig: TI K3 defconfig updates for v7.3
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


