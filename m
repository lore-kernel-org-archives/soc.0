Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A4021A453
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422318; cv=none; b=rFnP5qPpDrGL7NCiE8wBq+QfpYrU/KKCukvZP/d35IE4OyAms72WqHKD2sgYOHlJS38zbyj4r2hLUWkNL9FfwWjt/sXDgEz+2qKbWxph882VfpQ7L7KLo96ZiChgXX1GuCpmIZQ/777yxRLPNQNSqyElUqGLmOOnsrE8V6LQDCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422318; c=relaxed/simple;
	bh=j2xycXPU7qrDNwUq1NESsX+7G3BLeXLehtQKYO/QyUM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=K8pE6mBhnQY98Bv3IWztJR1uyXQaXfVJ8bImMDiW95SaUVshuUmzrfFjqn7v7CWAaJUUIiw6OIZ8zaytIp7N4l0tV31pueiBQonT3R+J5PmK1yhB90Yoba5L1w12Hu5QngqCsaPTxOLc6Ia5kxmWeJieopGDoHHbfTaW+dr3tpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAWs5RF6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAWs5RF6"
Received: by smtp.kernel.org (Postfix)
	id CA20CC4CEEA; Wed, 19 Mar 2025 22:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3ADCC4CEE4;
	Wed, 19 Mar 2025 22:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422317;
	bh=j2xycXPU7qrDNwUq1NESsX+7G3BLeXLehtQKYO/QyUM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gAWs5RF6zbDhaYWxbC41Y7SfQHlwKSvZ6Bt9B46yqRYqynQejT/sTLnAWufne4YNR
	 g3T9Zkf8xvPiTT7CIykzYUDok5/pVs5U0p5aQiLI7+lsg4CWhzZOzMBYjIOk2jyacB
	 foZJBXeAJ7CFj+paBChoiQe64pmIRKBxHDyeOcGRrD838nlay2Urz0mUjV1Zg0ywIR
	 4YY+4ktPbrdC59/vJBdRQtf5Xdmr/E7HsVHzdsBm3x/82y73Ma8YkxbsTggMhGnJaj
	 B62BQ1JBfGDlcvND9C8P7/Wja5SE15iWV/At9LmJhs9Jl5EgMi9iIlRYWYfXwsrmAU
	 tAaOIFqcIqKmQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD8D3806654;
	Wed, 19 Mar 2025 22:12:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242235325.1211847.10829799089937617839.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:33 +0000
References: <Z9LTOHJDY2p0lNG0@wens.tw>
In-Reply-To: <Z9LTOHJDY2p0lNG0@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 13 Mar 2025 20:44:40 +0800 you wrote:
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi-dt-for-6.15
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree changes for 6.15
    https://git.kernel.org/soc/soc/c/877fb9a3ca78

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


