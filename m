Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E623F4D09FB
	for <soc@lists.linux.dev>; Fri, 16 Oct 2026 15:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163430; cv=none; b=BMdstHyaYnjhJMMbWYjgG+cnE5meZlQJSU21lipLkgplb9FvrXV6tVSR48TY2TXUKWgcNycuElTzcAbJcpx48/F/4IIl48UamEqMnHeUn3KCIXLD+eP2Joe3KJMFA7MMMTseiGSLm8s6z8vQGz2NtgoSBJNK1RN2scJcfw5j4r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163430; c=relaxed/simple;
	bh=rzHkAjxqS+xfUhriYSO7jVFpFl0Q9IBIvrCq6581LaU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=crM0yp55J0GvymaEHH88cHLyKPJI1TYXGKUcVbAfBpgG9OTujQuwK2o6GFae3d1Vb5rp1O0nEbHqoDUTv+Exg1toKpFBYdRj04lOGrehDNuYRGzMQi8k9LUl3IR0DuQl6X0KEiFmCsW5TVWZglzbgncw/uJWsECFlb8H63QOIx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXinDieV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXinDieV"
Received: by smtp.kernel.org (Postfix)
	id 98D661F000C6; Fri, 16 Oct 2026 15:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821B11F000C4;
	Fri, 16 Oct 2026 15:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792163429;
	bh=zKq3PUigKuQ2d/8Zt3DBbvPan6xvg/56XWDjuS/FYLI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BXinDieVAdLP9JpDN1h4nybj+YxISa6EMx9ANZOEuIKK5ScxrS/+0DCfAR0SHMwgn
	 rDToyG6Hl+Cc8BGcohZIR861CzoK1s+pJZFc10tmJmRq+DCyK/k4BVW0a2YQPXl4IZ
	 AR9atRCBsz2zwhWtZGz073uNAYuxFBBLOooZK+1j/jxLAvP1rGW2XYPrWubladdHqS
	 komLQrUvaD5mshXXGK2yKHI+VGOoY8VmqHnaZfDcZrioDaCCAyomJYAeYnXuIjc5rj
	 sOw8wYXf7F6wkXP6vV8i+8aV2ETuHTma1LIpI3zRMennGABAbA9iC9ER4ZTpL4GNKP
	 g37SH4Meu4OSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77576380A966;
	Fri, 16 Oct 2026 15:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm Arm64 DeviceTree updates for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179216342827.806834.2575920378863349621.git-patchwork-notify@kernel.org>
Date: Fri, 16 Oct 2026 15:10:28 +0000
References: <20261012193412.14636-1-andersson@kernel.org>
In-Reply-To: <20261012193412.14636-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Mon, 12 Oct 2026 14:34:10 -0500 you wrote:
> The following changes since commit 32afff1e816e10185bb571aa9d89dc2eb061d548:
> 
>   arm64: dts: qcom: Add device tree for Nord RRD board (2026-09-17 22:15:17 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.4-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm Arm64 DeviceTree updates for v7.4
    https://git.kernel.org/soc/soc/c/5728b672ffa6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


