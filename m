Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95C61553BB
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961195; cv=none; b=ZR8uns4RlU1lhCBuYV+CQUHujnJTfssSOy6oohgCCSxxFuP3ygDhjPlFTtiQ+qbKIHfM1iCF4NrAxu0O5JOBScHq1GcWzRE7s60aNzU6XnLGikk7xXdlPRHerJbjogHuXhuS46GzWzC/jhb0trigqQEMfKmkACFW9tjoUeUmOrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961195; c=relaxed/simple;
	bh=QxlzQUmnre023Ay2z7oZlibVZf3pQKfbq6pfBoJRjcM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TMoAttxAETNHzoAO5w4nUDUBWeU9vW+/9bewxwspHxX9VTEe1JbzX2RfEDUNiDAK0hoGxnSHo/wogkJ0VRNLYALl2EKzDrKXzlwEyjj3AMIvoyJChvby9jQFMZSCxUa+kcD0i0Uk38gQZZ4SQtsTSoGQ38jZwO2ZZqBu83vXT8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACWRHIM9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACWRHIM9"
Received: by smtp.kernel.org (Postfix)
	id DCE86C4AF09; Wed, 15 Jan 2025 17:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6263C4CED1;
	Wed, 15 Jan 2025 17:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961194;
	bh=QxlzQUmnre023Ay2z7oZlibVZf3pQKfbq6pfBoJRjcM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ACWRHIM9KuEEQugzDlmbmZl4nD6BNASErFBllT/mPznFQA3yseriikXPjNoLx7nT/
	 sQQ/7bmk1s7hzEX4lUy6r376NHtwlZ/mimTiLEHzGBiZbCBdIH1Q4mLABDwOo6zaFr
	 xucQAunlW1oaMRYbsguBm7jLNGdM76cUmlLSkMqWIW085uR6LbxRSLiW78AWb72/4a
	 pDBxLo7ww5Hlh7W6QriTltIELfx5S8gSXlsIPJSJXtqzg6+C1h/BGYSrfPh2rNsi7t
	 3LeQ6ODhNdH+vnHCFZPzRxObTld1ba9odgFGf9b2TTXoLD1/61NJ6WUp+Cl7pZIiYP
	 GrLuw3NphH9xQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFDF380AA5F;
	Wed, 15 Jan 2025 17:13:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173696121774.809051.2747525751696862911.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 17:13:37 +0000
References: <20250111173306.392204-1-andersson@kernel.org>
In-Reply-To: <20250111173306.392204-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 11 Jan 2025 11:33:05 -0600 you wrote:
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.14
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 defconfig updates for v6.14
    https://git.kernel.org/soc/soc/c/71867d16d6b2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


