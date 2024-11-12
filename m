Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05011FC7FF
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424974; cv=none; b=jVpjsC7BZIwsyUjhGBboyHo5Ags+ZFtiZXY+xa49tBKJ7VCFkGggn94udxtdIp3wDDoFD/2P4rU4WBzJnrNzDqOLRI5UZKUP+dNl6kx5X4iwGroWcpGtcIesl6T8uHEBiqAEz6jqOOczxAJc1vOO29JGs77/IzJMkNzVmfIhIkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424974; c=relaxed/simple;
	bh=8jYzkZZKV4mMQ5rERLdndYGD5Rp9w6XDh1tIKQzEeko=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=n1uycI9+vv01/zL+qQTIhnQHdAZZLzFQLzhaX1KNtQcYZWmTQCwVdzrtTDBP5QApovf4GCRG+Q0MvSG4/wKp3fF3C94rwQoQDyC0aC1s303TwNGK1KqUwcpvLg8VcNYb4j9uwXpFumfsY8IqSvt6jM4w01wlYw0qVtkFgHw6k/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6maGwUx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6maGwUx"
Received: by smtp.kernel.org (Postfix)
	id A1F72C4CED5; Tue, 12 Nov 2024 15:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B1FC4CECD;
	Tue, 12 Nov 2024 15:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424973;
	bh=8jYzkZZKV4mMQ5rERLdndYGD5Rp9w6XDh1tIKQzEeko=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=d6maGwUxm6VYw+I9ghdm1RA4NTafecNlKCHBwXB7J8BkiQc3JFy5qPqRy+W8ac/P8
	 xO+34CFuXonu9r+iEZAdjn2uAxY4KBkFXPb076sClJek++4O464iwaLwyqwF+ROZwz
	 HGiXvftzv1+RHlTSAFZ3Sgzs4tVd1WD3G2kMcgngdJ5KMyQ1NJmVaCLnWqhVcWpitu
	 rmI6rw/CMqQQfOHyQyOPaFAtBKiUlH+fGev6aoErMZThZ1wVj2UrEFoPty9pvAumnv
	 dLZAcDm4E5Ay9VwnzbJvHZsLhAEXpGwpsCXCFaUcasngrq6LIZAslDlEx/9Rs+ienk
	 8soGrItcupjqA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB05C3809A80;
	Tue, 12 Nov 2024 15:23:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: Switch back to struct platform_driver::remove()
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173142498349.562452.7506888456092561397.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 15:23:03 +0000
References: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40baylibre=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 29 Oct 2024 08:48:58 +0100 you wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/soc to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> [...]

Here is the summary with links:
  - soc: Switch back to struct platform_driver::remove()
    https://git.kernel.org/soc/soc/c/511c06e39035

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


