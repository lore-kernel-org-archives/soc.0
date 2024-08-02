Return-Path: <SRS0=WY91=PB=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD214C3DA7F
	for <soc@archiver.kernel.org>; Fri,  2 Aug 2024 20:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2B22C4AF0C; Fri,  2 Aug 2024 20:57:05 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9F092C32782
	for <soc@kernel.org>; Fri,  2 Aug 2024 20:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9F092C32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52efd08e6d9so12480467e87.1
        for <soc@kernel.org>; Fri, 02 Aug 2024 13:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722632223; x=1723237023; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHoufGKZeNUryCyLA/+zkaxEPpoianrLqYlTOdN9QGs=;
        b=ejwWKWOSoGy9FA+PzAVkH6n8GRrUIXFPWGfzmjMTBBDK1KkTEg8g0NDisXx7CUYVHz
         FajO9qIpo5C+A6UFGGYvPtgvfSlhUpUw44Tbk3/fkMPp4m/0tn5z1ovirnFiK2c1X6KZ
         0hnNyDE3s3Ng9oPDwei+3ifHWVdrvczjIb/tu2KPtFWMUyB4k2dY4aMrpvFwROc75Rhv
         yvSxoT2RPvzmAIFRn6de9XYxhkb//JUurWsZ+N19M9PL1vKkR9FTXTiQS6Z0J5MI+NiM
         HoCaDPUls323WYYGcPJNy62s457Md5HjvLVBCiLsStfWf+zvcIsNIgNFmCTdeDfJC8od
         aWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722632223; x=1723237023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHoufGKZeNUryCyLA/+zkaxEPpoianrLqYlTOdN9QGs=;
        b=DiD7Fr45glYgBnnfS8kOWLKuprXe78LPjng5CL6ebnwQaOhNMZEml3vGt/C253T8pP
         tdnkq6rIPff3ff783G4gDcpzbMkKrOHKMgd1ZRuEqwB4/GhM+o8RHtGzPawnUgvcHeZh
         KYOhBJaOdQhgC1qRxXAF25jPtXVZr2+mO7r6j7F9X/G2wGwn+U5HXIzStnGoesLjw8aY
         xMtHpnnIhanSZnoDfeOkt4Ss0RqD+gLzkzMFC6NOZ+YdjhrcVAirTFxvHswpeIiYqaca
         h/0m+hwV1SOpwhXoqhM57bfuvfs3S6X9ev3LwZRMlLmD8wV4oJ9eu9RgJlDf0lOAKysq
         s76Q==
X-Gm-Message-State: AOJu0YzCjOLHptuDOV4VgDfMo26DlQ0no57NIrDKwiyPOmQRtpP1GsTN
	kZlcOv60nKl6s9d4Dw4plZQEja9DVOv9MTZzw92bF5B/dc/Umnpwczf1v/j+UpLWZ3TGw8ZZdeQ
	8oTkOMXb5uP9J20Js2WdW7GnhaFy/aFTbqGN+7A==
X-Google-Smtp-Source: AGHT+IFSAobZlgNBt2mHwGZSkwuSohByPTwEotsEjUgojbeScm1oYWLEvLsKj3nyo90zjHBoZrcIWCfeL9L5VHqJ76g=
X-Received: by 2002:a05:6512:2344:b0:52e:74d5:89ae with SMTP id
 2adb3069b0e04-530bb3cde4emr3210685e87.39.1722632222377; Fri, 02 Aug 2024
 13:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240730210030.2150467-2-robh@kernel.org>
In-Reply-To: <20240730210030.2150467-2-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 2 Aug 2024 22:56:51 +0200
Message-ID: <CACRpkdb1TbiMps0WLXZF4vu=RO71ubPUL9fB3DWO8axh4LOJmQ@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: arm: versatile-ab: Fix duplicate clock node name
To: "Rob Herring (Arm)" <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 11:01=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Commit 04f08ef291d4 ("arm/arm64: dts: arm: Use generic clock and
> regulator nodenames") renamed nodes and created 2 "clock-24000000" nodes
> (at different paths). The kernel can't handle these duplicate names
> even though they are at different paths. Fix this by renaming one of
> the nodes to "clock-pclk". This name is aligned with other Arm boards
> (those didn't have a known frequency to use in the node name).
>
> Fixes: 04f08ef291d4 ("arm/arm64: dts: arm: Use generic clock and regulato=
r nodenames")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Oh excellent, thanks.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
