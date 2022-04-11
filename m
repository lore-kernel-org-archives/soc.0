Return-Path: <SRS0=5fya=UV=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D3BC433F5
	for <soc@archiver.kernel.org>; Mon, 11 Apr 2022 02:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65CB8C385AB; Mon, 11 Apr 2022 02:51:46 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91D55C385A4
	for <soc@kernel.org>; Mon, 11 Apr 2022 02:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 91D55C385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f53.google.com with SMTP id bx5so13886794pjb.3
        for <soc@kernel.org>; Sun, 10 Apr 2022 19:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rXMHDZ/wjPIXvL9nqfsrxMZkzmm8UuxVAONDINflarg=;
        b=AE76w0buips1IavXt8IqZhb/mkmazdyXyCp/cggM8TOunNklvkgT4lSsRzujLmLdE3
         476Yi8o85rpPXFHnov+x/BLI3qBaqVaaP6I4k4iLECAwuzFym8qZNIZbEP/WaSKDg6Zg
         Q3gO1XTRhmNyxHLz71bDze79BuvYZ4M53fsVYrBMjvPRw4FZhhWJB6p04pI8WUQU1wUF
         VS6JxUiB5uS9NezIa01SRAz5HYjTn9xC4rSa4gCrxokcMgDrVexzZAX9iJXsx6xLW0TK
         CSo+qBkDUpOfw17IEGKJH3+MaferjZI/1prH9OTR0qLrgBsw9ADJ367gVGLHIl088MBE
         6bVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rXMHDZ/wjPIXvL9nqfsrxMZkzmm8UuxVAONDINflarg=;
        b=F0y1coeVtbM2Zl3DdqErIAdbbEQqfpuXRRsRd3NvmQO7oK/VC530+YcQ+5ZZlt5cEK
         W7RxJSwyEvo6kCRKP7qWyNbvtdPVkwJe3+lm9+ZQ4SCwSTbBNKRNrCI5Sx7XdJoHxFKD
         wKrKzlSUjlI0g+kqUVvxQaE89ye6U9uOFX+szUu7M0SUpR1fDEJ+tUXAVIUx9NRdXl1q
         jvwvY6y6Xv1RLM3TE19kZrmSWW784Uu68Uc3J3Ja/Lls1qAkVUCPhix6UDP659LRllpa
         Yz+gNDS5oJwHuu1ibqn9OI8oE5lxvWtOjkR8PwDKKp+fJ8nh3svS4ym2WYZRrKpI+rlh
         7Fgg==
X-Gm-Message-State: AOAM5310GLnZMrrvvMhaaxGyp8T0XrKkB90UWvVGKz0XD2SDFAqmIBC0
	Ks1Ryimie6f75bHiv5BeJgkIkg==
X-Google-Smtp-Source: ABdhPJzGVKQR6w8pMxMmb2S23wGUZsQuhLLg7iNaBj4HpD8z37EDF1Ky46L9XugLcAZWFBAiFvYfIA==
X-Received: by 2002:a17:90b:4a4e:b0:1ca:c996:20dc with SMTP id lb14-20020a17090b4a4e00b001cac99620dcmr35062125pjb.98.1649645505104;
        Sun, 10 Apr 2022 19:51:45 -0700 (PDT)
Received: from localhost ([223.184.83.228])
        by smtp.gmail.com with ESMTPSA id d8-20020aa78688000000b00505793566f7sm9440536pfo.211.2022.04.10.19.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 19:51:44 -0700 (PDT)
Date: Mon, 11 Apr 2022 08:21:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, arm@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: dts: align SPI NOR node name with dtschema
Message-ID: <20220411025142.uhdllnknn232h26f@vireshk-i7>
References: <20220407143027.294678-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407143027.294678-1-krzysztof.kozlowski@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52

On 07-04-22, 16:30, Krzysztof Kozlowski wrote:
> The node names should be generic and SPI NOR dtschema expects "flash".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/spear1310-evb.dts              | 2 +-
>  arch/arm/boot/dts/spear1340-evb.dts              | 2 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
