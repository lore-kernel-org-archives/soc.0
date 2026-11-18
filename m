Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019414;
	b=4cjN86MBl+b88LWAP/6ZdWtPvBpJSPojM78RQhJYkSxINE1trs15tiRSAvo+nSM2gKiG
	 pz5WeK+RptD19qWKMGoL5CDhxRYKPFxKZKhh3SzIfQ1c2LpFCYf48b/J6ok7qkTJy0E0N
	 m3ZsZFJJ6NImU/rJAYvAVZdnMCrJC3++tv/N1mSpWUucFvSFgrnFGVOGHURUcwLPwvvpM
	 3zKCytP0PZ/K0YlOAHLwl9SJxvgQwEJucYK9P0RybJiXLrYQtLhDMssVQ4iBzpcFNvvcq
	 Tyg7aLHSjCV78NTSx7U9faOVS9FQ1Gywll8jpurtn9iC8Nc94idnpriBewBHiST6Aew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019414;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=VCKASn6ApIJHmgIeeIf8bl5HB0+lWz/oGlL8LqEX3KU=;
	b=PyvpoNzO3XHfjQMQGtjctBeaZYjWB9H1lGLH9DFTm67IetbLYGZDUZUIcNuFf7v5KDCP
	 cbe9VSLQp9B09iHZB6xBKUwAb+wMFuhA3y1phR4MfLZKI1I202Q7ecUA/vFuI/hqwflDh
	 ouSYNKPfqK33rsA59g6zj8AAM4cYiRHJzbzukshHLCzmTCIv3nhb0Du4e1PN4vNAU2bed
	 beCCDU9w/gBfIlu6I/5y6T0hPfSeH0dusG2UJ97XlP4jajzwebW2oNxkn2aIzHmvbdmhW
	 XkLB4s2THZvYatWBxb+qUzF07M5Js0p1ItsSqf2qavwtojDbg0UJwgJQ9cd3tqOnd4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PkPQZMW7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6989D606A339
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PkPQZMW7
Received: by smtp.kernel.org (Postfix)
	id 5D0251F00935; Wed, 18 Nov 2026 16:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 462571F000CE;
	Wed, 18 Nov 2026 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019414;
	bh=VCKASn6ApIJHmgIeeIf8bl5HB0+lWz/oGlL8LqEX3KU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PkPQZMW7AoDUnu20GHxn8It56uLHl85JkDcjx5XVH8/jNtrMUSBUlBQTTfzNsKqJD
	 Ha4PCQ+GcD+Lx/0kMhqZ9jujinmqe63Fz8Ct2ZaaE/GHdzjzuRaYaqRce/IG8Zy0Sm
	 4BsVQrIpoqbLokaQzhECaXU9ecvd5D1GeLeQ8ebOE65qnzyo2DG3XJtezQ7oC3cotB
	 6Ezapxx5Fq8WMYYUFARqthXX0z/ELNTbsbIodzu+HHkQePJBBWjGABYAAuJEM0DA2T
	 Napy5uwpbhjuyTE3BxfJ1uWfaYb3aIg8JDAGujJdA2THYXcNBFoiyhgm9ucaiUG6j8
	 3seNLtgZVUl+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A10A3808210;
	Wed, 18 Nov 2026 16:30:14 +0000 (UTC)
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
Subject: Re: [GIT PULL] U8500 defconfig changes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501941302.1837438.2807752262726991134.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:30:13 +0000
References: 
 <CAD++jL=FzG1EMuZUZ3_14VqV-1U9=c06gCUJYaTZpAkdB9+5Cg@mail.gmail.com>
In-Reply-To: 
 <CAD++jL=FzG1EMuZUZ3_14VqV-1U9=c06gCUJYaTZpAkdB9+5Cg@mail.gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Nov 2026 21:33:48 +0100 you wrote:
> Hi SoC maintainers,
> 
> this is an annual update of the U8500 defconfig.
> 
> The details of the update are in the signed tag.
> 
> I dropped the tail commit off of this pull reques becuase
> Stefan raised a concern regarding the generality of that patch.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] U8500 defconfig changes
    https://git.kernel.org/soc/soc/c/5170a198f5d8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


