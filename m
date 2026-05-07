Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12871199931
	for <soc@lists.linux.dev>; Thu,  7 May 2026 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159584; cv=none; b=GE8z747bVFRjUUdHQo+k44yhQXqQI8y4wAbhXHdzAW9wxrjislJj9nrRboINoEWxL0MFeWRJ+Iw3BpeLWEOInqMyEZptMPKk9Yzv0M12ptayFnEN968muKgL2bQwfDPzF5ay3Ktk/3DdI3G/zjoHEJj689rVpWWK0T8hdusHUc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159584; c=relaxed/simple;
	bh=s4ye3Kh9NyG6uW6c7AsqAzJkFcI3Mi2CFonCeP/pvXc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=k+olWAPszW7kTgRXTGPD4ugeCLWHn/98FJTqCyn7pM3Qjiepzh2zF2gDUrNzX6cPb0H1MpfYfLVCVgBUHWStwQYGcne5eu3MecJ6Ct+UX13ZHqFnpcZgJSEW7FY1KxpUq7epvMR+Njeb1FXg6gYf3ieRcOTzS2P1xzJXr8nhT9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huku1SmX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huku1SmX"
Received: by smtp.kernel.org (Postfix)
	id CDA62C2BCC4; Thu,  7 May 2026 13:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81DDC2BCB2;
	Thu,  7 May 2026 13:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159583;
	bh=s4ye3Kh9NyG6uW6c7AsqAzJkFcI3Mi2CFonCeP/pvXc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=huku1SmXVUDPJKM/jniMYOiyncJbbU1BkCuxZ+CDRHoY4sHE+V1JbaMlnqDA8Xgsg
	 naXicposmPrj0Mu0+J5vKH0R8tlYb3YCmHRWlhGxOXRBdbvqnidTRs8hoj+MU2pPQx
	 pHAUBf/vAreIF6jOrVdZOp8XTHq2aDa5vWIzb33O4viclWY4j38KevHs7n23WcVWmo
	 jffpgi4p87L/XFB8DmOiaq9e7IpHORhQSCTNlApRek7Nuz3EwQW60XD3TG8gQCyydP
	 BMWghh28s4JhnXhaQB0TPK2N97YWQADVfHaLm/d1GCCwVsBWOZPvorAuawzjHvB7Pe
	 6G0Wl0tiMPYkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE6439308F7;
	Thu,  7 May 2026 13:12:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: select legacy gpiolib interfaces where used
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177815953279.3933061.9405739375068077806.git-patchwork-notify@kernel.org>
Date: Thu, 07 May 2026 13:12:12 +0000
References: <20260428162757.540823-1-arnd@kernel.org>
In-Reply-To: <20260428162757.540823-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 28 Apr 2026 18:27:30 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A few old machines have not been converted away from the old-style
> gpiolib interfaces. Make these select the new CONFIG_GPIOLIB_LEGACY
> symbol so the code still works where it is needed but can be left
> out otherwise.
> 
> [...]

Here is the summary with links:
  - ARM: select legacy gpiolib interfaces where used
    https://git.kernel.org/soc/soc/c/518949e986e2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


