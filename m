Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976B11D8A0D
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043295; cv=none; b=HA7h+TFoFON/jdSEq/2qmJuhwwjV9wQCv7p+xFcOU6HdzzlusIMDRhnWSlXjJpZ6hmrYfPf7r+4mIn5B+TSOE7zeijGcow4qk/LniOT/gfZwGNY6h7nhHGpUtNtysh8L1znOjN3BTYObbP/dHv6sZhVjBSrdMnLCuCkw+R6TDes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043295; c=relaxed/simple;
	bh=zz66Uf181SoM3Pipt7atxBiAozzYfCaHczNjqWR4Tvg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FBxQ1orq/6Tk6ovxHxT7pznMy1h5eUCesH98/bRwNU7YdnSNtQLprg9fjLmvSIsodubpLQM9oEjuTWqP629VfImjLZFRLwXe/2Btp5XWtJtOiSmXSOeHYOFfy53BUB5qQsliiP9ZxyH9eeO+4SReR6wHDlIEHHT/nde9j10qZXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V46hfY3B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V46hfY3B"
Received: by smtp.kernel.org (Postfix)
	id 1D6D5C4CEEA; Thu, 16 Jan 2025 16:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F0FC4CEE5;
	Thu, 16 Jan 2025 16:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043295;
	bh=zz66Uf181SoM3Pipt7atxBiAozzYfCaHczNjqWR4Tvg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=V46hfY3BqZ9Uuucy4i+fvTtr/HzgcgGmDkUPEB3Q5UE2UqPNgx4CKnrCO9FlPq7pc
	 6F0uywPXeEhZsaIOYWXNkkC4jrVMq6r3b3CRp+oTFJiUoBBipnSLbz55ou4JDa8Bso
	 0xSVblSjJVktgeauLPTD8eAQp0m/KA0S/j+k0wurZ+4kCEHyKdo6SWJGARKTtTTnDb
	 FL8ibqSJ9Cyt7zbXoUC4aGn6rfeEzuv50iVB4WUSGGqmzM2zhDyzC00EVS3F/uM++Y
	 wshTV1ZyEd4X+CyTG4ulzRZ/vrXqf2MmBOQTDcdtfXUi3j6Pm1XIpG99WwQaPj0T/L
	 qw6QnZXFYAb1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADFC380AA63;
	Thu, 16 Jan 2025 16:01:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173704331773.1501791.16360358194173171255.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jan 2025 16:01:57 +0000
References: <20250111171126.369502-1-andersson@kernel.org>
In-Reply-To: <20250111171126.369502-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 11 Jan 2025 11:11:26 -0600 you wrote:
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.14
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.14
    https://git.kernel.org/soc/soc/c/d1181e342bff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


