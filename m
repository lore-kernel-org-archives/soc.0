Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752F4381EA8
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874869; cv=none; b=kA+gI3Bm+/Aylo4UN8/obGZQHBgvavstM1BPpRXSribgcmD+ULzpMZR5KqPomySJTFjQ8i4DFYeErLyzkFTP9+s1L0d++AcWyUyhvlq5UtMU9vXQ2LKdoFeLT5loWHop5ZfOeLsAI74VWc+Ky78GvF1Voh/foh2WpPXq0poZPXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874869; c=relaxed/simple;
	bh=JYDl47iaPTn+ji4SaJ357s0vHgl14zj9mpvz+wDGjj0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=boTAHIoAB0XBdel3Srt1CVwewUK4V+UJtzaUS5GtTW0B6zMRCMY41VuYzv1seIv+BadXvpPFw4SeghTIkd6RLVpq7Adh6U8AxxJaCfmy8IDzG1JBWF9KREpy0g55s8UAOy0womxrhJNQZuRDEstwOk83PC1sMqH/+M2rnlSx91U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pvuqa+Vm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pvuqa+Vm"
Received: by smtp.kernel.org (Postfix)
	id BC90F1F00A3E; Tue,  4 Aug 2026 20:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A693C1F00A3D;
	Tue,  4 Aug 2026 20:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874866;
	bh=zKTJJfqwifIAZ6MfyX0/JEunjWP+GyovGUSsiiNob90=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Pvuqa+Vm7nAFeVINB+pIzhgyhHIo1oyKJNp2cdnRNlcweoS4N6ImCgacd6WiLN9RB
	 nL0EdlR6pgJtS0LtyTumhbxmIvzPHgSu21slP6PgIS+9tz6tc/Yj1hlLDY3PN4ES7o
	 rskvv2T20PUHtnjbvZEe/BXCoaIl3NRCwkldrVCi55uFLoauHIq/IF6j8N9ueN9DLg
	 96Y00LqiYEJKoude4bLTevqNFzPl/0AxNh4acmw7NxDaMCgYjh8wz6yog7HqvXMOcZ
	 n8DNSg2hELOlM1jrq3p49tmIVxnUvP9HHczMw5/ZHa5QFyzNAwYasNgPjdaLrrlbaP
	 D/p73lXw/iLLg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5686139263B9;
	Tue,  4 Aug 2026 20:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] Broadcom devicetree fixes for 7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178587482688.3769923.13929563220090879549.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 20:20:26 +0000
References: <20260730232519.2706487-1-florian.fainelli@broadcom.com>
In-Reply-To: <20260730232519.2706487-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 30 Jul 2026 16:25:19 -0700 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.2/devicetree-fixes-v2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] Broadcom devicetree fixes for 7.2
    https://git.kernel.org/soc/soc/c/cf3eb490ff57

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


