Return-Path: <SRS0=Iuj8=HW=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3555EC4167B
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 18:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EDC09C433CA; Mon, 11 Dec 2023 18:26:40 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27080C433CC;
	Mon, 11 Dec 2023 18:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 27080C433CC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6d9e0f0cba9so2819720a34.1;
        Mon, 11 Dec 2023 10:26:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702319199; x=1702923999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIsWkgcgh+iryiOw2ckITXN971M9P/rGXpk4uklSnJ4=;
        b=ETfcAYlNBoN8m4o01Yi5r1rUvDxn4b9Qevu4aZX89tZZE+oTLhXLut71VCzG4sdxo+
         KMhPKaezzTukyVLGAHzJCQyCJaZY1Lw2uNx0vppHLjIh4ewxkO3sgalMZ/INwyiHQLDn
         MOKbOTha8V8qEr0+qxrClPoV/DTGQr1BEoNiRPOiY6/T3rLu2GfuT3zfftXK+J2t0GOt
         R/GA1ckex+Br/9cMq/a3cJmSB815UJsHM6gosfwAyJ2S1FWkL4wqY6LBm5FHAlxWDgBR
         2OH+RO0l/D3hH/qARCUFQpKOM6ZW4u8AxFlR7jovKp6sAI/vNHyh0CPEea8r6cOsW7UW
         CEPA==
X-Gm-Message-State: AOJu0YwcC7Kpi3NAPqBNQtlJC/yRV+yvLGZJGh7FHj2YtammVpE9siGH
	8MCNjh8OvwoGJ1+6wFxVwQ==
X-Google-Smtp-Source: AGHT+IEeiVS/4EbZYPFhn0tgt9W90eW5liw+bo1KTROUv5Qfw1SPIbJZbqhh1GSmu2/aNwicB7rJEw==
X-Received: by 2002:a9d:6c17:0:b0:6d9:ece7:a3fc with SMTP id f23-20020a9d6c17000000b006d9ece7a3fcmr4260019otq.55.1702319199167;
        Mon, 11 Dec 2023 10:26:39 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e7-20020a0568301e4700b006d87df1c53dsm1795031otj.65.2023.12.11.10.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 10:26:38 -0800 (PST)
Received: (nullmailer pid 2663219 invoked by uid 1000);
	Mon, 11 Dec 2023 18:26:36 -0000
Date: Mon, 11 Dec 2023 12:26:36 -0600
From: Rob Herring <robh@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, krzysztof.kozlowski+dt@linaro.org, 
	Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, saravanak@google.com, 
	William McVicker <willmcvicker@google.com>, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 09/20] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize required property
Message-ID: <20231211182636.GA2657319-robh@kernel.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-10-peter.griffin@linaro.org>
 <59b949a0-5aeb-4f01-8789-cb305513b626@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59b949a0-5aeb-4f01-8789-cb305513b626@app.fastmail.com>

On Fri, Dec 01, 2023 at 05:39:33PM +0100, Arnd Bergmann wrote:
> On Fri, Dec 1, 2023, at 17:09, Peter Griffin wrote:
> > 
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - google,gs101-uart
> > +    then:
> > +      required:
> > +        - samsung,uart-fifosize
> > +
> 
> Is there a way to reverse the list and make the property
> required for anything that is not explicitly enumerated?

if:
  properties:
    compatible:
      not: 
        contains:
          enum:
            - optional-compatibles


Either way is fine with me. Anything new has to add their compatible 
anyways, so not a big deal to adjust it here, too.

Rob
