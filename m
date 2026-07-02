Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA153264A9D
	for <soc@lists.linux.dev>; Thu,  2 Jul 2026 13:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000167; cv=none; b=P/tqKxo8SXmUOZYvHV83DSWdMqO6RlAjhfAHxsNMaK+5IwXuiOnuvhSeRvMXL3xaI3mwhDKZujDhdYG2s2sEHQJVHW0pyZKJ0vMeazugkvzCxK7MLvY7yYqv1sBcoj6M2dIjakd45W7uoILG8e/FehZnM/Or2ImPpr3E8KCSt0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000167; c=relaxed/simple;
	bh=pXrtFx0FT+qt0diHV8hgxBuEqDMlbfO5DuMlh8WeaWw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gXgHvpXfb2FJAsWV40vwP3coQ9aWqoG+9W0ae7YJwfU4t2T6olzGy5gArS6+sRYkDXOaQHSoV6uAGrU+P07oYn0FFyxdTwvWkpwLJFSS4qGpYGMUmBNNgHRrMB+tH7gnRcNZEBJiHrF3A/cjOro1j5tVm12csAlDAadc3dT5MU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=RfxLj7Nc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EHv02WVm; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="RfxLj7Nc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EHv02WVm"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 1B7CBEC01A9;
	Thu,  2 Jul 2026 09:49:25 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 02 Jul 2026 09:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783000165;
	 x=1783086565; bh=s0qhwNl8Ti7/+PwPxJQG47LfuEzLVphs4ZT5l2JYVBg=; b=
	RfxLj7NcmAzl7mfYDbGMdp3IOFyLmhhvp8OkYXOBFgbccAzcqb+QfHWfDcA+1QVa
	06wtSgX6LWO8V1m2yPAkiIZbNuQyAxWkt2afRfn8zp9LRn9qOLhPwVigSlRl5PSA
	Oe5ux8Ju/h+qGp2UgXP09+RRFZZZasEfUBMiYPlt64Z47JKrbpLoy8f21II66NVc
	825v+UMws0SrHnbTEHmQ0LgAaGVQx3ZSowGrSwVTXrFkrPdautqE6ncJh77arosV
	tgPooiLtmX+Uny3e0S8EZ5Lfu9aP2nRSU97TnhY4kalcY2kjrL1plRBTXj0ofQa7
	o5zE76UCAo/DZ/w5Od5WoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783000165; x=
	1783086565; bh=s0qhwNl8Ti7/+PwPxJQG47LfuEzLVphs4ZT5l2JYVBg=; b=E
	Hv02WVmWKPGJ4iQGs/semYJXPz+0ajOJ5zXcB+QIqXhlBH88yW/A68GofZwEQX2J
	0Pj3rZYuMRjMztHg+vip+yVDtUE59ye5pA2USRovqkSrRo3GQ5QioJwuE7rHPgb9
	pnFiHqr0iE1gtj/RIBIbf7cyZxqdt5HymrF+ZVZAb0PYBUq30iEXPeVA2+frjUm/
	UMeLDMloeWMyU4lLDgPfAffuM6H9o2X8qeN27123d/DMI04Lz+4fUbYdCRQM4yLD
	FkddA9yEUeBJk9UPxDNGIiT1haBtJp6yiG8TTyocu1AJNSlcOCyVG5Pq1nUWa84M
	ChzFy7cVzLCga1vAPtOKQ==
X-ME-Sender: <xms:YGxGaqY4jvCggJyXt3tN3p21nYw8L-JbKFMn16xKRdM7JKMbZRn-jA>
    <xme:YGxGaoMWCjwKYV09MpAUvJpe8YVap_AV1L4Tcsn79PSOO91cFlOmEIjtnt7sKu6G0
    wzzXdWpnVxtAnqQDkpLeUuBrkSw035d5P5i5xgtbpCPO4q32o30ObQ>
X-ME-Proxy-Cause: dmFkZTEOx1CG+3Lucry0wYcMqSOqV+ylcgCjt+9E5QrzG0j5axr50UlMYJ0ar0deYl+kIe
    OYMASixdZaOwVrGfrHD1ZovcRUIeNiPCnti1MXqMwO6n+t939K5eorJCWKuGHO7q9EBfEb
    a+6ZL6dLd9jl/R8tae8AlP23rbJpGw+93qRZshPuhYfxdXJAL5EwAwQecijNYFS5gNp1Tr
    tSGQZFl21b0JfEQgBKiofkwlxwtYpkGfQ/mfH6tPim2h52zXVU8trwqIIyHhe8JH2CgN/X
    0Z/YGFUyg4xTmfbe5tjfb2g4uCQm6jfsuLHMzUr8vxAHRoCZDqr4wyvmr+kM2midKmKLW8
    qhbzZWRAlxMdUEr/QnWimAJngJhosdaM23VyuctJGyII2pCd5Q/nolS77P37OD0WnCvLPj
    TwxxjEhp2FboNjLqk13zLqa7P9MdAK6wB5LSVR7DF1ySaQF+KNb3CZMwm6+avI+vphLEDX
    5R6DsqbeIb9utiNP6/zOob8QQBz5aBTeVwoQawnaOcWelIvLsSkSqBrOQ+HnRzHtOyzUPy
    c0KtBXT5kh0BaoMTrvYTi70bjdB9YQKulYauZcjQ1E3MxYxyGUhtCF0grdv+lcyX45NpSJ
    6gx6Dyl5+la72Lu9LW76fIWJxnYycWZIdyc0cTMYXnVTbIgVydcUzP4dNXAg
X-ME-Proxy: <xmx:YGxGalwktcZP-iPMemPMOvoFRC9sc4T1K31iSqKBGANQSMcrrm5Yvw>
    <xmx:YGxGarlrBDqRAb17XNpShh6cPTJT6UjF405KxQNmBNGRhABinajpKA>
    <xmx:YGxGalWJwlrCqn5NbsrHBNq2a_XA7r2tZ6RudFaUtCBUkgEFv0oIRA>
    <xmx:YGxGak14jxtoZXIjGOfW6WwJQVDUhYm60zRSewWQu9rY8-0tYGL78Q>
    <xmx:ZWxGamI7jum-I3CinoiO5DRrkv7Yd91HMyrwgJ3AVp6J9_DB6vQQOux0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A04F6182007E; Thu,  2 Jul 2026 09:49:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ADtf3HBnvRk-
Date: Thu, 02 Jul 2026 15:49:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Andrew Lunn" <andrew@lunn.ch>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Daniel Mack" <daniel@zonque.org>,
 "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Frank Li" <Frank.Li@nxp.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 "Kristoffer Ericson" <kristoffer.ericson@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Linus Walleij" <linusw@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Ralph Siemsen" <ralph.siemsen@linaro.org>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Russell King" <linux@armlinux.org.uk>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Stefan Agner" <stefan@agner.ch>,
 "Stefan Wiehler" <stefan.wiehler@nokia.com>,
 "Tony Lindgren" <tony@atomide.com>, "Vladimir Zapolskiy" <vz@mleia.com>,
 "Will Deacon" <will@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>
Message-Id: <2e7d9365-ba32-4871-aacb-c72c3adddfbe@app.fastmail.com>
In-Reply-To: <202607021346368633bfa6@mail.local>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-4-arnd@kernel.org>
 <202607021346368633bfa6@mail.local>
Subject: Re: [PATCH v2 03/19] ARM: rework ARM11 CPU selection logic
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jul 2, 2026, at 15:46, Alexandre Belloni wrote:
> On 01/07/2026 23:23:37+0200, Arnd Bergmann wrote:
>> 
>> To my knowledge, none of these have any actual users aside from
>> reference boards being used more easily test the platforms.
>
> There is a missing "to" in this sentence ;)

Fixed, thanks!

      Arnd
