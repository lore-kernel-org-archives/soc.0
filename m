Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4B23A7199
	for <soc@lists.linux.dev>; Thu,  4 Jun 2026 08:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563004; cv=none; b=VQ1JoNoXI2mh77E7WUWQ+kvwA2PcSKsn/Dqqkh3qEYa3ozV48c+p/ICx1q5pRVDjSNJhU4bSa3hjSjrhO7jal3H5Z3rJ+6dPl42dddBK0TL+fiAsZCIBaiSMH4wUFttL9K7IMdY87OAvHDBsQdIap00Z+m7b/EvJlCrjsS7hM7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563004; c=relaxed/simple;
	bh=VewjU/Tf8vs43MB4tYZUY20Vj94VlGWqchCWkHv/oOk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SfQzWikqut1quTtq3uqW+qnmI9tLlZbv6RZalqOfI4W1Mir0h6vgGT8J8muDOif5CVZKG8HE7q8geIlY7di24+y6UlMcWTEXGcIxEpcNrzwSLdu94Ks40yolxOZt6VXQnlKU3L0oK2TneE5PCn4i6UZP+g87KsRwlMMLezhl/K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DuPP/FUe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DuPP/FUe"
Received: by smtp.kernel.org (Postfix)
	id A69781F00899; Thu,  4 Jun 2026 08:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9101B1F00893;
	Thu,  4 Jun 2026 08:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780563003;
	bh=4olp677XhViyhEalaXKeVQbeWZ2Mh4uoDLt51PFHsMw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=DuPP/FUeUIpPm7ZUaGlfUM16AGFlfGl1TfQ8NLCzPROj5hQ9l1Dxr7NKyOfR+NQQD
	 Z/KZ1VMv+ZwmXZkKS5+915wYDJjUBCsSz/6iHU4TlYgmaFUG3GRabpBZDqMHwoIYTV
	 tYT0gHPM+GbOZOXiDmoPyt1FrHDlFqp4lhmVIoC1feBXfpQ98tyDygINncYy0wXDi2
	 kCYpN99gLnQfq7NLXF7budMqVJVBm6qfUNR7TFpRXZQ8wc0H2fITJOL4iFKtfDd02t
	 cGetr9ZMKP5fa3S1wM8OSYhyzDj7JMJWqxXDl1j9m9oin7kH4APhfpOtM6/71/jOut
	 j6wqWKprWZzJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D099D39308F9;
	Thu,  4 Jun 2026 08:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.2 v2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178056300465.2319217.8240361366401609912.git-patchwork-notify@kernel.org>
Date: Thu, 04 Jun 2026 08:50:04 +0000
References: 
 <CAHTX3dKJBTQ9TF2TeTTjsWBo9bkV=39b5YjTG7j+tqct0Q-E5w@mail.gmail.com>
In-Reply-To: 
 <CAHTX3dKJBTQ9TF2TeTTjsWBo9bkV=39b5YjTG7j+tqct0Q-E5w@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Walleij <linusw@kernel.org>:

On Tue, 2 Jun 2026 15:55:57 +0200 you wrote:
> Hi,
> 
> please pull these 2 patches to your tree. I have removed that 2
> problematic patches from my queue.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: AMD/Xilinx SOC changes for v7.2 v2
    https://git.kernel.org/soc/soc/c/6bd8fb9f1cd9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


