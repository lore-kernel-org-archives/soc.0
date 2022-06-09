Return-Path: <SRS0=rEvr=WQ=googlemail.com=martin.blumenstingl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE54C43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 20:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B0D3C3411B; Thu,  9 Jun 2022 20:03:38 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E12D8C34114;
	Thu,  9 Jun 2022 20:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E12D8C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ej1-f52.google.com with SMTP id o7so16279239eja.1;
        Thu, 09 Jun 2022 13:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=65BKb6+QTnEhJJ0Vp4EQuB44eWGIpxtLTjcmvbPa/Q8=;
        b=Emp0E+5ZxCn3BLb90p4QITBjZiOgXtq9gcju7V+lZINA/YbIJQvdKPYv/H+HAI3qdr
         v3odiCW/sg1rz55NsstJQfMbjM+0cKeb4V1dgkeONQd6WbK/k5XLPQ1CNO+Ne9dkCX13
         aeVUsUCiGxtMYwgPo0cvLAJgHQdfddrgVPIqyKjWvwD3LLIsm3JGBJ1Lleg/QO/A9cF3
         xY9VqZZdQmcdUSpl5co5d1gYh0gFmez3VXE0PbMxNA4W/pt29g/2J+SK0aXDYPR54oq0
         a1+FMG3tXEkm8NR2gDdbm72+qF1y0kTwUyJJOafmA7/U/FCBQThsyIGCUmUECf370ACE
         a/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=65BKb6+QTnEhJJ0Vp4EQuB44eWGIpxtLTjcmvbPa/Q8=;
        b=BrHPz+h3lO24uOtpOKOkCw+KXj6AFrMGo4LoNTh+JZ5DtuKWUfLuT9+o5Y5ltceoEU
         YomWAfFQnNLjI3kh6z2NmUL1PiGAeg+CUgTBxyDd+3zODdYSwuDyC0M4aD9RAxINe6qN
         nwWRMaZYFRAFtUa0WYAWdJb07EW7tTLVZGiUQH5lK31m+vV+G2yjcEpgD3+KJE6FFu+2
         0R8YbYJq/Gim3OW+nLGKdABZCzA/6C1CT3Tcgkv+TLiFUPeEDNWuM/J+DnzJ3vMxcVnJ
         ynK/T3gebwrt4ANQbDi9VIXTsXQT0hZScgWuQqY9b+7oWnw9/0huYM+mjWluj69AyEig
         TN+Q==
X-Gm-Message-State: AOAM533qV87YS5WuCMsYfVJli+M9LEQnwHoEiWY8Jp8SeUM8TM/23rON
	hwuhqsfxbBhqiTpnlPyPbL6Ykp29okEqHj4Fiaw=
X-Google-Smtp-Source: ABdhPJwfjXkI4NfrY0Ak8ggvGl+owfQ44h7IsmFLeTxpiYz+agoIaeTAoH5NeXgbZqJNRr4AYiO6dtCK5cHgctlK6qs=
X-Received: by 2002:a17:907:7246:b0:6ff:241f:200a with SMTP id
 ds6-20020a170907724600b006ff241f200amr37297815ejc.543.1654805015941; Thu, 09
 Jun 2022 13:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org> <20220609113911.380368-6-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220609113911.380368-6-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 9 Jun 2022 22:03:25 +0200
Message-ID: <CAFBinCAwS2zYksWUbQiPY+XNhQHFz8Qvfe+Li79Lw16dviWSZA@mail.gmail.com>
Subject: Re: [PATCH v2 07/48] arm64: dts: amlogic: correct gpio-keys properties
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
> gpio-keys children do not use unit addresses.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
