Return-Path: <SRS0=I0QX=IU=linaro.org=lee.jones@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DA2C433C1
	for <soc@archiver.kernel.org>; Mon, 22 Mar 2021 15:11:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7871F6198D; Mon, 22 Mar 2021 15:11:00 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16D2361931
	for <soc@kernel.org>; Mon, 22 Mar 2021 15:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16D2361931
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=lee.jones@linaro.org
Received: by mail-ed1-f42.google.com with SMTP id bf3so19806110edb.6
        for <soc@kernel.org>; Mon, 22 Mar 2021 08:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BblDdmrktMK5tFFD4LOpFP77ijBklviaU26xu4C63tQ=;
        b=IT2iGJQyBA7Y1+dCJvTIJziErQmWcbn0+kMr4Y273pDNqodHvB6Ww7nGeAozLlDj16
         AaZFlWmlmAzS7zUACjHtiaCrXpOhiRROiQFyU4auZ+13hpjjdqVYNePQ5Cyp/9DkkrQC
         b91OFvMWYHKs9MAA7wM3CC0WQRuzxtVRw66hiamNYNrYJOlJE43oIsVGuMZ9kLPAqUbQ
         nynbvcEhIJeX2PlbMuKhnlTT65dd9GDFO83TYP0QzGcN6dLgdO2DDjR1KDBGvGzAifvT
         3iM6ErE3HQUX/Nd9uR6OnpKDyBISmiXqsi9ileg7sykq6tbAiP06wPIgKKPW7GTaZvHL
         iZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BblDdmrktMK5tFFD4LOpFP77ijBklviaU26xu4C63tQ=;
        b=WO4DhkeILLbjZNOnuLBOEV53+Jd9aVncObx1sANs7u2uZ4iXVt5BEtJmWWv1WjXSla
         8ywpteVEXjnwIsJ4EC4gzpmy58X6SCNheINWwmVqi7uuemdkWxLBFibi7XmcK7rLCxHz
         CPx4i/83/y2xVtCBavqsOCyOMpiB98i6dMlj3rvtNQ1zfA6lMfahKTF6xFw3+5V8f+pf
         NtIveH/unEghQ3xKEY1zQ1J3BSQjrU+jmA8rCZIYqRY+FNeFKKHVLsYwh7SyIuEmVGGz
         V5m1OEWMsqCeseV47Vy2HJsJn8ojrjaV94fYUCiUqymvJ3bRcp2bG3Accmp/Kce+Bshy
         Znxg==
X-Gm-Message-State: AOAM533G7kvgl2rkclW3ez/Fpjvifsmt06+1YpvckHCl6dBTfqKHwIAF
	FfM+juk19HTarIY+h2O+XQ+aiA==
X-Google-Smtp-Source: ABdhPJwxMVa4A4qij3tXD3Epc4EsEgsbfdMWBHLOdKIarJBUoxpk8xvIYdSjs+oVvVNjC/1HEN64aQ==
X-Received: by 2002:a05:6402:22b5:: with SMTP id cx21mr26421224edb.27.1616425856228;
        Mon, 22 Mar 2021 08:10:56 -0700 (PDT)
Received: from dell ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id e4sm9768413ejz.4.2021.03.22.08.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 08:10:55 -0700 (PDT)
Date: Mon, 22 Mar 2021 15:10:53 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>,
	Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 03/15] mfd: altera: merge ARCH_SOCFPGA and
 ARCH_STRATIX10
Message-ID: <20210322151053.GB2916463@dell>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152545.1317581-4-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210311152545.1317581-4-krzysztof.kozlowski@canonical.com>

On Thu, 11 Mar 2021, Krzysztof Kozlowski wrote:

> Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
> one for both of them.  This the common practice for other platforms.
> Additionally, the ARCH_SOCFPGA is too generic as SoCFPGA designs come
> from multiple vendors.
> 
> The side effect is that the MFD_ALTERA_A10SR will now be available for
> both 32-bit and 64-bit Intel SoCFPGA, even though it is used only for
> 32-bit.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/mfd/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
