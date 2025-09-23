Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573FE30C370
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662468; cv=none; b=ZylT9GpOTwYbWxcM+r6o6VpzR956dWP0JH0SB3afLzVjrQjw4Gz7udAqOJ1a7lhLF/0uBO+s8MYfQ8dP38lenv/nQAvoVG10YLvuzLX+67w+Z4rglEGsprHD0HVYWIVaSjQ9CvWkFlh214PCNbWkZTNg2VO07cwTde9C2Ar6ALw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662468; c=relaxed/simple;
	bh=ZYNxSyniNDMdKeeulel38gAvx9Ru4mGDUjEH+kXpJCE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LZ/YeG3YaAb3wTD8EuzC5VBHpowmP2z+IGpqrCJ+d0lN7EA78qkMHi6VmMhYU9nuUpXeCUIBkc31KpO/Bs/k3l8qD/U4UVaIpmq4/hbtEsYM7MaSzV3rxUPVhYx9esbYvMwj1KkeDg7zJacKXKM+moPwCftrIhznwWkGOEkTzkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpUZ2Cde; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpUZ2Cde"
Received: by smtp.kernel.org (Postfix)
	id 4E7BEC4CEF5; Tue, 23 Sep 2025 21:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39311C4CEF7;
	Tue, 23 Sep 2025 21:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662468;
	bh=ZYNxSyniNDMdKeeulel38gAvx9Ru4mGDUjEH+kXpJCE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lpUZ2CdeD21hkp4DN3n6sNoiPzQZ0qKMIXUAfC5iDbIogLV1ssS7NwGfnVvhDrxZP
	 aD72sklUe9dW0JGetVvFl+yOoAkwwgovahHpuonGLJ/zBFq8/Tj5U1eyGe5LMr2bPD
	 aSVaWXfi7MYojS1ChDkaDT8No2clSlnthNCUZHbL45NhZ8qs0NqqVhlAtKx0XalZXw
	 P+mkmjwP4MH+svV6/il9lwp8NEFABBi4rkLieu2CCzOVTwexya25/SBG1hMMZHvRIm
	 EJv6nHTPNv0vhRoMhw0XPQsj1svjH+SanWvNysxKrWcONe8exwJ3cmFrLxTD0hwxIw
	 VInW8rJjc8Pxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710EB39D0C20;
	Tue, 23 Sep 2025 21:21:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: apm-shadowcat: Drop "apm,xgene2-pcie"
 compatible
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866246498.1926563.10348888810936788369.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:21:04 +0000
References: <20250919161529.1293151-1-robh@kernel.org>
In-Reply-To: <20250919161529.1293151-1-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 19 Sep 2025 11:15:28 -0500 you wrote:
> The "apm,xgene2-pcie" compatible is unused, undocumented, and in the
> wrong position in the compatible list. Given this is a mature and little
> used platform, just remove the compatible rather than fix the order and
> document it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - arm64: dts: apm-shadowcat: Drop "apm,xgene2-pcie" compatible
    https://git.kernel.org/soc/soc/c/345518c00ba6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


