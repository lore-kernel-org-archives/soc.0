Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608423;
	b=JjEbntknGJld9vuEW0+sBz3eoxqiIfUTu62xZR7E6stSbv3fJNKT3/GpAT6s/uAB0eg+
	 sbC7UWMhHDEVJzUwDPR7oucPDgK6e80UsY27P9sj/jRY478pSYSjUc9Fl8oK98iV9/gCE
	 1sUgBIKlap+92DxqzWUhtJ6GKoJaG6gQJqoDswerz0cmWEjZ/+8MtGGP97mvMy3tSbFAh
	 Olh9HOnocxp2LQMWMV1jirI98SkPqNwagtq4KTx1wKZCPbVlxN6IoFart4/2TX6ubYFaI
	 ir+SThpe6X2A58rCsS0wpmEgH/KX9x1l2zSXOFOLtkteUlSQs5/p0R1u5AtxjCYhvlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608423;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xqvMv36sU1arvmKl+cIGHmHRCnYWDCYqsUJxqYwyPL4=;
	b=lnUkIdJKQoPMw1mTAZ+6UnXYEXECPa8QtToYL4ix0YokR+cUgmqgUf+5GlkEosNGnzbA
	 AwqKPjJBMESJxDF0MpHIr1MYBfPpA+qIv91DnFgya09mCKcAt+ul202bb3AY0H7TVRsNL
	 uT4TV52MNZyjQZGzBf9YYi+Lc8n01IftrZVLHHmg6vJo8nxsKeB4ge3/d6uHswwSFhBFJ
	 IRzLycXPD0n4dXllHmAXg1zKm6TtWZdIwF0vy4+YP9l9BTiRLz7HPEwzvhz96zdm1pEVA
	 Nx+0Kwl07vmji5PV1N5L0ltjvo3YFigB7/uRlQMHKMMJ0/0QLmp9HowFGlUtmKGQnDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HG3DS/xm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27F4606A329;
	Wed, 25 Nov 2026 12:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HG3DS/xm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CBD1F000D0;
	Wed, 25 Nov 2026 12:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795608423;
	bh=xqvMv36sU1arvmKl+cIGHmHRCnYWDCYqsUJxqYwyPL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HG3DS/xmRh+hLy/FZR+0DYfYsuM99sOw0N5RdI595AfpTVhkw1ibfxIqv+4SLC1x7
	 nLTTGtcYq6q5oVbibxAcXtlkQEn0KqmBebcb8ICXio1q9HiLRFhghlIyRbxaVn0Zun
	 qQNTUDAeB+BnT4l7UoVIUviBrRlHKASCArw2XfexmDn3CRFd/OAqnOM0zwtolbMTwu
	 PVqAwqMlY4zQ07Lqx8dmdqDP+loL413gUqnJdKgfTYjNlLqDbSTVgDsRXka+wDynLp
	 8AUFPEzcX8r4mVwFvOFahOhpzdNI6EalJ4DGJdaAUxKqoo/QkTXHorxOnFK/6YRA91
	 ktW9x0DaFbLmw==
Date: Wed, 25 Nov 2026 13:07:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Russell King <rmk+kernel@armlinux.org.uk>, 
	Vladimir Zapolskiy <vz@mleia.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [GIT PULL] soc: deprecated platform removal for 7.5
Message-ID: <20261125-judicious-burgundy-bee-89d514@quoll>
References: <7d052ff3-6d0a-47ff-a1cb-b7864ad2c248@app.fastmail.com>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7d052ff3-6d0a-47ff-a1cb-b7864ad2c248@app.fastmail.com>

On Thu, Nov 12, 2026 at 04:47:21PM +0100, Arnd Bergmann wrote:
> The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:
> 
>   Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/board-remove-for-7.5
> 
> for you to fetch changes up to 273a6e23f66433952300d1810b5274786e7e4a25:
> 
>   ARM: at91: remove samv7 support (2026-11-10 22:18:44 +0100)
> 
> ----------------------------------------------------------------
> soc: deprecated platform removal for 7.5

Thanks, applied

Best regards,
Krzysztof

