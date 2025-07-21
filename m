Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5356C17993
	for <soc@lists.linux.dev>; Mon, 21 Jul 2025 15:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111904; cv=none; b=nEC7dyMRbFJR4b9DZf42nAVwyRRUY/MH7rZ3yY+Gfh8TY8o+0F+fAzuctAWfpKORXsNNaUqqmFG0vEYlJyPOnRmWlG0/vZ3tooNiPlnjtU0oqKqvVmlyLDTo6dHHagiod4NN8san4AyPPVXHsEuIOuVq4oXtv1ZiYPpzLd1R1zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111904; c=relaxed/simple;
	bh=QQKiluwcGnuyL2deqZKOeCH19tmHslA+5bPUxGqVG/U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=oXBjt/P1lSjhd57fLQrhoHSKNaje/IfHk4+ZyNHOtIF3YLiLzk82xqDMvBIQX6mIZVb+umHJ4HCMBhH5WCC5h2dYTnUosJTymY/gQEUa6/GOTspHKnBU51aTM8sUKYrHjDmlEOXxKPiVDDKKPMc8sSTnNRklo5eV7TgBj7hCkyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tw+IYXUN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tw+IYXUN"
Received: by smtp.kernel.org (Postfix)
	id 0416CC4CEFA; Mon, 21 Jul 2025 15:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28ACC4CEF8;
	Mon, 21 Jul 2025 15:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753111903;
	bh=QQKiluwcGnuyL2deqZKOeCH19tmHslA+5bPUxGqVG/U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Tw+IYXUNPnNCTH1UJi+LiMmiBoOxpI7O6A7RrYaYQZj2/fEo8Cc7oOeyrRf5Oey+B
	 Qid6K1++Jd3aEhqcPY9iB4bJOCR2HWdevL62N7S10D/fVE16HkEZj6K6bpb/lg83e5
	 qwwABQbfyeRpF1W76IZh7GBeBKuf5HNbrb0QNVySovGo/NLkEkgOB52ehetiaZxo8P
	 IC9lcY5d5vdkI4sD3XuzAjfTBMSSquHHT4qaDfX7DkCqbxgjn8HRFYS/22rFLsC/Su
	 W+xN9cifUxxOZBMOLaqhbZuFKnZL6IucjcsgF2f8Tft226nGo3oPMzbLJrv9IOMEA/
	 TL+bIPAHHmyDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0D6383B266;
	Mon, 21 Jul 2025 15:32:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: devicetree changes for 6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175311192252.94241.9513678410920859340.git-patchwork-notify@kernel.org>
Date: Mon, 21 Jul 2025 15:32:02 +0000
References: 
 <36d50489cac1fbae01ec699b742f6c6c459a01cb.camel@codeconstruct.com.au>
In-Reply-To: 
 <36d50489cac1fbae01ec699b742f6c6c459a01cb.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Jul 2025 12:09:04 +0930 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: devicetree changes for 6.17
    https://git.kernel.org/soc/soc/c/9a5a531d1cb8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


