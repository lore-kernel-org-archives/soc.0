Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6507A21D3E2
	for <soc@lists.linux.dev>; Thu, 20 Mar 2025 17:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742490605; cv=none; b=RAaHGD7E0kT+W15OmUTABvo+msq0bqG4Mqj2rHYq1HepHsEMcfCmen3TFviWyBKM/iV3+yhp1U9dw22FGMrH3aYdt81wh5QKnt9aKxThHUAAwlfIfdqyNxIIeBPDrfRWuSXXsLgXtG06+2CuX8j+VIgsRDxtI62VbKQ/aJwuubA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742490605; c=relaxed/simple;
	bh=tSBa8vKoSmHbnHXGbk8HipKEfGHFSaE91baYdiZgIp8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BDRmSL4TYWR03Ifg2kfk19qTfYPLQ9M/wxlmhw9lwjwNyjOPnMi8WN6abhE1tHvb7DYrFPHAxXQpA3eanQw/s4mVQAaqejF7ItuXpiJDwzAD5PbMzM+hNgl2y5WR1xLAOzs7UsYxz1dfLruWhs2pHb7dC6TzCZPxn7aABkuGHF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0rSZ9xI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0rSZ9xI"
Received: by smtp.kernel.org (Postfix)
	id EEB3FC4CEEC; Thu, 20 Mar 2025 17:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A1FC4CEDD;
	Thu, 20 Mar 2025 17:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742490604;
	bh=tSBa8vKoSmHbnHXGbk8HipKEfGHFSaE91baYdiZgIp8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=R0rSZ9xI9B1wfcax6qIWNQAiFMQeUjfXDmr+SQgEq8EcASQl7nsmbuS53g1p+QAh9
	 nv9jSjetGsihRCVsh15NgSORoI396GYlTX0uT5cmDrsTn7rHDRvEJ+zmX8eEA8tIqL
	 y+B8AHxUZgsfZcy5fsfh3Rs0Q2gF5/0qFecSXc9YcC1wr1rPxtcQvCqJDHuE0MRPb9
	 c68J8u7IJWFO0jAgSojRHd98Qzn5/TEIhwYy5g3ao8JljNaby0YO818LioS2ibU9GH
	 +b1G8AJ2p+81MfllL8OQCWvDrKVUoS2VfnPhn739JOZxcZZG0gYQc1XkoLRiIyE66T
	 k6vKdQUNS71Pw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADDC3806654;
	Thu, 20 Mar 2025 17:10:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/5] Turris ECDSA signatures via keyctl()
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174249064077.1843567.5568062931913381797.git-patchwork-notify@kernel.org>
Date: Thu, 20 Mar 2025 17:10:40 +0000
References: <20250204131415.27014-1-kabel@kernel.org>
In-Reply-To: <20250204131415.27014-1-kabel@kernel.org>
To: =?utf-8?q?Marek_Beh=C3=BAn_=3Ckabel=40kernel=2Eorg=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  4 Feb 2025 14:14:10 +0100 you wrote:
> Hi Arnd et al.,
> 
> this series adds support for generating ECDSA signatures with hardware
> stored private key on Turris Omnia and Turris MOX.
> 
> This ability is exposed via the keyctl() syscall.
> 
> [...]

Here is the summary with links:
  - [1/5] platform: cznic: turris-omnia-mcu: Refactor requesting MCU interrupt
    https://git.kernel.org/soc/soc/c/ee7f8ed72990
  - [2/5] platform: cznic: Add keyctl helpers for Turris platform
    https://git.kernel.org/soc/soc/c/0b28b7080ef5
  - [3/5] platform: cznic: turris-omnia-mcu: Add support for digital message signing with HW private key
    https://git.kernel.org/soc/soc/c/df94a2f1eb45
  - [4/5] firmware: turris-mox-rwtm: Drop ECDSA signatures via debugfs
    https://git.kernel.org/soc/soc/c/4110ad034fb7
  - [5/5] firmware: turris-mox-rwtm: Add support for ECDSA signatures with HW private key
    https://git.kernel.org/soc/soc/c/ba8755ab541f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


