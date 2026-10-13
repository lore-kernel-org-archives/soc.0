Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A495E519914
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907852; cv=none; b=XMVOOR1Xz7sgYg2YQ5Cu7CJ9m8yvwbiYUOmofoEjzg0+XZMsYjTeM9sSdDoKCXRwJiWtIm796ZbJ71vURPd3dXMM8LbMYcf5WbYEgMydnl6xyFo5nU0vpbXdyuYXz54pmBj++idE+1HP11CX4RV08RHZI5s2rcyDHU/gzXNeMzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907852; c=relaxed/simple;
	bh=6LsMYB0EJ5Dtar5zpI3bcl9VJIZiZqPCVAOj791WLhs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZkxdEKviKzZgXppF6vkGt6+umePqwbbClFE+a9iwQbZ4VY8D70zRroI+2jVqoLn6Y8cZqvpHa4QINz+rccrDXmih1AOrkxunrtlUB5rI8de6VmeJlUzqTgvJnBVsZhyupZlSQozHIzpEZLQrg5PrkQ0KWx4mmedcVGFdoq0OTkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5OEqVAR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5OEqVAR"
Received: by smtp.kernel.org (Postfix)
	id 5AA9B1F00893; Tue, 13 Oct 2026 16:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4465E1F000FF;
	Tue, 13 Oct 2026 16:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907851;
	bh=Qu/bfFe2hsglLDIyOSrM4BIMACo5NZ/UnwQjRQzNCPQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=d5OEqVARNEwguZuDAdALf0i+HJtHwEI8B2D1mC/K9BbtbalCDv5i4Un/Mz4OCxKkz
	 FeaJdJ0bhkH9Q37EugISqG8JmhpwArXAZ/ZasSqtDNJlgBuRzgmkA8z1zLqlfHAbSA
	 wD5rp8RdU/zCuYYSKD5jz7WsmwE6HYv1fXFTIZimrYcPBHjAZ87Bl+2HCrrTAFUu7Y
	 diGC2stQ8TW7AnueFV8KXEcfT6BC9efQ/28zYYHUvynTPNRjaRhwhffZBbZcTXQdlz
	 Ri1ryzz4Bker4f5o00YIzrwyLpzW9eA1ZXXX2c4RVKYTKRSAUiGvzA4k+YbZkx6DgP
	 eYaXVKlg6T+JA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2B139D5FD8;
	Tue, 13 Oct 2026 16:10:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v7.4 (second attempt)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190784976.417156.5563250129495604206.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:49 +0000
References: <20261010073609.3689061-1-andersson@kernel.org>
In-Reply-To: <20261010073609.3689061-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 10 Oct 2026 02:36:02 -0500 you wrote:
> Now with the missing #define...
> 
> Thanks,
> Bjorn
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v7.4 (second attempt)
    https://git.kernel.org/soc/soc/c/3780804272e1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


