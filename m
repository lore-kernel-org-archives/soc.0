Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A59266EEC
	for <soc@lists.linux.dev>; Fri, 14 Feb 2025 15:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739545804; cv=none; b=Jy/EHTi3dA+3QMSF9NuRnt/iOCPB0tmaSknlzUPMZPqCXimi25ABY2HAZQg0VXZ2kVmR9wAaB/N3kqLRkng2Avg2WmJ3dMHO83GOSfLGnvL8A8rjFlVk6+VsVvUqFubWHKnDAxfe7cXpzjiVPBF2ZUDE3B3RNyKIjNEONhn38JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739545804; c=relaxed/simple;
	bh=y01sA4tQi4FMyW+MtVSdu0dpMWgl73hmZf8u03UfCXE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Mg/KNZ8zeoKJixwxEUrIaKISQiYj36kzTudJN0YEUk+EcltOY/kQrDZVzCKbcTXY6HZCwWw/cf8VDxbLQE5PbDXszOGl488VZ3meZcfDv511f6laqsEgk38cPIF+pXfbJlhgYt0DoWZ4uyRYak4BaaNMzritWHLYc2uGAip++oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2ZhSgg4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2ZhSgg4"
Received: by smtp.kernel.org (Postfix)
	id 5FE86C4CEDF; Fri, 14 Feb 2025 15:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A727C4CED1;
	Fri, 14 Feb 2025 15:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739545804;
	bh=y01sA4tQi4FMyW+MtVSdu0dpMWgl73hmZf8u03UfCXE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=o2ZhSgg49D8svsVI4GT2JJfM3SByZJQcdy2iTTgY2v9F2LO9W9cWV3ndAYCmJ7KO1
	 cSBKL7vdC39/ob8+KlX7T1DU7UVvySv5Bsf4X02wsJUcoC/qBHAKvcO4Fr7nme3fWQ
	 ggdQ2X7unpq2ZNx3Mqx28r050THSRsx2dFDhFYmW6w2iwDhrLcKTfBTAPO7QuFvECv
	 m116K0OqoX1206oE7+wnm7eSgVgUOWw1M8Kgj160cK329vQfL53A0O8qIOzGn06TGn
	 9vSCJb09sdU44CA0ZsItTKYFPiEogcwwUQ1R2THjOghAikftHLaTYlKUIvDZlBugJY
	 JFT0fNNdXnKcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB608380CEE8;
	Fri, 14 Feb 2025 15:10:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Remove myself
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173954583349.1980112.2144707435921408289.git-patchwork-notify@kernel.org>
Date: Fri, 14 Feb 2025 15:10:33 +0000
References: <20250207-rm-maint-v1-1-10f069a24f3d@marcan.st>
In-Reply-To: <20250207-rm-maint-v1-1-10f069a24f3d@marcan.st>
To: Hector Martin <marcan@marcan.st>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 07 Feb 2025 03:21:46 +0900 you wrote:
> I no longer have any faith left in the kernel development process or
> community management approach.
> 
> Apple/ARM platform development will continue downstream. If I feel like
> sending some patches upstream in the future myself for whatever subtree
> I may, or I may not. Anyone who feels like fighting the upstreaming
> fight themselves is welcome to do so.
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Remove myself
    https://git.kernel.org/soc/soc/c/1b3291f00013

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


