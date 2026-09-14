Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C245447CA82
	for <soc@lists.linux.dev>; Mon, 14 Sep 2026 15:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398676; cv=none; b=UPH9KObqYyos+2M3iTEthQDvQI8t2Fd4MzEus6OqiEpLxFbHkHFF6/0LT/KTFDxxiO1+UdbMiAtZOKV2W6laDyX7GJlHU/soV06/sy1ESbGLOvv0i0nAm/IyH7PsbV/hNPUPJgmtoqiBbNZht/LEAgkmvbhhDzVKdR1ij/CWnec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398676; c=relaxed/simple;
	bh=TRE+NPXqLv4xbUWhXaSZbwFfUtrIsuw1SlyBRbMbRR8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=B0V7/NOMxB5JfUZSVGiENAw18hwclj+GYRb1d4sZVSQ/QslHa4FCVyqDv49JnKNuHTs9Tr2EBeYCSwfUXgzMR4iuwl0X2yAjOjDvI1MFHTI2HLJIzGWmN/aFqQFdDvVifDR5ajNUzOWHwOc5MzowIsCPCc2WFKvp8GiTEEYyr2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ugo9ro/d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ugo9ro/d"
Received: by smtp.kernel.org (Postfix)
	id C0C241F00899; Mon, 14 Sep 2026 15:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9F21F00898;
	Mon, 14 Sep 2026 15:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398674;
	bh=KYwuN/yfyxrOmXw9JWsPq09RuTzXgKhq8njuv+9Dhho=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ugo9ro/dgiTFErYIt9HHg0808/Lw8fNY/8I3uyZBIbbmqUlRl8ARZSrGVAnhi5UlM
	 kbHjjaxBPw9O0jKuYe7SA12mBWyeonjBlcclwUA3z5U1f/hz+i5ZWl6fmMV6p5iqPX
	 351zuIMhBuv3QPpnjMFwn+UoJwzqWsXyb1llUpzbxF9w7xivb9YUkQR+MspAMn9EZ3
	 fWUpcVXK3aM40OAmt01gC8ci6NRfUVdaSyoP0gwWmGtZtV63bo9QVxkzjJ0Jmhho/4
	 AAUjj7caxQ5bUKu6BxBC6a2qTvY6CDWnD6tuZBXy3aJg9o3VDzhoqnYSfaNnhVILsG
	 Zbxg8fz5PEBNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199313924A6F;
	Mon, 14 Sep 2026 15:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: socfpga: fix file access permission
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178939860962.630437.2996397223156166220.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 15:10:09 +0000
References: <20260907162016.1148705-1-dinguyen@kernel.org>
In-Reply-To: <20260907162016.1148705-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  7 Sep 2026 11:20:16 -0500 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_fix_for_v7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: socfpga: fix file access permission
    https://git.kernel.org/soc/soc/c/ebdad7d867a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


