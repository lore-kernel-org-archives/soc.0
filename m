Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466661DE3C2
	for <soc@lists.linux.dev>; Wed,  6 Nov 2024 10:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730890400; cv=none; b=JsBszxHFjGQIZXsFqMFq0RgOfxFuD8+wtQHN5NqMe8XZhEp6N/cW8BeS04xBQVT08QT3vSFI9cxG994N1FKD4odsB3hZQ+f4LPk3M4lx/IjIFyPqGEx6R+2czWfBA4GCzv8VG3vxwMJJC6OlPp+72Go5AbqZy2l9OaxgKVa4jAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730890400; c=relaxed/simple;
	bh=5PHI4fPaMZ58YGXZOlVUlk2Z8m0C506quXMMgauBu/8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tQM36PG1DKqpvXN2nja8YOQi1dYRu6SIwm6A1qHRcCiyFj8XPOr4GTtPsfXIgYoRyNGuEWiiDN7ynfeyiAkI69aJWULfbDN8AnV8ZijSBXHCmJbE8LL6VKRP1m6r78dF5CRdhZvdUTkP7CXFDnm6w9bhAKTF05q8S+GJU1DeyMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VF2UhJsT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VF2UhJsT"
Received: by smtp.kernel.org (Postfix)
	id F0AD7C4AF0B; Wed,  6 Nov 2024 10:53:19 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D85CC4CECD;
	Wed,  6 Nov 2024 10:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5D85CC4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18CC4240002;
	Wed,  6 Nov 2024 10:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730890390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j480Ld0gUMh0K3CHAhi0RY/yU5j2pbiXxo67wU5UQ7c=;
	b=VF2UhJsTwUI53MhfXbHVKdTByUSYaNT3JHKD1+OVTTLQSG+fqFS0b7b7J1K1GNE9jfTiRU
	TySuIorlpETcGEMQ20f+ltX2ywlwKDtAtnGBricFogGuoYUT9fYZc2hEux33Ev0RoMTE+k
	NB2odWNfJ8uz4SucgD6aD9VBsAsEHmWnbCginvGjMB6tS0G3r1dcEnU0naBvBxLbP+tIVN
	xE1K0ap6nxtsLF0BoxFyPyFx1HxavpFHIj32EFBBaplh+H0A/cu8nH27BD/h2uyNIUk+OI
	2jmNxRoqfVJdGRHh6vIaHuu7HkoZnLfrCNZvMWUiy8UGi69aCEv/dQEuaP03WA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Lee Jones <lee@kernel.org>, Marek =?utf-8?Q?Beh=C3=BAn?=
 <kabel@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Andy Shevchenko
 <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?Q?J?=
 =?utf-8?Q?=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v5 01/12] turris-omnia-mcu-interface.h: Move
 command execution function to global header
In-Reply-To: <20241106102840.GN1807686@google.com>
References: <20241104141924.18816-1-kabel@kernel.org>
 <20241104141924.18816-2-kabel@kernel.org>
 <20241106102840.GN1807686@google.com>
Date: Wed, 06 Nov 2024 11:53:08 +0100
Message-ID: <87msic8wh7.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Lee Jones <lee@kernel.org> writes:

> On Mon, 04 Nov 2024, Marek Beh=C3=BAn wrote:
>
>> Move the command execution functions from the turris-omnia-mcu platform
>> driver private header to the global turris-omnia-mcu-interface.h header,
>> so that they can be used by the LED driver.
>>=20
>> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
>> ---
>>  .../platform/cznic/turris-omnia-mcu-base.c    |   1 +
>>  drivers/platform/cznic/turris-omnia-mcu.h     | 130 -----------------
>>  include/linux/turris-omnia-mcu-interface.h    | 136 +++++++++++++++++-
>>  3 files changed, 136 insertions(+), 131 deletions(-)
>
> Who needs to Ack this for me to take it via the LED tree?

Usually, it's Arnd who takes these patches, so it could be him who needs
to acknowledge them. However, Marek is the maintainer of this driver, so
I think it's already okay for you to take it.


Gregory

>
> --=20
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
