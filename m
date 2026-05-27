Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918493E2768
	for <soc@lists.linux.dev>; Wed, 27 May 2026 08:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779871834; cv=none; b=S8vOkZdtBRi1dHzV4suVcenMlGuEZVAQwWpxNQRetgCTLWTU92eJKeUWP3mj4mPte60rStTS/39FFzg5M6xGeAPVYaUVBKqdl+8XuZn1wL8/TPtPFI+LM1/jhOPElYmF+xG5XatWzZn+8OB44Y+R/s58L0hUzmBUFgw2+qYz6B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779871834; c=relaxed/simple;
	bh=ttH8c5kAOC+l2txfoyqbn8DH2F4keiGFlTvpg+o4CFA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uxZkKMhJ30fl0lqrfV2nGdZoVq2MAxmYY65/ep90sT0ODncNkwx0/U9H4s7RQ9BYxrBCgXu37a/Oxbhd5Rexw87q3r+7FTRtpbK2k9TIkd38onf5c2c5k1fwhGtOoz11D2E3xkZcl8FyRSWUgE6xfw/GckuAPiCQy3qJU6ZRB4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=eOyU3li6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=h9vmKHuq; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="eOyU3li6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="h9vmKHuq"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 95042EC0620;
	Wed, 27 May 2026 04:50:31 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 27 May 2026 04:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1779871831;
	 x=1779958231; bh=ZlvHG80ZK9hSvPIw9z+nYs3IKa/2LVMBK5vKDbWv19o=; b=
	eOyU3li6sRipDsZA+0f1laQY+3DwdmuXcuEmfKGx4GNKmWKSY3wQvivfm7JFdAy+
	lmtevx8Qc4od8DgVkf7WKiWlx+aUI+Qak7LQYdLohP88IpKUxEgLvKpMThL/07mt
	G6WJvtaMhdxEqK6fHYauIcuooL8AIXhNE6EE/Lb/qYxVlchDGb3LRI2nLFjWNi6u
	aFSNfj0lakCakb318cqwvdyfExJ8rWLTUDpC9fue9khoWnhfuwQS4eNBUpZ4+BRi
	3D/B4V13Jqamt7jxD3eUOY/k7tFuUmmTJxMw5kctcMYVSLUe7qjWJwDyjxe9AAcQ
	kf7EGjT8h1FX702d51Fzng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779871831; x=
	1779958231; bh=ZlvHG80ZK9hSvPIw9z+nYs3IKa/2LVMBK5vKDbWv19o=; b=h
	9vmKHuqMwK9M43r2afMl7uLKBhTCyZUDa8I7WCCM4GXXM6JtSDbgPlnNAVB5xpfK
	gDbufMSbkAJfqhc/Eg9wx96dO/F4mZ4SO542gAUcgLB5UcMo5XW09XWZNJibJYeJ
	+F67Xe0Mp7RA4QPqAStp0DMxekY+LtpUiCDzFw8iCkWmMxGBvQH5K/T/aL+AYHWV
	CTzaBshn063+JraNsoZkujPD4Qi3FQFD0KxxTX4a5n12K8pok+j+MU2BcF+kXn6Z
	RSPF5y6fCgm4/m1Q0wTqhCcHGc52GbNksPir6iyYp6+Yy8ighEh84qfosjUIwrSI
	6KHXP49YMDdzWROfgJX2g==
X-ME-Sender: <xms:V7AWajcLwBhVurX71yGLXX6F9PoB0nj5lOsHup3hxKI2RqPMZXuNTA>
    <xme:V7AWakAEG_g5Y5OF6CTlPsi44vHrl2Su2PLEi0QXj8VROxHibR_g8kwMNMYGtJool
    WQkjE45s01O68VlyE4EZ6HbyAXdi-axjYIuIYh9djsgivE8HpZLFS4>
X-ME-Proxy-Cause: dmFkZTEQnuCJnUGUaxzNnumE6XjEKL3h2kKIS4KFHjVSCcGa3YYu5VKRd5u3aqOEuQ16hD
    3xLH38woyVab7yTIFNtLzjXs1fe7dSak9UoNK1oOkYntLpivb03dA8sUbRUV/cmTkUS60i
    NHREZf/f67/RmWKXC6vWwfjDiB14GL9xWmYxF3BOFxt8vplhQsp/xSewGR42UrKFcj+aha
    wm3fZIwcNciqcTppwb5A9iDxf/kmVQ+Sz6cZM7xUCqW1lEcb0HwA7YvEecamPlxmZpy5dZ
    Dj6MvVJKDpJ2X/HjF5Ch0HV7K3F79NhgWoCpouoMTH4Zz6YwYWV5H2jR1AOZNkK3YfRpD9
    62uZaNavMLEOkCjtBdOpNkeg9p1ioQCIKhJlAwm0QqEohsQ7on0YxJ597cOM7pbOOvtVgd
    QgLnmRm7WN/ifY1MlXrY+LPKsGF1h85x2UmrFSMMObOh2+0Mg3bN9tTZgsolDFHG/bMJhq
    AvHLunP++UuokO6t7L9SnIWn88Z8MsaSN7LXgWK/1kpe2kmAbfNxc1PlESKat0GE6wkN32
    fqO8Me9YkoeaoTp/PhGH3LyYvtiLiWydt6cJ4l5SawxYPOsKT0HXtnPRvitRvOWf07lgp2
    ohOb5Lj88ALmRml2+KK5a7iwyLavkDD05k6WHdVed6ybn7m9+p04WLoJNFOw
X-ME-Proxy: <xmx:V7AWao9iqdKvbMNOF4ASkNPG4_X88FzC9SfbcjBT2VmzP-PDj3At2A>
    <xmx:V7AWastuN5_2ELbFtNpIH70ZzgrFpb0t9iY9x0yLMHnC19d85duDhA>
    <xmx:V7AWagPfC0jmGS8qG8FPPiOd6aq6qAcSaeJ6vwhJBVtoo7uQM5jhZQ>
    <xmx:V7AWapiG4rowdLy2ygLBAH0ZSYAi4J3KCoIQDQpReP3JXdbcoocFpg>
    <xmx:V7AWanYXx-BXzyV9YzK7LNsJ4RPUMc5sHfy74X-IZ7eqsvWD709qkgIc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 31477182007A; Wed, 27 May 2026 04:50:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Ap3K6gjQ-9OJ
Date: Wed, 27 May 2026 10:50:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Maxime Ripard" <mripard@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>
Cc: "Drew Fustini" <fustini@kernel.org>, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev, "Andrew Davis" <afd@ti.com>
Message-Id: <422d7885-67bf-485b-b2fc-f0604a2213db@app.fastmail.com>
In-Reply-To: <20260527084135.842736-1-mripard@kernel.org>
References: <20260527084135.842736-1-mripard@kernel.org>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable dma-buf heaps
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, May 27, 2026, at 10:41, Maxime Ripard wrote:
> Now that the system and CMA heaps can be built as modules, enable both
> as modules in the arm multi_v7_defconfig.
>
> Suggested-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

I'd like to wait until we have resolved the build regression
from the earlier patch[1][2]. I don't have a strong opinion on how
to resolve it, but at least for now Christoph is asking to have
your change reverted.

[1] https://lore.kernel.org/all/ahPqbfH54R3JJyaV@infradead.org/
[2] https://lore.kernel.org/all/eebe442e-eb5e-40db-b07a-f446c8f7c8db@kernel.org/

     Arnd
