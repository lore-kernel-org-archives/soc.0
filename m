Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9184E199931
	for <soc@lists.linux.dev>; Thu,  7 May 2026 13:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159581; cv=none; b=G3hYlLOVbHA7t8X3e9yv0cvv8I7LRTd6qUNCuLNCgzbF712HtvyFpoRD26wXEm0uYWBThM7iRHebzI2BBnvXfv2Z2xwY4BJEME4DSXx0hho4+RbF9Fw6kWKIWaTzDPvx2bQdLF2P8gwAsVOhVkjWWXKIM8d24+LSRB2svU148W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159581; c=relaxed/simple;
	bh=aRHQRcl7I9312QN3xUCoXKnYMG7slM2HSQzU43pyVAU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XHi9dyCvma9Tm2zPw/qD594sNrr6jtknsvCAbZy/+fDEpQ8bG7CL4YjX0qvqPJMs8/oIXB0WYKcaYemfcjHAx0i5gKtIc5352hi9W64CkHrEkxVOXDnhPwkIiveTOgJa+mRcUf6KmfRsxzApyDHsApjZUXYx3deXQ8Jkbt/kbJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPJ0Vg1K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPJ0Vg1K"
Received: by smtp.kernel.org (Postfix)
	id 1CD8EC2BCC4; Thu,  7 May 2026 13:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07480C2BCB2;
	Thu,  7 May 2026 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159581;
	bh=aRHQRcl7I9312QN3xUCoXKnYMG7slM2HSQzU43pyVAU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TPJ0Vg1K0OXBkNCyLp95KzsCq40nV19gKQ2pnFCGv/Ht26HtQEPPYzWQpCKl1iq3D
	 745ynNpopdlCwLdJq1dv3DsEXrnWX+VV2BKObrkW2HNsnr7p7XYBN+9XxNpoA895Lm
	 9uORVvgMIxpf9sRTnoeXmSK0eGncfxe5XCRm5ew8VSCxKXMeBU8JU+alcH0qC0MOc8
	 CVS2eJ70DInF2yV3Lp4VU7QczcsmjMLG8n+GvJ2N0lvdsXrRpCTjMuHMebVczHz4GM
	 TqODhfuQnc0Ra9CzxwhW/ebR4dbRZ3rYllgxnkvBpPmvxn+3qiGgB3/J3jYLHTTzAJ
	 u/bd4Y9vcI0Vw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CD9939308F7;
	Thu,  7 May 2026 13:12:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/5] ARM: configs: Cleanup redundant options
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177815953003.3933061.11648592274876269864.git-patchwork-notify@kernel.org>
Date: Thu, 07 May 2026 13:12:10 +0000
References: 
 <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
In-Reply-To: 
 <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 12 Apr 2026 19:12:43 +0200 you wrote:
> No functional impact (verified autoconf.h).
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (5):
>       ARM: multi_v7_defconfig: Move entries to match savedefconfig
>       ARM: configs: Drop redundant I2C_DESIGNWARE_PLATFORM
>       ARM: configs: Drop redundant SND_ATMEL_SOC
>       ARM: multi_v7_defconfig: Cleanup redundant options
>       ARM: multi_v7_defconfig: Correct QCOM_RPMH and QCOM_RPMHPD
> 
> [...]

Here is the summary with links:
  - [1/5] ARM: multi_v7_defconfig: Move entries to match savedefconfig
    https://git.kernel.org/soc/soc/c/02994735e4f9
  - [2/5] ARM: configs: Drop redundant I2C_DESIGNWARE_PLATFORM
    https://git.kernel.org/soc/soc/c/d370bfb926cd
  - [3/5] ARM: configs: Drop redundant SND_ATMEL_SOC
    https://git.kernel.org/soc/soc/c/c62cee042d02
  - [4/5] ARM: multi_v7_defconfig: Cleanup redundant options
    https://git.kernel.org/soc/soc/c/9d119de5951f
  - [5/5] ARM: multi_v7_defconfig: Correct QCOM_RPMH and QCOM_RPMHPD
    https://git.kernel.org/soc/soc/c/02802b40c31d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


