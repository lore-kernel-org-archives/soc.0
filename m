Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B2A221732
	for <soc@lists.linux.dev>; Wed, 21 May 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747847998; cv=none; b=l7yZvjVMQ08BD+scFr3Y5h7acXkYSQh1b6il24dI1/xLzCZT0wAjtCPR+U+hgNHzQWx1lccYryjbR8/eiJVO6E5pCPstDPKYDywftXAATjXXVcJijMphFAjDFn3vlrTc63c3ohERVMvUkDpgxiTZh7Hi4VXGIzShbKA2mTqTlPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747847998; c=relaxed/simple;
	bh=9e9PkQNofhBsYHjV5iqIGlGW5IZKOa7mlJjmaKTQX7g=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qKocttIBZMhEMi4r5KbQNsWj+Bhih/CBoWcv7IIMCtpSBUlU8oDaincCB0qnB0A8CSIfprdwwNRu1AndATXi/Z19+sYef8CwoyZuAOhQlxn/NlEseND/Z3xcRO7Ab3s0S2jPPzC158N7U0UkwFu58jEHpLviCbFncRy+Ia4C+RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kO/uVtaD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kO/uVtaD"
Received: by smtp.kernel.org (Postfix)
	id 96401C4CEE7; Wed, 21 May 2025 17:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810F2C4CEE4;
	Wed, 21 May 2025 17:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747847998;
	bh=9e9PkQNofhBsYHjV5iqIGlGW5IZKOa7mlJjmaKTQX7g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kO/uVtaDLYWuhTCQl+AfkwLaUgQ57z1nHeoqb/dVt+8cr3qZACgKceF5c0SLKX8l2
	 OMeI/mgiMW4ggwjc6ZDRSXwPDTd415JChmXHLPtcmtfgCWiJxA6rbSTBY9dk6goFPB
	 wN93jLFnenMz352+QsHEtNXF36ZbUd0FyIgaFzdjE5fK3uxTjiML2uHzKZz4Url42c
	 P46YDme/Pe2OSAFFE6CDVt1VVkfdCZgv6zN8DOxeTVJ2MyFAAY2M6kI85fDEVxkq2s
	 3BscPj1FSvIF0jcXcb6mjd/tVUny5wvuIzGpzZVetGq8PmhJujSIK5q6plCTyD1kkU
	 q+4dyzWyOPFjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 711C5380CEEF;
	Wed, 21 May 2025 17:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4 fixes] samsung: drivers: fixes for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174784803426.2163178.9173533738308608080.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 17:20:34 +0000
References: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 May 2025 12:10:22 +0200 you wrote:
> Hi,
> 
> Please pull for current cycle. Both commits fix issues introduced in this merge
> window.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4,fixes] samsung: drivers: fixes for v6.15
    https://git.kernel.org/soc/soc/c/7c1bda099394
  - [GIT,PULL,2/4] arm64: dts: samsung: DTS for v6.16
    (no matching commit)
  - [PULL,3/4] ARM: dts: samsung: sp5v210-aries: Align wifi node name with bindings
    (no matching commit)
  - [PULL,4/4] ARM: s3c: stop including gpio.h
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


