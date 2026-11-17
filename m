Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921516;
	b=qCuH1tMxl3VopofVj/e6QtlJrcPdfPjwngWLq4vs4p+EDNJltwFRNTk7u58iLFeJ8tlC
	 MkLZx1h6sJtDIbkgQK0GTtydZzEbgcSWYq9sDKK8Dx2hOMXuAwTfV8i5uDdC7q8puu3dG
	 1CLiAS7usbW87wjpCSHfc58058ulIkAQHNu7XoRJW0NVHabAuv+20zfQtMIngIgdUx3Ab
	 N2R+J+USWKTWnWeJhT70pAv0m3ZSYM5ntdvc1LkjAKi5uNkK2zKEOtRV2aguPr3XWRbzS
	 +N0SJ4ooYwougrRF3bqlPRug+mOXmPgvjrM5b3KanM2qLrDHXKe9nSAW2/2yCTdqbcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921516;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=X5Rz2Ygap5kebIv8LKY3vVFeHVyc95pMyChBqQQNkts=;
	b=XLyRTmsIQiGlx15vrVc9vRDPuUpsxVCIS/mdOmX9bJETa9YIMVrA7hem9D5pSsrXA4fP
	 Srfqlb0l8cl2UXynrOrRrmazZiEKkTvlTFYBNoCogRua3+qtWMv1lVLgFkR+4B4I8TbHK
	 QpVdExY1ilUy6W17f2k4exTUz4OVEm92/B0KDP8jJz1mbF9PXu5KBO5qDdgzdNItyg7kB
	 PlJpcUsImyjski/qhTSgpTk2F/2T07lbPAcaODo6cEvIPNfTgambntx3DqnA2j1aTxCSs
	 9JD2zFAn17w5OKbMctBH9WX4KWZSCbk+f521bqTrU/JF+flfTvajGXhBXMw+KhQIUIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=WKdnVgri;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rl5FsS4I;
	arc=none smtp.remote-ip=103.168.172.138
Received: from flow-a3-smtp.messagingengine.com (flow-a3-smtp.messagingengine.com [103.168.172.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CD3606A31C
	for <soc@lists.linux.dev>; Tue, 17 Nov 2026 13:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1CD3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=WKdnVgri;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rl5FsS4I
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.phl.internal (Postfix) with ESMTP id DF7CD1381C20
	for <soc@lists.linux.dev>; Tue, 17 Nov 2026 08:18:34 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 17 Nov 2026 08:18:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794921506;
	 x=1794928706; bh=X5Rz2Ygap5kebIv8LKY3vVFeHVyc95pMyChBqQQNkts=; b=
	WKdnVgriXweWZY4U1+3kve1Va7e1M/Pj8ATLzphElORes34pUpLyH3bHbrZCHO0n
	wsBP+6b9ZTG66/Fk9E3ETVSXuyxFZ8YnxzVpLnBDzwhG3GSn72tl2ifD3mZ7ZTEG
	n0MI3+tzPkoeKfW/aPsBUfAj8ujAwEihGOVYWBk6FieNHgSSycXFOKmi9sjcssvA
	vbxwQ1i6ZI07uaDP+nsNxSWKv/2STM6+kICF07pu01ESt7hNLjIQyP+Gu3AlmmsL
	7sj+zajL/M/eLzJM4B8lOCPzpzCv2dwkUckoGi9zvoCiEKK/A9PxsLowBvsKMXXt
	m9dNjTVqFyeEq6zOz4R0AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794921506; x=
	1794928706; bh=X5Rz2Ygap5kebIv8LKY3vVFeHVyc95pMyChBqQQNkts=; b=r
	l5FsS4IDuyP752/h1Jb6fS61PRMZoiCuMXTKa3VYNVTdykFf5oSzlx1fTq9Mne+z
	tswNEnclYS+YFaCJZwxUyUlUGB+K3XNfya/YoGUwnBtBbt0/ASY2d+8VGdapj1Qa
	VIJ4t9qv8XXWj2Wt0AHdQiIEM4asJ3irmDiwbfjcTivM3PecnjnCa/zXV3rMmz+1
	piik4/axMNMt6+lY9/RXFrYr1s5OVgj5Ds8ZSK+ocG1Nag1ZSfqQbyfkxsa9sgq0
	9ONmtzN+cRmqoqNtUn0kQAq9yX3XvCBdKbBV1URJVneUr1JK6VPo8n0gn9EqMLzb
	ZnxuKQoj+gmZH6yuK/Dgw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794921506; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PHNvY0BsaXN0cy5saW51eC5kZXY+;
	s=fm2:rsa-sha256:PbkanQ6yklpKWe5+CTXVzXBsDOYjJjb3GORTcS2HX3hsOwv
	TQ6Fw3wnPwoVMj5H5mqrXFGqL66GDzD1WRGA1/Q89t79VYkrZ/Sy4GQz1rDXThwy
	LbOKM1/gKCSdqBmma00xvB8jkQ6w4FDtRzB4icRGSLfT279IIhfPFoBi3UFWjmK/
	BMEGKUrcn/xwka/8y/KPzQsxwylS7RM8D6jSk1wyhQjjpafDorzjmo1Lnw/3EBfj
	q4hk7eHgeU+71Syy6siEIAXKfMvzIlrbn1WAWCf6vUS9c5hy2Gx4oJIlmFsZIr90
	uJxvKnJ+P9JH3SZlstmWRJa+WQvQDvyLgd8W7FQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:E4p+jgEjA6z4YOh+zG8xI2+TIk/z5V7O3REzuJQl8e0=:s3MaRm4deGZPyFhIC/OTW6d1TxrbpBC2jMCuDZt0O64=;
X-ME-Sender: <xms:G1T8akqR9LXxK17B3VNCjPaUZv57ob7Yn46_dzb14CXweKQFfcsvSw>
    <xme:G1T8alcscSthCjjkEkXgL3qIRo-bMunpt4OBXbN78KGGfcuTDxoOWm0DixukFZnAB
    3jwegdzC0Na_olzE9jxlu50q8T7-2oo-ZplwiPDT5uLUjQ65k0u1q9j>
X-ME-Proxy-Cause: dmFkZTGybI4vNsfJtZzIBSKeQUH0Qakpa4RCkhFfnaLfC6yUDA+d0FhnQKXWZPDy/kj75y
    /NHXCGCkIIRkpWzs7V9nOux+5xMy4D//gORpgKSuDZagCYoHdROAEolXCtxYlk0V1qzgQ7
    tcyU5IV832OfArLFKi2C/fRZinN6cp9vGaENPPMTnNQB1tBH54th32q6znhW6538GoSMEE
    EhVz6USd1rgWFhLy5dx+8gopg3Q2n02hhp9Ut/26LIFIBBrr6XDaNrQr3uc7JLxPG1YIcm
    CXvYq72ZJ4TSsSUhaxEqTJ4r5trqsjQG41MN2FyVjBHM4jh7jdH8iSN98sq8Kket5g8KTq
    KPawFUnDmboDkfTjXA1nO+6db8zom9yA7ww/NF516/xY8wRTARG4qPKmjfyMlz5FZzA4+a
    UmK8pc0Ig7ijBU+s+TdVHbSuTD7IF1SFl3/OCRO1wCGCX1MOwhgdWVLrswT1xBdYUb5IZo
    q2MKDq7HBY1HPpvVYhu0TUuc2fFf0gvDTmeNvi4jjM/cWX23SJ0vmGopOyiS+K3gGgeuiH
    JaLkcuenAxN7oIrhjnHLdpKm8HwRus9h/Xb6D/dA3byDadtX8Q5Z2zWcygswz7dG3P6d1U
    aOIqYoTzVsKgm58c6yLw2B2ghJF5wUPpSx0T9gzjYz+50yTWNagB3MCcR8WA
X-ME-Proxy: <xmx:H1T8atf0rCO8nggJRHa3MyNETIrNXBA9ztat274b8BY8M91kpbOlSQ>
    <xmx:H1T8apDGPcEkAr2z3ZJXbIveHkxb4ZSuzFvSStwP3wvf13bTz57KtA>
    <xmx:H1T8anZqVdU-2n1FqALuJcgxj9pguX_xsdvzfQXPKL-6O-W2_l3BxQ>
    <xmx:H1T8ah5fpGKSVyEDLsEzjKY9JbCEw_GPFnc29qLNYFLNdcNn_pni1g>
    <xmx:IlT8ah8jKTg2Mn15xl3Eu9v6m_LkhV9tQB8vZpV-ATMNI6ddq304vKIJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 45C6C32A0099; Tue, 17 Nov 2026 08:18:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AruObr9CcEcw
Date: Tue, 17 Nov 2026 14:17:58 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: yogo.0917.sabu@gmail.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Radu Rendec" <radu@rendec.net>,
 "Ulf Hansson" <ulfh@kernel.org>,
 "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>, "Drew Fustini" <fustini@kernel.org>,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 linux-doc@vger.kernel.org, soc@lists.linux.dev
Message-Id: <c3832ce3-4605-4810-9348-c6fee394fe04@app.fastmail.com>
In-Reply-To: <20261117-at550-rfc-v1-v1-6-5879573cb825@gmail.com>
References: <20261117-at550-rfc-v1-v1-0-5879573cb825@gmail.com>
 <20261117-at550-rfc-v1-v1-6-5879573cb825@gmail.com>
Subject: Re: [PATCH RFC 6/6] ARM: add the SiRF AT550 platform and YPL514si board
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 17, 2026, at 14:06, yy-Local-LLM via B4 Relay wrote:
> From: yy-Local-LLM <yogo.0917.sabu@gmail.com>
>
> Add a minimal DT machine using standard IRQ, timer and simplefb paths.
> Describe the SoC and the firmware-configured YPL514si display. Leave
> usable memory and the divided counter rate for the bootloader to
> populate. Keep optional peripheral nodes disabled until firmware hands
> them over. Disable unvalidated board suspend; limit this board to SD PIO
> at 25 MHz. Document the RAM-boot contract and the missing
> cold-boot/clock-tree support.
>
> Signed-off-by: yy-Local-LLM <yogo.0917.sabu@gmail.com>

Please use a real name for signoff and make sure you understand
the legal meaning of this.

> +config ARCH_AT550
> +	bool "SiRF AT550 platforms"
> +	depends on ARCH_MULTI_V6
> +	select ARM_ERRATA_411920
> +	select AT550_IRQ
> +	select CLKSRC_AT550
> +	select CPU_V6

Which CPU is this specifically? You need to select CPU_ARM1136R0,
CPU_ARM1136R1 or CPU_ARM1176 instead CPU_V6 since b5fdfa208175
("ARM: deprecate support for ARM1136r0").

     Arnd
