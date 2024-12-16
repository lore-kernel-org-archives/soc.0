Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BF5206281
	for <soc@lists.linux.dev>; Mon, 16 Dec 2024 17:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734371169; cv=none; b=BA6RsJLtp7GPrVomxXXmEAe0OPRShYBvG5ndOZ/1dnhONjolraD2C2ZZM6s8OREj7ikBx3FlQgi6D/150W2hpR5zTEpdRuFzh2OD66wj988FDDJ9LcI2EcCWKtvLOWsY5Sun/skkcjoizCadg+OGLH8s+buArhBckHYihI2J+4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734371169; c=relaxed/simple;
	bh=LDxIv1E3Cfi6mUhdbKPkPLS8LWB9TYypt4l83RYATcY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q/G6Flm2J6MMgf738N+BWGbMjcPZa2Sxcy4QapHa1sR/NLCYj+api6ihr8xJ8jj3HW7d6FM/cSzPqV7Hb2sm54Too3u0usG4JGIvGW/9JD06W4n4tXu0bryutcgVt3cqafBpO6mU3P8+/EnGuIqTRXoqjJPt/LmOR8bYpWp77FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfYgqaUG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfYgqaUG"
Received: by smtp.kernel.org (Postfix)
	id B734BC4CEE2; Mon, 16 Dec 2024 17:46:08 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A2749C4CED0;
	Mon, 16 Dec 2024 17:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A2749C4CED0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385de9f789cso3535605f8f.2;
        Mon, 16 Dec 2024 09:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734371166; x=1734975966; darn=kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LDxIv1E3Cfi6mUhdbKPkPLS8LWB9TYypt4l83RYATcY=;
        b=bfYgqaUGtjFdzHKWhCfyLoavhj4HtQnJ3QzmHLK6bHtM3iw+XoTAeJCGBWasWX96rd
         phdfLc/DdRUi/tu6gRfNVuD+nolCEIpNivx12gMo4V7ofWggwn3Z8/m/Ple+BLtMD/m4
         qiRiXTx2DZVH/B1LhLnKL7ou7udaepYpSMLdOJg1dGFQqj0f6VOUDwPzmFWVXFcDYrsZ
         48HXLxFWQDakJ1iNQLF1eBLCYUHW2rxUlqpESE7rKAs6o9LgGwXWDoSK0axaRHpEkQ7T
         leyrN3UQ7dmV6obrtlZAvLT3cZB+N+07xIL+WnNuOYFU7YQSiV3DggOmLCKcugOD1qzL
         QcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371166; x=1734975966;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LDxIv1E3Cfi6mUhdbKPkPLS8LWB9TYypt4l83RYATcY=;
        b=eoKPmlx7LDpRdxzQdjDym+747ZfWi+LGX8YbHU4QQadqj0FVv6H4irCg5gbNl8HynZ
         xEK+0cXFO9PPMws4WTjnUex/ILhXZ6uEmNyz0OTGzX7FmoovijBV65hGauq8/5nxEJqg
         YBZnsD3QAFIL+Xryx9OUQXJZ+ugEAXY+Ak0HC4p68XqrV3q92zuYflew/xY37jdPe2SS
         p0OhKpY3BlO6I5mhMSKQz+8GCEXODpTgVynLsevu3K5GC2IL5z1adytBzspy5TXPZUjX
         /z/Eajn9hIEtJMrBIX4K3QmRxDX2O/x/g+mTPB7eUz6DDenRMPLDEgTjAULFy5cDHWL6
         +Aww==
X-Forwarded-Encrypted: i=1; AJvYcCUf+qJ0vVMPQN3O86NkyKUVgt5rK+LCq0qDR35+y8eb5cpRvs5UuzvDdXRjmQvlu/Bsq7oA@kernel.org, AJvYcCV0oE5tVCpVR7wuiku3UahnlJWtf2TJWpryyLFNlNNxOPRFCZO/EwGyX68CoZFHh/I2qYSg@kernel.org, AJvYcCVfWlLZ//o6t+HAiNj+HhOaI37jztrX1ZriS0ZHcZ0zgyzZh+6FEZCVlJijZ+NKEM+eYx9h@kernel.org, AJvYcCXVMTx8MSvq6AdZ7LEJA0BagCsqj5sQRlV8irQQTNubJE9abeNBUto9tzRz7yaQGlaEXmKJqA==@kernel.org, AJvYcCXg904hxUwWUWsEykS0ZcemfhEkX86Z/WPOQUpmY3rylYcItAUF75uBS4+0FslA/AJCPt7FNA==@kernel.org, AJvYcCXqPkiWcPicO0D3yH2sesxlZxut/W0xVhXS4IA305/zPYc755/O0UQlv/pZq2kO8OcoJ4wmipQ=@kernel.org, AJvYcCXsxaBNkkWamV5VArjTRsFnJ3FRVs9bhcROziEJJyy1g9jmIC3EwQWh5rCDSiXhith/c5+x@kernel.org
X-Gm-Message-State: AOJu0YxAB4xzZ0ADvPMuxRLEFTNEY3YS7a3VwP+oV82Qho2XR3G8ES1m
	NCUvK6fqwQ9NLN5AnfDrmat2ez4Alm8PIVTTK2AkAVB9mv+E8bf8FxNZFuBs
X-Gm-Gg: ASbGncvQz1boF7OiSYxcIZl7QxgIh7jGKiY3ALlElEmWLLU1qOwhheCpTVBFTl9ZwaW
	rG9qpEVfBkc6FjkgR1cuSxWAaKBl/EfPYF6sNHYko1UMJkyW5vmfkNthvTxL17vP3xDDwezSLvQ
	zApQ3tLUVHwzox3XPT0fmibPN8tAIL0L90C6j2ZJfuBU1uG0cQZrq1PF6gqgX4Fl3rKTTEWh2gG
	RCCGaTBleyWZ+lodI0SyR6f0WyKaJ87FsfwN2Cy8GXYhnFd3UAPXPh5hwkJs0wgUhg3psOXuNL5
	MvFDqHJFcSloC6/TyyBBMtobTis=
X-Google-Smtp-Source: AGHT+IGBJ/riXVZwoF0GRkipPWTNb3OBIdWhOHkRurhkAMxRMKmBaoGRuVMikgREKTp4489NMTgdUA==
X-Received: by 2002:a5d:6d87:0:b0:385:e94d:b152 with SMTP id ffacd0b85a97d-3889ad37d1fmr11079777f8f.54.1734371165558;
        Mon, 16 Dec 2024 09:46:05 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:fc42:464d:ef2d:52a3? ([2a02:168:6806:0:fc42:464d:ef2d:52a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80608e3sm8635591f8f.103.2024.12.16.09.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:46:04 -0800 (PST)
Message-ID: <2f870913fcbf89043b6cfe26d32f9ae6d45cddd2.camel@gmail.com>
Subject: Re: [PATCH leds v5 12/12] ARM: dts: turris-omnia: Add global LED
 brightness change interrupt
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Marek =?ISO-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Lee Jones
 <lee@kernel.org>, 	regressions@lists.linux.dev, Pavel Machek
 <pavel@ucw.cz>, 	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 soc@kernel.org, 	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de
 Goede	 <hdegoede@redhat.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, 	devicetree@vger.kernel.org
Date: Mon, 16 Dec 2024 18:46:04 +0100
In-Reply-To: <6gxg466bl7tbyfq5yoenpw5t3vcfcyywv3jydwwwiqik2pzqsv@3g4gk6m62mdk>
References: <20241104141924.18816-1-kabel@kernel.org>
	 <20241104141924.18816-13-kabel@kernel.org>
	 <87bjyv9ecb.fsf@BLaptop.bootlin.com>
	 <778f08f1774fcad5fcc39114dbb721793ebf95d6.camel@gmail.com>
	 <2iocrd4a7l4avfhqmobbexo7k4u2poidkvvj7lpqh7vp7mprkm@pfgytqnmt2si>
	 <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
	 <ec61714eaa3d84498cd69dc673fb11996550a3ea.camel@gmail.com>
	 <6gxg466bl7tbyfq5yoenpw5t3vcfcyywv3jydwwwiqik2pzqsv@3g4gk6m62mdk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2024-12-15 at 22:26 +0100, Marek Beh=C3=BAn wrote:
> On Sun, Dec 15, 2024 at 12:39:10PM +0100, Klaus Kudielka wrote:
> > Testing reveals:
> > I have to enable CONFIG_TURRIS_OMNIA_MCU_GPIO as well, to make the LEDS=
 work again with v6.13-rc2.
> >=20
> > So far, so good.
> >=20
> > But the upcoming dependency in 6.14 will be on CONFIG_TURRIS_OMNIA_MCU,=
 not on CONFIG_TURRIS_OMNIA_MCU_GPIO.
> > Is this correct?
>=20
> On both, see the first added line at
> =C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/commi=
t/?h=3Dfor-leds-next&id=3Dd82e09d62b3bdbfa9dac2daf3c3c071b6a79d2aa

Indeed, sorry for missing that. So, I'd say:

#regzbot fix: d82e09d62b3bdbfa9dac2daf3c3c071b6a79d2aa

and we leave 6.13 as it is.

Klaus
