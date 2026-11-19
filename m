Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080608;
	b=nabENyaHNvPgjKCUzN3knZmxL7+lXOhbJzvI59WsYk0mmi5vaCq7KgxvZob9fqRdp0rK
	 cnd7YdLYzH01nlA0IA5/voc3SZlduwofKnTJYn/1z85PjMat1Z6bV7b22AoaOxnw307Ty
	 /yaOqcd3Q3Qjwhmf8qtSndkKC0rne8jDD94uEXHdzk2UabHYajAqw4WhP+vGuUgVqWe+o
	 WG2IaUNUPA7iJ47byMU+E/8dAwCqaEe/3RzTfRueAAqunEh0IkfFFtwaQfTRZl+yhyySl
	 JusCBGHHw9jBuCAuBUYfPOSA5Zl5IBft5k/FmwwNHAf/ofa8HUkp03t/wLgmWYpQZVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080608;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=JSizgAkT2aWYUc3Q60llczBRIW+P98v6MPb08OfhriA=;
	b=W0xeLRX8qJ1qgVVA/dKLLZ5veBfKpmJbv/SeQVA+SUSMfyrWgtNHKH0hpW9r6s2RQRwC
	 oLqHMYgj/kcoeDuySBIMgE0u/J9Kim1GeLxXv5JK9LHH13ySLevd50bUoiTD7G0SvJvmv
	 TpEOsDsLVVjJhDwT77hv5JByz4jIUqsPVDwP1cZg8LWaGbzwgASw292NbKoI9cWbOZOSj
	 nrdT82+mDkhu808zWKJ9vWtXkJzX5YgPyRiwsZ9DDm1lLjY40BGmScNcOZQH1AeizwVLo
	 fEuAjm3Pibb6RMs2OWZuLq8QzATjVBoYH8n3bKfXG5SiGMOQvDqbAmHk/gjW8DMeCiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B7HXUQgm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AFB606A32C
	for <soc@lists.linux.dev>; Thu, 19 Nov 2026 09:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B7HXUQgm
Received: by smtp.kernel.org (Postfix)
	id 58D7D1F000C9; Thu, 19 Nov 2026 09:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429C11F000C8;
	Thu, 19 Nov 2026 09:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795080608;
	bh=JSizgAkT2aWYUc3Q60llczBRIW+P98v6MPb08OfhriA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=B7HXUQgmPD9YfGtVyfU76BSR+jlNuvBwp7COPc9ZVUQ8N/WwIlzbw3nkC4hpb7LFt
	 DGIZLTWHgD4qNCEWCfRRz9rK3rsJS0XyzmUGXHkAPbYiFftvYJI58JVtl2C85car0P
	 jieQ3QWr9X9CHK2MkreGQZqKek4q8UBiPNwj8udwu7RmsxA4fNhHWzz2/AUM9Gj/b5
	 6rEE0oN2RkmtMxnRLeSKtJD3fNkgZimye06hTEfhLuaaKhSLJcEAEoGnqcE4TOamnt
	 GbvI4Qm46MEqmW5R5Ln1Rub3AeMcWF16WlqEjfnuNr/KQU13Hpo0N7pnoWBConuTmw
	 FDbO5pIAmVFJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3C93808210;
	Thu, 19 Nov 2026 09:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] sram runtime PM
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179508060677.2971054.7608160304629457689.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 09:30:06 +0000
References: 
 <CAD++jL=1xfmNQf-=ejeDy6iL5BL_yiEFnFtPsakufN4QkipS3g@mail.gmail.com>
In-Reply-To: 
 <CAD++jL=1xfmNQf-=ejeDy6iL5BL_yiEFnFtPsakufN4QkipS3g@mail.gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 17 Nov 2026 19:51:53 +0100 you wrote:
> Hi SoC maintainers,
> 
> the following is a single patch to the SRAM driver that was ACKed by misc
> maintainer Arnd Bergman and needs to go into the SoC tree as a drivers
> patch.
> 
> Details in the signed tag, please pull it in!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] sram runtime PM
    https://git.kernel.org/soc/soc/c/fb44d7f760a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


