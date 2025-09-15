Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A0833EAED
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 15:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757948420; cv=none; b=mKFyoYZaEMhS4wdsyckHQJqH+zodoaXn73QgUy2iwowK18OcIpyrqbOl7alQhaAxMNSjIBPoiUkY9xzhya7c7Y7Z2dxI/lq58KFMVKW19cSSSLY4Hhj7r7MDnkiLHQ43j+x9TpMHrVxDjZoUmZKq6pPewNnWKpyd5+WB9PwpCq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757948420; c=relaxed/simple;
	bh=M8k6Fvj+o8AVx6XQwxciQcy0V1KWGF8eo4CgIfKtmaU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=M3aXOaLVANGsFoudYUJxozmr62Ij+YiHEKZAe1X2sVKEo7Hzv3ncSU741bf7K4CuiBCgZatCisxVT748sWhbYoykWr5bRa/6cLLBMtn6xkGWRQs3ql+LvDo+PQlFfohYHWVvv7mTZZ0BijbCTJQfcNfyiCYyobZpmJ6Ch1ZMOzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWjlxrE3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWjlxrE3"
Received: by smtp.kernel.org (Postfix)
	id 0FCD4C4CEF5; Mon, 15 Sep 2025 15:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE47EC4CEF1;
	Mon, 15 Sep 2025 15:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757948420;
	bh=M8k6Fvj+o8AVx6XQwxciQcy0V1KWGF8eo4CgIfKtmaU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fWjlxrE3MpcWUiltceXvemSvd9beYe8rnvmPfDyKP1hV9V62Zx2WYBqYjKe1nGwqo
	 5O5/HtvpNvRA7wXKLfusyDcTDj7jvqqoRgDvSWbEzsaO9h/ECX3MrS48nZ+B5vaIqV
	 qlx+ThxDzx3FC1rfebnLflcdbvxohw6eF8zyYcyk2U6t3oXzf/rIz0ZM6xnsVms432
	 eRiY6XOg+BOKuLDR+/ox61k8+y9TJm0Q+/hEgLz6BJGGeCQrCIwQgX774b9KUf8ltV
	 2ZRnmU+X4aa9mAyEvlimH+553I6zdr+0PZtg2gvDHvpRJpvjvSM8zsyvQy/BLZCkXK
	 XAk2ZWFbPrTjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF4B39D0C18;
	Mon, 15 Sep 2025 15:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: socionext: Drop "linux,spdif-dit" port node
 unit-address
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794842124.17822.5659247442649361941.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 15:00:21 +0000
References: <20250910233740.777077-2-robh@kernel.org>
In-Reply-To: <20250910233740.777077-2-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 10 Sep 2025 18:37:40 -0500 you wrote:
> A single graph port node without an address (i.e. "reg") should not have
> a unit-address, drop it from the "linux,spdif-dit" port node.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Arnd, Please apply directly.
> 
> [...]

Here is the summary with links:
  - ARM: dts: socionext: Drop "linux,spdif-dit" port node unit-address
    https://git.kernel.org/soc/soc/c/a409fac1f74b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


