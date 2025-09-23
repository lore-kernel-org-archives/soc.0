Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA31730C372
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662463; cv=none; b=N+JEbmpju5ygmPVApZBrmHL2LaXEcLANQaypIDEU8dIFk0UOtpxIRAxdgLDdYSe3mGz23/hut9o0dML4GcZB+UHu/2a2EEpyvgOl3a6qJ84C1D4OevvTj6O+CPqE86kSCAFU3QhmMTv0bOd69SaYy0MCVa2J3ACICu2SH0JNeQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662463; c=relaxed/simple;
	bh=V1Y04OCXBA1oIJir/FIQPKqH0JBlyiiRWx0E5woA3cw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=o0PItahux9K1DgBMcqb6uoi4FkxfeIg3kT3vsUmoo4RwR8VrHYKrO2cU+h6H7APLJpGlqcK5Wugk6Dss/FD9Lo6iIzQ3AA8HiXBmoTL5pu3pDLTx6ketjSwjWPKHB849TF5znFDGaY8fYoIMK9f6XS0lkyLgl6bkWYHI2wMGAy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j7dT0W0G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j7dT0W0G"
Received: by smtp.kernel.org (Postfix)
	id D0C55C113D0; Tue, 23 Sep 2025 21:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB538C4CEF5;
	Tue, 23 Sep 2025 21:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662463;
	bh=V1Y04OCXBA1oIJir/FIQPKqH0JBlyiiRWx0E5woA3cw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=j7dT0W0GY3h59NQdY3F1Mkf2C6NP/MqtDACSTVJQvjOoVOlCtffThcAObKGQ38QFV
	 nEzdNR2zlOZna51wtKFJ1/pVQZNGsRWzkSmPFDORqeIp92H5MqE1tppgWND0FIPi1l
	 Gpvs0ccmkNj8xYu+1K27amlxDVdX2pY0IBL+8roYhODWrSQs9RG4r98VcHGcZRlyjC
	 8wVW2oKMSKBy5UypwhC2f8ToKaebdVWQkDj8re1+TY7ameK3xMMVjXGQI/wbuX2ZyQ
	 4gIH7JRSiUkKYuCP9xVNwh3G73/5ztQYyYgkegGl/8PSfjUpCISuu+pcaDy3csQ1My
	 UtfTBhrF+Tlzg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB04339D0C20;
	Tue, 23 Sep 2025 21:21:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE add QCOMTEE driver for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866246048.1926563.2081394797657359676.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:21:00 +0000
References: <20250915174957.GA2040478@rayden>
In-Reply-To: <20250915174957.GA2040478@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 15 Sep 2025 19:49:57 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this set of patches [1] adding a Qualcomm TEE (QTEE) driver to
> the TEE subsystem as described below. The QTEE patches depend on two
> patches from branch
> '20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-2-17f07a942b8d@oss.qualcomm.com'
> of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE add QCOMTEE driver for v6.18
    https://git.kernel.org/soc/soc/c/ff0bebab778c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


