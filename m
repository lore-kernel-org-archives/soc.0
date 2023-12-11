Return-Path: <SRS0=nAtV=HW=linaro.org=andre.draszik@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A157C4167B
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 16:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60D54C433CC; Mon, 11 Dec 2023 16:36:21 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BFAF8C433CB
	for <soc@kernel.org>; Mon, 11 Dec 2023 16:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BFAF8C433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c4846847eso10412355e9.1
        for <soc@kernel.org>; Mon, 11 Dec 2023 08:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702312578; x=1702917378; darn=kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bK1lX1hwHqRE0qWwNG1aUzZucX1tBAoUd44IP9gaN34=;
        b=WmEKhI2Np/Qq52hTlRsD6vYYE+Vs+6XXoCnCqIJAxtTJlLoDY9YYOiu0mQye56M2yU
         D1wwesTfT9ryiWZa7my+4QPY0RsVIsqpCCHRNMAH5hDNNp75lYN4oMJK9urFqH0QucnH
         JD5lQXebY2Pym+XdaWx3OGSaQppVp4v7zqii5gQ0TsDYe6ngmglZeqsfmaOjBvOxNHX6
         N/7OoD9i745Te+g/8pyNPPexMoHiUXBYmfcmrGvbNug5oSKL5IzF+JIL31ZuZzWyg0D7
         LGKN3c0JNwPBf10hrSaZlNy5O05rWOUvzW4brUZpPyFE90GYWkdJp+u6KmFcbgs644dp
         wXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702312578; x=1702917378;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bK1lX1hwHqRE0qWwNG1aUzZucX1tBAoUd44IP9gaN34=;
        b=fw8RMMOJxhuMMBNpDXOsT5J5EssISBIUMbTuA7Rkmxhznqgr1As6DYYuQEUeakX8i3
         9XGki9FmN2YAtsv2s1UttbyoGTwgGJ79sqss3iJKJNBCjS4w4JCUL53VtXptGBqax0nH
         AUNOQfagVVsh6Ibs1Ae8VdDwP2r+6MWjFIYuYXlmq5M9KBu2BiMjyM3hdiaEzS9apwl1
         h6ht6uDZH72l1YrCS8CYX80gtpbl+XlyDTjqEIa7MRV2hUDVczoDHScu9MewLwK3s3Lv
         kv0RxVCoPwGYy2RwFjA9uBCQb2rJ8hBfeF7wkMPnYn7YwMjY6jRruUltn188wGaz8j0R
         Ujhw==
X-Gm-Message-State: AOJu0YwXFYazECpKxxE8gFzVYbjEGiI8aJEGGfZxbIbz2T65F1PwYocS
	dybJEdMSagh8mI8ORm00UqvhOw==
X-Google-Smtp-Source: AGHT+IHqlghak/z1rUpsIZnKDYLf/Lji2enrhgj53Kac2omQn554ooTGIUHbzfez0RtduglMO9UMiw==
X-Received: by 2002:a05:600c:510e:b0:40c:67a:b3bc with SMTP id o14-20020a05600c510e00b0040c067ab3bcmr2342567wms.71.1702312577700;
        Mon, 11 Dec 2023 08:36:17 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id w7-20020a05600c474700b0040c41846919sm7404061wmo.41.2023.12.11.08.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:36:17 -0800 (PST)
Message-ID: <f3299aaf9392aaedf8cca1c4756605b11c59b98f.camel@linaro.org>
Subject: Re: [PATCH v7 06/16] dt-bindings: clock: google,gs101: fix
 incorrect numbering and DGB suffix
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
Date: Mon, 11 Dec 2023 16:36:15 +0000
In-Reply-To: <20231211162331.435900-7-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
	 <20231211162331.435900-7-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.49.2-3 
MIME-Version: 1.0

On Mon, 2023-12-11 at 16:23 +0000, Peter Griffin wrote:
> 166 was skipped by mistake and two clocks:
> * CLK_MOUT_CMU_HSI0_USBDPDGB
> * CLK_GOUT_HSI0_USBDPDGB
>=20
> Have an incorrect DGB ending instead of DBG.
>=20
> This is an ABI break, but as the patch was only applied yesterday this
> header has never been in an actual release so it seems better to fix
> this early than ignore it.
>=20
> Fixes: 0a910f160638 ("dt-bindings: clock: Add Google gs101 clock manageme=
nt unit bindings")
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

