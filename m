Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F7D46EF92
	for <soc@lists.linux.dev>; Fri,  9 Oct 2026 14:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556526; cv=pass; b=ncWgD5QTRV/SfN0skKUvojWcCPZKgrPzZGe71CWWn8x0JDtfNn6/mDYmNFUjMwqdEHlK7nTC9FHsUZ5qv+u5dc9Gf/sPyLxCnon06pYoWpKgY6imgV6XIKzd2nK04Pc73pMIIYspFrg8kTxUjdm5CUEpEr/SkEf3b4UOowvcdW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556526; c=relaxed/simple;
	bh=UnsLEH4QCzdtJL20xPP0hKPmfusPEwPrRKkP+07FlDY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ehjH9bhLPJ8j8yqLLdNHG5f+UcVIzTG4izHSlgH+bc9qFx3Ym2fSjyqSNZg5XqL2FtkpJuV0xhQd02Noj2W1sqiLiyx7VL0m831bvTzob8jpr0hG9eJZ10cHOlxL6Hi02Ha8fjDbIs/18ucHfhGYNSIDdy+QctWIzG4NdLT3V5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qQPUp+Vk; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qQPUp+Vk"
Received: by smtp.kernel.org (Postfix)
	id ABB4E1F00893; Fri,  9 Oct 2026 14:35:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791556523;
	b=rgITAVgCuesmoYhp3And/gM+zi37rBJH0qvM16h2o8VvudVzfdAv3DbQJm4WU6LNiF87
	 oLw9XgjVuRyu2J8yKctmU8BFAffaqe70vOpXqK8UVWIBZ96MQ9L+qZJNR5boZ70CbZhC7
	 hIWik0JpbmeP52pJxhluN/NXT+R0e9d/LaETWy/0EMvgzozY2evOAj9MeoQcxr8bI2TUi
	 ceTCVZwEsoyQnBakDLmsJw4MgaNrSRORnAQWSLFDkW434m1QKnaA7DNPV6SUfl1J0Cd+B
	 IzJOsJsB+1iHQlRxfNBwMTyXYcQiEs7l4/CE5ySdrmV9liX2hJ50ZFBPoUk8HZaiCsA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791556523;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=5JzFqGxHzHN5rnVUak2+jKVigs7VEUnyyVH0rb7Zh1U=;
	b=qCoR2UoF0ZCR216oWiub0RpGm1ubZqqVRRXo/eQvTfnYJVoDd0FahXznuziMfvZDDjIQ
	 LURtc2n3n0dOeG8TD47AKSIlxUnIPpfpS8N/I8kEFpgfZNuJdC8qYeJClMwz7NAeDJ3oc
	 7LCsnpPkaAioOG2euQSLV9edDPVq3AFFydhNJELIRyzEt81RuIaYKdzqP5iUybyZE+vHr
	 ZI+YXtqA94eGbjpqAyEY/2lZYCIvNa7EyFMJKMUHi1e8UavpfdyjMDi7zoE89iPkbZK9U
	 tdDTiPBSKfj6K1bxduHAfV9wr43oTvvwWul+I0EGwrEuCkN6qZDTARrE2xAkz7Xr5vg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qQPUp+Vk;
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8396E1F000FF;
	Fri,  9 Oct 2026 14:35:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qQPUp+Vk
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8396E1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C6F631A119F;
	Fri,  9 Oct 2026 14:35:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9469760754;
	Fri,  9 Oct 2026 14:35:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F5D311D70889;
	Fri,  9 Oct 2026 16:35:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791556519; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5JzFqGxHzHN5rnVUak2+jKVigs7VEUnyyVH0rb7Zh1U=;
	b=qQPUp+VkdyzkWric8+3zSygpFsJEGXCyZhN8KuajXk+ByGp44gj+AnaXF0J3j1iGyLykif
	eFPkKQ9ZnwKfIK0We7I/nWcv/zWEogQC2poENVKbRP90YIuuJSs6NkdKMcIroeEzkq3lj4
	W82rKlR6/9eh3TcyQMM62W2vqfHTvr1K/lmviyrEZXBGYz2aEvumhFcdKqHWkfeGupPhMa
	eKWbCqYZlkUDUFheN33SzN5cIq/8r5tuG4Lk84ppfrOd9/WVaMMlgxcExf1xlOOirLdcrB
	Sl/W3lkNM174RlN6BJ6NuuFFDeMPDiJUMC2myawm9ei3AurF03U+XGPr9nouEQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: dt for v7.4 (#1)
In-Reply-To: <28ced1ee-b0e0-49a9-a414-0b1e6eeb28fa@kernel.org>
References: <87o6d96w7w.fsf@BLaptop.bootlin.com>
 <b2e182bc-6707-4147-bc04-fba3c379160f@kernel.org>
 <28ced1ee-b0e0-49a9-a414-0b1e6eeb28fa@kernel.org>
Date: Fri, 09 Oct 2026 16:35:15 +0200
Message-ID: <87y0c754d8.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Krzysztof,

> On 09/10/2026 09:21, Krzysztof Kozlowski wrote:
>> On 04/10/2026 22:34, Gregory CLEMENT wrote:
>>> ----------------------------------------------------------------
>>> Krzysztof Kozlowski (1):
>>>       ARM: dts: marvell: Replace spaces indentation with tabs
>>>
>>> Rosen Penev (10):
>>>       ARM: dts: helios4: fix lm75 supply name
>>>       ARM: dts: armada-385-clearfog-gtr: fix vmmc property name
>>>       ARM: dts: marvell: add missing SDHCI clock-names
>>>       ARM: dts: armada-395-gp: drop unsupported SDHCI clock-frequency
>>>       ARM: dts: armada-388-helios4: fix vmmc property name
>>>       ARM: dts: helios4: fix vbus-supply for USB2 PHY
>>>       ARM: dts: helios4: fix spi1 location
>>>       ARM: dts: helios4: use national,lm75 compatible
>>>       ARM: dts: helios4: add #phy-cells to USB nop phys
>>>       ARM: dts: marvell: armada-388: use onnn,pca9655 compatible
>>=20
>> Your pull introduces new warnings for undocumented compatibles:
>>=20
>> https://lore.kernel.org/all/202610021617.AlVUa9No-lkp@intel.com/

Is it OK to resubmitted a PR without the patch introducing the error ?

>>=20
>
> And I found the binding patch which is not right (which was pointed out
> at v1 but never responded to), so neither is DTS change.

I finally found what you refereed;
https://lore.kernel.org/all/20260907-unnamable-geography-d04f61df0fe5@spud/

I was not in CC for this one, and indeed when applying the patch I only
checked that the driver supports the compatible string, I wrongly
assumed that if the driver support it then the binding was already
merged. Sorry for the mess.

Regards,

Gregory

>
> Best regards,
> Krzysztof

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
