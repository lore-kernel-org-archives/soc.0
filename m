Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEF222258C
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162558; cv=none; b=rdtLEQA/t+3uYoroyerf88QDxVAlk66NFfpSXQRa9ejMWFo3KvlyftS7UAsZ575Y9Wfr/s8ZR/vKCVYf+Ay47A11/I0UI9Qbxfq3lFoOVt0ReQkuptovB7RRELXdpjyVMJb9BI26Uy1v2aY+uBqvGLmOgHsdMCmiaYEv8UC57xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162558; c=relaxed/simple;
	bh=ffvmX80gajC42U3uvQ8NPoIWEr0BptdhGHBkmZ8PXCI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lSS1mbQy1nLBxrTIG1458DPAXi3676r32OxasIboU/tKZSaZKHg+FQk6BCaGpCTsnSirVXoiB3n8x0B6LRVMCTEwvGPFJzXa+M7N6dIBuG3Tcx/vAozPY+1EwY4gZGUacDfJp96RYm2RldEPLxbkPa1w0h/R75Qw5oxjistS7Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMDS3Ybp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMDS3Ybp"
Received: by smtp.kernel.org (Postfix)
	id 6E6F8C4CEF8; Fri, 14 Nov 2025 23:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F60C4CEF1;
	Fri, 14 Nov 2025 23:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162558;
	bh=ffvmX80gajC42U3uvQ8NPoIWEr0BptdhGHBkmZ8PXCI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kMDS3Ybpi4Z0eXrWIOjVfLN/tbi/uLlMpNS7QYNWCklCne002HDoEejMbV4qtcX14
	 oJBgGjfCcdmB9bWnBp36KCPNofr2u5XtzlP16G685hOLmjQSvpeTWDFo5ddko1DsNs
	 Imo7nUGHNCkiHQ5axR1U/vbvRqsfTqnMSCuccRmAURC6muSbt73tp0tbl+qttrhYQC
	 kcNKz8C4XBKjKeX16VvUJlBxxr3VZabdMYSC4JbjTgtN3yOrKN0PIxffIFCqpadjNV
	 RQg/lya1oXJweAOm20yozNuaQToV5coLoDtu1kaTlF9dde9Ipn9w27u0Kuggn2vGu/
	 NnRiVuKltdroQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACD23A78A5F;
	Fri, 14 Nov 2025 23:22:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH fixes] MAINTAINERS: Update Krzysztof Kozlowski's email
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176316252676.1867843.10552410451763506907.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 23:22:06 +0000
References: <20251031135041.78789-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251031135041.78789-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 31 Oct 2025 14:50:39 +0100 you wrote:
> Update Krzysztof Kozlowski's email address in mailmap to stay reachable.
> 
> Link: https://patch.msgid.link/20251021095426.86549-2-krzysztof.kozlowski@linaro.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Patch for current cycle please.
> 
> [...]

Here is the summary with links:
  - [fixes] MAINTAINERS: Update Krzysztof Kozlowski's email
    https://git.kernel.org/soc/soc/c/ec0ca4be116a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


