Return-Path: <SRS0=XK7G=F2=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E268CDB46E
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 06:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0713EC433C7; Thu, 12 Oct 2023 06:16:05 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 726AEC433C9
	for <soc@kernel.org>; Thu, 12 Oct 2023 06:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 726AEC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5a1d91a2540so461253a12.1
        for <soc@kernel.org>; Wed, 11 Oct 2023 23:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697091362; x=1697696162; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8esZ0yO2aAzAHHUJbhBO1Vz268Oa3brBkIMO3CyVGR0=;
        b=mQFMzZP4YnPcXshcC/jbXCVqd5qd6mhUJ6ReukEVSi/to0bQC/wE9nc+2jlusiv+i/
         /fDO1dTPANEdbdzbGPR+hAruEVXZWAZMB6E/6MDLMBn2omZh0Xux7NSF+QP4RoJcRpSg
         2igrJt5yIe3kkXYQEhfEbQ3U9fkLbXY4bF3RYqrQKm92r8wOSCSbQdMfaUoO+ToT4e+E
         ul9uAogBgj/4ZacrdfLcwyt73YuCLOMBxGIXR5QWZSOU1Sn8Zkn3sVDvTUKAtrKraaBJ
         WyS4v6nMgY9i3hXFOApLgdnSWS+AKpSU0zA3aK7WjxBmIf2WWuAPMBAtqRKVS77ZlbeY
         lbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697091363; x=1697696163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8esZ0yO2aAzAHHUJbhBO1Vz268Oa3brBkIMO3CyVGR0=;
        b=tRFKzRyl43nygXx3tq+S1WUwkcD+0rR0Tk3rb25jVF1fBE/sM4JnSLKfLmX5PcEyjc
         KZ+7fKejqXblM9OidD35KkZOUMQIANg7fIjYpK40ZxO5SlfuLv2oYUSrhL7zbl57ZKul
         FFFepnXtSSSOEu5z3jGLKj6u9ezBA4l+zSssfTsi1/9oFTg+MbqUEInj+3BM6gSbRvmb
         5sFrsRPNaYH+SvWtwPpFg/hCnqEl+WUTWGbdAEpnfTUM/tvJanVUwj12TBoNkWINNZ09
         D2gGH8oExID6krjlYDV3NEnHOpvX8ObpBRCWgNqDbQqlCeOKQb3oldE+JyBed6U4O5Tv
         UUyw==
X-Gm-Message-State: AOJu0Yy+PtDPwqqygQyOO0DPR7BhsKoYuxNGr/Z26I60FD0hYkct3k9J
	zwbTuRbbWxBmpGpqEqEB1JKhqxjCNFB78rNIHagHig==
X-Google-Smtp-Source: AGHT+IFVQ9Wikpi2B+8rv5uas0wyJQjBlEO1BbvS/6y/xJD4K3tybOua8AIGJVAe27mvKcnQC5VVeozSwZ6aMTqh9LI=
X-Received: by 2002:a17:90a:488e:b0:27d:233e:b4f6 with SMTP id
 b14-20020a17090a488e00b0027d233eb4f6mr345442pjh.45.1697091362667; Wed, 11 Oct
 2023 23:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-20-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-20-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 12 Oct 2023 01:15:51 -0500
Message-ID: <CAPLW+4mAeRQBZp1HKWDKLHV1cYafksjijzQJMGhMsz+e0cxhOg@mail.gmail.com>
Subject: Re: [PATCH v3 19/20] arm64: defconfig: Enable Google Tensor SoC
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	cw00.choi@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add the Google Tensor SoC to the arm64 defconfig
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5315789f4868..8a34603b1822 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -41,6 +41,7 @@ CONFIG_ARCH_BCMBCA=3Dy
>  CONFIG_ARCH_BRCMSTB=3Dy
>  CONFIG_ARCH_BERLIN=3Dy
>  CONFIG_ARCH_EXYNOS=3Dy
> +CONFIG_ARCH_GOOGLE_TENSOR=3Dy
>  CONFIG_ARCH_SPARX5=3Dy
>  CONFIG_ARCH_K3=3Dy
>  CONFIG_ARCH_LG1K=3Dy
> --
> 2.42.0.655.g421f12c284-goog
>
