Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1C8200B8D
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424982; cv=none; b=M9UCLDUUhT7PRElWbzBdG7tTX4jSMRk/SqPQI+rSlKbDLnx+IDA1V2BDZKgOES/DSKBi2AEznbfe34QXuXCp61s/VB/k1xrA1pfHtiCmbSycM1lMtz2/e3TVWIxEtopya6lWlvmIDBpcyVOaCgrR4okIVU9og9OYeHEgAmVLtgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424982; c=relaxed/simple;
	bh=ZaNMwhscOwcD5luydjDisseVOhbuBKjhpEGFw+2DMvs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hT1GhhM9EeJxYUEwmULAT13DSNXooTtKaOAGrM1F/cY6t6R7tVVRj8Tr9SUGXcXY6eGQybTUd27nSm9CEsLUYNjJ6o4iQT5yhVg9l/8Ji7yDNaDj4shdnw0RzH1PqOe5NuUW0fVRBxQdz89jcoleBSFpZtzRlXabh8n5NHTeCCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BnK64Pbs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BnK64Pbs"
Received: by smtp.kernel.org (Postfix)
	id 1ED7EC4CECD; Tue, 12 Nov 2024 15:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09523C4CED5;
	Tue, 12 Nov 2024 15:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424982;
	bh=ZaNMwhscOwcD5luydjDisseVOhbuBKjhpEGFw+2DMvs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BnK64PbsCPmhdD/gtX5nFvRv/T7ZovNp0fmA7yeyol63SLlBIrj19oyF9T1kZKLU/
	 kckpxFY9TnUGnS7NkCu93OCmyazByGBiEX4uGf+JSCDzlRWLuFS5eQ7vWNR2U9e1Hv
	 qBBjonE0iMxefQLiSOnQDMXXrmW/4yWl6BUuZRz5l1Ro8T4pYKxWKo1F8DIJOGk4AN
	 oqOn78ScqugE215L5m/xbm/V+ZW1ibqVrlZYXdQ/OTXY/SdK2/eTPjs2L5Gn9kzKQD
	 C7KF9CIpL0N1/R5mAVrRdHWsSwHJsXriH3kQudiS9MqcnBFOU7Mp424nCYqR3KtqrO
	 ee9G4/qQ9Eb0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 711EA3809A80;
	Tue, 12 Nov 2024 15:23:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173142499224.562452.13819514237654133520.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 15:23:12 +0000
References: <20241102231953.871067-1-andersson@kernel.org>
In-Reply-To: <20241102231953.871067-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat,  2 Nov 2024 18:19:48 -0500 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.13
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v6.13
    https://git.kernel.org/soc/soc/c/73536ab21a3f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


