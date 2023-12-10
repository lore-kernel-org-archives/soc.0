Return-Path: <SRS0=57W1=HV=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F7CC4167B
	for <soc@archiver.kernel.org>; Sun, 10 Dec 2023 23:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41FCCC433D9; Sun, 10 Dec 2023 23:36:38 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3F74C433C7
	for <soc@kernel.org>; Sun, 10 Dec 2023 23:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3F74C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1faecf57bedso2778208fac.3
        for <soc@kernel.org>; Sun, 10 Dec 2023 15:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702251396; x=1702856196; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwhdaI8XBubSIfRfAPI160DRLkTYdL3p80yUVHWP+lE=;
        b=ayNgkqGRqGsWEFOYfCPrG/OO+8R46fEqlb4t/DP3EFY1ilvD9EghpRShLAOr+cE91j
         EBW32HEnIF+2cOesOPZ+jfoMGspLUBIGjPYucy9jR8W6IJJDR2bdBgtm6STDa1ByED5P
         T6d0PwSMuGFky5DhTWfzS9MhDBS76iuM9T5ZA8o7IlqkS4+qY/ir3JSmxGpyUnF8jfbu
         IedMNSLoBHjNWLmL9A0AEM2nccKlBGbh9lFawJj80dL5SRR0MvfAmbCX+/Ghw6hI61lM
         LBYrpEY50LnqtWkmqzPY1Chsaw37FFHaKVWQZPaw7HICE/lDEGT9gW2UTvrfJ7iPTCG9
         s01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702251396; x=1702856196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwhdaI8XBubSIfRfAPI160DRLkTYdL3p80yUVHWP+lE=;
        b=qR1gthUHCbGOqt4lS8pOlpEeeNZAogZDgpY19QLrLGpBk7Dc3VNuPDUIMS4KIFreSZ
         ebA5/DY025hdcoFTtPK4CqDUF7cls1wHyptDnP5uOSy5riwQaJkOQkTGp9+1ZMxRSB0q
         tmUDe1whcgqd3agcykfgZMQ5lPPy2UgRiiojlxxf2DFGm72UWb6ch3p1k4XM91bfuVtW
         IvJaXiQNqB7oc7GjjibafyCIQQaB7p4Cjaw8/zLnP5nvcVCKN/15rEvZ/Ch9b9U5Gfsk
         A5sCao2h3vkC9HRbDgnTFilnDzh/HSQVy4JWdu4YbyGjzt+WNqtEA0QSfU/SceNguo5b
         EgfQ==
X-Gm-Message-State: AOJu0YzLr5IhWUp3Bf78aMpPNoTjPz4t85bqj/WPIOwt3SV3ZOdAZeka
	uXD/wGSKuJa60XluFRYpgOcyV6CGEY2PF9Tv/+MV3w==
X-Google-Smtp-Source: AGHT+IGBq7mUtyfHbN3TWy9RKPBEUdVZWqEc908zIBJVoQI53SI1IAvfmzEwWNQNMlm9DsxGtd8LX7ARxtptPsEGI7s=
X-Received: by 2002:a05:6870:4f13:b0:1fb:75a:de7a with SMTP id
 xi19-20020a0568704f1300b001fb075ade7amr4086371oab.104.1702251395847; Sun, 10
 Dec 2023 15:36:35 -0800 (PST)
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org> <20231209233106.147416-13-peter.griffin@linaro.org>
In-Reply-To: <20231209233106.147416-13-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sun, 10 Dec 2023 17:36:24 -0600
Message-ID: <CAPLW+4nuYHbLuLX=HGsDz6WYtZV3P7yBEmhCXbLW2M+dF1asow@mail.gmail.com>
Subject: Re: [PATCH v6 12/20] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
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
> cmu_top is the top level clock management unit which contains PLLs, muxes=
,
> dividers and gates that feed the other clock management units.
>
> cmu_misc clocks IPs such as Watchdog and cmu_apm clocks ips part of the
> APM module.
>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

[snip]
