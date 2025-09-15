Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B862FE571
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944244; cv=none; b=rh2sNc9ej9BhM39Js8ALs/eUTVet7gyG6Biqn98yJxhRVRWwaP7iXZ1zioOt767fvgYFv0Cfzh3tq+uWWYtJg3gzv215FTZkk8ww+VPQZcQENAL5v1vXrKdmKWF8ZJfKzeCClawbDov+coNBdmN7SbMuoFKmheKDdZz4WHrSDlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944244; c=relaxed/simple;
	bh=5KRyPZXb4oqtpPQ9XgbwozuvpS8OGcPsFTnnrAsddCo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nBMeU/zVABnVDft197qy1PAv0h0JMpxO0icmzfM45mIrQQBmHsx2KTbgcDe8TRpRmUUvUtC6thn6rH8ZKL5B3EGrlU19Qg0X42GuZu3vQ0zyQsuQ49A2nz5jDvQWHDyAMvOnbNqBLQ6eHgSY69yH6R4j/IEIYvcsuHRO1mtT9qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHYlhoqI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHYlhoqI"
Received: by smtp.kernel.org (Postfix)
	id CA500C4CEF1; Mon, 15 Sep 2025 13:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DC7C4CEF9;
	Mon, 15 Sep 2025 13:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944243;
	bh=5KRyPZXb4oqtpPQ9XgbwozuvpS8OGcPsFTnnrAsddCo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nHYlhoqIktUuGYAuRjjiZGBHURtCoI809JM6MdvA/KTzTYpccTpn4H8+J8UOwkBtu
	 CCHhAkvSRb2IqVgJg5JFTjJLDlnbfvxqCbOeZVVtIdMA51Sp34yfcJNHFeP9CFkG2c
	 Wz9aWmhoMh59TfMeaM7fTEqs8FbUOJnB5DZto/5Zvts7O8Q3HIT/+mgHLlJR9P4YjU
	 H1pTzGQN5xSeJNSlCdSCPggcD/T7MIhvHRt+wuhAxon4MSORWttHMWR8ZTwznl2Edr
	 Wc8S8rS0pcx0aM/UAWPZmQNqqleOkO2LqWtc21WyP9koEzZOmV/JsHMf1hClEhrpnn
	 3htWdJ/4z6T2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C9439D0C18;
	Mon, 15 Sep 2025 13:50:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: apm: Clean-up clock bindings
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794424498.4179625.2239538089761268133.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:50:44 +0000
References: <20250910223020.612244-2-robh@kernel.org>
In-Reply-To: <20250910223020.612244-2-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 10 Sep 2025 17:30:19 -0500 you wrote:
> Clean-up a couple of clock binding related issues in the the X-Gene DTS.
> 
> CPU and I2C nodes aren't clock providers and shouldn't have
> "#clock-cells" properties.
> 
> A fixed-clock only provides 1 clock, so "#clock-cells" must be 0. The
> preferred node name is "clock-<freq>" as well.
> 
> [...]

Here is the summary with links:
  - arm64: dts: apm: Clean-up clock bindings
    https://git.kernel.org/soc/soc/c/668cf076552d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


