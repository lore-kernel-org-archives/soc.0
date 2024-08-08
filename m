Return-Path: <SRS0=V2sl=PH=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ED7C52D73
	for <soc@archiver.kernel.org>; Thu,  8 Aug 2024 22:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 549ADC4AF0C; Thu,  8 Aug 2024 22:40:32 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DC5DCC4AF09
	for <soc@kernel.org>; Thu,  8 Aug 2024 22:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DC5DCC4AF09
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fc65329979so14581775ad.0
        for <soc@kernel.org>; Thu, 08 Aug 2024 15:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723156829; x=1723761629; darn=kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vnFFKslAyQCvTlzcAGgFXS35aWJRluBhjxEK1S5MBPE=;
        b=WSRVhleHz7xUui+9Rln1b1C+F2baL89LJ2/H1sQ4lu0wsZei93QtBSPIbY4jfnoW1y
         3b+06NkYwiZd9u/M43JVetV0oW/TKs5T95wdtS+DYjCXXeGxMztCETbDYh0U67xlIYtX
         zYQmd5GDhb0O+UUlYXqUByXbnZ+kezSSaQMBxUjEMmvKX+46fE6uN3qGJ7PKv6M891Nt
         8UxO/bof06i7QPfVfK5iOhj84dGni+3JI+OBvmLhmQaLKlBlo/E5HpXn52qwpDqYRZSL
         o/GUe8/Enb8ciBhbZKp2+MYj4EC544pfKeyawFUVjNvb11FwudQ2mGLJDSFdedlvq5BH
         9ZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723156829; x=1723761629;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vnFFKslAyQCvTlzcAGgFXS35aWJRluBhjxEK1S5MBPE=;
        b=X0xFOZsYU8Bs4nsZcQSCHbGNXdEQGk0tP5aF3ZMyoO8jM0aJ4vrvG+ZRgZdX0kIuDY
         PENsKJxYwkMZUazShxuYCCKZ4s5RefjX5azCG5aJH4+95BF/bWyu8U0Cup+34CKm8THB
         p23aqTyOG+AAGx+NwycqvOgrus9v0zuS28NIG/fynFJns8t+Dc6V5fTSsftGstCWCNf7
         DsjIy/xmng2wqJAHmqFwG7eesggnDHc5TwpukYSk+j/sSmG8qkPGOX3g7DHBRKI8j7eU
         zMk57pXYvckKShXFK99M9SoaBpD6rgL8jSJVsGOMYFGatzB5XSON/jQtPdWExLej2Dtr
         Xh8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWznfa+Lh5y3uFy1ogHhcCheYHapNDvZjiU1xRaiBj3J+9/ujA8UwknW4Osc0gqMMldmNUb8DiJ284R8hbNxQ==
X-Gm-Message-State: AOJu0YzRHHuptgxcg7EjZ6Mnma1c60qJ0SRyPMPpSVEpcN+6X7Lk5IuY
	ELBLG4gS74kQfIj5LPbgtQOXAlDNqidXsCt1UeVD27CBZC+2unFoqT5X4HlJskc=
X-Google-Smtp-Source: AGHT+IFuozGVpD2S8JcbyZGe128XhqnFMQbDl0tXLzyrxRy3snyF4waOTyuxeRGS6PqrGLYA3KLmIg==
X-Received: by 2002:a17:903:228c:b0:1ff:4d4f:d819 with SMTP id d9443c01a7336-200952633e7mr47633515ad.34.1723156829035;
        Thu, 08 Aug 2024 15:40:29 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200668fc398sm85768725ad.207.2024.08.08.15.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 15:40:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>, soc@kernel.org, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Dinh Nguyen <dinguyen@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Mark Jackson <mpfj@newflow.co.uk>, Tony Lindgren
 <tony@atomide.com>, Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, imx@lists.linux.dev, linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: Fix undocumented LM75 compatible nodes
In-Reply-To: <20240808164941.1407327-1-robh@kernel.org>
References: <20240808164941.1407327-1-robh@kernel.org>
Date: Thu, 08 Aug 2024 15:40:27 -0700
Message-ID: <7hcymir63o.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

"Rob Herring (Arm)" <robh@kernel.org> writes:

> "lm75" without any vendor is undocumented. It works with the Linux
> kernel since the I2C subsystem will do matches of the compatible string
> without a vendor prefix to the i2c_device_id and/or driver name.
>
> Mostly replace "lm75" with "national,lm75" as that's the original part
> vendor and the compatible which matches what "lm75" matched with. In a
> couple of cases the node name or compatible gives a clue to the actual
> part and vendor and a more specific compatible can be used. In these
> cases, it does change the variant the kernel picks.
>
> "nct75" is an OnSemi part which is compatible with TI TMP75C based on
> a comparison of the OnSemi NCT75 datasheet and configuration the Linux
> driver uses. Adding an OnSemi compatible would be an ABI change.
>
> "nxp,lm75" is most likely an NXP part. NXP makes a LM75A and LM75B.
> Both are 11-bit resolution and 100ms sample time, so "national,lm75b" is
> the closest match.
>
> While we're here, fix the node names to use the generic name
> "temperature-sensor".
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> SoC maintainers, Please take this directly.

[...]

>  arch/arm/boot/dts/ti/omap/am335x-nano.dts     |  2 +-

For this one...

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
