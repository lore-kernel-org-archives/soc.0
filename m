Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D711378812
	for <soc@lists.linux.dev>; Thu, 26 Mar 2026 02:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774493709; cv=none; b=ENCmktcn7bxjuLPOH65GPUi9wCW2LZV1yrfavA9vzdPp+InkGlTzCum/9KafICUXjUja03fXKSmLHILNraDKRJNVNuUsFDjoLAroeienTe1VcJtgd6XfauomAs6jAQ2jKgrYf4Y941wYRfUTVa54+SqQI4YxmlHHV7G/tUw8gxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774493709; c=relaxed/simple;
	bh=fxa4huV+zh4IdbhAywm+8f9whhxORLHx306xfU5WV/U=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=grVNQlxTWMgga0ypwYXz6bYxuVykFXyLLcMTutUxYAj/51xF5uuCnLv2oGGqBXBgUuhptzbMgWsYKV2j8OlMX62IKWvD0yCNlnJKbKBPJsANbWyAf0aMDDk3E9UgcWV8EFhzzwnP1dFOa61hkl6q45I2lbHCfQz6JdMLDXef2y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=NccYpQ4C; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="NccYpQ4C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774493705;
	bh=l4mtEumOCiMQzVWWzIR1DoohIyGt0P5H3qYqzvyRbOU=;
	h=Subject:From:To:Cc:Date;
	b=NccYpQ4Coz6Uhm2j3vFrrAtwmbchovowc2eYGZJE7GxosHgOgayix3f+s4UxSf0eZ
	 HMvgr1d+0SpUF9lZDH8zJ/j+02Nr4GNMm+RcLJkyOkXeVB0h4tUmgqpVj1aJ/VnEBY
	 9AQDtitwKqP0MZBaOWozB5TsuesOj8OKerpTs8kWOpY8ynlgxCUgsQRU6UeBzZXC/X
	 zAyOAf0mw+liIwyWSBFINH1NtCEQuoUCMenQvu85WCHM9r9jI4kobkGNnN+rhwyV6q
	 YyGXGZjsKIGVfwJLjYMdZc/YzmMGVY7YxFgwv/lAq9UcOvazKzNgRTU+tsVhgj1+1J
	 yqD8RgtCJ+cEw==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3ECD3645CA;
	Thu, 26 Mar 2026 10:55:04 +0800 (AWST)
Message-ID: <4afeb8eaa663835725cebaeb8c1b6f50dce184dd.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: first batch of fixes for v7.0
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Mar 2026 13:25:03 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hello SoC maintainers,

I've been intending to send out this fix PR for a while now, but time
has escaped me recently.

Andrew

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f=
:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-7.0-fixes-0

for you to fetch changes up to 7ec1bd3d9be671d04325b9e06149b8813f6a4836:

  soc: aspeed: socinfo: Mask table entries for accurate SoC ID matching (20=
26-02-23 09:43:21 +1030)

----------------------------------------------------------------
aspeed: first batch of fixes for v7.0

----------------------------------------------------------------
Potin Lai (1):
      soc: aspeed: socinfo: Mask table entries for accurate SoC ID matching

 drivers/soc/aspeed/aspeed-socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

