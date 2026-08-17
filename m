Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7252D8DDF
	for <soc@lists.linux.dev>; Mon, 17 Aug 2026 14:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975256; cv=none; b=bJlFJPZK67+wcM96LYO/EygWrENJaRbVcF72AcnEawP0hmOTcmvZpDIlh/OTI/1V6vE0zpv1eyxeVq7y94OZotPjiU6H6liMJRdPBErVYAmEP1nAgCS8gXW2+CuAVLn76TNBH8mcjLdqrAOqRN/mCIimM8VIdEIRKjVFlZuBIbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975256; c=relaxed/simple;
	bh=F/NemrENDL3FBCyttNPJR1ICFFzkGMlbzfbh2TR+iI8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fszQmqntEhaWP9pgmpBUQ9bduw/k0RgkvnaXbAS0urgTGKskiZcB7aWd9fvroGt2Nfr9R/N97NL6zhzAtDIoH0RzsOMjBES12DUwe/p0Udp0sv4gHo59Qp5yUcc1gF5k+oO6gTLDk5P2CDF7MnIxKbRd7+XRYyQEHGgqeD5Uy74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dul2HkBS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dul2HkBS"
Received: by smtp.kernel.org (Postfix)
	id DB5BB1F00A3A; Mon, 17 Aug 2026 14:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D7D1F000E9;
	Mon, 17 Aug 2026 14:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786975254;
	bh=Gp95Q59OSKJhybccznn9FiaSPg6O36hh41HMRcdhjI4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Dul2HkBSG2sICz5pGMcN473n41kjStLbp6GGbZ/FsT96dxt9K8AGwosSl12q/0ZIY
	 74VJzsmYsX0e2fmLsvyAQRL3zcnYk8I6yLM8OOmkD/QNtdcLAx5E10yQEV5Jqq+ULu
	 yDth5iw5E8RTfbj6jPMqP2WF1ppxCmPuj9B7JB7G6zMhlUgiWUkwHKZNhdmHOfnud+
	 474dLCmDtGGTrsDwxLeAMFPTNdGP6D2ibPvnjQfDukKCkVfBECJedInzwaRhh87DtH
	 GHs87sqJrhTGcljTJRiewCKoSMNVnoZ3tvPzGmtm9ZBBPoqQiONPQaEf0/pDbRMxbE
	 ERetE9oSSkZtQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5682739253F1;
	Mon, 17 Aug 2026 14:00:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt for v7.3 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178697520713.1152135.16724473477582286264.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2026 14:00:07 +0000
References: <87ik5bokdk.fsf@BLaptop.bootlin.com>
In-Reply-To: <87ik5bokdk.fsf@BLaptop.bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Sat, 15 Aug 2026 10:31:19 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v7.3.
> 
> Sorry for the delay. I only managed to push my branches for linux-next
> last Sunday, so I waited a few days for them to be merged before
> creating this PR.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt for v7.3 (#1)
    https://git.kernel.org/soc/soc/c/63dbd330b595

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


