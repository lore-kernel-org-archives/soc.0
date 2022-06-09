Return-Path: <SRS0=rEvr=WQ=googlemail.com=martin.blumenstingl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDFBCCA473
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 20:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A78B9C34114; Thu,  9 Jun 2022 20:04:18 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 16379C3411B;
	Thu,  9 Jun 2022 20:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 16379C3411B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ej1-f49.google.com with SMTP id kq6so36545133ejb.11;
        Thu, 09 Jun 2022 13:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hHccYO4z5usBojn087eWGV+jtlxg4L1Z0rSYUHXah30=;
        b=MzK55xDftqFwDPyfVCY7qiTgQHhw5KesPgjLEHgVe5c8iVsi7WJVaGi3HQShA5VfEQ
         Kn/0mRYQS73Chzq89V+ucqGUae0L6oTBbtkQRbknGz2rA/qaiNxFD22oFYTqCkDAU4EZ
         a+/aVe6nUWt4hKAQosJGv3YfLIXqFcS90I9GBPXwz+VnH4A41p/PhAHRX2rDp7fU6StS
         NduLvu5zanSz2LpVdKlLaZvlsuLPjgrMyntgiAU8noKZgFaLX9LU6wY6aTEHkp3SqXuZ
         59c/FZe+gEKxuZ/pgVYQZ+AnBvfYbshMkp90Fkaqe9Iu8ek0XMEp3B2Ez93Xd++aCQsj
         z66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hHccYO4z5usBojn087eWGV+jtlxg4L1Z0rSYUHXah30=;
        b=7A0bE2kkAw19Vi7B93UpHBmtSviDWzMffCcG4LoQ1PE3zwF+S68Q82UmsIF1T8e+qe
         Ak0j6FNQaAduy4weEfE4Inl/SzNfItGF4+JhBB9WoLLAzY7h3CmQFq7SfdnsjTj+YHUG
         gqc01sfPCoPvTTWZ0wAjr90G8rFZ+3EjagidCjcmvySdGdZLLjb0Gx+tPU08pdcM5MBx
         kztb60IunLp8o+sJKIme6u5AECjqCwxeoOgRpCGANFnIV1PpfISFluvOuNlR7CnAWzwC
         d/xffQlNuL1RYL24sc1MOdu0YoFp26Z3gi5WueLuWUgRGmkNrjDD4ihwBFV4G2De+nA5
         kKVQ==
X-Gm-Message-State: AOAM5339kzeUhBQuyUunrBya2lkf3mxjcnNGa4LEizifQjPOzbX3vaMz
	hWFKsEzyj+NxYVNwU75oOdqYDfT+39HTuPZlZ60=
X-Google-Smtp-Source: ABdhPJxfhhcOra1ui4AvrkvXdWpqY9OeKmCTNjSpjd2RoNGVaKcF2Dqv56z2FDMl582+UvxSiToI0PJmhOR4YpEYj9Y=
X-Received: by 2002:a17:906:b18e:b0:710:26db:7a53 with SMTP id
 w14-20020a170906b18e00b0071026db7a53mr29313366ejy.290.1654805056333; Thu, 09
 Jun 2022 13:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org> <20220609113911.380368-7-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220609113911.380368-7-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 9 Jun 2022 22:04:05 +0200
Message-ID: <CAFBinCC2A-Fe9QbZtffmCvHFNWcgaL-TZydwFBKsBp-n2sD_1A@mail.gmail.com>
Subject: Re: [PATCH v2 08/48] arm64: dts: amlogic: align gpio-key node names
 with dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 9, 2022 at 1:39 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
