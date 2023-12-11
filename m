Return-Path: <SRS0=nAtV=HW=linaro.org=andre.draszik@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20131C4167B
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 10:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E44BDC433CD; Mon, 11 Dec 2023 10:04:33 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CCDF4C433C7
	for <soc@kernel.org>; Mon, 11 Dec 2023 10:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CCDF4C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50c02628291so4382528e87.0
        for <soc@kernel.org>; Mon, 11 Dec 2023 02:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702289071; x=1702893871; darn=kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dlDvMrT1asX8DIwxy4hQXmmKRl2/sfivmPuoV3hSf5Y=;
        b=kB3QzRURSMG664u09rFy4LpgD4bkXiu/FpEC5uk8kMzBk4GLlkKfCg9kIKcC6gJkQa
         u3WBiBGYX9MZFmxPzj8kj0c0t8HHrz7l+Gyd6YCrCgMUgr05FyxARZh89nQytq+h8tvn
         IGBwB4zrqnbYn/lyP7C7WueTUsaCo+c4389vrsIa+9xw9VphapAQ/BT7QyngtG2yIarb
         3t0tN3efJeyDshoXlGxBWnxs5y9F78IhOGkR6F8vwgBUQNyUmS9liaVnPdgX4F0EHgIO
         2V4GMG2eli84FUa3/q/KdlRp1Z9fZdL4CYlXQV4jhO9W0iF0PvJsfARlQAOK16voA5lz
         bNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702289071; x=1702893871;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dlDvMrT1asX8DIwxy4hQXmmKRl2/sfivmPuoV3hSf5Y=;
        b=jjz2qAgINZZjfcnL/o1DRPoS/Pp0Pb7GsF+lcS5yNhmPZbWeCeMKkPOe16RmGYiClq
         ndLUVg9AqjKn6Gz5qPXR8mGW8pcDgqwCMeflFdWoifxKqyfmrrV3q4kQXW9KmUwNp7aQ
         vKYR62lkr8e9eB2AMvSdQUmfGMKrh5CVeJO1U/4g5q1CJvXsA/uoklgat/wWlK6w2K+k
         hYZuOvF1P0vzLoR6XwanUKal8BSp1jmX4Amam6CgALnh3ocIP4QEcMRrISzOfs0er5QA
         98MwBskl+IThNRsJTPr+tpmDYMp8GrdbF3booFvSUzZXbOTpP/tlejnAFbs2yg/mxiHl
         I7oQ==
X-Gm-Message-State: AOJu0YzHNjJOSiM0m6ZXSc4/mv6numVcWyB4qa2iqaShLpnvhV7oxYD0
	FPH4qj6lSfYMBkrlowGvdfGteQ==
X-Google-Smtp-Source: AGHT+IGE0CAwP4QDiJnNgqtN7eWwZHyt1mgacPdvwANjL6HNlCW8mOl+VpfcTEOzlnLHL9+YpJ2Ucw==
X-Received: by 2002:ac2:58d8:0:b0:50b:f05b:7c22 with SMTP id u24-20020ac258d8000000b0050bf05b7c22mr1538255lfo.53.1702289070940;
        Mon, 11 Dec 2023 02:04:30 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id fs27-20020a05600c3f9b00b0040b36050f1bsm12147315wmb.44.2023.12.11.02.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 02:04:30 -0800 (PST)
Message-ID: <0c8532d2bcb6ad5a583e8f716cc88cd5cbae1356.camel@linaro.org>
Subject: Re: [PATCH v6 12/20] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org,  sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com,  linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net,  catalin.marinas@arm.com, will@kernel.org,
 arnd@arndb.de, olof@lixom.net,  gregkh@linuxfoundation.org,
 jirislaby@kernel.org, cw00.choi@samsung.com,  alim.akhtar@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: tudor.ambarus@linaro.org, semen.protsenko@linaro.org,
 saravanak@google.com,  willmcvicker@google.com, soc@kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,  linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org,  linux-watchdog@vger.kernel.org,
 kernel-team@android.com,  linux-serial@vger.kernel.org
Date: Mon, 11 Dec 2023 10:04:29 +0000
In-Reply-To: <20231209233106.147416-13-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
	 <20231209233106.147416-13-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.49.2-3 
MIME-Version: 1.0

On Sat, 2023-12-09 at 23:30 +0000, Peter Griffin wrote:
> cmu_top is the top level clock management unit which contains PLLs, muxes=
,
> dividers and gates that feed the other clock management units.
>=20
> cmu_misc clocks IPs such as Watchdog and cmu_apm clocks ips part of the
> APM module.
>=20
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Cheers,
Andr=C3=A9

