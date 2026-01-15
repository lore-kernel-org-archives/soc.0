Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD023BFE24
	for <soc@lists.linux.dev>; Thu, 15 Jan 2026 17:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496765; cv=none; b=Us3Z8wpEiVt4kPyTa2wOZUUkgC6OQ2NiXEh1fKf+1tQF51spx5bsvKrLGAtadgKG5p2QyLTZBvTkUQUIRgYK5hnemnmTTARdQAUtCOrcsAskzcsXaonU+jaTzUUbkVlH8b2oYKh8H8czTPh3kKpv69e2bSr0B8Efi202AtXyNwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496765; c=relaxed/simple;
	bh=giqIdYfEigviLZ2FQcCfYFu8m8k4QuegszrTvAto51M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dRkV8/Ia9ICpntgDm5mKRmJoQyaii6rJnYxs47uHS3/hLC7pXIAxuvjKqL7F3BTrDSLHfANKDCL2Jp5xATpQkLVAk+TK/E38ctB/iRrhnmx5YZIYt3rlY3OYPB5o2MMHFA6QfNS2OqV/7CAxOqY66xVrzDDr5G8wQPZOU5uwU1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4czZukj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4czZukj"
Received: by smtp.kernel.org (Postfix)
	id E9EBAC19423; Thu, 15 Jan 2026 17:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42BBC116D0;
	Thu, 15 Jan 2026 17:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768496764;
	bh=giqIdYfEigviLZ2FQcCfYFu8m8k4QuegszrTvAto51M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q4czZukj4HDYZCSVZnKPAt6JMNqDMEMOSDvJImeQBps+k5dTpWSPL+w/iCt8gPqJ0
	 8UwBp1ntSJh3FuBR629Ezhj/9omqsbQzQzkeXMyZfE1jMJvc23jrmdGbyhn4m5Paqe
	 TU2VnYrPSkOtZG7WUROgAak37K5IAuFA2YWFP0i5F6URKg5tvLqgXYf+vp1DMYqZ3U
	 QZtU4c5xhml+LNkYzhLd6NVq2bTyXbSFRcqxT1oCrsLomlXpb/uOjgOlDXRHUuPoqV
	 9hmM/KB8Sjh+DETAEJU/nkJsVdRIlmdRQd6ym1MYGiEXW/vrMsLxr/ireMTzNN20FU
	 c6ltgVFx2sDIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BD17380A966;
	Thu, 15 Jan 2026 17:02:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: update email address for Yixun Lan
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176849655702.4073327.9660735754248107368.git-patchwork-notify@kernel.org>
Date: Thu, 15 Jan 2026 17:02:37 +0000
References: <20260115-11-maintainer-dlan-v1-1-64bb698da846@kernel.org>
In-Reply-To: <20260115-11-maintainer-dlan-v1-1-64bb698da846@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Jan 2026 10:03:35 +0800 you wrote:
> Switch my email address to kernel.org account for more convenience.
> Also add entries to the mailmap.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> I will send it along with PR to SoC maintainer via SpacemiT's SoC tree
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: update email address for Yixun Lan
    https://git.kernel.org/soc/soc/c/8bb9fd440aec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


