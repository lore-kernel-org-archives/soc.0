Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908D433B97D
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 16:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911242; cv=none; b=WsJN6RGQhZld3Go8rU/R8bpxt9yF9P1gmVmgjkB+qrFk1Wg2a+mvvUvmM8JFx9Z8fVVAVLfaLnCUnTyw2b2tEnqcowUeZHOduI1TkzxPw9k9F7KxY5Jfm6Va2j59sJkWiUx2Kv5d9bvvBDkZ9hKTMOnIVRfKlFi7L2S71RUzlzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911242; c=relaxed/simple;
	bh=GG/cB8HakvJSPb1VS8ieLtUUFRJ5bAB61v06/SpmDdw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Xu7ZJsUZXME+lSoBatEzbpV66RmUmLVnNapvrj5SaKjTjDpZxh0knwVqLJZyRBaETEiKPMmCGRAkaHkAx3Mm+W9eijmNQrm9BHTXsiK/VfZn5e2iSOvS0t/X3VV8lM9lw6ic4UFliS8SBthOjzCo5J+xUQOXv9gtpQr7ry59CMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVSy43Z3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVSy43Z3"
Received: by smtp.kernel.org (Postfix)
	id 255471F00A3A; Fri, 24 Jul 2026 16:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E78B1F000E9;
	Fri, 24 Jul 2026 16:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784911239;
	bh=J1qFTEGtg6kFq7Jt8yCGFcLyrxMPYQsYhcLc7t/GJf0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KVSy43Z3twwLWmgjBhl2WmHmPBh0fAiIKk5hfa3Rtkrv1EMVFj0bYEJitM8WpDnuG
	 C2ar4V6sA05it0ZuJejFWA7pz6xavdhxBDJ29cidUTX7MfQRqeSQvu8oBCj4BgtHNc
	 OZoAQ8x2oVl8Z6nNnKfriP4lvW0Wjj0ceiK8rolf12VJdBAFn9FYv+fguBBOYOxBJ1
	 6N9CCerC9k8xsX0sbvr/J6a4gDrsuqYh+QuPysLSrr4+BztjpwwplGci3HI7PxSVEO
	 gWQ5HuZbExaAG4k70lg5z9XamkdUbLiED7JNdqq5cOoBTXcyEFnybf5G752QvYeFrb
	 oL1br+WO8O64Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 938AF39263A5;
	Fri, 24 Jul 2026 16:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom devicetree-arm64 fixes for 7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178491120615.3229915.4247442524077334887.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jul 2026 16:40:06 +0000
References: <20260721170851.3581392-1-florian.fainelli@broadcom.com>
In-Reply-To: <20260721170851.3581392-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 21 Jul 2026 10:08:51 -0700 you wrote:
> The following changes since commit 1590cf0329716306e948a8fc29f1d3ee87d3989f:
> 
>   Linux 7.2-rc4 (2026-07-19 13:54:41 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.2/devicetree-arm64-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom devicetree-arm64 fixes for 7.2
    https://git.kernel.org/soc/soc/c/1df696a7d18d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


