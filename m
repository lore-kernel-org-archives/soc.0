Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DE847B410
	for <soc@lists.linux.dev>; Wed,  3 Jun 2026 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489812; cv=none; b=fDPZZvaKgQd9BHFlezkpmPmbpIjcUNmJum85u44yCXmzqXhqIbCt/480h4v5s49uwLCh7rJCtIRZA4gefW1NqoV3k9zl0FYWJujx3rRYWFkNK0ObGY0C/yrQqeoFld+7urzFwWR6NVwTSSeOFN1UxJwps/TaYYMD2BATfJK8Hw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489812; c=relaxed/simple;
	bh=GO3PtJcqmJTZtW6cG/wfZbFgsOCOpSYVTuUuPu5KpdU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=STuHsuPQnqgZ6USl5zNsZbQ5FRtvHDUqXg43uPADfcKaYpCa8MkpRaztyxnEvtyIcZT2nsO5Pqft3vKL/2gPSquiTQ29wBZP1hl7BGdPJogEwll+jDUorvNey+HtjWydQH13TfNMkHzAWI+MMQ0rc2opuLub3qF1p6Qmp0ZZ3fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwkD29Nn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwkD29Nn"
Received: by smtp.kernel.org (Postfix)
	id 770AF1F00898; Wed,  3 Jun 2026 12:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F51F1F00893;
	Wed,  3 Jun 2026 12:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780489810;
	bh=x2u/qeg3RN982PN7XGdNyjODAdE5eDBmZ6Vujrw3bWk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QwkD29NnjxlvG20d8w06EPu2pEEWjgebwMf1FocOw0+bQPC832lG8TOb3f2eKJTai
	 Xi7TpaRHC4gFAS6I843cWI6gL9g3kOT60ao/19trb3Xn0QQ+XuxfDtMfeGYmFBZGtY
	 PDQxdaEHi2epiO/3ujbBIVuvIHrlVFtcmQ4LvCwEDpwl6apEWjLrmdY0IQGt63lvcy
	 GsOvs8bsZC6tyijFq/8jKj26be3LE8RaEGyxu0wzilfmXu/99vTuA4wBwZRsgsiv+k
	 SYYc1tFNDnDC51iy3xsF0mzZpRKtd5wdBSAfwt2n4r48qu5Ku2v9IZsnGbdxwwlw3H
	 d9HC3itkVd6qg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1988F39307B6;
	Wed,  3 Jun 2026 12:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v7.2#1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178048981163.1389067.7782458139338770495.git-patchwork-notify@kernel.org>
Date: Wed, 03 Jun 2026 12:30:11 +0000
References: <5f52acde-00e3-4f9c-97bd-9ab068320bc2@foss.st.com>
In-Reply-To: <5f52acde-00e3-4f9c-97bd-9ab068320bc2@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Walleij <linusw@kernel.org>:

On Mon, 1 Jun 2026 10:36:58 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT changes for v7.2 cycle.
> 
> Thanks
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v7.2#1
    https://git.kernel.org/soc/soc/c/73f0e344f0d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


