Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05821E105B
	for <soc@lists.linux.dev>; Fri, 13 Dec 2024 15:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734103411; cv=none; b=EekAb5qMOWw0HgW/wlgL1sWV7u2ctosa/fmmzYN/7gPVtMUwYLT8LFqRbD8fJMLFO9zJ1XyVAICz6MR++f4Jphb/pUNsHIzhCGlWQHkYc0zL54syb8pk42RrLoLaJ40ZhoNnCu3WoXAgWfZd+3/eMGwHinjJeLClaazh2Wp5PzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734103411; c=relaxed/simple;
	bh=OIqhixRy75P9yijVGF8L10BCxda6hfKKju7D+wcMAHs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=c2fFbEv2IPdGgQx33HKWSmGImb1g0ObRuc0M8/uL0nt2vZDuOIvO6YdP50CQsSdpr2vhbSW4dmKCsVhzyUoCcNmo08O9+3OwDrM9Hf++WQFtv86O8kF6WVovlHkw3ipAceppqAP+6rGGYUayVVsCaea6BkdKHzLrl34w1wSxMQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAPjfdK3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAPjfdK3"
Received: by smtp.kernel.org (Postfix)
	id E4153C4CED6; Fri, 13 Dec 2024 15:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDACFC4CED0;
	Fri, 13 Dec 2024 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734103410;
	bh=OIqhixRy75P9yijVGF8L10BCxda6hfKKju7D+wcMAHs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CAPjfdK3pEzmnPjSZGenr7+f7VUYIAuSeUCaTZec17UKw54ZckpT5T20uir0gHNcl
	 hcOWVfe/kzul1XbsEJpkch8RODuAapZ3ePwLoGO6ueDLD0xQ278tQih+Odl5gmrMGb
	 X0UuQOqy4jj1LzXWPHUjUut5FWLVwLQyUz8E3zWPD23rj3XGcbFPlnX0GuFlynAK4c
	 ioFe3zv0iF5zk4Igzk8tIlj/tTGt6sxMomiHLVihSWdtHxEeCi576PiAHM69HDe7m2
	 kOYWZjyqF7BDOfFI11xdk5KZm4Sh2hHU8/+mJPVqCwtHE+4l0uwfVMWiHMELViy5wc
	 K+DP28COIekKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F28380A959;
	Fri, 13 Dec 2024 15:23:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND] arm64: dts: apm: Remove unused and undocumented
 "bus_num" property
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173410342724.3014960.17002516409928435059.git-patchwork-notify@kernel.org>
Date: Fri, 13 Dec 2024 15:23:47 +0000
References: <20241115195049.3637454-2-robh@kernel.org>
In-Reply-To: <20241115195049.3637454-2-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 15 Nov 2024 13:50:49 -0600 you wrote:
> Remove "bus_num" property which is both unused in the kernel and
> undocumented. Most likely they are leftovers from downstream.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> SoC Maintainers, please take directly.
> 
> [...]

Here is the summary with links:
  - [RESEND] arm64: dts: apm: Remove unused and undocumented "bus_num" property
    https://git.kernel.org/soc/soc/c/9f5cbdaae5f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


