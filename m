Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02C022B8DA
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043298; cv=none; b=SLk6qSuH+aMDp+cuh8r/G3iXGy6wPSmTVyUcMxKL6MzfgMJMTPEHYjcxtdipNtikw80FgaRCdPW4jQtmsTCNjPSuBdy3yxGBUTWCsOxTMSV7qtKBUURvUs5rFV/zJorcDiOVSuFEXU4ghW6oDyNMFwb9OSjPWiLlz99ny4J06Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043298; c=relaxed/simple;
	bh=iJ0tDdzOmNJ/NmW4pHWJdQ3iy4AZeHXfNASyGihZMUQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UCQhtdhW5rsgfKlyy7VZQX220tEdgyLSgVaOgZqiPPAAIpDm7R5U/N4XJdStQnmG0pNf0t/CbWsiZit2RdnC+K7QUqu/yti7mPHvgBUcPfQlP4GjAUZvi8WlIpl5Hicd/4Dd9zTnZqj4hW+btvTkb2E/HNj7yoU+jjrCgvDz0p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWqmRpxl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWqmRpxl"
Received: by smtp.kernel.org (Postfix)
	id 6AE54C4CEE2; Thu, 16 Jan 2025 16:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DE4C4CEE1;
	Thu, 16 Jan 2025 16:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043298;
	bh=iJ0tDdzOmNJ/NmW4pHWJdQ3iy4AZeHXfNASyGihZMUQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iWqmRpxlAzehBwcEtkAmkvLfAzD12E7r0HI1AqjmYDGsCGLKsKHu4p4Ka6XE/Z3og
	 G2WRSRi6oxVsbpQPbC+bBzUTFb5gunx6R6wXkTSyNWXgx5k8slQn0JGa9x8eNSCWnA
	 tzGE/sTR505pzX3s1UQ+u3f2Wx12R66k+YyCErM4H+jgE+qHhQI+qEZzpvfkVdFu7D
	 sX75LqzTwgNWxWjdEsP9zAn68Z3gbucq0aHa/xY/r+q722z3PUuv5Uo5rbuHo4QKU9
	 nXsbyqQPTFGEX3rqMW7HcxDxMJHQIw+lOpf9wJKBD4W828htk/rIQkRp3AraaGH5ew
	 vXdrsOedmsoYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF1C380AA63;
	Thu, 16 Jan 2025 16:02:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173704332148.1501791.14714454900601243929.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jan 2025 16:02:01 +0000
References: <Z36h2FwUxro8rouO@wens.tw>
In-Reply-To: <Z36h2FwUxro8rouO@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 9 Jan 2025 00:03:36 +0800 you wrote:
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.14
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree changes for 6.14
    https://git.kernel.org/soc/soc/c/36ad66238ea5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


