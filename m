Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA523164B4
	for <soc@lists.linux.dev>; Sat,  8 Aug 2026 20:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220502; cv=none; b=t0LPw3Wq4d1ICLsNQD2eB61v15AbdT3jmMvhBuf65ML8EwiUBOKPgyWl3Cjs2TZis8c1CPctIfQ5LtZ3MgwXCPSXnryB01QlKFNEBg3uPJhXOZzqCmridaDo0DcWaFHKxrDepQSQaOc28eQ+eHArLexu2StBZSMKHw+o1LziIQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220502; c=relaxed/simple;
	bh=TDhW6i0/ji07BU1ThTl8cEugoB9JCg6Cv4hZ2S000nA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=b3SqSkxFyYxEqDOioSq7Vi6mHs4B9vKGzZAKLsjH/QU58bWufxCwnFl9cynp5EHPNenB1dQScigaj6rM9O10cfjT5b+HpVGF1rhXaP4+jxBXmnut+gXf/ziRd2r3BwXTnfB7PNXItt+j5a1uh8BkOnw0/F0zC8I+qRkuP3sxsRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCtfvONw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCtfvONw"
Received: by smtp.kernel.org (Postfix)
	id 879AC1F00A3A; Sat,  8 Aug 2026 20:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721251F000E9;
	Sat,  8 Aug 2026 20:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786220501;
	bh=pxez2vDamQTiYERI34JIo5831BKCyRJGqHn5ac5G6G8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=HCtfvONwSITCnSLDcjJtOk5RHPU2MdSdkFCtv6bqMQzL/fih8ZxqiMDglyMfU7bHW
	 AzrD8DaRJ9MfmK16czWFE3CUCS4ZUbllhhf/Z4fS3vVQ/fDeau68Dke1PcQQ2msW8w
	 ZZb8uytgT/1SHttUNsW7itazJ2PqTCYDpb14B0Sk8oxIRsIaH1VXI4rWN1UjQ8cy81
	 mogN5gXAezSVyZ65xXAdJRP8AGvCWZPZQVCSptKVRkhiD00Lb+esiKM5wEkX0jquN/
	 yzYCmNuQcmUuLhBnyIFKvr9Ah6nEMSXagYneeHA3nWFdzc6wgGt1JgNKxacSgXoXvO
	 zk+eZLv+6zgBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93AA6380CFFA;
	Sat,  8 Aug 2026 20:21:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178622045913.2748994.16639938237522540444.git-patchwork-notify@kernel.org>
Date: Sat, 08 Aug 2026 20:20:59 +0000
References: <7db3a138-facb-4132-aed8-8e8dcd3bdf60@linaro.org>
In-Reply-To: <7db3a138-facb-4132-aed8-8e8dcd3bdf60@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Fri, 31 Jul 2026 17:59:43 +0200 you wrote:
> Hi,
> 
> Here's the Amlogic ARM64 DT changes for v7.3, contains some overall
> indentation cleanups for the Amlogic DTS, some new features support
> for Amlogic A7 & A1 (clk measure), A9 (pinctrl, gpio-irq) and some
> fixups for AXG to only enable PCIe on the S400 board.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v7.3
    https://git.kernel.org/soc/soc/c/307b9caae6e6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


