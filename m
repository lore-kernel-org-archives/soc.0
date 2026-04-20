Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0092835F5F2
	for <soc@lists.linux.dev>; Mon, 20 Apr 2026 14:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693958; cv=none; b=NW9N5PSbbVCHQXAAOPlNGXBkTQ0dzJFd9zVEDT0dS3oAVv+eQ4SNKWMR1yf57Zz/XMIZEfjbM5waMENhnquht7u1BRCPWxUD4Z8xL1afxK+Z3br72BwAN3lyxw7kQ0evXrCEOQ+HXigARnPIQOHDGKoQrrfLJP6pz4nIZn3rmQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693958; c=relaxed/simple;
	bh=QAwupXvswKi0i6idD00xekBtVM14c9yZdmAI9K+opHw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=T8UYSwcFYsxe66meQB4DuBgeGGjbXtNX9/i0GkGMo9LwCoMFNBZbOH/1eGJWNtLKDoew4BLoQtFytW4RH+6Vh9GNju4Th0PHz/1qe7s+hISOWGp/tdsJvmRy+HgEPkWTTDIfi1DO5dw8JUuiuIdVy5WxVmtLqpGmYYGwNJg3MCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pQiPoimt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pQiPoimt"
Received: by smtp.kernel.org (Postfix)
	id A3192C2BCB6; Mon, 20 Apr 2026 14:05:57 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E72FC19425;
	Mon, 20 Apr 2026 14:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E72FC19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 508CFC5C997;
	Mon, 20 Apr 2026 14:06:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EAD05FFA5;
	Mon, 20 Apr 2026 14:05:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D831D104609B0;
	Mon, 20 Apr 2026 16:05:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776693952; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/mj8RAP9/uofykJIdVLa13LaWWUYKPuyG+u16lfjWh4=;
	b=pQiPoimtg6qTaag9BcjlaMczteF6DEA8IoDnUWB7NIclufHoCNSD0R4oQG0Zh5NL+WuZEA
	iajliuAqic0sAA1X8q/g4FEFzdJjskYVDeyH60UWuuFw1rnndOU7AAUCsKK7V8+HErGW7t
	aQv9FlgwYpJtba4/s2MF0F+SwP6WfiaPuCI9uiz3skDP190p2QPAr0lMhykXaaD1/oPIhq
	I/9e2yA/IxnsTwrNbZae5EwaIsd/JJq9O9Q1hAy+qoNnXZrfuqc5679z1HWayG4N6rhZtW
	mDMCMzWP9l9nW8XfwX8JDe+WSVELP6VS7thbv400ohavmqdYWNGj1C6Gs/rujg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, Andrew
 Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.1 (#1)
In-Reply-To: <20260414-nifty-conscious-fox-973b65@quoll>
References: <87cy072bho.fsf@BLaptop.bootlin.com>
 <20260414-nifty-conscious-fox-973b65@quoll>
Date: Mon, 20 Apr 2026 16:05:50 +0200
Message-ID: <87mryxrakh.fsf@BLaptop.bootlin.com>
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

> On Fri, Apr 10, 2026 at 03:25:39PM +0200, Gregory CLEMENT wrote:
>> Hi,
>>=20
>> Here is the first pull request for dt64 for mvebu for v7.1.
>>=20
>> Gregory
>>=20
>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f=
27f:
>>=20
>>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>=20
>> are available in the Git repository at:
>>=20
>>   git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/=
mvebu-dt64-7.1-1
>>=20
>> for you to fetch changes up to 00e6d608fe80b0f68c325cb46862f78e9a8ec768:
>>=20
>>   arm64: dts: marvell: armada-37xx: swap PHYs' order in USB3 controller =
node (2026-04-09 10:14:40 +0200)
>>=20
>> ----------------------------------------------------------------
>> mvebu dt64 for 7.1 (part 1)
>
> This was sent just 2 days before merge window open, thus I applied it as
> late branch.


Thanks for finally merging it.

Gregory

>
> Best regards,
> Krzysztof
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
