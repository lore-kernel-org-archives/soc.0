Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA2A136351
	for <soc@lists.linux.dev>; Wed, 21 May 2025 22:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866664; cv=none; b=AmookwxPk52gLNY3ygtAvQtfdlsSwxD0rW6Jl3jIiVZWwGiDs3mM/92QlLfIyX5VWgPLwXxOTSUPOUKqkfvaWs0UDzxLYTOgvZzlEl0nD8R6ysuTD1a3JjViluaKliX2vULyVKi04v2XUvcX/JfSr49qJH0hVa2QajDeuwGCDRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866664; c=relaxed/simple;
	bh=d7FrYkpeQJrffe1gdGY2g4sHCp8HKktN52AFkiV+I6Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cVDx34A7+syZhZ9vh129XKKIIYmMWOF3a1g9zrdjrBp5nOyZx9pkn/IQQc3WCM6C3bZcWKON5dt3kdShhhpBvXkPcRb9AOnywz740wQfgq1lLqnC5owd3K5y5oCojtNPw4curOrt8KG5ymgXFL+JsAFtz2iBczU645thtb3NKbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=thuXkQLU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="thuXkQLU"
Received: by smtp.kernel.org (Postfix)
	id 6C887C4CEEB; Wed, 21 May 2025 22:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D48C4CEE4;
	Wed, 21 May 2025 22:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747866664;
	bh=d7FrYkpeQJrffe1gdGY2g4sHCp8HKktN52AFkiV+I6Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=thuXkQLU8MZoxSbe3KV5VugBSHo1YlfXfSSrv31Ni7O5wkgmwCGmlyM1TxvQcQMTE
	 ytRo+Gig8OmsbMJty5AFXnxdBDCSg4YTCrZJFASe5mrxzfEIAvU9iVdw7ZRF9Oe2j9
	 XLfKn8Q4EsAs3BKGUi8El1Qin8Ie0fx4Iz0zoxZ71OtYUBsZSwYRx7VMImlDYRdZ7K
	 OIVsgMiK8gnMxMi+D3hcB0Xo8l8XnQj9yTyd8ULQVHM526uHKRZTkzsu20pVpplBPF
	 rYnTMJYB6Jfer6TDNb731PbIFUQOqg9O6CmKwiDI3dwd8EM39rIhsHhgyJzIkQAJsT
	 vWk0fMci58dEw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D6D380CEEF;
	Wed, 21 May 2025 22:31:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Arm32 DeviceTree updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786670001.2299459.4846722551631009775.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 22:31:40 +0000
References: <20250520024716.39418-1-andersson@kernel.org>
In-Reply-To: <20250520024716.39418-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 May 2025 21:47:14 -0500 you wrote:
> The following changes since commit f2420037d90a8354594b3da541e19dcbb60c75e1:
> 
>   ARM: dts: qcom: apq8064: move replicator out of soc node (2025-05-13 17:00:59 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.16-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Arm32 DeviceTree updates for v6.16
    https://git.kernel.org/soc/soc/c/13649a41bec2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


