Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1AF36998F
	for <soc@lists.linux.dev>; Thu,  7 May 2026 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159582; cv=none; b=S/N5cX5nVf79bN03uKiAy9jCFSdlVVRVRW/aJJN+Ar2x45O1XHgAg2qsGFB9/TtFNZNo2uwtFqkWARuBSd29Ba41fNzrOE8F1vnchbRkmhrrTCZqfaSVgdgN9kdj54ieec2zlzv7FFEmfDXP0J3jezZM5QkNpeT+iwj0m60dKFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159582; c=relaxed/simple;
	bh=pB5JkkOzYLpVtyURBFJv5DRTb6jtqwVzhdkWf/+n5UU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SjEyJ+kkkDv7SFPmjAzFemgGyHyEZs+UU2kwEhT9tx+BUZIaooTp487UJEj0OPMmNs6Q4giSkqH7fsMrcIvrX5g4VBQ3MMjGVYNCuILxJJttHvITSxu4BA2sMEOy4ID9oovFKeqw6sKX5W4ph4ZGcXeqYq0kOH0/o97NfnOcoz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bERF3xM4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bERF3xM4"
Received: by smtp.kernel.org (Postfix)
	id 59A73C2BCC4; Thu,  7 May 2026 13:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43838C2BCB8;
	Thu,  7 May 2026 13:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159582;
	bh=pB5JkkOzYLpVtyURBFJv5DRTb6jtqwVzhdkWf/+n5UU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bERF3xM4Mk25emxW/v1kMy+setbZ4iN+XAiqSbGT2UpFIXQHdr3DPCm6aCfTZUX1b
	 3WBmdsDTtIfds96jUqUzYkHIg4arIYYGpCjdnVvEQ3v2cTTl5X9n8qvZPHmxjfuu6M
	 s+0gMSNcOSI+soSjkIMk4+qe4ren5qQYxg7G4QRTqiCzphyz0jL7yPzLAlRwXsum5S
	 2WAa6FSF8EzfuQE7G50Xl8wMdhAAFIa6IynI3dY5AF9T90oqsrHtQqC84W2ZqwpUMd
	 QgNj4jR+fwQdDgjSwCO2tOiAQQp5qaoagU2g4BkU177k2tr85heP8LMeOymGBXrWf7
	 mibpPx/b+zv3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E1639308F7;
	Thu,  7 May 2026 13:12:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: ixp4xx: use phandle-based GPIOs in mi424wr
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177815953153.3933061.2354242150378019668.git-patchwork-notify@kernel.org>
Date: Thu, 07 May 2026 13:12:11 +0000
References: <20260505-ixp4xx-dts-v1-1-02f4a92a9697@kernel.org>
In-Reply-To: <20260505-ixp4xx-dts-v1-1-02f4a92a9697@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 05 May 2026 11:36:07 +0200 you wrote:
> From: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
> 
> Convert remaining legacy integer GPIO specifiers to phandle-based
> descriptors in intel-ixp42x-actiontec-mi424wr.dtsi.
> 
> All other GPIOs in this file already use &gpio0/&gpio1. These are the
> last remaining legacy users in the IXP4xx DTS files.
> 
> [...]

Here is the summary with links:
  - ARM: dts: ixp4xx: use phandle-based GPIOs in mi424wr
    https://git.kernel.org/soc/soc/c/d2ab44b9ecf4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


