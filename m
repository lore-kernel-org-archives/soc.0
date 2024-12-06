Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59821DBB3A
	for <soc@lists.linux.dev>; Fri,  6 Dec 2024 09:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733475910; cv=none; b=V0f/IcOFqIBreKAkCv4nrFeI21P9KkIR9DErJrNRkkoRmZ/9urjFHXuRbL3chYGZVcMA8a6TMmdEJ20/dVcGfOwgUG3ZMp3cWLGJpZsV0dqzhUz1P5w+NP2OaCUmZyYt1OMJQ04xWB3F4i+xeNUxxuZwD3kPbjw8d5T3gDlPgUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733475910; c=relaxed/simple;
	bh=Yr0g3WmQW+IHXu+PjpY2ZQ2+PDu7yU9MPGfZM+h7qLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I0COkSGbsQ6bdVQ1QdzTnEIA/JrzSzWTK0RL8EauV+FMoik6bMQYw9yWAIhXbd/5VIR94+055sGFvifxXLfPeem+1wtyn7Up0zaQxZ46WZ+nPuCFxcKsICbVHcqIHl+w3LwxqPscy5ZrlX1VeEIy6oYmZUCE5Kxp+fAinBcrG6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H83x9wWQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H83x9wWQ"
Received: by smtp.kernel.org (Postfix)
	id 81794C4AF0C; Fri,  6 Dec 2024 09:05:09 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 92701C4CED1;
	Fri,  6 Dec 2024 09:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 92701C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30037784fceso1736621fa.2;
        Fri, 06 Dec 2024 01:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733475907; x=1734080707; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efsIOzc9I0KV4PldJMZIG9pg8gFQONLYL0eK0acbihU=;
        b=H83x9wWQwTnUQKnf7gMwoHfrIdg/lcAoBktsqAL4VVl/NuMSLwaLSg5MTdj7EIwCL+
         bDE60QEC+h7DtiZKemW6hMik++oJj2iYFzWDiapRfn3x8i7MleDBr8CaP6VMJAsvZBJc
         r3AwC3zMgyAETfFTNgSsXB+0pXGMtlWOWH3lgXO47UqVpuXh0/g7LlCBo+sx4lVeofv6
         nhLy7ASq0XK6oKRa7unnyICt5C9Mgk4KtK9aFidROt581WbIQIZ//CKvJvHZ+876zJ0q
         C4rBVymIh6rZ/3rMip0wZjPSQH1+LIrYdXNt9Sce9W5NZQOxglVYJg3Y65TwRgde2tUP
         7UNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733475907; x=1734080707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efsIOzc9I0KV4PldJMZIG9pg8gFQONLYL0eK0acbihU=;
        b=H9j7icWR6MvvuuxEQfRxr+9OvyjOlRa+SeH0qNbc0URVQC+0ls3Cngdz3jphOat0cA
         9Nq6jXGotifLcHpJV2dBR23S2QwbH2LyMgdbFa5Hxs2nnnPd0WCJSQMbOsvVN5ULLh3B
         5NwI+39ec8svPYkyHZ9xo5AKAWjxLdfE3zyVJESXd4+NRKTBkCpGpwi4O1yRrkq38R6m
         LdmH2/aeXDZFZbh9es7jkcQtW6EjQTUl1b/oBNdGuPeKS/3zEu4pmyzlG0XwthrLbbl4
         TNIc3Kjn57bUrQW84Ptz0JMsQ60RVjg5/YWB8cQQJYDceTIGK5ZZCM6pjWtXkze4wLum
         ttNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO8caq5Z/ZGFvm9p6llmMrjs59GwjA/noRaRDCwoIJUzHG3/IGXgkRI8ac8u+HQQlk5zmZ@kernel.org, AJvYcCUSVp6nd2Sv+DAI0oVp/ZAD2jajTZAUOP2ASUzoZRbsJ3z35UR4kJFuRYK1jcLnKAded2Ta@kernel.org, AJvYcCUc0Czi+LmvdC8BSB/EgSXU4P98RBGsBfhqE7wDdo1ZErB2cSNzTX1Hug9NQeTdB8vscthd@kernel.org, AJvYcCUmrcmAUKgm2llgxk/jWu+ABRToD5UQYjnwPVZxTWn27uuSpOqs0bA3e6DE5gferecZWLQK@kernel.org, AJvYcCUoE4gcS4FkEcj/709QHxjmiNk2USGT7Xqzg/PVVBbc401na512vJo2Wc4f6FG6Fe6cyw2auU8=@kernel.org, AJvYcCW0uzXa3ffmlOc7FSHKT8qXPdLRJnifzEylhB7KjssR8LnKmV/UNIi51SIDiTDQtj/a70WJnA==@kernel.org, AJvYcCXCTf/5ZBriRFWJD3A09EysJPmzegsvtiosZjEO1mvA3geBqLQOZglL20sqSQrYJzFeLixsEg==@kernel.org
X-Gm-Message-State: AOJu0YzXL+qcpMCWi4tKiSRJwW6pZzRxFHlHCKF2soZhSnH2xUzP7zNW
	TB0LtFoobLozvtdjKVN+n1Xh/06clgCKwzO44BLPZ9Z2rR6oFGadpgu5EcqKLd6/f3TFppAEvXk
	V09+HCutjrhoPh7A1j/NCk1hLCmWbB4LdHB6/xA==
X-Gm-Gg: ASbGncuP1obJT8pE1alP/4ybaPxSwvu/0igxG8IWcHuTrwgmKUlBocf5KoE7xc2muvo
	479eC1YEk/xzECh9w8LL/DMS3k54OCu0=
X-Google-Smtp-Source: AGHT+IG3PcR91L2T9z3OmlJIfEmknI/xIPqLFBSaFNeahHyyl0XqsdvHAwMamczMXZSxQGrufLIUoq1zoKwW+VQQ06I=
X-Received: by 2002:a05:651c:901:b0:2fb:4b0d:9092 with SMTP id
 38308e7fff4ca-3002f89e98dmr9183041fa.1.1733475906447; Fri, 06 Dec 2024
 01:05:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241104141924.18816-1-kabel@kernel.org> <20241104141924.18816-13-kabel@kernel.org>
 <87bjyv9ecb.fsf@BLaptop.bootlin.com> <778f08f1774fcad5fcc39114dbb721793ebf95d6.camel@gmail.com>
 <2iocrd4a7l4avfhqmobbexo7k4u2poidkvvj7lpqh7vp7mprkm@pfgytqnmt2si> <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
In-Reply-To: <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
From: Klaus Kudielka <klaus.kudielka@gmail.com>
Date: Fri, 6 Dec 2024 10:04:49 +0100
Message-ID: <CAPy0QmsF1qr3A-89BDQHu-QVXpMhMGWt8e74FfDkqVT6Ha7q-g@mail.gmail.com>
Subject: Re: [PATCH leds v5 12/12] ARM: dts: turris-omnia: Add global LED
 brightness change interrupt
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Lee Jones <lee@kernel.org>, 
	regressions@lists.linux.dev, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 1:43=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
wrote:
> On Thu, Dec 05, 2024 at 01:38:10PM +0100, Marek Beh=C3=BAn wrote:
> >
> > This is because the patch went into 6.13 but the rest of the patches
> > did not, Lee wants to take them for 6.14 :-(
> >
> > Apply this series and it will work.
> >
> > https://lore.kernel.org/linux-leds/20241111100355.6978-1-kabel@kernel.o=
rg/T/
>
> Alternatively you can overcome this issue if you enable the
> turris-omnia-mcu driver in 6.13:
>
>   CONFIG_CZNIC_PLATFORMS=3Dy
>   CONFIG_TURRIS_OMNIA_MCU=3Dy/m
> (and also the subsequent options).
>
> Marek

Thanks, I will try that when I'm back at the hardware (in a week or so).

Do I correctly understand the situation:
For the Turris Omnia LEDs there is now a temporary dependency on
CONFIG_TURRIS_OMNIA_MCU, which will vanish in 6.14?

Best regards, Klaus
