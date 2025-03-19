Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A319B20899C
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422300; cv=none; b=VW/gx/QgGDG/MQoEQT9HkvoBPgRg9FbViBR26/zgxzzooG4arkrtohqB7+tweBvM6GS/3CKe24dFZrYOBh1xn5F89Yq69/67ZGtBtT7R4FFkvszpcSdNzueePKryTIxGrCP8mx2qIe2PqikY1j0Wv3PCtEj+srEzXPT2FE5DR/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422300; c=relaxed/simple;
	bh=tlvm3GCRFEIMuvTuZEcZCpKKa1hDCI2IbsA/63k4cyM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=iYZwFnpj2w0C/aKCodfJooaw6SJpX0LGB7qEfhLi1maVFYhONrjuXFKRftgaCmsNgPn7b8xxBNIB4+cJZCXymjcxyAwsRrw/tG1qm3mnooBqPR7wFCKOtFeevs7m/VhbOhr53pC+n5yCzOAdWR+gX630+geQ60gYwhAJMSCOqpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=thUjVPIl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="thUjVPIl"
Received: by smtp.kernel.org (Postfix)
	id 8F509C4CEE7; Wed, 19 Mar 2025 22:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D2FC4CEE4;
	Wed, 19 Mar 2025 22:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422300;
	bh=tlvm3GCRFEIMuvTuZEcZCpKKa1hDCI2IbsA/63k4cyM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=thUjVPIlzw8RCoursaRmC5gDcQwpG4DY13n87EFSw+Txd1vHwTX/0zU+i9P2YyRwT
	 uruTwA34juc4Ds/C6VwdDxPHoqbe5VtXcVOVyVyVePJWk8CI8PBEUbayPtu65r5i48
	 qRP9H6wjZHyTrR00ywhldHhUrroC2gkZdAaZrmMG+cbR5wxzvRXTwKvkc5vuWSwJgf
	 L9EjQvHoiiLpAWqevQmxmP6f/SsfSiuZgkk3Qfc6GB/Hc1SQSqcFOsAz/mVvlczjEK
	 T3nFxQUx3C0WqAAgFF0YVzmykjfdfUwh4+4sUzlO25Mbjop9hAPQDN2/pgS5SwgEbT
	 ZASv1uJaS0jmg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CDB3806654;
	Wed, 19 Mar 2025 22:12:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] arm64: dts: AMD Seattle clean-ups
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242233599.1211847.13810653839502439429.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:15 +0000
References: <20250306-dt-amd-fixes-v1-0-011c423ba99a@kernel.org>
In-Reply-To: <20250306-dt-amd-fixes-v1-0-011c423ba99a@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 06 Mar 2025 19:07:42 -0600 you wrote:
> This short series fixes most of the schema warnings for AMD Seattle.
> 
> Arnd, Not sure if the AMD maintainers are active. If not, please take
> this directly.
> 
> Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - [1/4] arm64: dts: amd/seattle: Base Overdrive B1 on top of B0 version
    https://git.kernel.org/soc/soc/c/bae2bdde4211
  - [2/4] arm64: dts: amd/seattle: Move and simplify fixed clocks
    https://git.kernel.org/soc/soc/c/8945ed5c8e69
  - [3/4] arm64: dts: amd/seattle: Fix bus, mmc, and ethernet node names
    https://git.kernel.org/soc/soc/c/6268ac369b59
  - [4/4] arm64: dts: amd/seattle: Drop undocumented "spi-controller" properties
    https://git.kernel.org/soc/soc/c/58fcd0b72955

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


