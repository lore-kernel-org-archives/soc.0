Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DA120899C
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422290; cv=none; b=c8cAJQOcuOtVuTNkkkDzJxq6EBvNeqGDRvxaCrcMT9euvhl9mP0P8wCqS3Q4t/yu8MjdRgg3rFD4Ags4e5CY7tilTvMoLCo4FvviFvmnYJsAaDikSB+O8gZNA34CCNEt3FOfqdN1LF8ojxe1qJx3Zy7VpEtYijiC+oP8lsknUh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422290; c=relaxed/simple;
	bh=XnKI44RJYH4KsdJLRaMkcOrpagLO1qM/Kv/4Faq5318=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=E18TPa03/K5idjzlYZ/rFdSEcOBjLpjWE+q46j9yWEGqP6G6Z18Jhu4Jw1eUzbZTzLO5q3cWmeeOki9rsV514QfQmnCaR205Sn/odQK505+O/jft3g+pQh60YeFyRFRZxSGDm0MMtmNvEApnYXyNzNrJvMnr8gZSUV0P0bi9r98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbpy8i6t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbpy8i6t"
Received: by smtp.kernel.org (Postfix)
	id 523D7C4CEEC; Wed, 19 Mar 2025 22:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC06C4CEE7;
	Wed, 19 Mar 2025 22:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422290;
	bh=XnKI44RJYH4KsdJLRaMkcOrpagLO1qM/Kv/4Faq5318=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cbpy8i6tedxe2FO4qxgaQcTEdKfbQNhfx/RdEg5mb3LRJP4T6wp9DbxGL+hzXTGLY
	 Vz4+pT2GCyrFOZzTqgT4g9EfDoAyOBs1rkeS3Dt/1xQY44qRraF4W22SCvMwXzq1Tx
	 qTfE3ssQnaNBuExIhguhEo8Y1JxN2DWA1E0Q08gRn3nle5aTeTtSmNWa6l38T5/oU4
	 ADt+hnvj0rG57A87SHFTeHF9rv5S5MXpDsjrVyZdcJjqvtpZF0It3JVUc3aEpTpm/9
	 2BpCWLuKDZRf2XuhMWHdvffSE8YUCeP77YMgdo0BnGk0Bg3cd3rKXIKUsn2WClgNeM
	 lJrNGB53LgjYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 347433806654;
	Wed, 19 Mar 2025 22:12:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242232602.1211847.8373558812211976228.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:06 +0000
References: <20250312003023-GYA76989@gentoo>
In-Reply-To: <20250312003023-GYA76989@gentoo>
To: Yixun Lan <dlan@gentoo.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 12 Mar 2025 00:30:23 +0000 you wrote:
> Hi Arnd:
> 
> Here is SpacemiT's device tree changes for v6.15, thanks
> 
> 
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SpacemiT Devicetrees for v6.15
    https://git.kernel.org/soc/soc/c/fce5759af901

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


