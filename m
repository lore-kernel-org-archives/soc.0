Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A940DDBC
	for <soc@lists.linux.dev>; Mon, 21 Jul 2025 15:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111902; cv=none; b=hB1BQzCDtnum7JOntklXBLLiAayEhgBOYc8cogeD4CvE42+F/ab1zL6wQdu3CzKhguvQgn/c3OMlgcJbHoEWvVLzym0vHWp8CDkOHY37qL0PHrDkl2DAagni3+Ac2tPrLN45HtFg1pv/d2vMXc7O6E2BL9sz7NctA+wsuOjMbpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111902; c=relaxed/simple;
	bh=BIET4wu4GV2tbOzp3MpscqyZfJaU42PwnNDJvllNIf8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PclE0qKNVgu/z/B8eNre9HpPKMIHjH92q2+ce5Lj3P6i60oF5w3vwaUZVwm1TaQ5YhXQ7jENjcCgZKCYvPnZY3VVeLCSXWrf9l2+TQlospn63OByVfCgtmUbItIm10ijNltb01QsYAYuKhf+nGmKEu+4qBYg33Y4tj8/AMbo4dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EuJkPGLo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EuJkPGLo"
Received: by smtp.kernel.org (Postfix)
	id 802E5C4CEF4; Mon, 21 Jul 2025 15:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A62DC4CEED;
	Mon, 21 Jul 2025 15:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753111902;
	bh=BIET4wu4GV2tbOzp3MpscqyZfJaU42PwnNDJvllNIf8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EuJkPGLoG0oHLhgfoRPuULHXBA2ziLl5jHTdHfsbpUciv7iUxUEklXJ5fgEwvtlsA
	 FXUGSGosSkWYANF+8Hp1I+dTsfREguyFUGB5Nm+BvBft15SziEMvf8aGoEpy3AqcBo
	 lF6ivVaY0ptfMQD9p3eDIY+ZnzlsxnxyqXGx33DiliraREG+IfD4ALJEvGtTIRweh+
	 9yduTzzxloxzYBSPuWwZna4XG0tE/IdSQoPzDvTLVQI4PwAXejYy5uPgHQLMOr29/f
	 8YFQdgDiacuR6KNN3bGT3WrLyXeqMj97vilXkMaV26AHkcU4OL74LInxmtzDG0Dlra
	 ST4f/5XjTGJUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77086383B266;
	Mon, 21 Jul 2025 15:32:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: nuvoton: npcm8xx: Drop the GIC
 "ppi-partitions" node
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175311192118.94241.15426072950480740787.git-patchwork-notify@kernel.org>
Date: Mon, 21 Jul 2025 15:32:01 +0000
References: <20250710-nuvoton-arm64-dt-v1-1-ec7db96ea507@codeconstruct.com.au>
In-Reply-To: 
 <20250710-nuvoton-arm64-dt-v1-1-ec7db96ea507@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Jul 2025 12:39:38 +0930 you wrote:
> From: "Rob Herring (Arm)" <robh@kernel.org>
> 
> The Arm GIC "ppi-partitions" node is only relevant to GICv3 and makes no
> sense for GICv2 implementations which the GIC-400 is. PPIs in GICv2 have
> no CPU affinity.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Link: https://patch.msgid.link/20250609203721.2852879-1-robh@kernel.org
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> 
> [...]

Here is the summary with links:
  - arm64: dts: nuvoton: npcm8xx: Drop the GIC "ppi-partitions" node
    https://git.kernel.org/soc/soc/c/8e7e63fc479a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


