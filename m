Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A64E215F4A
	for <soc@lists.linux.dev>; Thu,  6 Mar 2025 16:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278704; cv=none; b=sQO+QzvZ5hxE+GAPCubgsYZqW8ZJ1mOxkutT2LHqvDwvNKk7j6+RxC7OQGy7CQEs1i0fRmC71MvFTBBmMzYN5+GXDl1wuQgI87Mb0VUaDt1Z+zNsy9wb6yfi+Pr5QGvi876ChWGxAuq4sX97BC268EElWMhgGURvo71y3W50zW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278704; c=relaxed/simple;
	bh=XjE1bmI8vYguqLlC6rrNAHf5v1tg1bOXLx4PbsCcUsw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=baWMyO5EjlnT0ZBP/mSN9D0hEnjt4cV09m59Zsjq42aNPoTeyxFa0pEK1WZz3vMCCTnwMne6I8UmDv4NzY0AP1b0IkWA+HYWM1ropBARdGXjWtVLb4ZLp3vB3YplTVQkcexBnvCVc2z+I/lW6Lg1vogvB6ClM6Ox0nuToOXqkzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/MaFV9J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/MaFV9J"
Received: by smtp.kernel.org (Postfix)
	id 89618C4CEEB; Thu,  6 Mar 2025 16:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7369CC4CEE8;
	Thu,  6 Mar 2025 16:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741278702;
	bh=XjE1bmI8vYguqLlC6rrNAHf5v1tg1bOXLx4PbsCcUsw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=G/MaFV9J/vKQltydjH544LB1dSLIsCmhoacMXWD7vuR3tqvo1n/DZHkeUppYJnEqE
	 5Npl+iQjySfwPEfZ5sPHw+uNs/LZSaUaWUDMf+AYcIrOX1aD8Q1+OwwLqs/gr0HeNt
	 HaRJxZCZyCk9ALNEIBteQ7NqNs9B3tbuJ7+dcPUd4L2MFqlaQRi/IdIwA96dogchAR
	 VWviy2P8Fr3D/ejLYLraFex3/5Cp2wVoNmAm8xWqwHREbn0cB+eALq3C8wzyEKh0jK
	 q5fx8X26/jYPeBe1tuONthWaDHhDgP/HCi34GAqGA9QBacUIl5aPfd/gzVnn/DQhOB
	 50hroXRNh+oFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1B3380CEE6;
	Thu,  6 Mar 2025 16:32:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH] arm64: dts: nvidia: Remove unused and undocumented
 "regulator-ramp-delay-scale" property
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174127873577.1655995.6134200744514125944.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 16:32:15 +0000
References: <20250305224952.2995841-2-robh@kernel.org>
In-Reply-To: <20250305224952.2995841-2-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  5 Mar 2025 16:49:52 -0600 you wrote:
> Remove "regulator-ramp-delay-scale" property which is both unused in the
> kernel and undocumented. Most likely they are leftovers from downstream.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Arnd, please take this directly as the NVIDIA maintainers seem to be
> AWOL.
> 
> [...]

Here is the summary with links:
  - [RESEND] arm64: dts: nvidia: Remove unused and undocumented "regulator-ramp-delay-scale" property
    https://git.kernel.org/soc/soc/c/828678a1f638

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


