Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D56B19F110
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644346; cv=none; b=cCUYFrpVYkWLUn8ZU8I5IsJNlUIc5/JHjxDG5ic+a49E/wxZQMC9nHj6LrtOAKLHWXYNLNdZaIRky2+oSxnpssO4IIJBcPBDHwDIf6op+zqw0N0VkMBmUuddTrv9xUhFIZLZZjchu0Mkc3wr7OwM/OLMHd8sV3Vls/DAViIoTgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644346; c=relaxed/simple;
	bh=DTByobLbOSE0KkIFIZU3w88NuG/k7PYOkJAxOVDa6k0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VBxBCJjnj84jBOt1pPrBaoTdQQYAxPtbx5fU/ALk2B0cj7pIhAX98+IV19mgMSARAUsBifAc8Us2TmHQx5PVm/rYl5xoexIuwB7uAGIPQBP8R9G0YnxlO6nuW9wn5jjljcJzq4aMPTmjBHHIWmFji2yN9d6lp3szW9/TI3SA6wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pWLsInVc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pWLsInVc"
Received: by smtp.kernel.org (Postfix)
	id BCE6EC4CECD; Fri, 11 Oct 2024 10:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A409FC4CEC3;
	Fri, 11 Oct 2024 10:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644345;
	bh=DTByobLbOSE0KkIFIZU3w88NuG/k7PYOkJAxOVDa6k0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pWLsInVcLEmTW0JPRGD72NNds/2qp54DTRf0q+HTfngdrCI7ZT0Gm8J8KBtQX4iXe
	 Z6ceEiIcNfGZvkEeEim93zuNMftQLgnPMO9CuDoCqPhYWbL2h4zlQICaB3so4ROni2
	 NfOv2RXfGyo8Y7G+N86JgyKxyjCiJwYcfb6ljImvmHsfEZieZjE06iLtapYVetY7bl
	 MzJt+uvL/Yv3k88WhNT7tH7PEP8fNe3ZdiLGs3ai0+kf+6dWQKeloCUoA5vVhesbQi
	 5AR88yx1EOnhbQugyNhoQQ5v3T3rLSHswJFGvsOfAvk2IeVqOjn9evbLmzD0maOfIE
	 z1ifJcH7x/65g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DBA3822E4C;
	Fri, 11 Oct 2024 10:59:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dmaengine: cirrus: check that output may be truncated
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864434998.2676212.13647220430482787547.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:09 +0000
References: <2bf9c37aad8f085839f9c63104f7275742f51945.camel@gmail.com>
In-Reply-To: <2bf9c37aad8f085839f9c63104f7275742f51945.camel@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 21 Sep 2024 01:21:55 +0200 you wrote:
> ep93xx_dma.c: In function 'ep93xx_dma_of_probe':
> ep93xx_dma.c:1409:74: warning: '%u' directive output may be truncated
> 			       writing between 1 and 8 bytes into a region
> 			       of size 2 [-Wformat-truncation=]
> 		snprintf(dma_clk_name, sizeof(dma_clk_name), "m2p%u", i);
> 		                                                 ^~
> 
> [...]

Here is the summary with links:
  - dmaengine: cirrus: check that output may be truncated
    https://git.kernel.org/soc/soc/c/26d77ce57479

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


