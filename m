Return-Path: <SRS0=57W1=HV=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29DDC4167B
	for <soc@archiver.kernel.org>; Sun, 10 Dec 2023 23:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B956C433CA; Sun, 10 Dec 2023 23:34:30 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95AE7C433C7
	for <soc@kernel.org>; Sun, 10 Dec 2023 23:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95AE7C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d0a7b72203so33880415ad.2
        for <soc@kernel.org>; Sun, 10 Dec 2023 15:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702251268; x=1702856068; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9inBJnm4RRUBTcM8clVN2K31CIq5Yi4neoBQMqj3lw=;
        b=zYIQeb9lIyyWLzZJ1EXEaswme59DVaQkp9kejE9AZI6Kw36nezculAD02t5Zqv9yZP
         GmQA02O0VpV8x9UvYGSSyqa7hEHaSgysbYE5A/rGN3CmfAxkfjIoTHRm64zwHLlQ5zKt
         3WSbGORDjoR2t0b8s5FER4pSNy/zAUeDliaGKb4PiVh+GQsneTF4MxU8qmG2qTPwjsjD
         B+l+U63noeejLOD0ISSZxir1N/ovuHgre1NhRqMaRiL2h5j+nK+qlqRN9gY5n/WxhK6A
         t8id0QuGt9eQqWpPWUY3Fv8wuzOSaGqNy3Y406GNfR4UmPZQgZEMO17NNLtLZz28U9gs
         Q9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702251268; x=1702856068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9inBJnm4RRUBTcM8clVN2K31CIq5Yi4neoBQMqj3lw=;
        b=tTAK+aCbBIwQLI5XdGFaIJDN779FS/t6MA6OiiE4UXNVx0dRllsRMon45ffv5Qt4C8
         nx//IPdbvmnDo3xav69M2CytOrYfwFvADv2TCsJBEkQzwX1QO2s3nxNPa8Yusx0Tgh7L
         b9zS867vyLFvHrqQfSQJcB6Q4/qB2kzv1l62GgE/Zn2vgJAzkzilERQi91BnHGw0RONi
         qsH7LO7NT2UoP1FgaH4CH/jMYmwng7hMf4Ox+yzrAOrhlLtqR0trjYJdIu9VcYZgimUv
         O7uverPUqLbhpVkOk2CursHJMVPv99r07/b3N0zB5vbUzt/YWGpk46c4pr8q2O+UveJK
         6yhg==
X-Gm-Message-State: AOJu0YwCevcW9dNwuTfAhsv3I409sNqodLwCVX3is3iyQ3s47uRzUT8B
	r1w4HfYAT/DkxmidxSPUllk9T/IbBaNwbSKWVCLXhA==
X-Google-Smtp-Source: AGHT+IGc+IvHTENHJ/KXFFp2iBYPliL5WTdTBJgCg+tz9DwtfoGQRHQ4N7s/di11rwfak1O7RMTB2P48Vdkm1Es9RHA=
X-Received: by 2002:a17:90a:94c7:b0:286:7f04:23c0 with SMTP id
 j7-20020a17090a94c700b002867f0423c0mr2376721pjw.4.1702251267601; Sun, 10 Dec
 2023 15:34:27 -0800 (PST)
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org> <20231209233106.147416-10-peter.griffin@linaro.org>
In-Reply-To: <20231209233106.147416-10-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sun, 10 Dec 2023 17:34:16 -0600
Message-ID: <CAPLW+4mztK2HEKh5S--tdi0p8i5sYOHHBoTFnfH=9X+vMXxOuQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/20] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize a required property
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 9, 2023 at 5:31=E2=80=AFPM Peter Griffin <peter.griffin@linaro.=
org> wrote:
>
> Specifying samsung,uart-fifosize in both DT and driver static data is err=
or
> prone and relies on driver probe order and dt aliases to be correct.
>
> Additionally on many Exynos platforms these are (USI) universal serial
> interfaces which can be uart, spi or i2c, so it can change per board.
>
> For google,gs101-uart make samsung,uart-fifosize a required property.
> For this platform fifosize now *only* comes from DT.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../devicetree/bindings/serial/samsung_uart.yaml       | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b=
/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> index ccc3626779d9..65d5d361e8f4 100644
> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> @@ -133,6 +133,16 @@ allOf:
>              - const: uart
>              - const: clk_uart_baud0
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - google,gs101-uart
> +    then:
> +      required:
> +        - samsung,uart-fifosize
> +
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.43.0.472.g3155946c3a-goog
>
