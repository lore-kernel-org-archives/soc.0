Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C7E481AF
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 22:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450709; cv=none; b=PHWQkclMpr+vSY6/tSSsKWsrpHFSdt4WqbNaYFIGe9qqfFGDvna7fyBvN4VcVohj1zQaPHvuUJp9wNDvG+HkQrrbtfIkSP0vk+s0/IrZoizUlRjaX9FRZeLITv1QJiH4CyIdoKsYFT1FnleeHPlGEtyZRMpF4hpO798Z3RGJWwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450709; c=relaxed/simple;
	bh=4VpetKUy6wH4SAby6uAb5asu4sPVqJUng8c2FZ7Ke2s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XWksYVIMboMVNB6Um69uuaHEt+XQuxQ1ck60FBKVWrlY9iNv6Xthv+WqUUdrEXTR6a3lQnXWMJkJ+fFNd4OQSfzXWcT31EEAadxhB2tarJkADidMV2YApI0nyj4jVRbMedNWT6Y4KQPUAvL8M7yec78+dee5B5hgttnAaH3Zrh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKe97vmW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKe97vmW"
Received: by smtp.kernel.org (Postfix)
	id 4D7B7C4CED5; Tue, 12 Nov 2024 22:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37BAEC4CECD;
	Tue, 12 Nov 2024 22:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731450709;
	bh=4VpetKUy6wH4SAby6uAb5asu4sPVqJUng8c2FZ7Ke2s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OKe97vmW0AUB7MdIfrI8AmJzRbjXdFF/gsgvUGcHHsg9rdY0ihIgBI+eEDK7hJqF1
	 gQvxinFUIP8on66fgSSCRdzLydDdMNjLvk/HcVfNiQ4OtuouIsDV046bcWt3p7eeRM
	 ENdFFavDCpovKj7ksguhWKSgNpeGhS9snk2+ec2XwR9Bf5ZuWmSwViDIx29bN13zjV
	 BkvmsMj6VLJrLr556lBqL7k/bvLjv8IUk+2VIWjWDXq/RCjX2I+J+p1UHkzVtbzOzT
	 lSCL+hzpcyIBa42FFvOTrM4pR1+Mdm8lpc0XDj6xw6rkHmrsMXlvPmfIPK8+VMSSyw
	 RFlgaODqXAlfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCC53809A80;
	Tue, 12 Nov 2024 22:32:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree changes for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173145071923.694695.1836745935412175279.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:31:59 +0000
References: <20241105164901.7787-1-andersson@kernel.org>
In-Reply-To: <20241105164901.7787-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  5 Nov 2024 08:48:59 -0800 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.13
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree changes for v6.13
    https://git.kernel.org/soc/soc/c/f50f6052c340

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


