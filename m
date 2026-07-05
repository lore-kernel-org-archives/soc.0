Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DA6352002
	for <soc@lists.linux.dev>; Sun,  5 Jul 2026 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783244118; cv=none; b=U/MK5GOnHrHcTRdDsIrWeMSlMwkvjkQiqA2Ot/DgSN0NVR9tFMuJ2XVbWenSHvKmBNjUF0W9r7stnS/OsMKrRlRyfiMLivBqP594j1nugLWplEPG1COHYhWQ3VDnzkp+qEMxrgctoAZUbTp2oRRyE1pzU1UmDIUFbWGM1KVAVgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783244118; c=relaxed/simple;
	bh=gdqUHQnR7XIG4b+MDJDzBsIPr1r8YsRaWdrKPKoZfko=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RVTBvJhkWXzgwY/wqIAfFZwR8XKCgNig9tEaKjQrprnMINvLPKZWrCta7OKIZoKNBSOSLebfry8w1PY5TbNw9K7Qo/yGfeNGHE2PqQMGrRB+c3BIhVghEjNlphxYpx++PLZECTzsK84CHW/ZPWrmrHEGrUEeUPOwbmBLCqLPeSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=AE5jLDrw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LFw15hzs; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="AE5jLDrw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LFw15hzs"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A8EC214000E2;
	Sun,  5 Jul 2026 05:35:15 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Sun, 05 Jul 2026 05:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783244115;
	 x=1783330515; bh=LSMTXVruDIRjjnXmceDngK0jOBafJI+Ml0R1gPtkUcI=; b=
	AE5jLDrwbHf+vRixt4gAnNacgHEDARWAOZnsZ1ybgvxkGM5HwMd3u6pOFDScyrQ6
	SDvx5ef/5/XjVz1aR/gzt7lZz3UpXmbdkHt1Fivj1Mc58ni+y4jELUcQI8i8pXJY
	qyVDFffKv+KnVRvyhdwGDnB3qO+2WrOv2GFsi768gCaJcvtKGBM1H4CHE+yDN+76
	MdC5nBPbr6wLjTrAM8iFYbULVwavCs/b92bfWM9uJXlcsHI2Bk8R9bD3k1DSX7af
	oKIFQpZJVTW5fa7z7R9Nb0ZdYp/ReouxShD/8N8G/ZYX3y5K3By2vTke+xVqaczu
	hs+vzucaa7qgQbVDjrExRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783244115; x=
	1783330515; bh=LSMTXVruDIRjjnXmceDngK0jOBafJI+Ml0R1gPtkUcI=; b=L
	Fw15hzssiDDgxmbJwsv1SZzPFmqFSTUJukSFOGvIKx/YB79hixV+qt/9uawmgJRA
	tAWCTDjWd9VW9P9eP0UKy/8OmVmgTEqz14PMNBDZSBxyXoqiFgLw17dzlwTWQXuq
	VlIfUn1DqNdapJAX47T7q8QpFZOBMNNHZ7DqqDoRYtT8kSLkN5LrYgNMIuFIvfA8
	kHl9W/zCRCBGcESMfcVdaHh3JzwxO7xO2CwfVqiATQk+DAd08kvyF3etuXmaPtCo
	Iy8TNH4R2IT8zXuySunpmQhvU2pNM1Fs3u2dbMUCVltitbgPqnfeDn+p5fdCHwNX
	M1lv+OIGrmVsVLBuw19Ig==
X-ME-Sender: <xms:UiVKahnHnDInyNSB3OZZRYqhQoouplTV3MSja4rXzb6TJC4Jd1UvFA>
    <xme:UiVKanoPPHweIZfqqLy2IB1geEPY27qCaVwo5m_uoMkocpmJoaMaCsRGu1dHFdjsx
    Z_2I6pQuJkwuh9qusNPP8zK_9iAHaXl0ChL53oXmGITAXgMg6OD4TqW>
X-ME-Proxy-Cause: dmFkZTF3pnwFZPirFYTFt8PAub3hCi9T3P7hmDxFcXyeP15oLDFgTlcs9QGPjThyW6zZga
    tVI9vbe6pbo0MOCfo2i/53HFVfSJ0e2NweFXqtPTlAoyPQ3mvF+tliJ6/XLoRO+24qpPxA
    GEDwzgYX5UKBJSxg3f0XB8wb3A/ptnESl1EkF4/5jRBKtAQR1Jjk/+bIlPvzTH1/hMfJa+
    TSK6OCibcG4ScnCREQppL5oFfDT09wB++iTu5oR37hBNo+u7gNLfmKl63M1dGobJIdOQWE
    QHbFohEssvH+oL63OFT3mvliLOiae2cc0hYm+w7nvNZgFOkXeofSg72M8GDeZDiTSNn/Qi
    DfhxTM/wCzid4wa+faTSZBjx1KT9W7UWJZ+AeqmvGVKt/gVaOnPVdKoebtlFZyIhfqKbcl
    AQ+lFBsM93dvn1Fnogl/kELNts5Xnls29tOr2BJS2Z8qJfhL/j+mtgwL/Beb8le52cMwdr
    zSyjCaDGdGcVW27YAfEB4D+Qhfpf6yR+poCPEXiHHqhG13ormKRzyMK4h5NUT/rNg/O4XK
    c9OCguadSE0IZvJ+R1g5MqjZSphTXnqs5hBd1cDpxRn03KDdfZs/WrMq/bTaNFCzjsI3MO
    D0vW0+qSJaXs0tHEdKhrr04UTxl3Fi/VXzb6c8lF1BpwjovRvofM2oiByStw
X-ME-Proxy: <xmx:UiVKapgx8ntcP7YeJwT7bRQMnuIcMuQCG3FK2ZTqlx6-5BaZ9jY5tA>
    <xmx:UiVKakYsODm2R4KRU697r2dI-kJvLWxQdH8Eccymr-F_j17MrhxnJg>
    <xmx:UiVKalXfKdamc6WoRWk3US8en4yflN2lG7VeIjiaIkXPzXUgbqkgYA>
    <xmx:UiVKasEURMyjItbiVhTuFnBuBC99alvkAmLlQNCtR2WAhjWktotZbQ>
    <xmx:UyVKarGhdiznsWF-IMVqWaTxDMsqK3bDhCcoyVjTBxMLTjbVxYiZQEpk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1453F1820086; Sun,  5 Jul 2026 05:35:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ARgniXuJ1PtZ
Date: Sun, 05 Jul 2026 11:34:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>
Cc: "Drew Fustini" <fustini@kernel.org>, soc@lists.linux.dev,
 "Imre Kaloz" <kaloz@openwrt.org>, "Russell King" <linux@armlinux.org.uk>,
 "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <d5ded362-abe4-4e6b-9585-a2a75dba27a7@app.fastmail.com>
In-Reply-To: <20260705085000.3510576-2-u.kleine-koenig@baylibre.com>
References: <20260705085000.3510576-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] ARM: Don't let ARMv5 platforms select USE_OF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026, at 10:50, Uwe Kleine-K=C3=B6nig (The Capable Hub) w=
rote:
> USE_OF is already selected by ARM (unless ARCH_FOOTBRIDGE || ARCH_RPC =
||
> ARCH_SA1100; these all conflict with ARCH_MULTI_V5). So there is no ne=
ed
> for an explicit select and it can be dropped.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koeni=
g@baylibre.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

> ---
> Hello,
>
> If I should split this patch by mach-*, tell me, but I think it's simp=
le
> enough and these architectures don't move much, so getting this in via
> armsoc should be fine?!

Hi Uwe,

I'd prefer it as a combined patch, but either way is fine with me.

Please send this to soc@lists.linux.dev in a few days with any
Acks you have received by then.

     Arnd
