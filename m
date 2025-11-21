Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26CC225762
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 21:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758951; cv=none; b=Nok9UQZLAAUNSu4sV1jKe1Un/pvgBfCKRjNI/JFSupwnM1LpC+uMyAlnzhJ78v2HfIUcq9C8PdMHNVut0sOGYdWhZg1fcya8TJU99MZrFlpXC9JwU6T/zS5IwtLAqiiOga+uhfFm+A0nWAIAYwXg83xOVRW7Z5GlAY+8RtfLFZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758951; c=relaxed/simple;
	bh=3O5XLZ46LVinvyHY5Tj96P7b2mE4SSKiq+M3VdNnDyc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cO8QyNrMn6VkHT5g7CnqRkWHVV8vfwzZlh4py2bAqaOoiqVU02n7KVVGIeCoO9SI9tWvT6+OOzvMOrvQNprnWLbGwIiz8DfMx06Ug4BAIFSH2Iq2M0W1XtwOGrq6b2NpIujwB/lyd53e3UuRPbVDZqzDUb7PSNVbTnlvix19VQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E5Cnp88z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E5Cnp88z"
Received: by smtp.kernel.org (Postfix)
	id B698CC116C6; Fri, 21 Nov 2025 21:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0BECC4CEF1;
	Fri, 21 Nov 2025 21:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758951;
	bh=3O5XLZ46LVinvyHY5Tj96P7b2mE4SSKiq+M3VdNnDyc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E5Cnp88zCcGft9D1YrBkN+xBhgZpukACy6dnXCQTsJSxq774v7kx1AMIjZn75Vli4
	 UomyHnpusFu4fv5fraYq2ctIs6u9at5D8qy5Px7bMZ9NLLiMzFLpd5sQdA0bziSdqf
	 Q97F6J0eZ8w7uzUHTc3u66D+28XKZThYKypEMrNgnsNrem8F1rletSoRwkJ7gv4iHN
	 pWv9z28Vp2Ej6aZ+EF9NROdXPasSF3tgxSc9nByBx1xNWUOeKvTB3I/zaHBzKZkNpG
	 0u5mVPklhFjFn2yBj7w+wz0UgbsVA5z4mAnhShQmliE5Arp4Ibdugtthpi4vdrsxJ1
	 AM4/I5LKdltsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E563A78A69;
	Fri, 21 Nov 2025 21:01:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] QCOMTEE fixes2 for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375891599.2583629.17964961502817624518.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 21:01:55 +0000
References: <20251117094712.GA1518418@rayden>
In-Reply-To: <20251117094712.GA1518418@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 10:47:12 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these two small fixes for the QCOMTEE driver in the TEE
> subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] QCOMTEE fixes2 for v6.18
    https://git.kernel.org/soc/soc/c/fe7cdcd1bace

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


