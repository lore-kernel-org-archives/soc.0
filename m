Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053391898F8
	for <soc@lists.linux.dev>; Fri, 30 May 2025 07:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748589595; cv=none; b=abFyw7dFRKWhyXn6GrsjHO01XAcYBtiBY6KdU/RhXj1sy3gPwxfONe1hohcI4u4hAsaASTFxA3OUcT+20gHCsooVSNmOtKhrtL8XfMOyhzszSRh5EJydYT1Uhs9YOh2+r3VsnNR1ziEWzBoPuvQVLm3dvIvegDp54HYI/WHw/mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748589595; c=relaxed/simple;
	bh=kEexur0PalYeGZr7FNXgRpjmw6Nbj2MRy2s+UYRNxPs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jTGKe05Zltuv2ApiIKLk947pJqrsItqCtOQzzXbSIRkmC4kmV1bq9li1YiAnSt4oTz3ZYajqe21iy6tWfVR9unNH6botBYZClv8rQaAsuAKJYhi/X5RPe7fgnrMWHBWN6K0MFI3EqQsLnAGle4vHMdsOoNO98TK7hBK0BD4WdrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tYwO+E6h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYwO+E6h"
Received: by smtp.kernel.org (Postfix)
	id 89475C4CEEF; Fri, 30 May 2025 07:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738D2C4CEE9;
	Fri, 30 May 2025 07:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748589594;
	bh=kEexur0PalYeGZr7FNXgRpjmw6Nbj2MRy2s+UYRNxPs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tYwO+E6hIHJfn7yem3zEG90/J+wXUs31xt05Ixh6fUmTLWyuHEli32W96wG6vub98
	 rUtFhsO2CsqENNSqmBrYDavuB8vNwkgreuZN/m7WNHEFewX6FjngqgLzWeXFKo4l3e
	 26BbUdE0xy5DTOoE7pi88F09AlvvhlThevYyt5UB6dj2TqWtsKZGimGbPe4gcQJ06p
	 6zHwpwpohLyV9ug48v1DeeIJR7WOQTAGf9qP5bg9jde2ICBCWOd9LGATdwVryIJhIh
	 cv7Ufhk/0KESxra8MvHFHQxEZHvqZ3XTBVgDKynBM0t6GV30G0s+ltL/tvzm3NABde
	 itAg+0Gd/tHNg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C4D39F1DEF;
	Fri, 30 May 2025 07:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS, mailmap: update Sven Peter's email address
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174858962800.3857068.1910705434448323247.git-patchwork-notify@kernel.org>
Date: Fri, 30 May 2025 07:20:28 +0000
References: <20250528221718.45204-1-sven@kernel.org>
In-Reply-To: <20250528221718.45204-1-sven@kernel.org>
To: None <sven@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 29 May 2025 00:17:18 +0200 you wrote:
> From: Sven Peter <sven@kernel.org>
> 
> Update my mail address to my new @kernel.org one and also add a mailmap
> entry to make sure everything gets sent there for easier filtering.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> 
> [...]

Here is the summary with links:
  - MAINTAINERS, mailmap: update Sven Peter's email address
    https://git.kernel.org/soc/soc/c/4c2cebc2e87d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


